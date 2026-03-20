# Turbopuffer

| | |
|---|---|
| **Website** | [turbopuffer.com](https://turbopuffer.com) |
| **HQ** | Ottawa, Ontario, Canada (remote-first; offices in Ottawa, Vancouver, NYC) |
| **Founded** | 2023 |
| **Structure** | Private (incorporated in Canada) |
| **Stage** | Seed |
| **Lead Investors** | Lachy Groom, Thrive Capital |
| **Other Investors** | Redpoint Ventures, angel investors |
| **Total Raised** | Undisclosed |
| **Valuation** | Undisclosed |

---

## The Big Audacious Idea

**Build the database layer for AI by making search 10–100x cheaper — using object storage (S3/GCS) as the source of truth instead of expensive in-memory or SSD architectures.**

Every AI application needs to search over vectors (embeddings) and text. Every existing solution — Pinecone, Weaviate, Qdrant, Milvus — assumed this data needed to live in RAM or on replicated SSDs. That made costs proportional to data size: 100 million vectors cost $20K+/month. Turbopuffer's thesis is that this entire cost structure is wrong. Object storage (S3/GCS) costs ~$0.02/GB. Replicated SSDs cost ~$0.60/GB. That's a 30x cost difference at the storage layer — and with the right architecture (a custom LSM tree built in Rust, centroid-based ANN indexing, stateless compute nodes), you can serve queries at competitive latencies while storing data on object storage.

The triggering insight came from a consulting engagement. In late 2022, Simon Eskildsen was doing "angel engineering" at Readwise, helping them scale infrastructure. Building article recommendations with vector embeddings on 100M+ documents would have cost $20K+/month — more than 4x Readwise's entire relational database bill. The coordinate system for vectors was almost 100x more expensive than it should have been. That price/performance gap was the founding insight.

Simon's framework for why this is a generational opportunity: *"To create a generational DB company you need: a new workload + a new storage architecture. Without both, there's no reason why tacking on a secondary index to your relational database would not work."* AI search is the new workload. Object-storage-native architecture is the new storage paradigm. Turbopuffer has both.

---

## The Problem That's So Hard to Solve

### Why vector search costs were broken

The first generation of vector databases (2020–2023) were built during a period when the primary concern was latency, not cost. Pinecone, Weaviate, Qdrant, and Milvus all assumed the data needed to be in memory or on fast SSDs with 3x replication. This architecture works well for small-to-medium workloads, but costs scale linearly with data size. At 100M+ vectors, you're paying $20K+/month for what is essentially a similarity search index.

The root cause is architectural: these databases were designed before AI workloads exploded. They assumed vector search was a niche use case where cost-per-query mattered more than cost-per-vector-stored. When every company suddenly needed to connect all their data to LLMs, that assumption broke catastrophically.

### Why building on object storage is genuinely hard

The obvious question: if object storage is 30x cheaper, why doesn't everyone use it? Because object storage has fundamentally different performance characteristics than SSDs:

1. **High latency per request.** A single read from S3/GCS takes 50–200ms, vs. <1ms from local SSD. You can't build a responsive query engine by making individual object storage reads on each query.

2. **No random access patterns.** Object storage is optimized for large sequential reads and writes, not the small random-access patterns that traditional database indexes rely on. You can't just port a B-tree or HNSW graph to S3.

3. **Write-amplification is expensive.** Traditional LSM trees compact data by rewriting it — fine on local SSDs where writes are cheap, but object storage charges per write operation. A naive LSM tree on S3 would have ruinous write costs.

4. **No built-in consensus.** Object storage doesn't provide distributed consensus primitives (locks, transactions). Building a consistent database on top of eventually-consistent storage requires careful engineering.

5. **Multi-tenancy at scale.** SaaS applications like Cursor need 10M+ separate namespaces (one per user's codebase). Existing vector databases cap at 100K namespaces (Pinecone's limit). Supporting millions of namespaces on object storage requires a completely different metadata management approach.

Turbopuffer's solution to each:
- **Tiered caching:** Object storage (source of truth) → NVMe SSD cache → RAM cache. Hot data serves from RAM at <10ms; cold data serves from object storage at ~350ms.
- **Custom LSM tree:** Built from scratch for object storage semantics — not a port of RocksDB or LevelDB. Different compaction strategies, different write patterns.
- **Centroid-based ANN (SPFresh):** Instead of graph-based HNSW/DiskANN, uses centroid-based approximate nearest neighbor search that minimizes roundtrips to object storage.
- **GCS Compare-and-Swap for consistency:** Instead of a consensus layer (Raft/Paxos), uses object storage's atomic operations. Simon: *"turbopuffer doesn't have a separate distributed consensus layer. We use object storage even for that! Yet, turbopuffer has consistent reads. It is not easy to make fast, but it is simple, and I'll take hard and simple any day."*
- **Stateless compute nodes:** Any node can serve any namespace because all durable state lives in object storage. A failed node is immediately replaceable. Simon: *"You could turn off all the servers that Turbopuffer has, and we would not lose any data."*

### The "context window will solve it" counter-argument

As LLM context windows grow (Gemini at 2M tokens, Claude at 200K), some argue vector search will become unnecessary — just stuff everything into the context. Simon's counter-framework is **SCRAP**:

- **Scale:** Data exceeds what fits in any context window
- **Cost:** Sending everything to the LLM is expensive ($1–10 per query at large context)
- **Recall:** Search finds the right data; context stuffing adds noise
- **Access control:** Users should only see what they're authorized to
- **Performance:** Pre-filtering data is faster than LLM reasoning over everything

He cites Andrej Karpathy's vision: *"The world-view presented by Karpathy is long turbopuffer — he argues that models should have a simple 'cognitive core' with a basic curriculum of knowledge, and search for anything else."*

---

## The Technology Stack

### Architecture: Object-Storage-Native LSM Tree

Built entirely in Rust. Not a wrapper around an existing database — a custom storage engine designed from first principles for object storage (GCS as primary; S3 support).

**Storage tiers:**
1. **Object storage (GCS)** — Source of truth. All data, metadata, and WAL segments. $0.02/GB.
2. **NVMe SSD cache** — Frequently accessed data cached locally. Centroid indexes live here.
3. **RAM cache** — Hottest data for sub-10ms queries.

**Indexing:**
- **Vector search:** Centroid-based ANN (SPFresh variant). Stores cluster centroids on SSD, underlying vectors on object storage. Minimizes roundtrips vs. graph-based approaches (HNSW/DiskANN) which require many random hops.
- **Full-text search:** BM25 with vectorized MAXSCORE over WAND algorithm for long LLM-generated queries. FTS v2 (Dec 2025) achieved up to 20x speedup.
- **Hybrid search:** Combined vector + BM25 + attribute filtering in a single query.
- **Native filtering:** High-recall filtering without the recall degradation that plagues competitors.

**Asynchronous indexing:** Indexing runs on separate nodes from query serving. Expensive index rebuilds don't impact query latency — a critical design choice for production workloads.

### Performance (Production)

| Metric | Cold | Warm |
|--------|------|------|
| Vector search p50 (1M docs) | 343ms | 8ms |
| Vector search p90 (1M docs) | 444ms | 10ms |
| BM25 search p90 (1M docs) | 285ms | 18ms |

**At scale:** 2.5T+ documents indexed, 10M+ writes/second, 10K+ queries/second across production customers.

### Pricing

| Component | Cost |
|-----------|------|
| Storage | $1/month per million vectors |
| Queries | $4 per million queries |
| Plans | Launch ($64/mo min), Scale ($256/mo min), Enterprise ($4,096/mo min) |

SOC2 Type 2, HIPAA, GDPR compliant. No free tier — deliberate choice to attract serious production workloads.

### Key Design Tradeoffs (Documented)

Turbopuffer is unusually transparent about its tradeoffs:
- **Cold query latency:** First query to a cold namespace takes 200–500ms (object storage fetch). Warm queries are <10ms. Competitors with everything in RAM serve <5ms always. The tradeoff: 10x cheaper for comparable warm performance, but cold starts are slower.
- **Write throughput:** Optimized for batch writes (50% discount for 10KB+ batches). Individual small writes are less efficient.
- **Recall measurement:** Continuous recall monitoring in production, not just benchmarks. They measure actual recall degradation over time — something competitors don't expose.

---

## What the World Looks Like If This Works

1. **Every AI application gets search for 10–100x less.** Vector search becomes cheap enough that startups with 100M+ embeddings can afford it. The cost barrier that pushed companies toward pgvector (free but limited) or not doing vector search at all disappears. Search becomes a utility, like compute or storage.

2. **Multi-tenant AI search becomes standard.** Cursor's 10M+ namespaces (one per user's codebase) at 100B+ vectors is a workload that literally couldn't exist on Pinecone (100K namespace limit). Turbopuffer's architecture enables a new class of AI applications where every user gets their own semantic search index.

