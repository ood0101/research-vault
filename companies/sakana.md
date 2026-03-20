# Sakana AI

| | |
|---|---|
| **Website** | [sakana.ai](https://sakana.ai) |
| **HQ** | Azabudai Hills Mori JP Tower, 22F, Minato Ward, Tokyo 106-0041 |
| **Founded** | July 2023 |
| **Structure** | Japanese K.K. (Kabushiki Kaisha) |
| **Stage** | Series B (November 2025) |
| **Lead Investors** | Lux Capital, Khosla Ventures, NEA, MUFG |
| **Other Investors** | NVIDIA, Google, Salesforce Ventures, Citi, In-Q-Tel (CIA venture arm), NTT, KDDI, Sony, NEC, Fujitsu, ITOCHU, Nomura, ANA, SMBC, Mizuho, JAFCO, 500 Global, Geodesic Capital |
| **Total Raised** | ~$379–520M (estimates vary) |
| **Valuation** | $2.65B (Series B, November 2025) — Japan's most valuable AI unicorn |

---

## The Big Audacious Idea

**Instead of building ever-larger AI models from scratch — the $100B arms race that OpenAI, Google, and Anthropic are running — use nature-inspired algorithms to combine, evolve, and improve existing models at a fraction of the cost.**

Sakana AI ("sakana" means "fish" in Japanese — a school of fish that collectively navigates without central control) is building the alternative paradigm to scaling. The prevailing approach in AI: train one massive model on all the world's data using billions of dollars of compute. Sakana's thesis: that's the wrong analogy. Nature doesn't build one giant organism. It evolves populations of specialized organisms that cooperate, compete, and adapt. Apply the same principles to AI — evolutionary algorithms to combine models, collective intelligence to orchestrate small specialists, brain-inspired architectures to replace transformers — and you can match or exceed the capabilities of giant models with radically less compute.

This isn't hand-waving. Their evolutionary model merge technique combined two 7B-parameter open-source models and produced EvoLLM-JP, which outperformed 70B models on Japanese benchmarks. No training from scratch. No gradient-based backpropagation. No GPUs needed for the merge itself. Just evolutionary search over the combinatorial space of weight mixing ratios and layer configurations.

David Ha, CEO (former Google Brain Tokyo, Goldman Sachs MD): *"In a space like AI, everyone's kind of doing the same thing. They're just like collecting the world's data, building a gigantic model, sucking up all this energy."*

Llion Jones, CTO (co-author of "Attention Is All You Need," the original Transformer paper, 267K citations): *"It may sound a little controversial to hear one of the Transformers authors stand on stage and tell you that he's absolutely sick of them, but it's kind of fair enough, right? I've been working on them longer than anyone, with the possible exception of seven people."*

The founding bet: the person who named the Transformer is now building its successor. And he's doing it in Tokyo, not San Francisco.

---

## The Problem That's So Hard to Solve

### The scaling wall

The dominant paradigm in AI — train bigger models on more data with more compute — is hitting three walls simultaneously:

1. **Cost wall.** Training a frontier model costs $100M–$1B+. GPT-4 reportedly cost $100M+. The next generation will cost billions. Only a handful of companies can afford this, creating an oligopoly.

2. **Energy wall.** A single frontier model training run consumes enough electricity to power a small city for weeks. The AI industry's energy demand is projected to exceed many countries' total consumption. Nuclear reactors are being restarted specifically for AI data centers.

3. **Data wall.** Models are running out of high-quality training data. The internet has been crawled multiple times over. Synthetic data introduces compounding errors. Diminishing returns per additional token of training data are measurable.

### Why "just combine existing models" is genuinely hard

Model merging sounds simple — average the weights of two models. But the combinatorial space is astronomical:

- A 7B-parameter model has 7 billion weights. The mixing ratio for each layer can vary continuously. The number of possible combinations is effectively infinite.
- Layer architectures may be incompatible across models. You can't naively swap layers between models with different hidden dimensions or attention heads.
- Merged models often exhibit capability collapse — the merged model performs worse than either input model on specific tasks.
- The optimal merge depends on the target task, language, and domain. There's no universal "best merge."

Previous model merging approaches (simple weight averaging, SLERP interpolation) were limited by human intuition — researchers manually selected mixing ratios based on trial and error. Sakana's evolutionary approach automates this: define a fitness function (performance on benchmarks), then let evolutionary algorithms explore the vast combinatorial space of possible merges. The algorithm discovers non-obvious combinations that no human would try.

### Why the transformer might not be the endgame

Jones's insight, informed by 10+ years working on transformers: the architecture has fundamental limitations that the field is ignoring because of sunk-cost bias and path dependency:

- **Quadratic attention scaling.** Self-attention scales as O(n²) with sequence length. Every workaround (sparse attention, linear attention, etc.) compromises capability.
- **No temporal dynamics.** Transformers process tokens in parallel but have no intrinsic notion of time or temporal state. The brain doesn't work this way.
- **Homogeneous architecture.** Every transformer layer is structurally identical. Biological neural networks have wildly diverse neuron types, timescales, and connectivity patterns.

Sakana's Continuous Thought Machines (CTM) are one attempt at an alternative: brain-inspired architectures where neurons have access to their own behavioral history and synchronization between neuron dynamics encodes information. Whether CTM or something else eventually supplants transformers is uncertain — but Jones's argument that the transformer is not the final architecture has weight, given that he's one of the eight people who created it.

---

## The Technology Stack

### Evolutionary Model Merge

[sakana.ai/evolutionary-model-merge](https://sakana.ai/evolutionary-model-merge/)

Sakana's signature technique. Uses evolutionary algorithms to combine existing open-source models across two spaces:

- **Parameter space:** Optimizes weight mixing ratios (how much of model A vs. model B at each layer)
- **Data flow space:** Optimizes layer combinations (which layers from which models, in what order)

**Key results:**
- **EvoLLM-JP:** 7B-parameter merged model that outperformed 70B models on Japanese language benchmarks
- **EvoVLM-JP:** Vision-language model merged from existing multimodal models — competitive with much larger systems
- No gradient-based training required. No GPUs for the merge itself. CycleQD adds quality-diversity search for population-based merging.

**Why this matters:** The open-source model ecosystem (Llama, Mistral, Qwen, etc.) produces hundreds of specialized models. Evolutionary merging turns this ecosystem into raw material for creating new capabilities without the cost of training from scratch. It's the difference between breeding and building from atoms.

### Continuous Thought Machines (CTM)

[sakana.ai/ctm](https://sakana.ai/ctm/) — Spotlighted at NeurIPS

Brain-inspired architecture that gives neurons access to their own behavioral history and uses synchronization between neuron dynamics to encode information. An alternative to transformers that introduces temporal dynamics and neuron heterogeneity.

Jones gave a researcher a week to explore the CTM idea. It became successful enough for a NeurIPS spotlight. This mirrors the intellectual freedom that characterized early Google Research, which Jones is trying to recreate at Sakana.

### Darwin Gödel Machine (DGM)

[sakana.ai/dgm](https://sakana.ai/dgm/)

Self-improving AI that rewrites its own code through evolutionary search. Named after Gödel's incompleteness theorems (you can't prove a system correct from within the system) and Darwin's evolution (you can empirically validate improvements through selection). On SWE-bench, improved from 20% to 50% through self-modification.

### The AI Scientist (v1 & v2)

[sakana.ai/ai-scientist](https://sakana.ai/ai-scientist/) — 12.3K GitHub stars

Fully automated scientific research pipeline: idea generation → literature review → experiment design → execution → paper writing → peer review. Approximately $15 per paper. Collaboration with University of Oxford and UBC.

### Transformer-Squared (Transformer²)

Self-adaptive LLM using SVD weight decomposition + RL-learned z-vectors for real-time task-specific adaptation. Far fewer parameters than LoRA adapters. Enables a single model to specialize on-the-fly without fine-tuning.

### ShinkaEvolve

[sakana.ai/shinka-evolve](https://sakana.ai/shinka-evolve/) — Open-source, Apache 2.0

Evolutionary algorithm discovery framework. Orders of magnitude more sample-efficient than prior work (including Google's AlphaEvolve). Discovers novel optimization algorithms through evolution rather than designing them manually.

### TAID (TinySwallow-1.5B)

Small Japanese LLM achieving state-of-the-art via efficient knowledge transfer. **ICLR 2025 Spotlight** — the strongest signal of academic validation for Sakana's research.

### Text-to-LoRA / Doc-to-LoRA

Instant model adaptation without training — convert a text document into a LoRA adapter that specializes a model on that document's content. No GPU training required. 1.2K GitHub stars.

---

## What the World Looks Like If This Works

1. **The AI oligopoly breaks.** If nature-inspired approaches can match frontier model capabilities at 1/100th the cost, the $100B training-run barrier drops. Countries, universities, and mid-size companies can build competitive AI without being beholden to OpenAI/Google/Anthropic. Japan gets sovereign AI capability. So does every other G20 nation.

2. **Open-source models become the substrate for evolution.** Every new Llama, Mistral, or Qwen release becomes raw material for Sakana's evolutionary algorithms. The open-source ecosystem feeds the evolutionary process — more models to merge means more capabilities to discover. This creates a flywheel: the better open-source gets, the more Sakana can extract from it.

3. **The transformer era ends.** Jones explicitly said he's *"drastically reducing the amount of time that I spend on transformers"* and *"explicitly now exploring and looking for the next big thing."* If CTM or another post-transformer architecture emerges from Sakana, it's the architectural paradigm shift since 2017. The person who named the transformer is the person who retires it.

4. **AI models become adaptive, not static.** Transformer-squared and Text-to-LoRA point toward a future where models specialize in real-time without retraining. Every model becomes a population of virtual specialists that emerge on demand. Static, one-size-fits-all models become obsolete.

5. **Japan becomes a global AI power.** Sakana becomes Japan's national AI champion — analogous to how Samsung became Korea's semiconductor champion. The $65B government commitment to AI + semiconductors through 2030, combined with Sakana's technology, positions Japan as the third pole in global AI alongside the US and China.

---

## Best Case Scenario / Addressable Opportunity

| Market | Size | Growth |
|--------|------|--------|
| Japan AI Market | $15.6–19.8B (2025) → $123.9–194.7B (2032–2033) | 32–34% CAGR |
| Japan Generative AI | $963.6M (2024) → $6.0B (2030) | ~35% CAGR |
| Japan AI Infrastructure | $5.5B+ (2026) | 18% YoY |
| Global Foundation Model Market | $14.2B (2024) → $128.7B (2033) | 28.4% CAGR |
| Global Generative AI TAM | $22.2B (2025) → $324.7B (2033) | 40.8% CAGR |

**Japan government commitment:** ~$6.34B (¥1T) over 5 years for domestic AI models; $65B (¥10T) through 2030 for AI + semiconductors. NEDO/GENIAC selected Sakana as 1 of 7 institutions for national GPU cluster access.

**Enterprise adoption velocity:** 25.8% of Japanese companies using generative AI in 2024, up from 9.9% in 2023 — 2.6x growth in one year.

**Sakana's specific positioning:** They're not competing for the global foundation model market against OpenAI/Anthropic. They're competing for Japan's AI market ($15–20B, growing to $120–195B) as the sovereign AI champion, while their research breakthroughs (evolutionary merge, CTM, AI Scientist) create intellectual property and methodology that's globally valuable.

---

## The Science: A Brief History

**1960s–1990s: Evolutionary computation's first wave.** John Holland invents genetic algorithms (1960s). Neural architecture search (NAS) uses evolution to design neural networks. The field produces interesting results but lacks the compute to scale. Neuroevolution remains a niche academic pursuit.

**2010–2016: Deep learning's scaling era begins.** AlexNet (2012) proves deep learning works for images. GPT scaling begins. The field converges on gradient-based training as the dominant paradigm. Evolutionary approaches are sidelined — too slow, too compute-intensive compared to backpropagation.

**2017: "Attention Is All You Need."** Llion Jones and seven co-authors publish the Transformer paper. Jones coins the name. The architecture enables massive parallelization, making scaling practical. Every subsequent AI breakthrough — GPT-3, GPT-4, Claude, Gemini — builds on this architecture. The paper has 100,000+ citations.

**2017–2023: The scaling race.** OpenAI, Google, and Anthropic compete to build ever-larger models. Costs escalate from millions to hundreds of millions to billions. The industry assumes that scaling is the only path to better AI. David Ha, working at Google Brain Tokyo, sees the diminishing returns firsthand and publishes work on weight-agnostic neural networks, HyperNetworks, and World Models — exploring alternatives to pure scaling.

**2022–2023: Open-source models reach competitive quality.** LLaMA (Meta), Mistral, and others demonstrate that frontier-quality models can be released as open weights. This creates the raw material for model merging — you can't evolve what you can't access.

**August 2023: Jones leaves Google.** The last of the eight Transformer co-authors to depart. *"I think the bureaucracy had built to the point where I just felt like I couldn't get anything done."* He joins Ha and Ito to co-found Sakana in Tokyo.

**Late 2023–2024: Model merging emerges.** The open-source community discovers that averaging model weights produces surprisingly good results. MergeKit and community-driven experiments on HuggingFace create a grassroots movement. Sakana's evolutionary approach formalizes and automates this, finding merges no human would discover.

**2024–2025: Sakana's research velocity accelerates.** Evolutionary Model Merge, AI Scientist, CTM, DGM, Transformer², TAID, ShinkaEvolve — a research output rate comparable to much larger labs. ICLR 2025 Spotlight (TAID), NeurIPS spotlight (CTM).

**2025: Japan's sovereign AI moment.** Government commits $65B through 2030. Every major Japanese corporation invests in Sakana. MUFG, Daiwa Securities, NTT, KDDI sign production contracts. In-Q-Tel (CIA venture arm) invests, signaling US intelligence interest in efficient AI. Google invests and partners, choosing Sakana as their Japan AI strategy.

**The "Why Now" convergence:**
- Open-source models provide the raw material for evolutionary merging ✓
- Hardware improvements make evolutionary search feasible at scale ✓
- Scaling costs hit diminishing returns, creating demand for alternatives ✓
- Japan's $65B sovereign AI commitment creates national-champion demand ✓
- Jones's departure from Google (last Transformer co-author to leave) ✓
- Tokyo's 8-hour time difference from SF = fewer meetings, more research ✓

---

## Open-Source Contributions

| Project | Stars | License | What It Does |
|---------|-------|---------|-------------|
| **AI-Scientist** | 12.3K | — | Fully automated scientific research pipeline |
| **AI-Scientist-v2** | 2.3K | — | Improved version with broader scope |
| **continuous-thought-machines** | 1.8K | — | Brain-inspired neural architecture (post-transformer) |
| **evolutionary-model-merge** | 1.4K | Apache 2.0 | Evolutionary algorithms for model combination |
| **text-to-lora** | 1.2K | — | Instant model adaptation without training |
| **ShinkaEvolve** | — | Apache 2.0 | Evolutionary algorithm discovery framework |

All evolutionary merge models released under Apache 2.0.

**Strategic logic:** Open-sourcing the evolutionary methodology and resulting models serves multiple purposes: (1) academic credibility and citation generation, (2) community adoption that validates the approach, (3) positioning Sakana as the intellectual leader of nature-inspired AI (competitors who use these methods are implicitly validating Sakana's thesis), and (4) aligning with Japan's sovereign AI narrative — open technology for national capability building.

---

## Commercial Validation

| Partner | Deal Type | Detail |
|---------|-----------|--------|
| **MUFG Bank** | Multi-year partnership (May 2025) | Custom AI for banking; "AI Lending Expert" entering real-case verification (March 2026). MUFG CEO Kamezawa: *"I feel responsibility to lead AI implementation across Japanese companies beyond banking operations."* |
| **Daiwa Securities** | 3.5-year contract (Oct 2025) | "Total Asset Consulting Platform" — personalized financial advisory for wealth management clients |
| **Google** | Strategic partnership + investment (Jan 2026) | Using Gemini/Gemma models; deploying in finance and government. Google's Japan AI strategy partner. |
| **Datadog** | Strategic partnership (Feb 2026) | Enterprise AI observability, starting with Japan enterprise customers |
| **Citi** | Strategic investment (Feb 2026) | Exploring Sakana technology in Markets division — first strategic investment in Japan |
| **ATLA (Japan Defense)** | Competition win + commissioned research (2025–2026) | Biosecurity + counter-disinformation AI; ongoing defense research contract |
| **US DIU** | Joint competition with ATLA (Mar 2025) | US-Japan defense technology collaboration |
| **NTT Group** | Research partnership (2024) | Announced at seed round |
| **Hokkoku Financial Holdings** | Strategic partnership (Jun 2025) | Regional financial services |
| **NEDO/GENIAC** | Government grant (Feb 2024) | 1 of 7 institutions selected for national GPU cluster access |

**Revenue:** ~$30M (2025, per Getlatka). David Ha claimed Sakana could achieve profitability within a year (CNBC, November 2025).

**Revenue composition:** Mix of enterprise contracts (MUFG, Daiwa — multi-year, likely $5–15M+ each), government grants (GENIAC), and potentially technology licensing. The MUFG and Daiwa contracts alone suggest $10M+ in committed enterprise revenue.

---

## Core Team

### David Ha — Co-Founder & CEO

| | |
|---|---|
| **Education** | Engineering Science, University of Toronto; PhD, University of Tokyo |
| **Prior** | Goldman Sachs (2007–2016): Managing Director, co-head of fixed-income/derivatives trading in Japan. Google Brain (2016–2022): Recruited by Jeff Dean and Doug Eck after they discovered his anonymous ML blog (otoro.net); led one of the first Google Brain research teams in Tokyo. |
| **Publications** | h-index 20; ~5,863 citations. World Models (NeurIPS 2018, with Schmidhuber), Sketch-RNN (ICLR 2018, with Doug Eck), HyperNetworks, Weight Agnostic Neural Networks, EvoJAX, PlaNet (1,309 citations). Co-author of MIT Press book on neuroevolution. |
| **Recognition** | TIME100 Most Influential People in AI 2025 |

**What's notable:** Ha's career contains a transition that most people couldn't make — Goldman Sachs Managing Director to Google Brain researcher — and it's precisely this transition that explains Sakana.

At Goldman (9 years), Ha was co-head of fixed-income/derivatives trading in Japan. Derivatives trading is fundamentally about modeling complex adaptive systems — markets where participants' behavior changes the system, which changes their behavior (George Soros's reflexivity theory). Ha didn't just trade; he internalized the dynamics of complex systems where individual agents interact to produce emergent behavior. This is exactly the philosophy behind Sakana's evolutionary and collective intelligence approach.

While still at Goldman, he maintained an anonymous blog called **otoro.net** (named after tuna) where he posted ML experiments as interactive JavaScript demos in the browser. Jeff Dean and Doug Eck at Google Brain discovered the blog — specifically an architecture search post — and recruited him for the Brain Residency. Ha went from anonymous financial engineer to Google Brain researcher through the sheer quality of his work, published under a pseudonym.

At Google Brain Tokyo (2018–2022), he led one of the first research teams when the Tokyo office opened. His research focused on the exact themes Sakana now commercializes: neuroevolution, collective systems, creative AI. HyperNetworks (small networks generating weights for larger networks) directly foreshadows Sakana's model merging approach. Weight Agnostic Neural Networks showed that architecture itself encodes solutions without learned weights — a radical departure from the "scale up weights" orthodoxy. EvoJAX brought evolutionary algorithms onto TPUs for hardware-accelerated search.

On choosing Tokyo over Silicon Valley: *"More room to achieve impact"* — rather than competing with 200+ other ex-Brain Residency founders in SF, Tokyo offers a $20B AI market with virtually no domestic frontier lab. The 8-hour time difference means fewer meetings and more research time. Japan's diverse economy (finance, fashion, manufacturing, creative industries) provides intellectual cross-pollination unavailable in tech monocultures.

On resource constraints as advantage: rather than equipping researchers with massive GPU budgets, Sakana gives limited compute — which *"naturally encourages efficiency thinking."* This isn't austerity; it's a deliberate design choice that produces the evolutionary/efficient-AI research the company is built on.

### Llion Jones — Co-Founder & CTO

| | |
|---|---|
| **Education** | BSc AI & Computer Science + MSc Advanced Computer Science, University of Birmingham |
| **Prior** | YouTube/Google (2012–2015): Software engineer. Google Research (2015–2023): Co-authored "Attention Is All You Need" (2017), coined the name "Transformer." 267,204 total citations. Other work: Natural Questions (NQ) benchmark (1,300 citations), Helpful Neighbors (geographic pronunciation for Google Maps). Last of 8 Transformer co-authors to leave Google. |

**What's notable:** Jones has one of the most unusual founding stories in tech. After graduating from the University of Birmingham with a master's in AI, he spent ~6 months in unsuccessful job interviews — couldn't get hired. Eventually landed at YouTube/Google as a software engineer in 2012. Transferred to Google Research in 2015, worked with Ray Kurzweil, and co-authored the paper that defined modern AI.

His specific contribution to "Attention Is All You Need" included **naming the architecture "Transformer"** — a detail that matters because naming shapes thinking. The choice of name (evoking transformation and reconfiguration) rather than a technical descriptor (like "self-attention network") influenced how the field conceptualized the architecture.

At Google, he also built "Natural Questions" (the first dataset combining quality answer annotations with genuine Google search queries — now a standard NLP benchmark with 1,300 citations) and "Helpful Neighbors" (predicting pronunciation of geographic features based on nearby locations — used for Japanese place names in Google Maps, directly relevant to his later move to Tokyo).

His departure statement: *"I think the bureaucracy had built to the point where I just felt like I couldn't get anything done."* He was the last of the eight Transformer co-authors to leave Google — watching each predecessor depart while choosing to stay until the right opportunity emerged.

At Sakana, he's recreating the intellectual freedom of early Google Research. He gave a researcher one week to explore the Continuous Thought Machines idea — it became a NeurIPS spotlight. His explicit goal: *"drastically reduce the amount of time that I spend on transformers"* and *"explicitly explore and look for the next big thing."*

The philosophical weight of this cannot be overstated: the person who co-created the dominant AI paradigm, who has worked on transformers longer than almost anyone alive, who coined the very name — is now publicly saying he's "absolutely sick of them" and building alternatives. If anyone has the credibility to claim the transformer era should end, it's the person who started it.

### Ren Ito — Co-Founder & COO

| | |
|---|---|
| **Education** | Law, University of Tokyo (2001); LLM, NYU School of Law (2004); Graduate, Stanford University (2005). Qualified lawyer, New York State. |
| **Prior** | Ministry of Foreign Affairs of Japan (15 years diplomat — embassy in US, interpreter to Prime Minister, Japan-US Security Treaty negotiations, Japan-EU Economic Partnership); World Bank (11 years); Mercari (led global expansion, CEO of Mercari Europe, orchestrated $6B IPO — Japan's first unicorn); Stability AI (COO); Solaris Fund Management (founder). |
| **Recognition** | Youngest member of the Trilateral Commission; Tokyo AI Strategy Council member (Dec 2024); Senior Fellow at NYU School of Law |

**What's notable:** Ito is the non-obvious co-founder who makes the entire operation work. His background bridges four worlds that rarely connect:

1. **Japanese government:** 15 years as a diplomat, interpreter to the Prime Minister, involved in security treaty negotiations. This gives Sakana direct access to Japan's government and defense establishment — critical for winning NEDO/GENIAC grants, ATLA defense contracts, and regulatory favor.

2. **International finance:** World Bank (11 years), Solaris Fund Management (founder). Understands global capital flows and sovereign investment dynamics.

3. **Japanese tech scaling:** Led Mercari's global expansion and orchestrated its $6B IPO — Japan's first unicorn. Ito has literally done what Sakana aspires to do: take a Japanese tech company to global scale and public markets.

4. **AI company operations:** COO at Stability AI before Sakana. Saw firsthand how an AI company can grow too fast with insufficient operational discipline (Stability AI's well-documented management problems). At Sakana, he's applying the lesson: controlled growth with institutional partnerships.

The Trilateral Commission membership (youngest member) and Tokyo AI Strategy Council appointment signal that Ito operates at the highest levels of Japan's policy and business establishment. When MUFG's CEO says he wants to *"lead AI implementation across Japanese companies,"* Ito is the person who can make that conversation happen.

### Key Research Team

| Name | Background | Contribution |
|------|-----------|-------------|
| **Takuya Akiba** | VP ML Infrastructure at Preferred Networks (2016–2022); Senior Research Scientist at Stability AI (2023). Creator of Optuna (hyperparameter optimization) and ChainerMN. | Initiated Evolutionary Model Merge project; wrote the design doc. TAID paper (ICLR 2025 Spotlight). |
| **Yujin Tang** | Former Google Brain / Google DeepMind. | Directed data flow space model merging. |
| **Robert Lange** | Former Google DeepMind, TU Berlin. | Core research team. |
| **Tarin Clanuwat** | Former Google Brain / Google DeepMind, Japan National Institute of Informatics. | Historical Japanese text expertise. |
| **Makoto Shing** | Former Rinna, Stability AI. | Expanded model merging to vision-language and diffusion models. TAID co-author. |

**Team size:** ~138 employees (February 2026), up from 102 in late 2025 — 35% growth in ~3 months.

**Team composition signal:** Heavy concentration of ex-Google Brain/DeepMind researchers (Ha, Jones, Tang, Lange, Clanuwat) combined with Japanese ML infrastructure expertise (Akiba from Preferred Networks). This is not a company that hired generalists — every senior researcher has specific expertise in the exact domains Sakana pursues (evolutionary computation, model architecture, efficient training).

---

## Scientific Advisory Board / Key Advisors

No formal SAB publicly disclosed, but the investor network functions as an extended advisory ecosystem:
- **Jeff Dean** (Google) — recruited Ha to Google Brain; Google's investment in Sakana maintains the connection
- **NVIDIA (Jensen Huang)** — compute partnership alongside investment; direct quote praising Sakana's sovereign AI role
- **In-Q-Tel advisors** — US intelligence community connection for defense AI applications

---

## Investor Depth

### Lux Capital (Josh Wolfe) — Seed Lead

Wolfe: *"Very bullish on Japan having one of the largest economies, a giant enterprise software market, and a tech-forward culture."* Sakana was Lux's first investment in Japan. Wolfe published a detailed piece on Ha's journey — from anonymous otoro.net blog during the "neural network winter" to Japan's national AI champion.

**What signal it sends:** Lux specializes in frontier technology companies where the founder has a deep technical insight that creates category-defining potential. Their portfolio includes Anduril ($28B), Eikon Therapeutics, and Applied Intuition. Backing Sakana signals conviction that nature-inspired AI is a category, not a feature — and that Tokyo is a legitimate place to build a frontier AI lab.

### Khosla Ventures (Vinod Khosla) — Seed + Series A + Series B

Khosla: *"Most sovereign nations will want their own native foundational models, both for national security reasons and to better interact with regional dialects."*

**What signal it sends:** Khosla's thesis is explicitly geopolitical: AI sovereignty will drive demand for national AI champions in every major economy. Sakana is his Japan bet. Triple-down participation (seed through Series B) signals that Sakana is meeting or exceeding Khosla's milestones at each stage.

### NVIDIA (Jensen Huang)

Huang: *"Countries are embracing Sovereign AI... Japan's Sakana AI is helping spur the democratization of AI."*

**What signal it sends:** NVIDIA doesn't just invest money — it provides compute partnership. Having NVIDIA as both investor and infrastructure partner means Sakana gets preferential access to GPUs during the global shortage. It also signals that NVIDIA views Sakana's efficiency-focused approach as complementary to (not competitive with) their "sell more GPUs" business model.

### MUFG — Series B Co-Lead

MUFG CEO Hironori Kamezawa: *"I feel responsibility to lead AI implementation across Japanese companies beyond banking operations."*

**What signal it sends:** Japan's largest bank leading a $135M round is an extraordinary validation signal. MUFG is not a VC — it's a $3T+ asset institution making a strategic bet that Sakana's technology will power enterprise AI across Japan's financial sector. The multi-year production contract (AI Lending Expert) means this isn't a passive investment; MUFG is deploying Sakana's technology in its core business.

### Google — Strategic Investment (January 2026)

Google invested alongside a partnership to use Gemini/Gemma models and deploy in finance and government. This is Google's Japan AI strategy: rather than building a Tokyo lab from scratch, partner with the team that's already there — especially when that team includes two former Google Brain/Research leaders.

**What signal it sends:** The company that employs the other seven Transformer co-authors is investing in the company built by the eighth. Google is hedging: if Sakana's nature-inspired approaches produce breakthroughs, Google has a partnership. If the transformer paradigm persists, Sakana deploys Google's models in Japan.

### In-Q-Tel (IQT) — CIA Venture Arm

**What signal it sends:** The US intelligence community's venture arm investing in a Japanese AI company signals: (1) interest in efficient, evolution-based AI for defense/intelligence applications where compute is constrained, (2) strengthening the US-Japan tech alliance, and (3) validation that Sakana's technology has national security relevance. Sakana's ATLA defense contracts and US DIU competition wins align with this.

### Japanese Corporate Investors

NTT, KDDI, Sony, NEC, Fujitsu, ITOCHU, Nomura, ANA, SMBC, Mizuho, Tokyo Marine, Dai-ichi Life, SBI Group — virtually every major Japanese conglomerate has invested. This isn't just capital; it's distribution. Each corporate investor is a potential enterprise customer for Sakana's technology. The breadth of Japanese corporate participation confirms Sakana's status as the national AI champion.

---

## Hiring Signals & Strategic Direction

**Open roles (early 2026):**

| Role | What It Reveals |
|------|-----------------|
| Software Engineer (R&D) | Productionizing AI discovery platform + model development. Japanese NOT required. |
| Member of Technical Staff | Evolutionary computation, generative AI, artificial life, autonomous agents |
| Applied Research Engineer — Finance | Enterprise AI for financial services (MUFG, Daiwa, Citi) |
| Applied Research Engineer — Defense/Public Sector | ATLA/defense contracts ramping |
| Recruiter / Talent Acquisition | Planning significant scale-up |

**Strategic reads:**

1. **"Japanese NOT required" for R&D** — explicitly international talent strategy. Sakana is using Tokyo's livability and Ha/Jones's research reputation to attract global AI researchers who don't want to compete in the SF talent market.

2. **Applied research split between finance and defense** — the two revenue pillars are clear. MUFG/Daiwa/Citi on one side, ATLA/DIU on the other.

3. **MTS role emphasizes "evolutionary computation, artificial life, autonomous agents"** — these are NOT standard LLM roles. Sakana is hiring for the paradigm they're building, not the paradigm everyone else is hiring for.

4. **35% headcount growth in ~3 months (102 → 138)** — aggressive scaling, likely enabled by the Series B and enterprise revenue.

---

## Conference & Media Presence

### Academic Circuit

- **ICLR 2025:** TAID (Spotlight — strongest acceptance category), Drop-Upcycling (accepted), AI Scientist v2 workshop
- **NeurIPS:** Continuous Thought Machines (spotlighted)
- **TED AI San Francisco 2025:** Llion Jones speaker
- **DLD Conference:** Llion Jones speaker

### Media Circuit

- **Bloomberg:** Multiple David Ha appearances (Feb 2025, May 2025, Sep 2024)
- **CNBC:** David Ha on profitability roadmap (Nov 2025)
- **TIME100 Most Influential People in AI 2025:** David Ha
- **Japan Times, Nikkei Asia:** Extensive domestic coverage
- **TechCrunch:** Extensive coverage including funding rounds AND controversies
- **VentureBeat:** Deep technical articles
- **Milken Institute Asia Summit 2025:** David Ha speaker

**Dual-circuit analysis:** Sakana has unusually strong presence across four circuits: (1) academic (ICLR spotlight, NeurIPS spotlight), (2) international business media (Bloomberg, CNBC, TIME), (3) Japanese domestic media (Nikkei, Japan Times), and (4) tech press (TechCrunch, VentureBeat). This breadth reflects the three-co-founder structure: Ha covers research + international media, Jones covers academic + tech conferences, Ito covers Japanese institutional + government channels. The TED AI talk by Jones (where he said he's "sick of transformers") generated the most narrative impact.

---

## Why This is a Non-Consensus Bet

### What the consensus thinks:

1. **Scaling is the path to AGI.** OpenAI, Anthropic, and Google DeepMind have demonstrated repeatedly that bigger models = better capabilities. The scaling laws (Chinchilla, etc.) are empirically validated. Nature-inspired approaches are intellectually interesting but can't match the raw capability of a 1T-parameter model trained on the world's data.

2. **Model merging is a trick, not a paradigm.** Combining existing models produces marginal improvements at best. The real breakthroughs come from training better models from scratch with better data and better architectures. Merging is what you do when you can't afford to train.

3. **Tokyo is the wrong place to build a frontier AI lab.** The talent, the compute infrastructure, the VC ecosystem, and the startup culture are all in San Francisco. Japan's tech industry is large but not known for frontier AI research. Preferred Networks was the last attempt at a Japanese AI champion, and it pivoted toward industrial applications.

4. **Sakana overpromises and underdelivers.** The AI CUDA Engineer claimed 10–100x speedups that turned out to be a measurement bug. The AI Scientist claimed to pass peer review, which was more nuanced than advertised. A pattern of bold claims requiring walkbacks undermines credibility.

5. **$2.65B valuation on $30M revenue is frothy.** 88x revenue multiple for a company whose primary market (Japan enterprise AI) is growing but still developing. The valuation reflects sovereign AI hype and Japanese corporate FOMO more than business fundamentals.

### What Sakana believes differently:

1. **Scaling has diminishing returns, and the cost is unsustainable.** Ha saw this firsthand at Google Brain — each doubling of compute produces smaller capability improvements. The energy wall, data wall, and cost wall are converging. Nature-inspired approaches (evolutionary merging, collective intelligence, brain-inspired architectures) offer a different scaling curve — one where efficiency compounds rather than costs. EvoLLM-JP (7B parameters outperforming 70B models) is the proof point.

2. **Model merging is evolution applied to AI.** Evolution is the most successful optimization algorithm in the history of the universe. It produced human intelligence without gradient descent, without centralized training, without a loss function. Evolutionary model merging applies the same principles to the open-source model ecosystem — treating every released model as genetic material for creating new capabilities. This isn't a trick; it's a paradigm. ShinkaEvolve being orders of magnitude more sample-efficient than AlphaEvolve validates the approach.

3. **Tokyo is an advantage, not a constraint.** Ha: *"More room to achieve impact."* Tokyo offers: (a) a $20B+ AI market with no domestic frontier lab, (b) every major Japanese corporation eager to invest in a national AI champion, (c) 8-hour time difference from SF = fewer meetings, more independent research, (d) government backing ($65B AI commitment), (e) talent arbitrage — world-class researchers who prefer Tokyo's quality of life to SF's cost of living. The Mercari precedent (Ito orchestrated its $6B IPO) proves Japanese tech companies can reach global scale.

4. **The controversies demonstrate transparency, not dishonesty.** The AI CUDA Engineer bug was identified by external users, acknowledged by Ha within 24 hours, and fully post-mortem'd publicly. The AI Scientist peer review paper was voluntarily withdrawn after scrutiny. Most AI companies suppress embarrassing results; Sakana publishes post-mortems. Ha called the CUDA issue *"cheating"* and blamed competitive pressure for *"rushing checks."* The pattern is: bold claims → external scrutiny → transparent correction. That's how science is supposed to work.

5. **The valuation reflects sovereign AI positioning, which is correctly priced.** Japan will spend $65B on AI and semiconductors through 2030. Sakana is the only Japanese company positioned to capture a significant share of that spend as the national AI champion. MUFG, Daiwa, NTT, KDDI, Sony, NEC, Fujitsu, ITOCHU — virtually every major Japanese corporation is already an investor and/or customer. The $2.65B valuation prices in the probability that Sakana becomes Japan's dominant AI infrastructure provider, not just a research lab.

---

## Competitive Landscape

| Company | Approach | Funding | Key Difference vs. Sakana |
|---------|----------|---------|--------------------------|
| **OpenAI** | Scaling + massive compute | $20B+ | 1000x more resources but no Japan focus; Sakana is efficiency-first |
| **Anthropic** | Safety-focused scaling | $15B+ | Similar talent pedigree but fundamentally different philosophy (scaling vs. evolution) |
| **Google DeepMind** | Full-stack research + infra | Google-funded | Google is now Sakana's investor/partner, not pure competitor |
| **Mistral** | Open-source European models | $1.1B | Similar "sovereign AI" positioning but for Europe; Sakana is for Japan |
| **Preferred Networks** | Japanese AI, deep learning | ~$300M+ | Earlier Japanese AI champion; pivoted to robotics/materials. Different research focus. |
| **Cohere** | Enterprise NLP | $445M | Building custom Japanese model with Fujitsu — direct competitor in Japan enterprise |
| **ABEJA** | Japanese enterprise AI | ~$30M | Application-layer focus vs. Sakana's foundational research |

**Sakana's positioning:** Not competing head-to-head with OpenAI/Anthropic on frontier model capability. Competing on: (1) Japan-specific AI for the world's third-largest economy, (2) efficiency (evolutionary approaches vs. brute-force scaling), (3) research novelty (post-transformer architectures, automated science). The closest analogy is Mistral in Europe — a sovereign AI champion with research credibility and government support.

**The Japan advantage quantified:** With every major Japanese corporate as investor/customer and $65B in government AI commitment, Sakana has a distribution moat that no foreign AI company can match in Japan. OpenAI has ChatGPT adoption in Japan, but Sakana has institutional relationships with every major bank, telco, and industrial conglomerate.

---

## Qualitative Assessment

**Conviction Level: MEDIUM-HIGH**

### Bull Case:

1. **The founding team is historically rare.** A co-creator of the Transformer (267K citations) saying he's "sick of transformers" and building alternatives, paired with a Google Brain researcher who went from anonymous blogger to TIME100 AI, paired with the operator who IPO'd Japan's first unicorn. This combination of paradigm-defining research credibility + operational scaling experience + Japanese institutional access exists nowhere else in AI.

2. **The sovereign AI thesis has massive structural tailwinds.** Japan's $65B AI + semiconductor commitment, every major corporation investing, NEDO/GENIAC government partnership, ATLA defense contracts, In-Q-Tel investment. Sakana is being built into Japan's AI infrastructure at the institutional level. Even if the research underdelivers, the distribution moat is formidable.

3. **The evolutionary approach has demonstrable results.** EvoLLM-JP (7B outperforming 70B), TAID (ICLR 2025 Spotlight), ShinkaEvolve (orders of magnitude more efficient than AlphaEvolve), CTM (NeurIPS spotlight). These aren't blog posts — they're peer-reviewed, benchmarked results that demonstrate nature-inspired AI can compete with scaling approaches at a fraction of the cost.

4. **Enterprise revenue with Japan's biggest institutions.** MUFG (multi-year, custom AI for banking), Daiwa Securities (3.5-year contract), Citi (strategic investment exploring Markets applications), Google (partnership for finance + government). These aren't pilot projects — they're multi-year production contracts with institutions managing trillions of dollars.

5. **The research velocity is extraordinary for the team size.** Evolutionary Model Merge, AI Scientist v1 + v2, CTM, DGM, Transformer², ShinkaEvolve, TAID, Text-to-LoRA, CycleQD, AB-MCTS — all in ~2 years with ~100-138 people. Two ICLR/NeurIPS spotlights. 12.3K GitHub stars on AI Scientist alone. The research output rate rivals labs with 10x the headcount.

### Key Risks:

1. **The overpromise pattern is concerning.** AI CUDA Engineer (claimed 10–100x, actually ~10–100%), AI Scientist peer review (claimed first AI paper to pass peer review, actually a workshop paper with caveats). Ha acknowledged *"rushing checks"* due to competitive pressure. A Japanese commentator asked: *"Was Sakana really just bait after all?"* The underlying research is real, but the communications layer consistently oversells, which erodes trust — especially with academic peers and skeptical enterprise buyers.

2. **Nature-inspired AI may remain niche.** Evolutionary merging works brilliantly for combining existing models, but it's unclear whether it can produce capabilities that don't exist in any input model. If the frontier continues to be defined by scaling (and there's strong evidence it will), Sakana's approach may produce cost-efficient versions of last year's frontier — useful, but not paradigm-defining.

3. **Japan enterprise is slow-moving and relationship-heavy.** MUFG's "AI Lending Expert" has been in development since May 2025 and is just entering "real-case verification" in March 2026. Japanese enterprise sales cycles are notoriously long. $30M revenue on $2.65B valuation (88x multiple) reflects expectations of rapid revenue growth that may not materialize at Japanese enterprise speed.

4. **$2.65B valuation creates expectations that may be hard to meet.** To justify this valuation, Sakana needs to grow revenue from ~$30M to $200M+ within 2–3 years. That requires either: (a) many more MUFG/Daiwa-scale contracts (possible but slow), (b) a product that sells broadly beyond bespoke enterprise (not yet evident), or (c) a research breakthrough so significant it redefines the company's category (possible but unpredictable).

5. **Post-transformer architectures have been predicted before.** Many researchers have claimed the transformer will be replaced. State-space models (Mamba), RWKV, and others have all been positioned as successors. None have supplanted transformers at scale. Jones has the credibility to make this claim, but credibility doesn't guarantee success. CTM may end up as another interesting alternative that doesn't achieve mainstream adoption.

**Bottom Line:** Sakana AI is the most narratively compelling AI company outside the US — built by a Transformer co-creator who wants to move beyond transformers, a Google Brain researcher who bridged Wall Street and machine learning, and the operator who IPO'd Japan's first unicorn. The sovereign AI thesis gives them institutional distribution that no foreign competitor can match in Japan, and the research output (ICLR/NeurIPS spotlights, evolutionary model merging, AI Scientist) demonstrates genuine innovation. The main concerns are a pattern of overclaiming that erodes academic credibility, an unproven revenue scaling trajectory, and uncertainty about whether nature-inspired approaches can produce frontier capabilities rather than just efficient approximations of existing ones.

**Verdict: A historically rare founding team with genuine research innovation and unmatched institutional distribution in the world's third-largest economy — held back from HIGH conviction by the overpromise pattern, an 88x revenue multiple that prices in unproven growth, and the fundamental question of whether evolution can outrun scaling. MEDIUM-HIGH reflects the extraordinary positioning with meaningful execution risk.**

---

*Research compiled: March 2026*
