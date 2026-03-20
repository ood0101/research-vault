# Etched

**Website:** [etched.com](https://etched.com)
**HQ:** San Jose, California (Santana Row)
**Founded:** 2022
**Structure:** C-Corp (Delaware)
**Stage:** Series B ($500M, January 2026, led by Stripes + Peter Thiel)
**Lead Investors:** Primary Venture Partners (Seed), Positive Sum + Primary (A), Stripes + Peter Thiel (B)
**Other Investors:** Ribbit Capital, Stanley Druckenmiller, Thomas Dohmke (GitHub CEO), Amjad Masad (Replit CEO), Balaji Srinivasan, Kyle Vogt (ex-Cruise CEO), Jawed Karim (YouTube co-founder), Bryan Johnson (Kernel)
**Total Raised:** ~$710M+ (Seed $5.4M → Series A $120M → Intermediate $85M → Series B $500M)
**Valuation:** ~$5B (January 2026)

---

## The Big Audacious Idea

Etched is building the world's first transformer-specific ASIC — a chip that does one thing and one thing only: run transformer inference as fast as physically possible. While every other chipmaker builds general-purpose silicon that can run any model architecture, Etched is making a deliberate, irreversible bet that transformers are the endgame of AI compute.

The thesis is simple but extreme: GPUs waste 95%+ of their transistor budget on generality. They support thousands of CUDA operations, arbitrary control flow, and dozens of data types that transformer inference never touches. By hard-wiring the transformer computation graph directly into silicon — matrix multiplications, attention mechanisms, softmax, layer norms — you can build a chip that is an order of magnitude faster and cheaper per token than anything NVIDIA ships. The tradeoff is total: if transformers stop being the dominant architecture, the chip is worthless. Etched believes that bet is worth making.

## The Problem That's So Hard to Solve

Custom silicon for a single model architecture sounds straightforward in theory. In practice, it's an extraordinarily difficult engineering problem across multiple dimensions:

**Architecture lock-in risk.** Every other AI chip company hedges by supporting multiple model types. Etched has zero fallback. If state-space models (Mamba), mixture-of-experts with non-transformer routing, or some yet-unknown architecture displaces transformers, Etched's entire product line becomes obsolete overnight. This isn't a theoretical risk — the ML research community actively explores transformer alternatives.

**Hardware-software co-design at the bleeding edge.** Hard-wiring transformer ops means every decision about attention patterns, KV-cache management, and memory hierarchy is baked into silicon months before tape-out. But transformer architectures evolve constantly — flash attention, grouped-query attention, sliding window attention, multi-query attention. The chip must be flexible enough to support architectural variations within the transformer family while being rigid enough to extract maximum performance from fixed silicon.

**Memory bandwidth is the real bottleneck.** Large language model inference is fundamentally memory-bandwidth bound, not compute-bound. Etched uses HBM3E with Rambus controller IP, but achieving 90%+ FLOPS utilization requires solving the memory wall problem at the system level — prefetch patterns, KV-cache placement, batch scheduling — all in custom silicon rather than software.

**Competing against NVIDIA's ecosystem.** NVIDIA doesn't just sell chips; they sell CUDA, cuDNN, TensorRT, Triton, and a decade of software infrastructure. Every AI company on earth has NVIDIA-optimized code. Etched needs a software stack compelling enough to justify ripping out that entire ecosystem for inference workloads.

## The Technology Stack

### Sohu — The Transformer ASIC

Etched's chip is called **Sohu**. Key specifications:

- **Process node:** TSMC 4nm
- **Memory:** 144 GB HBM3E per chip (using [Rambus](https://www.rambus.com/) HBM memory controller IP) — 1.8× the capacity/bandwidth of H100, 0.75× of B200
- **Architecture:** Hard-wired transformer inference pipeline — matrix multiplication units, attention computation, softmax, layer normalization all implemented as fixed-function blocks rather than programmable cores. Hybrid memory architecture combining HBM and SRAM.
- **FLOPS utilization:** 90%+ (vs. ~30-40% typical for GPUs on inference workloads)
- **Server configuration:** 8× Sohu chips per server, ~1.1TB aggregate HBM memory
- **Scope:** Runs different transformer types (varying sizes, modalities, attention mechanisms, activation functions, masking, encoding, sampling). Cannot train models. Cannot run LSTMs, DLRMs, or non-transformer architectures.

### Performance Claims

| Metric | 8× Sohu Server | 8× H100 | 8× B200 |
|--------|----------------|---------|---------|
| Llama 70B tok/s | 500,000 | ~23,000 | ~45,000 |
| Hardware cost savings | 87% vs equivalent H100 | baseline | — |
| Power savings | 75% vs equivalent H100 | baseline | — |
| Effective replacement | "One server replaces 160 H100s" | — | — |

### Software

Etched is building a custom compiler and runtime stack optimized for their hardware. Their GitHub presence reveals a fork of [SGLang](https://github.com/etched-ai/sglang) (the inference framework from LMSYS), indicating they're adapting an existing open-source serving framework for Sohu rather than building from scratch — a pragmatic approach that gives customers familiar APIs. They also maintain a fork of [Caliptra](https://github.com/etched-ai/caliptra-sw) (the open-source hardware root-of-trust project), suggesting Sohu will include hardware security features for data center deployment.

Beyond these forks, the company has not open-sourced any proprietary tools or published compiler documentation as of early 2026.

**The transistor utilization argument:** Etched claims only ~4% of H100 transistors are used for actual matrix multiplication during transformer inference — the rest handle general-purpose control flow, branch prediction, and data types that transformers never use. By eliminating that overhead, Sohu can dedicate nearly all die area to transformer-relevant compute units and memory interfaces.

**Memory bandwidth skepticism:** Critics note that LLM inference is fundamentally memory-bandwidth-bound (typical GPU inference workloads achieve 60-80% memory bandwidth utilization on NVIDIA hardware). If the bottleneck is memory bandwidth rather than compute, Sohu's compute density advantage narrows — you can't compute faster than you can feed data. Etched's hybrid HBM+SRAM architecture and custom memory controller are designed to address this, but the claim of 90%+ FLOPS utilization would require solving the memory wall problem in a way no one else has demonstrated at scale.

**MoE variant:** Etched has indicated a separate Sohu variant optimized for Mixture-of-Experts models (which use sparse activation patterns requiring different memory access and routing logic than dense transformers). This suggests the company recognizes that even within the transformer family, one chip design doesn't fit all workloads.

**Important caveat:** These performance numbers are company-reported and have not been independently verified by third-party benchmarks. No Sohu chips have shipped to customers as of early 2026.

## What the World Looks Like If This Works

1. **Inference costs collapse by 10-100×.** If Sohu delivers on claims, the cost per token for running large language models drops by an order of magnitude or more, making AI inference essentially free at the margin for most applications.

2. **Real-time AI at unprecedented scale.** 500K tokens/second on a 70B-parameter model means real-time multi-agent systems, continuous video understanding, and always-on AI assistants become economically viable without massive GPU clusters.

3. **The inference market splits from training.** Training stays on GPUs (general-purpose, flexible). Inference moves to specialized ASICs. This creates a structural opening for non-NVIDIA silicon in the fastest-growing segment of AI compute.

4. **NVIDIA's inference monopoly breaks.** If purpose-built silicon is genuinely 10× better at inference, NVIDIA's strategy of serving both training and inference with the same GPU architecture has a fundamental efficiency ceiling that specialized hardware can undercut.

5. **New applications become possible.** Edge deployment of 70B+ models, real-time translation of full documents, continuous code generation at IDE speed, and AI-native products that were previously too expensive to run continuously.

## Best Case Scenario / Addressable Opportunity

The AI inference market is the fastest-growing segment of semiconductor demand:

- **AI inference chip market (2024):** ~$45B, projected to reach $120-150B by 2028 ([various analyst estimates](https://www.bloomberg.com/))
- **Inference as % of AI compute spending:** Currently ~60% and growing; inference scales linearly with users while training is periodic
- **NVIDIA's inference revenue:** Estimated 40-50% of data center GPU revenue now comes from inference workloads
- **Cloud inference spend:** AWS, Azure, and GCP collectively spend $30B+ annually on inference infrastructure

If Etched captures even 5% of the inference ASIC market by 2028, that's a $6-7B revenue opportunity. The $5B valuation implies investors believe in a path to $1B+ revenue within 3-4 years of first shipment.

The key market dynamic: inference demand scales with AI adoption (more users = more inference), while training demand scales with model development (more researchers = more training). As AI moves from research to production, inference becomes the dominant cost center.

## The Science: A Brief History

**2017 — "Attention Is All You Need"**
Vaswani et al. publish the transformer architecture at Google Brain. Replaces recurrence with self-attention. Initially for machine translation.

**2018-2019 — Transformers become universal**
BERT, GPT-2 demonstrate transformers work for almost every NLP task. Vision Transformers (ViT) extend the architecture beyond language.

**2020-2022 — Scaling laws emerge**
Kaplan et al. (OpenAI) show transformer performance scales predictably with compute, data, and parameters. This is the intellectual foundation for Etched's bet — if scaling laws hold, transformers aren't going away.

**2022 — Etched founded**
Three Harvard undergrads (Gavin Uberti, Chris Zhu, Robert Wachen) bet that transformers are permanent enough to justify dedicated silicon. Seed round of $5.4M from Primary Venture Partners.

**2023 — Series A and growth**
$120M Series A from Positive Sum + Primary. Company begins serious chip design work with senior hires from NVIDIA, Intel, and Broadcom.

**March 2024 — Thiel Fellowship (team award)**
All three founders receive the Thiel Fellowship — notably the first time a collective team (rather than individuals) has been awarded. This is a strong signal of Thiel's personal conviction in the company, not just the founders.

**October-November 2024 — Oasis demo**
Etched and Decart AI co-release [Oasis](https://www.etched.com/blog-posts/oasis), an open-source AI-generated interactive game world running on transformer inference. Serves as a public demonstration of what cheap inference enables.

**January 2025 — $500M Series B**
Stripes + Peter Thiel co-lead at $5B valuation. Intermediate $85M round also closes.

**2026 — Design completion target**
Chip design expected to finalize; targeting first customer shipments by 2027.

**Manifold prediction market note:** "Will Sohu ship by June 2025?" resolved NO — the market correctly anticipated that Etched's timeline would slip past early predictions.

**2023 — The Mamba scare**
Gu and Dao publish Mamba, a state-space model that matches transformer quality with linear (not quadratic) scaling in sequence length. Briefly raises questions about transformer permanence. But follow-up work (Jamba, Mamba-2) largely shows hybrid architectures that still use transformer attention.

**2024 — Transformers consolidate**
GPT-4, Claude 3, Gemini, Llama 3 — every frontier model is transformer-based. Mixture-of-experts variations (Mixtral) and architectural tweaks (grouped-query attention) evolve within the transformer family rather than replacing it.

**Why now:** The convergence of (a) transformers as the proven dominant architecture, (b) inference becoming the majority of AI compute spend, and (c) NVIDIA's GPU architecture leaving enormous efficiency headroom for specialized silicon.

## Open-Source Contributions

### Oasis — AI-Generated Game World

In October-November 2024, Etched partnered with Decart AI to release [Oasis](https://oasis-model.github.io/), an open-source interactive game world generated entirely by AI in real-time. Oasis serves as a proof-of-concept for what becomes possible when transformer inference is cheap and fast.

**Technical architecture:**
- **ViT autoencoder** — Encodes/decodes video frames using a Vision Transformer
- **DiT backbone** — A Diffusion Transformer generates the next frame conditioned on player actions
- **Diffusion Forcing** — A training technique that enables stable autoregressive generation of video frames without compounding errors
- The entire pipeline is transformer-based (no CNNs, no GANs), making it a natural showcase for Sohu's capabilities

**GitHub repository:** [etched-ai/open-oasis](https://github.com/etched-ai/open-oasis) — 2,100+ stars

### Other GitHub Presence

| Repository | Description | Signal |
|------------|-------------|--------|
| [open-oasis](https://github.com/etched-ai/open-oasis) | Oasis game world model | Public demo of inference-intensive transformer applications |
| [sglang fork](https://github.com/etched-ai/sglang) | Fork of LMSYS SGLang inference framework | Adapting existing serving software for Sohu hardware |
| [caliptra-sw fork](https://github.com/etched-ai/caliptra-sw) | Fork of Caliptra hardware root-of-trust | Hardware security for data center deployment |
| [systemrdl-compiler](https://github.com/etched-ai/systemrdl-compiler) | SystemRDL register description compiler | Chip design tooling (register maps) |
| [jaxtyping](https://github.com/etched-ai/jaxtyping) | Type annotations for JAX arrays | ML development tooling |
| [io-uring fork](https://github.com/etched-ai/io_uring) | Linux async I/O interface | High-performance I/O for serving infrastructure |

The open-source strategy is selective: Oasis serves as marketing (demonstrating the inference demand thesis), while the SGLang fork reveals the practical software strategy. The absence of any open-sourced compiler or hardware documentation is notable — Etched treats its core silicon IP as strictly proprietary.

## Commercial Validation

| Partner | Type | What They Did |
|---------|------|---------------|
| TSMC | Manufacturing | Fabrication partner for Sohu on 4nm process |
| Rambus | Technology IP | Licensed HBM3E memory controller IP for Sohu integration ([blog](https://www.rambus.com/blogs/from-dorm-room-beginnings-to-a-pioneer-in-the-ai-chip-revolution-how-etched-is-collaborating-with-rambus-to-achieve-their-vision/)) |
| Decart AI | Research / Demo | Co-developed [Oasis](https://www.etched.com/blog-posts/oasis), an interactive AI-generated game world model (open-sourced, Nov 2024) |
| SK Hynix / Samsung / Micron | Planned Supply | Memory wafer suppliers targeted for production |

No named *customers* have been publicly announced. Etched targets hyperscalers (AWS, Google, Azure), cloud inference providers, and LLM developers. The chip has not shipped as of early 2026.

This is the most significant gap in Etched's story. ~$710M raised with no shipped product and no disclosed customers means the entire valuation is based on projected performance rather than demonstrated market demand.

## Core Team

### Gavin Uberti — Co-founder & CEO

| Detail | |
|--------|--|
| Education | Harvard (dropped out, CS) |
| Prior | OctoML (ML compiler optimization), Xnor.ai (acquired by Apple, edge AI), Apache TVM contributor |
| Recognition | Thiel Fellowship (2022), MIT Technology Review Innovators Under 35 (2025), world record FTC Robotics, 1st place Purple Comet math contest, MLPerf Tiny SOTA |
| Other | Guest lectured at Columbia University |

**What's notable:** Uberti's background is unusually deep for a 22-year-old CEO. His work at Xnor.ai (binary neural networks for edge inference, acquired by Apple for ~$200M) and OctoML (ML compiler optimization) means he's been thinking about efficient inference execution since before founding Etched. His Apache TVM contributions show he understands the compiler-to-hardware interface — exactly where Etched's product lives. The Xnor.ai pedigree is particularly relevant: that company also bet on specialized, efficient inference hardware and was validated by Apple's acquisition. MIT Technology Review's Innovators Under 35 recognition (2025) and guest lecturing at Columbia signal growing stature beyond the startup world. The competitive math and robotics background hints at the kind of person who optimizes obsessively — useful when your company's entire value prop is maximum efficiency.

### Chris Zhu — Co-founder & CTO

| Detail | |
|--------|--|
| Education | Harvard (dropped out, CS) |
| Prior | AWS (intern), HPC research, combinatorics research at Harvard |
| Recognition | Thiel Fellowship (2022) |

**What's notable:** Zhu brings the systems engineering and high-performance computing perspective. His combinatorics research at Harvard — a branch of mathematics dealing with counting, arrangement, and optimization — is directly relevant to chip architecture decisions around data routing, memory access patterns, and pipeline scheduling. The CTO role at a chip company means he's responsible for the Sohu architecture itself — the fixed-function pipeline design, memory hierarchy, and hardware-software interface. The combination of cloud infrastructure experience (AWS) and HPC/math research aligns with designing silicon for data center deployment.

### Robert Wachen — Co-founder & COO

| Detail | |
|--------|--|
| Education | Harvard (dropped out) |
| Prior | Co-founded Mentor Labs (acquired by Crimson Education), Co-founder at Prod (startup accelerator) |
| Recognition | Thiel Fellowship (2022) |
| Other | Founded Birthday Cakes 4 Free Maryland (nonprofit) |

**What's notable:** Wachen is the operational and business-side founder with a stronger track record than it first appears. Mentor Labs' acquisition by Crimson Education means he's already built and exited a company before Etched. His experience building Prod (a startup accelerator) and the prior acquisition gives him fundraising, recruiting, deal-making, and go-to-market experience that's critical for a hardware startup that needs to raise hundreds of millions before shipping a single chip. The COO role at a chip company means managing the TSMC relationship, supply chain, and eventually sales — all operationally intense functions.

### Brian Loiler — VP Platform

| Detail | |
|--------|--|
| Education | — |
| Prior | NVIDIA Senior Director, Datacenter Systems (~20 years), Google Cloud VP |
| Notable | Led HGX and DGX server platform development at NVIDIA |

**What's notable:** Loiler spent roughly two decades at NVIDIA building the exact server platforms (HGX, DGX) that Etched's Sohu aims to displace. His decision to leave NVIDIA for a pre-revenue startup is one of the strongest team signals — he knows better than almost anyone what GPU-based inference servers can and can't do, and he chose to bet on ASICs. His Google Cloud VP stint adds hyperscaler deployment experience.

### Ajat Hukkoo — VP Hardware

| Detail | |
|--------|--|
| Education | — |
| Prior | Intel VP, Broadcom Distinguished Engineer |
| Notable | Responsible for 300M+ chips shipped across career |

**What's notable:** Hukkoo's track record of shipping hundreds of millions of chips is exactly the operational hardware expertise a pre-revenue chip startup needs. Distinguished Engineer at Broadcom and VP at Intel means he's navigated the full chip lifecycle (design → tape-out → yield optimization → mass production) at scale multiple times. This is the hire that de-risks manufacturing execution.

### Saptadeep Pal — Chief Architect

| Detail | |
|--------|--|
| Education | IIT, UCLA PhD |
| Prior | Co-founder at Auradine, NVIDIA architecture team |
| Notable | Chip architecture from design through commercialization |

**What's notable:** Pal bridges startup and big-company chip design. His Auradine co-founding experience means he's built a chip company from scratch before, while his NVIDIA architecture role means he's worked at the scale Etched aspires to. The IIT → UCLA PhD pipeline is classic for semiconductor talent, and Chief Architect is arguably the most technically critical role at the company — he owns the Sohu microarchitecture.

### Mark Belli — VP Engineering

| Detail | |
|--------|--|
| Education | Stanford BS/MS EE |
| Prior | Cypress Semiconductor CTO (acquired for $9.4B by Infineon), Cisco |
| Notable | CTO of a company through a $9.4B acquisition |

**What's notable:** Belli's CTO tenure at Cypress through its $9.4B Infineon acquisition means he's led engineering at a chip company through the entire lifecycle from development to massive exit. Stanford EE plus Cisco networking silicon experience adds depth. This is a "been there, done that" hire for taking a chip from design to volume production.

The team composition tells a clear story: young, ambitious founders with relevant (if early-career) technical backgrounds, supplemented by named senior hires from NVIDIA (Loiler, 20 years), Intel/Broadcom (Hukkoo, 300M+ chips), NVIDIA/Auradine (Pal, architecture), and Cypress/Cisco (Belli, CTO through $9.4B exit). This is not a team that will fail due to lack of chip-building experience.

## Investor Depth

**Peter Thiel** led the $500M round and is the highest-profile backer. Thiel's investment thesis has always centered on monopoly and contrarian conviction — companies that do one thing better than anyone else. Etched's all-in bet on transformers fits his framework perfectly: if they're right, they have a structural advantage no general-purpose chipmaker can match. The Thiel Fellowship connection (all three founders are fellows) means Thiel has tracked this team since 2022.

**Patrick O'Shaughnessy / Positive Sum** co-led the Series A and participated in subsequent rounds. O'Shaughnessy (who hosts the *Invest Like the Best* podcast) featured Uberti in a [December 2023 episode](https://www.joincolossus.com/) — one of the earliest deep public discussions of Etched's thesis. Positive Sum's involvement signals conviction from an investor known for backing technical founders in emerging markets.

**Primary Venture Partners** led the seed round at a $34M valuation and co-led the Series A. Being the earliest institutional investor and doubling down through Series A shows sustained conviction as the company progressed from concept to chip design.

**Ribbit Capital** — Known primarily for fintech investments (Robinhood, Coinbase, Nubank). Their participation in a chip company is unusual and suggests they see AI infrastructure as a generational platform shift comparable to the financial technology wave they rode in the 2010s.

**Angel investors** include an unusual concentration of tech company founders/CEOs: Thomas Dohmke (GitHub CEO), Amjad Masad (Replit CEO), Kyle Vogt (ex-Cruise CEO), Balaji Srinivasan. This is the profile of angels who are potential *customers* — people running AI-intensive companies who would directly benefit from cheaper inference.

**Stripes** co-led the $500M round. Growth-stage investor known for backing companies approaching commercial scale, which signals confidence that Sohu is close enough to shipping to justify growth-stage capital.

**Fundraising trajectory:**

| Round | Date | Amount | Valuation | Lead |
|-------|------|--------|-----------|------|
| Seed | 2022 | $5.4M | ~$34M | Primary Venture Partners |
| Series A | 2023 | $120M | ~$800M | Positive Sum + Primary |
| Intermediate | 2024 | $85M | undisclosed | — |
| Series B | Jan 2025 | $500M | ~$5B | Stripes + Peter Thiel |

The investor trajectory ($34M → $800M → $5B valuation across 3 years pre-revenue) reflects either extraordinary conviction or extraordinary hype. The presence of Thiel, chipmaker veterans joining the team, and founder/CEO angels with inference cost pain provides some substantive signal underneath the valuation.

## Hiring Signals & Strategic Direction

~25+ open roles as of early 2026, spanning the full chip development lifecycle:

| Category | Example Roles | Signal |
|----------|---------------|--------|
| Silicon Design | ASIC Verification Engineers, RTL Designers | Core chip still in active development/verification |
| Software | SW Engineering Manager, System Software Engineer, Compiler Engineers | Building the critical software stack for customer adoption |
| Firmware | Firmware Engineer | Chip-level firmware, boot, power management |
| Supercomputing / Networking | Networking Engineers, System Architects | Multi-chip and cluster-scale deployment — thinking beyond single servers |
| Manufacturing | TPM Hardware NPI (New Product Introduction) | Preparing for manufacturing ramp — a production signal |
| Operations | Demand Planning Manager | Supply chain and demand forecasting — implies expecting orders |
| General | Interns (multiple) | Scaling the team broadly |

**All roles are fully in-person, San Jose (Santana Row).** No remote positions. This is typical for chip companies where tight hardware-software co-design requires physical collaboration, but also reflects a culture choice.

**Glassdoor/Blind signal:** 4.4/5 overall rating, but 2.5/5 work-life balance — consistent with a hardware startup in crunch mode pushing toward tape-out. The high overall score despite brutal hours suggests people believe in the mission.

The most telling signal is the combination of NPI (preparing to manufacture) and Demand Planning (preparing to sell). These are not R&D roles — they're commercialization roles. The supercomputing/networking hires are equally revealing — Etched is already thinking about multi-server inference clusters, not just individual chips, which implies confidence in getting past first silicon.

The Software Engineering Manager hire is strategically critical. Etched's chip is useless without a compiler and runtime stack that makes it easy for inference providers to switch from CUDA. This role suggests they're investing seriously in the software ecosystem, not just the silicon.

## Conference & Media Presence

### Technical / Industry Circuit
- Etched has been relatively quiet at traditional semiconductor conferences (Hot Chips, ISSCC) compared to peers like Groq and Cerebras
- The company has not published peer-reviewed technical papers on Sohu's architecture
- This opacity is notable — most chip startups use conference presentations to establish technical credibility

### Media / Investor Circuit
- **Invest Like the Best podcast** (December 2023) — Gavin Uberti deep-dive on the transformer ASIC thesis with Patrick O'Shaughnessy ([Spotify](https://open.spotify.com/episode/10zEiGYtsGrxeQywDOEIFF))
- **Power Law podcast** — In-depth conversation on Etched's technical thesis and market positioning ([YouTube](https://www.youtube.com/watch?v=ejeIz4EhoJ0))
- **Pioneers of AI podcast** (March 2025) — Updated discussion of Sohu progress ([Spotify](https://open.spotify.com/episode/3yTljNiwWNa0Yiqt4jnOkT))
- **TechCrunch Found** — Featured interview on the founding story
- **Bloomberg** — Coverage of the $500M raise and $5B valuation
- **TechCrunch** — Series A and subsequent funding coverage
- **CNBC** — TV segments on the AI chip market featuring Etched
- **Tom's Hardware, The Register** — Technical press coverage of Sohu specifications and performance claims
- **Mercury News** — Local Silicon Valley coverage of the company's growth

The media presence is heavily weighted toward fundraising announcements and high-level thesis discussions rather than technical deep-dives. This is consistent with a pre-revenue hardware company that has impressive claims but no shipped product to benchmark independently.

## Why This is a Non-Consensus Bet

**What the consensus thinks:**

1. General-purpose GPUs (especially NVIDIA's) will continue to dominate both training and inference because the ecosystem lock-in (CUDA, software tools, developer familiarity) creates an insurmountable moat
2. AI model architectures are evolving too rapidly to justify hardwiring any single architecture into silicon — flexibility is more valuable than raw performance
3. State-space models (Mamba), hybrid architectures, and future innovations could displace transformers, making a transformer-only chip a stranded asset
4. Hardware startups almost always fail against incumbents — the capital requirements, manufacturing complexity, and time-to-market disadvantages are structural
5. Even if specialized chips are faster, the switching cost of moving off NVIDIA's software stack is too high for most customers

**What Etched believes differently:**

1. Transformers are not a temporary architecture — they are the fundamental building block of AI, comparable to the role Von Neumann architecture plays in general computing. Scaling laws prove this.
2. The 90%+ efficiency gap between specialized and general-purpose silicon for a known, fixed computation is too large to leave on the table — customers will switch for 10-20× cost savings regardless of ecosystem friction
3. Inference, not training, is where the money is — and inference workloads are far more standardized than training, making specialization viable
4. NVIDIA's CUDA moat matters for training (where flexibility is essential) but is much weaker for inference (where you're running the same model architecture billions of times)
5. The "what if transformers go away" risk is overstated — every frontier model (GPT-4, Claude, Gemini, Llama) is transformer-based, and even "alternatives" like Mamba end up as hybrid transformer models in practice
6. Transformers are expanding into new modalities (vision, video, genomics, robotics, audio), not contracting — the TAM for transformer inference grows every time a new domain adopts the architecture

## Competitive Landscape

| Company | Approach | Stage | Valuation/Exit | Key Differentiator |
|---------|----------|-------|----------------|-------------------|
| **Etched** | Transformer-only ASIC | Pre-revenue, $710M raised | $5B (Jan 2026) | Maximum specialization, 10×+ perf claims |
| **Groq** | LPU (Language Processing Unit) | Shipping inference API | Acquired by NVIDIA ~$20B (2025) | Already shipping, proven performance; now NVIDIA-owned |
| **Cerebras** | Wafer-scale engine (WSE-3) | Shipping, filed IPO | $23B valuation | Largest chip ever built, both training and inference |
| **SambaNova** | Reconfigurable dataflow architecture | Shipping | ~$5B (2021 peak) | Enterprise AI platform, training + inference |
| **Tenstorrent** | RISC-V AI accelerator | Shipping dev boards | ~$2.7B | Jim Keller-led, open architecture, edge to cloud |
| **d-Matrix** | Digital in-memory compute | Pre-revenue | ~$350M raised | Novel compute-in-memory approach for inference |
| **NVIDIA** | General-purpose GPU (H100/B200/GB200) | Dominant incumbent | ~$3T market cap | CUDA ecosystem, training + inference, massive R&D |
| **Google (TPU)** | Custom ASIC (training + inference) | Deployed internally + Cloud TPU | Internal to Google | Proven custom silicon at scale, but not merchant silicon |
| **AWS (Inferentia/Trainium)** | Custom inference + training ASICs | Deployed on AWS | Internal to Amazon | Captive cloud market, Inferentia2 competitive on cost |

**Key competitive dynamic:** Groq's acquisition by NVIDIA in 2025 removed the closest competitor and validated the inference ASIC thesis while simultaneously strengthening NVIDIA's inference capabilities. This cuts both ways for Etched — it proves the market exists but means the incumbent now has specialized inference silicon too.

**Hyperscaler custom silicon:** Google's TPU and AWS's Inferentia/Trainium prove that custom AI ASICs work at scale — but both are captive to their respective clouds and serve training+inference. Etched's merchant silicon model (selling to anyone) and inference-only focus differentiate it, but the hyperscalers' existence proves the technical thesis while creating formidable, well-funded competitors who could build transformer-specific variants if the market demands it.

Etched's positioning is the most extreme on the specialization spectrum. Every other competitor maintains some degree of architectural flexibility. This is either their greatest strength (maximum performance if transformers persist) or their greatest vulnerability (zero fallback if they don't).

**External skeptical analysis:** [Zach's Tech Blog: "Stop Trying to Make Etched Happen"](https://www.zach.be/p/stop-trying-to-make-etched-happen) provides a detailed bearish technical case. [ChipStrat](https://chipstrat.com/) offers semiconductor industry context for evaluating Etched's positioning against incumbents.

## Qualitative Assessment

**Conviction Level: MEDIUM**

**Bull case:**

1. **The performance gap is real physics, not marketing.** A chip that only does transformer math will always be more efficient than one that does everything. The question is whether the gap is 2× (not enough to switch) or 10× (impossible to ignore). If Sohu delivers anywhere near claimed specs, the cost savings force adoption.
2. **Transformers are winning harder, not fading.** Every frontier model in 2025-2026 is transformer-based. Scaling laws continue to hold. "Transformer alternatives" keep turning into transformer hybrids. The architecture risk diminishes with each passing year.
3. **The team has relevant pedigree despite youth.** Uberti's Xnor.ai and OctoML background, plus senior hires from NVIDIA (22 years, HGX/DGX) and Google DeepMind (TPU v1-v5), provides genuine chip design experience.
4. **Inference economics are broken.** Running frontier models costs $10-100M/year for major deployments. A 10× cost reduction isn't nice-to-have — it's transformative. The market pull is enormous.
5. **Capital is not a constraint.** $710M+ raised gives Etched enough runway for multiple tape-out iterations at TSMC 4nm, which costs $150-300M per iteration. They can survive a first-silicon miss.

**Key risks:**

1. **No shipped product.** As of early 2026, Sohu has not shipped to any customer. All performance numbers are company-reported. The entire $5B valuation rests on projected, not demonstrated, performance. Hardware startups routinely miss performance targets when moving from simulation to silicon.
2. **Architecture extinction risk.** Etched's own CEO has said "if transformers go away, we'll be hosed." This is not a hedge-able risk — it's binary. While transformers dominate today, the history of computing is littered with dominant architectures that were eventually replaced.
3. **Groq acquisition changes the game.** NVIDIA acquiring Groq for ~$20B means NVIDIA now has both general-purpose GPUs and specialized inference silicon. Etched is now competing against an incumbent that covers both approaches with $30B+ annual R&D spend.
4. **Software ecosystem gap.** Even a 10× faster chip is useless if customers can't easily deploy models on it. NVIDIA's CUDA ecosystem is a decade-old moat. Etched's software stack is unproven and largely undisclosed.
5. **Valuation compression risk.** $5B pre-revenue for a chip that hasn't shipped is aggressive even by 2026 AI standards. If first shipments reveal performance below claims, or if the AI inference market growth slows, the valuation has significant downside.

**Bottom Line:** Etched is making the most concentrated bet in the AI chip market — all-in on transformers, all-in on inference, all-in on specialization. The thesis is intellectually compelling and the performance claims, if true, would be genuinely disruptive. But the gap between "intellectually compelling thesis" and "shipping product that works" is where most hardware startups die. The $710M in capital provides meaningful runway, and the team's senior hires from NVIDIA and Google add credibility, but until Sohu ships and independent benchmarks confirm performance, this remains a high-conviction bet on projected rather than demonstrated capability.

**Verdict: A genuine contrarian bet with a real technical thesis, priced for perfection. The risk/reward is asymmetric in both directions — if Sohu delivers, Etched could be a generational semiconductor company; if it doesn't, $710M in capital and a $5B valuation unwind rapidly. Worth watching closely for first-shipment benchmarks as the single most important catalyst.**

*Research compiled: March 2026*