3. **Object storage becomes the foundation for a new generation of databases.** Turbopuffer proves the paradigm: stateless compute, object storage as source of truth, tiered caching. Other database workloads (time series, graph, document) follow the same pattern. The $0.60/GB → $0.02/GB cost reduction reshapes database infrastructure economics.

4. **RAG becomes the dominant LLM deployment pattern.** If search is cheap and reliable, every LLM application connects to external knowledge rather than relying solely on model weights. Turbopuffer becomes the infrastructure layer that makes RAG work at scale — the "search engine for AI."

5. **A new database company reaches $1B+ ARR.** Simon's explicit ambition: *"To create a generational DB company."* The precedents are Snowflake ($3.4B revenue), Databricks ($2.4B), MongoDB ($1.9B). If AI search is as foundational as data warehousing, the top database company in this category reaches comparable scale.

---

## Best Case Scenario / Addressable Opportunity

| Market | Size | Growth |
|--------|------|--------|
| Vector Database Market | $2.5B (2025) → $8.9–17.9B (2030–2034) | 22–28% CAGR |
| AI Infrastructure (broader) | $45B (2025) → $150B+ (2030) | ~28% CAGR |

**The embedded search TAM:** Every SaaS application is adding AI features that require search — code editors (Cursor), productivity tools (Notion), email clients (Superhuman), project management (Linear), support platforms (Pylon). The addressable market isn't just "companies that buy vector databases" — it's every software application that connects to LLMs, which is rapidly becoming every software application.

