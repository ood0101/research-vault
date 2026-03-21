# SF Compute (The San Francisco Compute Company)

| Field | Detail |
|---|---|
| **Website** | [sfcompute.com](https://sfcompute.com) |
| **HQ** | San Francisco, CA |
| **Founded** | 2023 |
| **Structure** | The San Francisco Compute Company / San Francisco Compute Trading Company LLC |
| **Stage** | Series A |
| **Lead Investors** | DCVC, Wing Venture Capital (Series A); Alt Capital / Jack Altman (Seed) |
| **Total Raised** | ~$52-55M |
| **Valuation** | ~$300M (Series A, Nov 2025) |

---

## The Big Audacious Idea

~$1 trillion is flowing into AI compute infrastructure. Data centers are being built at unprecedented scale. But there's a structural problem: AI startups bill on usage while paying fixed compute contracts. Demand is uneven. GPU clusters sit idle while other companies are GPU-starved. There's no liquidity — once you sign a 12-month contract, you're locked in.

SF Compute is building the **financial marketplace for GPU compute** — where GPU time is a tradable commodity, contracts can be bought and sold, and dynamic pricing approaches 100% utilization. Think commodities exchange meets Airbnb, but for supercomputers.

Evan Conrad: *"Something like a trillion dollars is flowing into compute. And if you don't have secure offtake, that means there's a bubble."*

And: *"If you couple the software and the hardware together, you're going to lose money."*

The company was born by accident. Conrad and co-founder Alex Gajewski were building an AI music model, signed a $500K/month GPU contract they couldn't fully use, and proposed a collective rental to other AI startups. 170 companies signed up within weeks. The music company died. The GPU marketplace lived.

---

## The Problem That's So Hard to Solve

**The GPU infrastructure market has a liquidity crisis.** Hundreds of billions of dollars are being deployed into GPU clusters, but the market structure is primitive — long-term fixed contracts, no price discovery, no secondary market, no way to hedge demand uncertainty.

**Why this is genuinely hard:**

1. **The contract rigidity trap.** GPU providers (CoreWeave, Lambda) offer favorable pricing on 1-3 year contracts. AI startups need flexibility — they might train for 2 months, go idle for 3, then need 10x capacity for inference. Fixed contracts mean paying for capacity you don't use, or not having capacity when you need it.

2. **The financing chicken-and-egg.** Lenders require "offtake" (pre-signed leases) before financing new data centers. But AI companies don't want to sign long-term leases. SF Compute's marketplace acts as the demand aggregator that makes cluster financing possible.

3. **Two-sided marketplace bootstrapping.** You need sellers (GPU operators) and buyers (AI companies) simultaneously. Neither comes without the other. Classic cold-start problem.

4. **Hardware reliability at scale.** GPU clusters fail. InfiniBand links go down. Power fluctuates. SF Compute doesn't own the hardware — they must ensure quality through aggressive burn-in testing (48hrs to 7 days of LINPACK) and real-time diagnostics on hardware they don't control.

5. **Financialization risk.** As the marketplace matures, speculative trading could dominate real compute usage. Conrad's own insight — *"Almost for certain, there will be more volume on SFC's marketplace than actually change hands in GPU terms"* — is both the opportunity and the risk.

---

## The Technology Stack

### Core Product: GPU Marketplace

- **Buy/sell GPU time** by the hour on standardized clusters
- **Tradable contracts** — resell unused capacity in real-time
- **Dynamic pricing** — each block priced independently based on size, duration, and market conditions
- **H100 SXM5 80GB**: ~$1.50-$1.99/GPU/hr (fluctuating)
- **H200 SXM5 141GB**: Listed but unavailable (March 2026)
- **B300**: Coming Q2 2026
- **VMs spin up in ~5 minutes**
- **InfiniBand** (3.2Tb/s) on certain clusters; VM InfiniBand coming Q2 2026
- **Zero ingress/egress fees**
- **Automatic refunds** on hardware failures
- **24/7 support** via dedicated Slack channels + emergency phone

### Infrastructure Control

- **From UEFI up**: Custom UEFI shims, whitelisted motherboards, cluster-wide standardization
- **All-Rust orchestration platform** (per job postings)
- **Aggressive burn-in/auditing**:
  1. LINPACK testing (48hrs to 7 days)
  2. Performance testing in realistic environments
  3. Active checks during idle periods
  4. Passive background diagnostics
- **Cluster names**: Angel Island (first), Bay Bridge (second)
- **Per node**: 1.5TB+ NVMe, 1TB+ RAM

### Additional Products

**Fog** — Self-hostable GPU cloud software for operators who want to run their own infrastructure. *"Fog = cloud close to the ground."*

**Large Scale Inference (LSI) Batch API** — Partnership with Modular (Jan 2026). High-throughput async inference for data labeling, summarization, synthetic data generation. 20+ models (DeepSeek R1/V3 671B, Llama 3.1 series, Qwen, InternVL3, Gemma-3). Up to 80% cheaper than alternatives. Built with an unnamed tier-1 AI lab to "print trillions of tokens of synthetic data."

### Open Source

[GitHub](https://github.com/sfcompute) — 28 repos. Apache-2.0 SDKs (TypeScript, Go). Notable:
- `hardware_report` (Rust, 26 stars) — hardware automation
- `tinynarrations` (Python, 31 stars) — synthetic narration dataset
- CLI tool: `sf buy -n [count] -d [duration]`

---

## What the World Looks Like If This Works

1. **GPU compute becomes a liquid commodity.** Like oil futures or electricity markets, GPU time has real-time price discovery, tradable contracts, and hedging instruments. AI companies buy compute like airlines buy jet fuel.

2. **The $1 trillion infrastructure build-out gets de-risked.** Guaranteed demand (offtake) through the marketplace makes lenders comfortable financing new clusters. More clusters get built. More compute becomes available. Prices drop.

3. **GPU utilization approaches 100%.** Today, many clusters sit partially idle because contracts don't match demand. Tradable contracts and dynamic pricing fill every gap.

4. **AI startups stop going bankrupt from compute contracts.** Flexibility to buy, sell, and resize compute eliminates the structural mismatch between fixed GPU costs and variable AI revenue.

5. **A new financial ecosystem emerges** around compute — derivatives, futures, options, hedging instruments — just as it did for electricity, oil, and other commodities.

---

## Best Case Scenario / Addressable Opportunity

| Market | 2025 | Long-term |
|---|---|---|
| GPU-as-a-Service | $5-21B (varies by source) | $26-134B by 2030-2032 |
| Global GPU market | $61.6B (2024) | $461B-1.4T by 2032-2034 |
| Cloud-computing startup funding | $11.76B in 2025 alone (2x all of 2024) | — |

At ~10% take rate on a $50B+ GPUaaS market, the revenue opportunity is $5B+. But the real play is becoming the exchange layer — if GPU compute becomes a tradable commodity, the exchange takes a fee on every transaction, including financial instruments beyond raw compute.

---

## The Science: A Brief History

- **2019-2021**: GPU clouds emerge (CoreWeave, Lambda). Dedicated rental model. Multi-year contracts.
- **2022**: ChatGPT creates explosive demand. GPU scarcity begins. H100 waitlists stretch months.
- **2023**: Severe GPU shortage. AI startups desperate for compute. Conrad & Gajewski sign $500K/month contract for AI music model, can't use it all, propose collective rental. 170 companies join. SF Compute born.
- **2024**: GPU supply normalizes. CoreWeave approaches IPO. SF Compute raises $12M seed from Jack Altman. The "offtake" problem crystallizes — lenders need guaranteed demand to finance clusters.
- **2025**: CoreWeave IPOs. AWS cuts H100 prices 44%. $11.76B flows into cloud-computing startups. SF Compute raises $40M Series A at $300M. Revenue grows 13x in 4 months. Manages $100M+ in hardware.
- **2026**: Inference demand explodes (OpenAI o1-class models). SF Compute launches LSI Batch API with Modular. B300 GPUs coming Q2.

**Why Now**: The convergence of (1) unprecedented capital flowing into GPU infrastructure (~$1T), (2) supply normalization creating a potential glut, (3) the structural mismatch between fixed GPU contracts and variable AI demand, and (4) the emergence of test-time inference (o1-class models) creating explosive new demand. The market needs a commodities exchange. SF Compute is building it.

---

## Commercial Validation

| Partner/Customer | Type | Detail |
|---|---|---|
| **NVIDIA** | Trusted partner | Listed on homepage |
| **Roboflow** | Customer | CTO: "competitive pricing and lack of vendor lock-in" |
| **Datology AI** | Customer | CSO: "convenient and easy to use" |
| **Liquid AI** | Customer | Listed on homepage |
| **MIT** | Customer | Listed on homepage |
| **Ultravox** | Customer | CEO: "Pricing and availability hard to beat" |
| **Mach9** | Customer | "Extremely fast" spin-up |
| **Standard Intelligence** | Customer | Mentioned in Latent Space |
| **Modular** | Partner | Joint LSI Batch API product |
| **Soluna Holdings (NASDAQ: SLNH)** | Supplier | MSA signed Dec 2024. 80-120 H100s. Max $2.466M/yr revenue |
| **Tier-1 AI Lab (unnamed)** | Customer | Built LSI product to "print trillions of tokens of synthetic data" |
| **Schmidt Futures** | Indirect | Grantees use SF Compute |

**Revenue signals:** 13x growth Jul-Oct 2025. Customers spending "millions/month." ~10% take rate. $100M+ hardware managed. Specific figures not disclosed.

---

## Core Team

### Evan Conrad — Co-Founder & CEO

| Field | Detail |
|---|---|
| **Education** | BS Computer Science, Gonzaga University (2015-2018) |
| **Career** | Segment (eng) → Room Service (YC S19, CRDT-based multiplayer, "a distributed systems company that didn't work out") → OpenAI (ChatGPT Enterprise) → AI Grant (batch 1, 170+ AI startups) → SF Compute |
| **Background** | Also worked in derivatives trading |

**What's notable**: Conrad's trajectory reads like it was designed to build a GPU commodities exchange. A failed distributed systems company (Room Service) taught him infrastructure pain. A brief OpenAI stint showed enterprise AI compute needs. Running AI Grant batch 1 gave him a network across 170+ AI startups — and direct insight into their compute problems. The derivatives trading background informs the financial architecture of tradable GPU contracts. And the accidental founding story (signing a $500K/month GPU contract he couldn't fully use) gave him the first-hand insight that GPU compute needs a secondary market.

*"We set expectations really low and then you get a supercomputer for like millions of dollars cheaper than you would have otherwise gotten."*

*"[CoreWeave is] a bank. It's a real estate company. And it's very hard to not be that."*

### Eric Park — CTO (joined 2025)

| Field | Detail |
|---|---|
| **Education** | BS EECS, UC Berkeley; MS CS, Stanford |
| **Career** | NASA Ames (Robotics) → Google → Quest Visual → Cadence (YC W20) → **Voltage Park CEO** ($500M+ GPU clusters, backed by Jed McCaleb) → SF Compute CTO |

**What's notable**: Park ran one of the largest non-hyperscaler GPU operations in the world at Voltage Park — managing $500M+ worth of GPU clusters backed by crypto billionaire Jed McCaleb. He knows data center operations, GPU fleet management, and the operational challenges of making compute accessible at scale. His move from Voltage Park CEO to SF Compute CTO suggests he believes the marketplace model is the future, not the infrastructure-ownership model he was running.

### Eric Menees — Co-Founder & CRO

| Field | Detail |
|---|---|
| **Education** | BS Neuroscience (Cajal Scholar) + Mechanical Engineering + Biochemistry, UT Austin |
| **Career** | Cervelio (neurotechnology) → Fynn (YC fintech, co-founded with Ethan Anderson) → SF Compute |

**What's notable**: The fintech founder background (Fynn) is directly relevant — building financial marketplaces, handling transactions, managing pricing. Triple-major in neuroscience/mech-eng/biochem signals intellectual range.

### Alan Butler — Chief Business Officer

Industry veteran with roles at **Sun Microsystems** and **Lambda Labs**. Enterprise sales and datacenter industry experience.

### Departed Co-Founders

- **Alex Gajewski** (original co-CEO): Columbia CS, Uber AI Labs researcher (worked with Jeff Clune, Kenneth O. Stanley), founded Metaphor/Exa (neural search engine). Left SF Compute.
- **Ethan Anderson** (COO): Co-founded Fynn with Menees, handled GTM. Now at Figma on AI research team.

---

## Investor Depth

**Alt Capital / Jack Altman (Seed lead, $12M at ~$70M)**: Jack Altman is Sam Altman's brother. Alt Capital launched with $150M Fund I, later closed $274M Fund II in a single week. The Altman connection gives SF Compute proximity to the OpenAI ecosystem — the single largest source of AI compute demand.

**DCVC (Series A co-lead, $40M at $300M)**: Deep tech VC. GP Ali Tamaseb joined the board. Called SF Compute "a true marketplace for compute" that "unlocks liquidity, efficiency, and price discovery in a market that has historically been rigid." DCVC's portfolio includes hard infrastructure companies — they understand capital-intensive markets.

**Wing Venture Capital (Series A co-lead)**: Enterprise infrastructure specialist VC. Validates the enterprise angle of the marketplace.

**Electric Capital (Series A participant)**: Crypto/Web3-focused fund. Interesting signal — suggests SF Compute may eventually explore tokenized compute contracts or blockchain-based settlement.

---

## Hiring Signals & Strategic Direction

**9 open roles**, all San Francisco:

| Role | Salary | Signal |
|---|---|---|
| Systems Software Engineer | $170K-$500K + equity | Highest comp = most critical hire |
| Principal HPC Network Engineer | $250K-$325K | InfiniBand/networking infrastructure |
| HPC Hardware Engineer | $220K-$300K | In-house hardware expertise |
| Software Engineer - Networking | $175K-$300K | Network stack investment |
| Solutions Architect | $160K-$220K | Enterprise sales push |

**Key signals**: Heavy HPC/networking investment despite asset-light model — they need deep hardware expertise to audit and manage clusters they don't own. All-Rust orchestration platform. No ML/AI research roles — confirms pure infrastructure play. Solutions Architect = enterprise sales expansion. Systems Software Engineer at $500K cap = competing for elite talent.

---

## Conference & Media Presence

**Major press**: Wall Street Journal (Series A exclusive), Bloomberg, NYT, The Verge

**Podcast**: Latent Space — *"SF Compute: Commoditizing Compute to solve the GPU Bubble forever"* (April 2025). Deep technical + business model interview with Evan Conrad.

**Industry**: Data Center Dynamics, eWeek, PYMNTS, The Deep View

**Social**: @sfcompute on X (~7,861 followers)

**Speaking**: Eric Menees at RAISE Summit 2025

---

## Why This is a Non-Consensus Bet

**What the consensus thinks:**

1. GPU infrastructure is a hardware play — you need to own GPUs to compete (CoreWeave model)
2. Hyperscalers (AWS, GCP, Azure) will ultimately win on scale and integration
3. An asset-light marketplace can't guarantee reliability or SLAs without owning hardware
4. GPU compute is too heterogeneous and operationally complex to commoditize like electricity
5. Two co-founders have already left — instability signal

**What SF Compute believes differently:**

1. Coupling software and hardware is a losing strategy — *"you're going to lose money"* — because GPU hardware margins are thin and software margins get competed away. The marketplace layer (Airbnb model) captures value without capital intensity
2. The real problem isn't hardware access — it's **liquidity and flexibility**. AI companies need to buy, sell, and resize compute in real-time, not sign 12-month contracts
3. The ~$1 trillion infrastructure build-out creates a structural need for offtake aggregation — lenders won't finance clusters without guaranteed demand, and SF Compute becomes the demand aggregator
4. Decentralized GPU networks will never compete because speed-of-light latency means distributed GPUs can't match fully interconnected InfiniBand clusters
5. As the market matures, GPU compute will inevitably become a tradable commodity — and the exchange that establishes liquidity first wins a natural monopoly

---

## Competitive Landscape

| Company | Model | H100 Price/hr | Funding | Key Differentiator |
|---|---|---|---|---|
| **SF Compute** | Marketplace (asset-light) | $1.50-$1.99 | $55M ($300M val) | Tradable contracts, liquidity, dynamic pricing |
| **CoreWeave** | Own infrastructure | $1.45 (reserved) | $12B+ (IPO'd) | Kubernetes-native, enterprise SLAs, InfiniBand |
| **Lambda Labs** | Own infrastructure | $2.49 | $400M+ | Developer experience, no egress fees |
| **Vast.ai** | P2P marketplace | $1.87 | Modest | Lowest rates, consumer + enterprise GPUs |
| **RunPod** | Marketplace | $1.99 | Undisclosed | Spot instances, consumer GPUs available |
| **Spheron** | Marketplace | $2.01 (dedicated) | $7.1M | 30+ SKUs, single GPU minimum, Web3 |
| **Cumulus Labs** | Serverless + managed | N/A (inference API) | ~$875K (YC) | Hardware-specific IonAttention engine |
| **AWS/GCP/Azure** | Own infrastructure | $6-8 | Hyperscaler | Integration, global scale, enterprise trust |

---

## Qualitative Assessment

**Conviction Level: MEDIUM-HIGH**

**Bull case:**

1. **The marketplace thesis is directionally correct.** GPU compute is following the trajectory of every other commodity — from bilateral contracts to standardized exchange trading. The question isn't whether this happens, but when and who captures it.
2. **$300M valuation with 13x revenue growth in 4 months** — the market is voting with real money. Customers spending "millions/month" on the platform.
3. **Eric Park (CTO) left Voltage Park ($500M GPU operation) to join.** When someone running one of the biggest GPU fleets in the world switches to the marketplace model, it's a strong signal.
4. **The offtake problem is real and structural.** Lenders need guaranteed demand to finance clusters. SF Compute solves this. As long as AI compute demand grows, the marketplace becomes essential infrastructure.
5. **NVIDIA as a trusted partner** validates the approach at the industry level.

**Key risks:**

1. **Asset-light means zero control over supply.** Hardware operators could underperform, defect, or raise prices. SF Compute's quality depends entirely on partners it doesn't own.
2. **Two co-founders departed** (Gajewski, Anderson). Key person risk concentrated on Evan Conrad.
3. **Narrow hardware catalog.** Primarily H100s. H200 unavailable. B300 not yet live. Competitors offer far broader options.
4. **High minimums** — 32 GPUs (4 nodes) minimum via web UI. Not suited for small-scale workloads.
5. **Market cycle exposure.** ~10% take rate on transaction volume means revenue amplifies both booms and busts. A GPU demand slowdown would compress both prices and volume.

**Bottom line**: SF Compute is building what feels inevitable — a liquid marketplace for GPU compute. The $1 trillion infrastructure build-out needs an exchange layer, and SF Compute is the furthest along in building it. The team has the right insights (Conrad's derivatives background, Park's GPU fleet experience, Menees' fintech background). Revenue is growing explosively. The risks are real — asset-light dependency, narrow catalog, co-founder departures — but the structural thesis is strong.

**Verdict: The most compelling GPU infrastructure play among the non-hyperscaler, non-hardware-owning companies. The marketplace model is the right long-term bet, the team has unique insight from both sides of the market, and 13x revenue growth in 4 months with customers spending millions/month validates real demand. The question is whether SF Compute becomes THE commodity exchange for compute, or whether a competitor (or hyperscaler) builds a better one. First-mover advantage in marketplace liquidity is a powerful moat.**

---

## Appendix: Comparison — SF Compute vs Cumulus Labs vs dCompute

| Dimension | SF Compute | Cumulus Labs | dCompute |
|---|---|---|---|
| **What they do** | GPU commodities marketplace (buy/sell/trade compute time) | Serverless inference with custom hardware-specific engine | Serverless AI agent deployment on decentralized infra (Spheron/Akash) |
| **Stage** | Series A ($55M, $300M val) | Pre-seed (YC W26, ~$875K) | Dead/dormant (website 404) |
| **Team** | ~30 people, CTO ran $500M GPU fleet at Voltage Park | 2 people (childhood friends from MA) | Anonymous (zero team info public) |
| **Revenue** | 13x growth in 4 months, customers spending millions/month | None announced | None |
| **Technical moat** | Marketplace liquidity + infrastructure from UEFI up + all-Rust orchestration | IonAttention C++ engine optimized for GH200 architecture | Thin abstraction layer over Spheron/Akash |
| **Target customer** | AI companies training/running large models (32+ GPU minimums) | Developers running inference workloads (any size) | Web3/Solana AI agent developers |
| **Hardware** | H100/H200/B300 clusters with InfiniBand | NVIDIA GH200/GB200 | Whatever Spheron/Akash provides |
| **Pricing model** | Dynamic marketplace (~$1.50-$1.99/GPU/hr, ~10% take rate) | Per-token inference API pricing | Solana token escrow |
| **Key insight** | GPU compute needs a commodity exchange with tradable contracts | Generic inference engines waste 40-60% of hardware-specific performance | AI agents on Solana need simplified deployment |
| **Conviction** | MEDIUM-HIGH | MEDIUM | N/A (dead) |

**They're not really competitors** — they operate at different layers of the stack. SF Compute is the commodity exchange where GPU time is bought and sold. Cumulus Labs is the optimization layer that makes individual GPUs run faster. dCompute was a Web3 deployment wrapper that never gained traction. SF Compute's customer might use Cumulus Labs' inference engine on GPUs purchased through SF Compute's marketplace.

*Research compiled: March 2026*