**Competitive revenue context:** Pinecone generated $26.6M in 2024 revenue. Turbopuffer's sales grew 10x in 2025, with ARR in "tens of millions." If Turbopuffer is already approaching or exceeding Pinecone's revenue with a fraction of the funding and headcount, the unit economics are dramatically better.

---

## The Science: A Brief History

**2013–2017: Word2Vec through to Transformers.** Word embeddings demonstrate that semantic meaning can be encoded as vectors. Researchers use FAISS (Facebook AI Similarity Search) for nearest-neighbor queries. Vector search is an academic tool, not infrastructure.

**2018–2020: The first vector database wave.** Pinecone (2019), Milvus (2019), Weaviate (2019), Qdrant (2021) launch as dedicated vector databases. All build on the assumption that embeddings need to be in memory or on fast SSDs for acceptable latency. HNSW (Hierarchical Navigable Small World graphs) becomes the dominant indexing algorithm. Funding flows: Pinecone raises $138M, Zilliz/Milvus raises $113M.

**2020–2022: RAG emerges as a pattern.** Retrieval-Augmented Generation (first paper 2020) demonstrates that LLMs perform better when they can search external knowledge. The pattern spreads rapidly: ChatGPT + search = better answers. Every company building on LLMs now needs vector search.

**2022: pgvector offers a "good enough" alternative.** The PostgreSQL extension pgvector provides vector similarity search inside an existing database. For workloads under 10M vectors, it works well enough that many developers skip dedicated vector databases entirely. This puts pressure on dedicated vendors to justify their cost premium.

**Late 2022: Simon's Readwise discovery.** While consulting at Readwise, Simon finds that vector search on 100M+ documents would cost $20K+/month — more than 4x their entire database bill. The coordinate system for vectors is almost 100x overpriced. The founding insight crystallizes.

**2023: NVMe SSDs + object storage enable a new architecture.** Cloud NVMe SSDs provide the caching layer. GCS introduces Compare-and-Swap operations that enable consistency without a consensus layer. The storage technology stack exists for the first time to build a database natively on object storage.

**2023: Turbopuffer launches.** Simon and Justine (who worked together at Shopify for 8+ years) start building. The founding thesis: new workload (AI search) + new storage architecture (object-storage-native) = generational database company.

**2024: Notion migration proves the thesis.** Notion moves from Pinecone to Turbopuffer (October 2024), migrating 10B+ vectors. Cost drops 80%, saving millions of dollars per year. Pinecone reportedly begins exploring a sale.

**2025: Explosive growth.** Cursor scales to 100B+ vectors on Turbopuffer with 95% cost reduction. Sales grow 10x. Headcount grows from ~5 to 22. ARR reaches "tens of millions."

**The "Why Now" convergence:**
- Object storage reliability/APIs matured (GCS Compare-and-Swap) ✓
- NVMe SSDs available on all cloud platforms for caching ✓
- AI/LLM explosion created massive new vector search workload ✓
- First-gen vector databases proved the market but at unsustainable cost ✓
- pgvector proved vector search needs a dedicated solution at scale ✓
- Founders' 8+ years together at Shopify scaling infrastructure 100→1M req/s ✓

---

## Open-Source Contributions

Turbopuffer itself is not open-source — it's a managed service. But the founders have significant open-source credibility:

| Project | Stars | Description |
|---------|-------|-------------|
| **logrus** | 25.7K | Structured logging for Go (Simon) |
| **toxiproxy** | 11.9K | TCP proxy for chaos/resiliency testing (Simon, Shopify) |
| **napkin-math** | 5.1K | System performance estimation from first principles (Simon) |
| **data-diff** | 3.0K | Compare tables across databases (Simon, Datafold) |
| **semian** | 1.5K | Resiliency toolkit for Ruby (Simon, Shopify) |

Simon's GitHub: 129 public repos, 3K+ followers. His open-source work demonstrates the same philosophy as Turbopuffer: pragmatic tools that solve real infrastructure problems, adopted organically by developers who need them.

The Turbopuffer blog functions as a de facto open contribution to the field — detailed posts on vectorized MAXSCORE, FTS v2 architecture, continuous recall measurement, and native filtering provide architectural insights that benefit the broader database engineering community.

---

## Commercial Validation

| Customer | Scale | Cost Impact | Use Case |
|----------|-------|-------------|----------|
| **Cursor** | 100B+ vectors, 10M+ namespaces, 10GB/s write peaks | 95% cost reduction | Code retrieval / semantic search across user codebases |
| **Notion** | 10B+ vectors, 1M+ namespaces, 100TB+ scale | 80% cost reduction, millions $/yr saved | AI workspace search (migrated from Pinecone Oct 2024) |
| **Linear** | 250M+ docs, 1.5M+ namespaces, 13ms p50 | 70% cost reduction | Product planning search (migrated from Elasticsearch + pgvector) |
| **Superhuman** | 9B+ docs, 60ms p90 | 20%+ cost reduction | Email search spanning 1–5 years |
| **Readwise** | 150M+ docs, 1TB+, 50K+ namespaces | — | Article search and recommendations |
| **Vercel** | — | $2M+ incremental revenue, 32x ROI | AI Cloud product |
| **TELUS** | 25K+ namespaces, 57K+ active users, <100ms p99 | — | Telecom customer service |
| **Other** | — | — | Anthropic, Atlassian, Ramp, Clay, Cognition, Grammarly, Warp, Photoroom, Suno |

**No sales team or marketing budget.** Every major customer was acquired through technical excellence and word-of-mouth. When Cursor emailed about cost problems, Simon flew to San Francisco unannounced. They migrated the entire workload within a week. Notion's engineering team had independently sketched out what they thought the ideal search architecture should look like — and they had basically designed Turbopuffer.

Notion CEO Ivan Zhao: *"Every message is replied within minutes. Every feature request is always answered. It feels like these guys work at Notion."*

**Revenue:** ARR in "tens of millions." 10x sales growth in 2025. 5x headcount growth in 2025 (to 22 people).

---

## Core Team

### Simon Horup Eskildsen — Co-Founder & CEO

| | |
|---|---|
| **Education** | No university degree. Represented Denmark at IOI (International Olympiad in Informatics) in high school. Moved from Aarhus, Denmark to Ottawa at ~18. |
| **Prior** | Shopify (2013–2021): Rails developer → Principal Engineer/Director. Scaled infrastructure from ~150 people to 4,000+, 10K merchants to 1M+, 100 to 1M requests/second. "Angel engineering" stints at Replicate, Causal, Datafold, Readwise (2021–2023). |
| **Open Source** | logrus (25.7K stars), toxiproxy (11.9K stars), napkin-math (5.1K stars), data-diff (3K stars) |
| **Talks** | CMU Database Seminar (March 2026), Google Cloud Next 2026, USENIX SREcon19 |

**What's notable:** Simon is an infrastructure obsessive who never went to university. He went from high school IOI (competitive programming) directly to Shopify at 18, then spent 8 years scaling one of the world's largest e-commerce platforms through its entire growth curve — 150 to 4,000 employees, 10K to 1M+ merchants, 100 to 1M requests/second. He worked on "nearly every part of Shopify's infrastructure."

The 2021–2023 "angel engineering" period is the most revealing phase. Instead of starting a company immediately after Shopify, he did 3-month infrastructure consulting stints at four companies (Replicate, Causal, Datafold, Readwise). This gave him something most founders lack: direct exposure to how multiple different companies at different stages struggle with the same infrastructure problems. The Readwise engagement was the trigger — seeing that vector search on 100M documents would cost $20K+/month, more than 4x an entire relational database bill — but the pattern recognition came from seeing four companies' infrastructure pain points in rapid succession.

His hiring philosophy reveals his approach to building: *"The P99 engineer has some history of having bent their trajectory or something to their will. The P99 engineer is obsessive."* When Cursor contacted him about crushing vector search costs, he didn't schedule a demo — he flew to San Francisco unannounced and migrated their workload in a week.

On fundraising: *"The fundraising round would be like showing you my office lease."* On PMF: *"If this doesn't have PMF by the end of the year, we'll just return all the money."*

### Justine Li — Co-Founder & CTO

| | |
|---|---|
| **Education** | B.Eng. Computer Software Engineering, University of Waterloo |
| **Prior** | Shopify (2012–2021): Intern → Senior Staff Software Engineer. Focused on scaling systems for flash sales and multi-tenancy. Co-founded Frustra Inc. (2021–2023): built "Stray Photons," a VR game engine. |

**What's notable:** Simon called Justine *"the best engineer he ever worked with at Shopify."* They worked together for 8+ years — the kind of co-founder relationship where technical communication is near-instantaneous. When Notion needed a proof-of-concept, Justine pulled a 24-hour coding marathon, fixing 300ms of latency in 3 hours. Notion signed the contract the same day Simon's daughter was born.

Her VR game engine work (Stray Photons / Frustra) between Shopify and Turbopuffer isn't random — real-time rendering requires the same performance obsession as database engineering: nanosecond-level optimization, memory layout awareness, GPU/CPU coordination. The about page emphasizes "simplicity and pragmatism" — which maps directly to Turbopuffer's architectural philosophy of choosing hard-and-simple (object storage) over easy-and-complex (consensus layers).

### Nikhil Benesch — CTO

| | |
|---|---|
| **Education** | BA, Harvard University |
| **Prior** | CTO at Materialize (streaming SQL database built on incremental computation); Member of Technical Staff at Cockroach Labs (2017–2019) |

**What's notable:** Benesch brings deep distributed database experience from two of the most technically rigorous database companies of the past decade. CockroachDB pioneered globally-distributed SQL; Materialize pioneered streaming incremental computation. Both required solving hard consistency and replication problems — exactly the challenges of building a consistent database on eventually-consistent object storage. Having the former CTO of Materialize as CTO signals that Turbopuffer's distributed systems foundations are built by someone who has done this at the hardest level.

### Nathan VanBenschoten — Chief Architect

| | |
|---|---|
| **Education** | B.S. Electrical and Computer Engineering, Northeastern University |
| **Prior** | Principal Software Engineer at CockroachDB (7 years) — focused on transactions, replication, and persistence layers. Google (Wide Profiling team intern). |

**What's notable:** 7 years on CockroachDB's transactions, replication, and persistence layers. This is the person who built the exact systems (write-ahead logs, compaction, distributed consistency) that Turbopuffer had to reinvent for object storage. Having both Benesch (CockroachDB → Materialize → Turbopuffer) and VanBenschoten (7 years CockroachDB → Turbopuffer) means the core database engineering team has ~20 combined years of experience building distributed databases at the frontier.

### Bojan Serafimov — Engineer

| | |
|---|---|
| **Education** | MIT (2014–2018) |
| **Prior** | IOI medalist (Simon: "Bojan was better"), IMO medalist. Core contributor to storage at Neon (serverless Postgres). Kensho Technologies, YugaByte. |

**What's notable:** Second employee at Turbopuffer. *"Completely rewrote Turbopuffer's core architecture."* An IOI and IMO medalist (competitive programming AND mathematics olympiad) with storage engine experience at Neon (serverless Postgres) and YugaByte (distributed SQL). Simon met him at IOI and recruited him specifically for his algorithmic depth + storage systems experience.

### Other Key Hires

| Name | Background | Role |
|------|-----------|------|
| **Morgan Gallant** | Founded Operand (search startup) | Built Turbopuffer's full-text search (third hire) |
| **Xavier Denis** | Created Creusot (leading Rust program verifier) during PhD; ex-Shopify infra | Engineer |
| **Mike Gagnon** | Shopify finance, Series A through IPO | Finance |

**Team composition:** 22 people. The engineering core is ex-CockroachDB + ex-Materialize + ex-Neon + ex-Shopify — a concentration of distributed database and infrastructure scaling talent that's disproportionate for a seed-stage company. GTM hires from CockroachDB, Cloudera, RedPanda.

---

## Investor Depth

### Lachy Groom — Lead Investor (Pre-Seed + Seed)

Former head of Stripe Issuing, co-founder of Physical Intelligence (robotics foundation model company). Investment philosophy: invest in tools developers love organically, not software they're forced to use — bottom-up adoption models.

**Why he invested:** Groom backs infrastructure companies with developer love. Turbopuffer's customer acquisition pattern — no sales team, no marketing, customers find them through word-of-mouth and technical reputation — is exactly the bottom-up adoption model Groom's thesis is built on. Simon's promise to him: *"If this doesn't have PMF by the end of the year, we'll just return all the money."* That confidence, from a founder who had already proven he could scale Shopify's infrastructure 100x, was compelling.

**What signal it sends:** Groom is one of the most sought-after early-stage investors in infrastructure. His bet on Turbopuffer (pre-seed AND seed, doubling down) signals conviction that this is a generational infrastructure opportunity, not a feature that gets absorbed into existing databases.

### Thrive Capital — Seed Co-Lead

Founded by Joshua Kushner. Known for AI infrastructure bets (OpenAI). Turbopuffer was described as their most recent first-time investment.

**What signal it sends:** Thrive's portfolio includes the largest AI companies in the world. Adding Turbopuffer to that portfolio positions it alongside the infrastructure layer they believe AI applications will depend on. Thrive doesn't do many seed investments — their participation signals that they see this as a potential multi-billion-dollar outcome.

### Redpoint Ventures

Listed among 8 total investors (per CB Insights). Redpoint has a strong enterprise infrastructure portfolio (Snowflake, Stripe, HashiCorp, Twilio).

---

## Hiring Signals & Strategic Direction

**Recent/Open roles:**
| Role | What It Reveals |
|------|-----------------|
| Solutions Engineer (remote US) | Enterprise customer deployment support — moving beyond self-serve |
| Product Engineer | Investing in developer experience / dashboard / tooling |
| Security Lead (SOC2/HIPAA) | Enterprise compliance push |
| Sales / Account Executive | First GTM hires — transitioning from pure word-of-mouth to proactive sales |
| Database Engineer (filled) | Core engine development continues |

**Strategic reads:**

1. **Sales + Solutions Engineering = enterprise go-to-market.** Turbopuffer grew to "tens of millions" ARR with zero sales team. Now hiring sales and solutions engineers signals they're ready to proactively pursue enterprise deals rather than waiting for inbound. The self-serve flywheel generated PMF; now they're adding a sales motion to accelerate.

2. **Security Lead = compliance moat.** SOC2 Type 2, HIPAA, GDPR already achieved. A dedicated security lead suggests they're going deeper — FedRAMP, financial services compliance, healthcare-specific certifications. This locks out competitors who can't match compliance posture.

3. **Still only 22 people.** The core database engine is built by a ~10-person engineering team that includes two former CockroachDB engineers, a former Materialize CTO, a Neon storage contributor, and multiple IOI/IMO medalists. They're not hiring 50 engineers — they're hiring 5 more of the best and adding GTM around the core.

---

## Conference & Media Presence

### Technical Circuit (Strong)

- **CMU Database Seminar** (March 2026) — "PostgreSQL vs. The World" series. Invitation-only seminar at the top database research program in the world. Being invited alongside Snowflake, CockroachDB, and SingleStore signals that CMU considers Turbopuffer architecturally significant.
- **Google Cloud Next 2026** — Speaker. Google Cloud is Turbopuffer's primary infrastructure provider.
- **USENIX SREcon19 EMEA** — Simon's pre-Turbopuffer talk on "Advanced Napkin Math: Estimating System Performance from First Principles."

### Podcast Circuit (Extensive)

Latent Space, The PMF Show, Software Engineering Daily, Vector Podcast, Amplify Partners Barrchives, Unsupervised Learning, Postgres FM, Bessemer Podcast, Jason Liu Podcast, The Geek Narrator, The Database School Podcast — Simon has done 10+ podcast appearances, each deeply technical. This is not a CEO doing marketing; it's a systems engineer explaining architecture to other systems engineers.

### Blog (Technical Depth)

The Turbopuffer blog functions as technical documentation of architectural decisions:
- Vectorized MAXSCORE over WAND for long LLM-generated queries (Jan 2026)
- FTS v2: up to 20x faster full-text search (Dec 2025)
- Native filtering for high-recall vector search (Dec 2025)
- Continuous recall measurement (Jan 2025)
- "Fast search on object storage" — foundational architecture post (Sep 2024)

**Dual-circuit analysis:** Turbopuffer is entirely on the technical/developer circuit. No mainstream press coverage, no TechCrunch fundraising announcements, no marketing presence. This is deliberate — the product sells through technical credibility with engineering teams, not through CIO presentations. The CMU seminar invitation and Google Cloud Next talk provide academic and infrastructure-layer validation. The risk: if enterprise sales require brand recognition beyond the developer community, the marketing gap matters.

---

## Why This is a Non-Consensus Bet

### What the consensus thinks:

1. **Vector databases are commoditizing.** pgvector is free and built into PostgreSQL. Elasticsearch added vector search. MongoDB added vector search. Every database is adding vector capabilities. There's no room for a dedicated vector database — it's a feature, not a product.

2. **Object storage is too slow for real-time queries.** The whole point of vector search is speed — sub-10ms results for conversational AI. Object storage latency (50–200ms) is fundamentally incompatible with real-time requirements. Turbopuffer's cold query latency (~350ms) proves the point.

3. **Pinecone already won the market.** $138M raised, $750M valuation, first mover advantage, brand recognition. The market leader in dedicated vector databases.

4. **HNSW is the superior indexing algorithm.** Graph-based approximate nearest neighbor algorithms (HNSW, DiskANN) provide the best recall at the best latency. Turbopuffer's centroid-based approach (SPFresh) is an older, less performant paradigm. Zilliz specifically criticized SPFresh's recall degradation.

5. **A 22-person company can't build a generational database.** Snowflake, Databricks, CockroachDB, and MongoDB each have thousands of engineers. Database engineering is extraordinarily complex — consistency, durability, performance, security, compliance. You can't do it with 22 people.

### What Turbopuffer believes differently:

1. **Vector search isn't a feature — it requires a fundamentally different storage architecture.** Simon's thesis: adding vector search to PostgreSQL or Elasticsearch is like adding a secondary index. It works for small workloads. But at 100M+ vectors with millions of namespaces, you need a purpose-built storage engine that understands how to manage embeddings on object storage. pgvector *"performance falls off a cliff once you can't cache in RAM."* The new workload (AI search at scale) requires the new storage architecture (object-storage-native). Without both, you don't get a generational company.

2. **Cold latency is acceptable; cost reduction is not optional.** Cursor's 95% cost reduction and Notion's millions of dollars saved per year demonstrate that cost matters more than cold-start latency for production AI workloads. Warm queries serve at 8ms — comparable to in-memory databases. The 350ms cold start is the price of 10–100x cheaper storage. Customers are telling Turbopuffer with their wallets that they'll take that tradeoff.

3. **Pinecone is being disrupted, not winning.** Notion migrated from Pinecone to Turbopuffer in October 2024. Pinecone is now exploring a sale. Turbopuffer's ARR is approaching or exceeding Pinecone's $26.6M with a fraction of the headcount and funding. First-mover advantage in databases means nothing if the architecture is wrong — Oracle was the first mover in relational databases, but Snowflake's cloud-native architecture disrupted it.

4. **Centroid-based indexing is the right choice for object storage.** HNSW requires many random hops through a graph — each hop is a potential object storage read (50ms+). Centroid-based approaches identify the relevant cluster(s) with one or two reads, then fetch the vectors in those clusters. Fewer roundtrips = faster queries on high-latency storage. The indexing algorithm must match the storage medium. Zilliz's critique of SPFresh recall degradation is acknowledged, but Turbopuffer continuously measures recall in production and actively manages it — something competitors don't do.

5. **22 obsessive people beat 2,000 ordinary ones.** The team includes ex-CockroachDB/Materialize/Neon engineers with ~20 combined years of distributed database experience, IOI/IMO medalists, and the creator of a leading Rust program verifier. Simon on hiring: *"The P99 engineer has some history of having bent their trajectory or something to their will. The P99 engineer is obsessive."* The Shopify alumni scaled one of the world's largest e-commerce platforms from 100 to 1M requests/second. This is not 22 random engineers — it's 22 people who have individually proven they can build systems at extraordinary scale.

---

## Competitive Landscape

| Company | Funding | Revenue | Architecture | Key Weakness vs. Turbopuffer |
|---------|---------|---------|-------------|------------------------------|
| **Pinecone** | $138M | $26.6M (2024) | In-memory/SSD, fully managed | 10–100x more expensive at scale. Lost Notion. Exploring sale. 100K namespace cap. |
| **Zilliz / Milvus** | $113M | — | Open source, HNSW | More complex to operate. Published detailed critique of Turbopuffer (cold latency, recall degradation) — but hasn't won Turbopuffer's customers back. |
| **Qdrant** | $87.8M | — | Open source, Rust, HNSW | Similar Rust performance story but SSD-first, not object-storage-native. Higher cost at scale. |
| **Weaviate** | $67.7M | — | Open source, GraphQL | Developer-friendly but same SSD-first cost structure. |
| **Chroma** | $18M | — | Open source, developer-first | Focused on simplicity/DX, not scale. Good for prototypes, breaks at production scale. |
| **pgvector** | Free | — | PostgreSQL extension | Free and convenient. Performance degrades past ~10M vectors. No multi-tenancy. |
| **Elasticsearch** | $1.2B+ (Elastic NV) | $1.3B+ | Inverted index + vector | General-purpose, not optimized for vector workloads. Heavy operational burden. |

**The competitive dynamic summarized:** Turbopuffer is winning on cost (10–100x cheaper than Pinecone/Qdrant at scale), losing on cold-start latency (350ms vs. <5ms), and competing on warm latency (8ms vs. 5ms — close enough). For production AI workloads with 100M+ vectors, cost wins. The customers prove it: Cursor (95% cost reduction), Notion (80% cost reduction), Linear (70% cost reduction).

**Zilliz's detailed critique** (blog post analyzing Turbopuffer's weaknesses) is worth acknowledging: cold p99 latencies around 4 seconds, recall degradation with selective filters (0.78 at 50% selectivity, 0.54 at 99% selectivity), eventual consistency on deletes. These are real limitations. Turbopuffer's response is architectural: native filtering (Dec 2025 release) addresses the recall degradation issue, and continuous recall measurement in production provides transparency that competitors lack.

---

## Qualitative Assessment

**Conviction Level: HIGH**

### Bull Case:

1. **The customer list is the bull case.** Cursor (100B+ vectors, 95% cost reduction), Notion (migrated from Pinecone, saving millions/year), Anthropic, Atlassian, Ramp, Grammarly, Cognition — this is not a company with hypothetical PMF. Production customers at massive scale, growing 10x in one year, with zero sales team. The product sells itself because the economics are overwhelming.

2. **The founding team is perfectly constructed for this problem.** Simon and Justine spent 8+ years together scaling Shopify's infrastructure 100x. Nikhil Benesch was CTO of Materialize and before that at CockroachDB. Nathan VanBenschoten spent 7 years on CockroachDB's replication and persistence layers. Bojan Serafimov is an IOI+IMO medalist who rewrote Turbopuffer's core architecture after building storage at Neon. This isn't "smart generalists tackling databases" — it's the specific people who built the specific systems (distributed consensus, LSM trees, multi-tenant scaling) that Turbopuffer requires.

3. **The storage economics are structural, not temporary.** Object storage at $0.02/GB vs. replicated SSDs at $0.60/GB is a 30x cost difference driven by physics and cloud infrastructure economics. This gap won't close. As data volumes grow (every company embedding everything for AI), the cost advantage compounds. Competitors can't match Turbopuffer's pricing without rebuilding their architecture from scratch.

4. **Pinecone's decline validates the thesis.** The market leader — $138M raised, $750M valuation — lost its largest customer (Notion) to Turbopuffer and is now exploring a sale. This is the canonical disruption pattern: incumbent built for an earlier era's assumptions (everything in memory), challenger built for the new reality (object storage + AI scale). When the market leader starts looking for an exit, the paradigm shift is real.

5. **The ambition matches the opportunity.** Simon explicitly frames Turbopuffer as a "generational database company" — not a vector database, but a database company that starts with vectors. The architecture (object-storage-native, stateless compute, tiered caching) is general enough to expand to full-text search (already done), hybrid search (already done), and potentially other database workloads. The Snowflake/Databricks comparison ($1B+ ARR) is the target. With ARR already in "tens of millions" at 22 people, the revenue-per-employee efficiency is extraordinary.

### Key Risks:

1. **Cold-start latency is a real limitation.** 350ms for a first query to a cold namespace is fine for background search but problematic for real-time conversational AI where users expect instant responses. Competitors with in-memory architectures serve <5ms always. If the market bifurcates into "latency-sensitive" (competitors win) and "cost-sensitive" (Turbopuffer wins), Turbopuffer's addressable market is smaller than the total vector database TAM.

2. **Zilliz's recall degradation critique hasn't been fully answered.** The published critique showing recall dropping to 0.54 at 99% filter selectivity is concerning. Turbopuffer's native filtering release (Dec 2025) addresses this, but the extent of the fix hasn't been independently benchmarked. Continuous recall measurement is the right approach, but if production recall is lower than competitors, some workloads won't be viable.

3. **"Feature, not product" is the existential risk.** PostgreSQL (pgvector), Elasticsearch, MongoDB, and every major cloud database are adding vector search. If the "good enough" threshold keeps rising, the market for dedicated vector databases shrinks. Simon's counter — that pgvector breaks past 10M vectors — is true today but may not be true forever as PostgreSQL improves.

4. **22 people serving Cursor, Notion, Anthropic, Atlassian.** The customer concentration risk is real. If Cursor or Notion has a production incident that Turbopuffer's 22-person team can't resolve fast enough, the reputational damage could be severe. Enterprise customers expect 24/7 on-call support, dedicated account teams, and immediate escalation paths. The first GTM hires (solutions engineer, sales) signal awareness of this risk.

5. **Undisclosed funding creates uncertainty.** Neither funding amount nor valuation is public. This could mean (a) the round was small and they don't want competitors to know, (b) they're waiting for a larger round at a higher valuation, or (c) investors requested confidentiality. In any case, without knowing the capitalization, it's hard to assess runway and dilution.

**Bottom Line:** Turbopuffer is the most compelling infrastructure company in this vault. The customer evidence is overwhelming — Cursor, Notion, Anthropic, Atlassian, Ramp, Grammarly — at production scale with 10x sales growth, zero marketing spend, and 22 people. The founding team's 8+ years together at Shopify + concentrated distributed database expertise from CockroachDB, Materialize, and Neon is the exact background needed to build a generational database company. The storage economics (30x cheaper than competitors) are structural and permanent. Pinecone's decline validates the disruption thesis. The main risks — cold-start latency, recall degradation under filters, the "feature not product" existential question — are real but are being actively addressed and haven't stopped customers from migrating at massive scale.

**Verdict: A rare combination of structural economic advantage, elite engineering team, and overwhelming customer validation. HIGH conviction — this has the makings of a generational database company, and the evidence is already in production at scale.**

---

*Research compiled: March 2026*
