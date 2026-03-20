# Standard Intelligence

**Website:** [si.inc](https://si.inc)
**HQ:** 548 Market St #26142, San Francisco, CA 94104
**Founded:** March 28, 2024 (CA SoS filing #6164402)
**Structure:** Public Benefit Corporation (PBC)
**Stage:** Pre-commercial (minimal disclosed funding)
**Team Size:** ~4–6 core + 18 named contributors
**Known Investor:** Transpose Platform
**Total Raised:** Undisclosed
**Contact:** contact@si.inc | invest@si.inc | hiring@si.inc
**Social:** [@si_pbc](https://x.com/si_pbc) | [si-pbc](https://huggingface.co/si-pbc) | [GitHub](https://github.com/Standard-Intelligence)

---

## The Big Audacious Idea

**Computer use should be learned from video the way humans learn from watching — not through screenshots + language models.**

This is a deep architectural disagreement with the entire AI industry. Anthropic, OpenAI, and Google all approach computer use through screenshot-based systems layered on top of language models. Standard Intelligence (SI) argues this is fundamentally wrong. Their bet: train a model directly on millions of hours of screen recording video, and it will learn to use computers the way humans do — by watching and imitating.

The name "Standard Intelligence" at si.inc is almost certainly a deliberate contrast to "Safe Superintelligence" at ssi.inc. The positioning: we're not just doing safety — we're building *intelligence*, and doing it in a way that's standard, reproducible, and open.

SI is a Public Benefit Corporation, the same structure Anthropic chose. They believe AGI will be created within the next decade and exist to solve the remaining technical problems before "aligned general learners" can exist. The PBC structure legally binds the company to pursue a public benefit alongside profit.

**The audacity:** A team of ~4–6 people, mostly in their early 20s, from the EA/AI safety community, with minimal disclosed funding, building a fundamentally different approach to computer use that challenges every major AI lab simultaneously. And the demos suggest they might be right.

---

## The Problem That's So Hard to Solve

### Why current computer-use AI is limited

Every major attempt at AI computer use — Anthropic's Computer Use, OpenAI's Operator, Google's Mariner — follows the same architecture:

1. Take a **screenshot** of the screen
2. Feed it to a **language model** with vision capabilities
3. Have the LLM **reason** about what to click/type next
4. Repeat

This screenshot-LLM loop has fundamental limitations:

- **Temporal blindness:** Screenshots are frozen moments. Real computer use is *continuous* — mouse movements, scroll dynamics, timing, and visual feedback loops all carry information that static screenshots miss.
- **Inefficiency:** Processing individual screenshots through a vision-language model is computationally expensive and slow. You're throwing away 99%+ of the visual information between frames.
- **Wrong inductive bias:** Language models learn to reason about text. Computer use is a *visuomotor* skill — more like learning to drive or play an instrument than writing an essay. Forcing it through a language model is a categorical error.
- **Context limits:** Current vision-language models can handle hundreds of frames at best. Real computer tasks involve thousands to tens of thousands of visual states.

### The robot learning analogy

Consider how humans learn to use computers: they watch someone else do it, then try it themselves. They don't take screenshots and describe what they see in words. The learning is visual, temporal, and embodied.

SI's thesis is that computer use is a **visuomotor control problem**, not a **language reasoning problem with visual inputs**. This is the same paradigm shift that happened in robotics when researchers moved from symbolic planning to learned visuomotor policies.

### The data bottleneck — and how SI broke it

The largest open dataset for computer use (OpenGUI) contained ~20 hours of recordings. To learn generalizable computer skills from video, you need orders of magnitude more data. SI solved this with a clever two-stage approach:

1. **40,000 hours** of contractor-labeled screen recordings train an Inverse Dynamics Model (IDM)
2. The IDM auto-labels the remaining **11 million hours** of unlabeled video (coding livestreams, video editing, game playthroughs)

This 550,000x data advantage over the largest open dataset is the foundation of their approach.

---

## The Technology Stack

### FDM-1 (Foundation Desktop Model 1) — February 2026

The flagship. Claimed to be the first "fully general computer action model."

**Training data:** 11 million hours of screen recording video — 550,000x larger than the largest open dataset.

**Annotation pipeline:**
- 40,000 hours of contractor-labeled screen recordings → Inverse Dynamics Model (IDM)
- IDM uses **masked diffusion architecture** to predict mouse movements, key presses, scroll events
- IDM auto-labels the remaining 11M hours

**Video encoder breakthrough:**
- Compresses ~2 hours of 30 FPS video into 1M tokens
- **~50x more efficient** than prior approaches
- **~100x more efficient** than OpenAI's video encoder
- 36,000 frames in 200,000 tokens vs. Gemini handling 775 frames or Claude handling 162 frames with the same token budget

**Key architectural choices:**
- Trains directly on **video**, not screenshots — fundamental departure from all competitors
- **No pretrained LLM weights** — video-native training from scratch
- Discrete tokens for key presses/releases, scroll events, exponentially-binned mouse movements (49 bins)
- Operates at **30 FPS real-time**

**Demonstrated capabilities:**
| Domain | Demo | Significance |
|--------|------|-------------|
| **Web navigation** | Navigating complex websites autonomously | Baseline capability |
| **CAD modeling** | Multi-action Blender modeling (constructing a gear via face extrusion) | Professional software + spatial reasoning |
| **Autonomous driving** | Driving in San Francisco using arrow keys mapped via forked [comma.ai openpilot](https://github.com/commaai/openpilot) joystick mode | <1 hour of finetuning data |
| **Security testing** | GUI fuzzing/bug finding | Discovered a banking app vulnerability allowing negative balance |

**Token efficiency comparison (at 200K token budget):**
| System | Frames Processed | vs. FDM-1 |
|--------|-----------------|-----------|
| **FDM-1** | ~36,000 frames | — |
| **Gemini** | ~775 frames | 46x fewer |
| **ChatGPT Computer Use** | ~240 frames | 150x fewer |
| **Claude** | ~162 frames | 222x fewer |
| **NVIDIA Cosmos CV4x8x8** | ~49 frames | 735x fewer |

> Source: [FDM-1 post frame comparison chart](https://si.inc/fdm1/frame_comparison.webp)

**Evaluation infrastructure:** 1M+ rollouts per hour across 80,000 forking VMs, 11ms round-trip latency, each H100 controls ~42 VMs in parallel. Key innovation: **VM forking** — full memory snapshots of OS state are captured and replicated onto fresh VMs without corrupting the base environment, enabling reuse of evaluation starting states across thousands of rollouts. Uses custom Rust device input bindings for high-performance action execution.

**Architecture diagrams (hosted at si.inc):**
- Training recipe overview: [recipe_overview.webp](https://si.inc/fdm1/recipe_overview.webp)
- Inverse Dynamics Model: [inverse_dynamics.webp](https://si.inc/fdm1/inverse_dynamics.webp)
- Forward Dynamics Model: [forward_dynamics.webp](https://si.inc/fdm1/forward_dynamics.webp)
- Exponential binning for mouse position: [exponential_binning.webp](https://si.inc/fdm1/exponential_binning.webp)
- Evaluation charts: [typing_test](https://si.inc/fdm1/evals/typing_test.webp) | [verbal_memory](https://si.inc/fdm1/evals/verbal_memory.webp) | [symbolic_memory](https://si.inc/fdm1/evals/symbolic_memory.webp) | [target_accuracy](https://si.inc/fdm1/evals/target_accuracy.webp) | [ui_manipulation](https://si.inc/fdm1/evals/ui_manipulation.webp) | [cad](https://si.inc/fdm1/evals/cad.webp)

### hertz-dev — November 2024

Open-source full-duplex conversational audio base model:

| Component | Parameters | Detail |
|-----------|-----------|--------|
| hertz-codec (encoder) | 5M | 16kHz mono speech → 8Hz latent at just 1kbps |
| hertz-codec (decoder) | 95M | Latent → reconstructed audio |
| hertz-VAE | 1.8B | Variational autoencoder for latent space modeling |
| hertz-transformer | 6.6B | Autoregressive generation model |
| **Total** | **~8.5B** | Full-duplex, two audio channels simultaneously |

**Key performance:**
- **80ms theoretical latency, 120ms real-world** on RTX 4090 — 2x lower than any other audio model
- Full-duplex: speaker + listener channels simultaneously, 8 forward passes/sec
- Only **8Hz token rate** (1 token per 125ms) — lower than any popular tokenizer
- **1kbps bitrate** (extremely compressed)
- Trained on **500B audio tokens**
- Apache-2.0 license (commercial use)
→ [GitHub](https://github.com/Standard-Intelligence/hertz-dev) — 1,800+ stars

**Architecture diagrams:** [hertz-codec](https://si.inc/hertz-dev/hertz-codec.png) | [hertz-AR](https://si.inc/hertz-dev/hertz-ar.png)

**Framing:** Audio modality is "imperative to creating interactive agents that feel natural." hertz-dev positions as the audio backbone for agents that need to converse while acting.

### The Heap — Data Infrastructure

A 30 petabyte storage cluster in downtown San Francisco:

| Metric | Detail |
|--------|--------|
| **Total cost** | $426,500 one-time + $17,500/month |
| **AWS equivalent** | $1.13M/month (~$13.5M/year) |
| **Cost ratio** | ~$1/TB/month vs $38/TB/month on AWS |
| **Hardware** | 2,400 hard drives (12-14TB each), 100 NetApp DS4246 chassis, 10 Intel head nodes |
| **Network** | 100Gbps dedicated internet (Zayo) |
| **Software** | 200 lines of Rust for writing, nginx for reading, SQLite for metadata |
| **Purpose** | Storing 90M hours of video for pretraining |

Built during "Storage Stacking Saturday (S3)" — a 36-hour hard drive installation party.

---

## What the World Looks Like If This Works

If video-native training is the correct paradigm for computer use:

1. **Computer-use agents become truly general.** The same model that navigates websites also operates CAD software, plays games, and drives cars. This cross-domain generalization — already demonstrated in FDM-1 — is qualitatively different from screenshot-LLM approaches that need domain-specific prompting.

2. **The efficiency gap compounds.** A 100x more efficient video encoder means 100x more context at the same cost. As models scale, this efficiency advantage becomes a decisive moat. SI can process 36,000 frames where competitors process 162.

3. **Autonomous computer work becomes economically viable.** At 30 FPS with 11ms round-trip, FDM-1 operates at human speed. Combined with 80,000 VMs running 1M+ rollouts per hour, this enables massive parallel computer work — testing, data entry, quality assurance — at costs that undercut human labor.

4. **SI becomes the foundation model layer for computer control.** Every company building agents, RPA tools, or automation platforms needs a model that can operate any computer interface. SI provides that model.

5. **The autonomous driving demo hints at physical-world transfer.** If a computer-use model can drive a car after <1 hour of finetuning, the same architecture might transfer to any visuomotor task — robotics, manufacturing, surgery assistance.

---

## Best Case Scenario / Addressable Opportunity

**Computer use agents / RPA market:**

| Segment | Size | SI's Play |
|---------|------|-----------|
| Robotic Process Automation (RPA) | $22–28B (2025) → $247B by 2035 ([Precedence Research](https://www.precedenceresearch.com/robotic-process-automation-market), 24.2% CAGR) | FDM-1 as foundation model replacing rule-based RPA |
| Agentic AI | $7.55B (2025) → $199B by 2034 (43.8% CAGR) | Video-native computer-use backbone for agent platforms |
| AI-powered testing & QA | ~$5B | GUI fuzzing/bug finding already demonstrated |
| Autonomous driving | $60B+ by 2030 | Potential transfer from video-native training |
| Conversational AI (audio) | ~$10B | hertz-dev as low-latency audio backbone |

**Combined addressable market:** Potentially **$400B+** by mid-2030s when including RPA displacement and new agentic AI categories. Gartner projects AI agents will challenge mainstream productivity tools, triggering a $58B market disruption by 2027 ([EquityZen](https://blog.equityzen.com/beyond-the-chatbot-why-2026-is-the-year-of-agentic-ai)).

**Why now — what made video-native training feasible in 2024-2025:**
1. **Video encoder efficiency breakthroughs** — FDM-1's custom encoder achieves 50x greater token efficiency than prior SOTA, making multi-hour video contexts practical
2. **Compute scaling** — ~4x/year training compute expansion ([Epoch AI](https://epoch.ai/blog/can-ai-scaling-continue-through-2030)); H100s with native FP8 dramatically reduce memory requirements
3. **Architectural innovations** — Masked diffusion, exponential binning, causal convolutions for streaming inference (2023-2024 innovations)
4. **Storage cost collapse** — 30PB for <$500K vs $13.5M/year on AWS made storing 90M hours of video economically viable
5. **Self-supervised labeling at scale** — IDM trained on 40K hours can auto-label the full 11M hour corpus, removing the data bottleneck
6. **The data already exists** — Explosion of screen recordings on YouTube, Twitch, and other platforms provides abundant free training data

---

## Open-Source Contributions

| Project | Description | License | Link |
|---------|-------------|---------|------|
| **hertz-dev** | Full-duplex conversational audio model (8.5B params, 120ms latency) | Apache-2.0 | [GitHub](https://github.com/Standard-Intelligence/hertz-dev) (1,800+ stars) |
| **Model weights** | Available at ckpt.si.inc | — | [ckpt.si.inc](https://ckpt.si.inc) |
| **The Heap** | Documented the full build of 30PB storage for $500K | Blog post | — |

**FDM-1 weights:** Not yet open-sourced. Whether they open-source FDM-1 will be a defining strategic decision.

---

## Commercial Validation

**Current status:** Research/pre-commercial. No public API, pricing page, or customer announcements.

**Potential commercialization paths:**

| Path | Evidence |
|------|----------|
| FDM-1 as computer-use agent API | Core capability; competitor products (Anthropic, OpenAI) validate the market |
| hertz-dev as real-time conversational audio API | Apache-2.0 and 1,785 stars suggest market pull |
| Video encoder technology licensing | 100x efficiency advantage is a standalone product |
| Evaluation infrastructure as a service | 80K VMs, 1M+ rollouts/hour is non-trivial infra |

**Contact:** invest@si.inc suggests active fundraising or openness to investment.

---

## Core Team

### Tyler Galen Mead — CEO (also CFO, Secretary, Treasurer)

| | |
|---|---|
| **Education** | University of Toronto |
| **Recognition** | Atlas Fellowship Fellow (1.8% acceptance rate from 7,000+ applicants) |
| **Roles** | Holds all C-suite roles simultaneously |

**What's notable:** Holds every C-suite title at the company — CEO, CFO, Secretary, Treasurer — which is either a sign of extreme leanness or a company too early for functional specialization. The Atlas Fellowship is a prestigious program for exceptionally talented young people focused on existential risk, funded by the rationalist/EA community. His personal site ([nel.ag](https://nel.ag/)) and GitHub ([calculating](https://github.com/calculating)) are characteristically minimal.
→ [nel.ag](https://nel.ag/) | GitHub: [calculating](https://github.com/calculating)

---

### Devansh Pandey — Co-Founder

| | |
|---|---|
| **Education** | Oxford (brief), high school dropout from Bay Area |
| **Prior** | First employee at Atlas Fellowship (2022) — ran infrastructure and admissions; Founded Atlas Academy (small high school for himself and fellow Atlas Fellows); Finance role at Atlas Fellowship (Apr 2022–Mar 2023); Integral Research (Apr–Jun 2023); President at Prometheus (Nov 2021–Mar 2022) |
| **Other** | Organized Hackuba — a 20-person weeklong hackathon in rural Japan; started the Bread Society and helped run the Taylor Swift Society at Oxford |

**What's notable:** A high school dropout who was the first employee at the Atlas Fellowship — a program that identifies the world's most talented teenagers and orients them toward existential risk reduction. He then created his own high school for himself and other fellows, briefly attended Oxford, and co-founded an AGI lab. This is not a traditional founder path. His organizational background (running Atlas admissions and infrastructure) suggests he's the operational backbone despite no conventional credentials.
→ [devanshpanda.com](https://devanshpanda.com/about/)

---

### Neel Redkar — Team Member

| | |
|---|---|
| **Education** | UCLA — BSE Computer Science + BA Philosophy, 4.0 GPA (expected graduation 2026) |
| **Awards** | Regeneron ISEF 2022: 2nd Place Grand Award (Materials Science) + 2nd Place AAAI Special Award; Davidson Fellow ($25,000 scholarship); Emergent Ventures grant recipient |
| **Research** | NLP researcher at UCLA's Peng Lab; designed neural network for Metal Organic Frameworks (carbon capture); independent research presented at NeurIPS 2023; AAAI poster presentation |
| **Prior** | AI work at Notion; recruited by 3blue1brown for Sinerider (math game) |

**What's notable:** Currently a UCLA undergrad with an outsized research profile. ISEF 2nd place, Davidson Fellow, NeurIPS 2023 research, and a 4.0 GPA in CS + Philosophy is exceptional for someone who hasn't graduated yet. His NLP research at UCLA's Peng Lab and prior Notion AI work suggest genuine ML engineering capability, not just competition credentials. Being recruited by 3blue1brown (Grant Sanderson) for Sinerider shows recognition from the mathematical education community. His GitHub ([neelr](https://github.com/neelr)) includes a fully commented R1 implementation and working GRPO — demonstrating hands-on capability with the exact RL techniques used in modern AI training.
→ GitHub: [neelr](https://github.com/neelr)

---

### Yudhister Kumar — Team Member

| | |
|---|---|
| **Education** | Mathematics with focus on AI (specific institution unclear) |
| **Recognition** | Rise Winner (prestigious global talent program); graduated high school 2 years early; took mathematics courses at UC Berkeley at age 15 |
| **Research** | Quantum field theory applications to AI interpretability; reward learning theory; neural architecture representational complexity; MATS 5.0 talk: "Applications of Oracles to Cooperative AI"; written on Schur-Weyl duality, Ramsey theory, scaling laws for transfer learning |
| **Other** | TEDxTemecula speaker; hydrogen storage research; active LessWrong contributor |

**What's notable:** A mathematical prodigy — graduated high school two years early, took UC Berkeley math courses at 15, and won Rise (a global program by Schmidt Futures and the Rhodes Trust). His research interests span QFT applications to AI interpretability, reward learning theory, and architectural complexity — unusually theoretical for a startup team member, suggesting he provides mathematical depth that grounds the engineering work. His LessWrong activity and MATS talk on cooperative AI place him squarely in the AI alignment community.
→ [yudhister.me](https://www.yudhister.me/)

---

### Other Known Contributors

| Person | Background |
|--------|-----------|
| **Ulisse Mini** | Former MTS (departed for Project Prometheus). Atlas Fellow. Published "Activation Addition: Steering Language Models Without Optimization" (2023). Active on AI Alignment Forum & LessWrong. Previously at SF Compute, Stanford Existential Risks Initiative. [uli.rocks](https://uli.rocks/) |
| **Nicholas Charette** | Stanford, generalist engineer. Built compilers, raymarching shaders. |
| **Lexi Mattick (kognise)** | Developer/maker. [GitHub: kognise](https://github.com/kognise) |
| **Kunvar Thaman** | BITS Pilani, based in SF. |
| **Robert Avery** | Acknowledged on both hertz-dev and The Heap. |

**All 18 named FDM-1 contributors:** Mohit Agarwal, Carlo Agostinelli, Robert Avery, Cheru Berhanu, Nicholas Charette, Trevor Chow, Luke Drago, Ryan Kaufman, Rudolf Laine, Jinglin Li, Lexi Mattick, Ulisse Mini, Rio Popper, Jannik Schilling, Armando Shashoua, Aidan Smith, Koko Xsu, Sally Zhu

The growing contributor network suggests the ability to attract talent despite minimal resources — many come from the Atlas Fellowship / EA / AI safety ecosystem.

---

### The Atlas Fellowship Connection

The [Atlas Fellowship](https://www.atlasfellowship.org/about) is the clearest institutional link connecting the SI team. Key facts:

| | |
|---|---|
| **What it is** | 11-day intensive programs in Berkeley and Oxford for exceptional students interested in reasoning, AI risks, biosecurity, and global challenges |
| **Selectivity** | 111 fellows selected from 7,000+ applicants across 18 countries (1.6% acceptance) |
| **Funding** | Open Philanthropy (Dustin Moskovitz's philanthropic org) |
| **Co-founders** | Jonas Vollmer, Ashley Lin, Sydney Von Arx |

**SI team members from Atlas:** Galen Mead (Fellow), Devansh Pandey (Fellow AND first employee), Ulisse Mini (Fellow + FDM-1 contributor)

**Why it matters:** Atlas is a nexus for precocious, technically talented young people oriented toward existential risk — exactly the pipeline that would produce founders of "an aligned AGI lab." Devansh Pandey was literally employee #1 at Atlas before co-founding SI. The fellowship is backed by Open Philanthropy, the largest funder of AI safety research.

---

## Funding & Investors

### Known Investor: Transpose Platform

| | |
|---|---|
| **Stage** | Global formation-stage VC (Day 0, first-check) |
| **Founded** | 2015 by Alex Bangash and Trang Nguyen |
| **Track Record** | 508 investments, 83+ unicorns |
| **Alex Bangash** | Cornell/Wharton MBA, previously managed $2B+ for institutional investors with 30%+ IRR; advised first checks in Accel, First Round, Founders Fund, Emergence, YC, Khosla |
| **Amount** | Not disclosed |

**What's notable:** Transpose is a formation-stage investor — they write the first check before most VCs would even take a meeting. Their 508 investments and 83+ unicorns suggest pattern recognition at the earliest stage. Bangash's background managing $2B+ with 30%+ IRR and advising first checks in top-tier funds (Founders Fund, YC, Khosla) gives weight to a check size that is likely small but symbolically important.

**Interesting connection:** Transpose also invested in Standard AI (a different company, $236M+ raised) — not Standard Intelligence, but the name similarity suggests they may track companies in the "standard/intelligence" naming space.

**Financial bootstrapping signals:**
- 30PB storage for $500K vs ~$13.5M/year on AWS
- Team of ~4–6 core people
- Used enterprise hardware (NetApp chassis for $350 each)
- 200 lines of Rust instead of deploying Ceph
- Extreme cost consciousness suggests operating lean, possibly pre-institutional-funding
- invest@si.inc contact indicates openness to investment

---

## Hiring Signals & Strategic Direction

- No public job postings or careers page
- Ulisse Mini departed for Project Prometheus (some turnover signal)
- FDM-1 acknowledges 18 people beyond 4 core authors — growing contributor network
- invest@si.inc suggests they may be raising to expand

**Strategic inference:** The absence of public hiring combined with a growing contributor network suggests an open-source-contributor model rather than traditional hiring. The invest@si.inc email is the strongest signal that formalization (and institutional funding) may be imminent.

---

## Conference & Media Presence

**Company blog posts (primary sources):**
- [FDM-1 announcement](https://si.inc/posts/fdm1/)
- [Hertz-dev release](https://si.inc/posts/hertz-dev/)
- [The Heap (30PB storage build)](https://si.inc/posts/the-heap/)

**Third-party coverage:**
| Outlet | Coverage | Link |
|--------|----------|------|
| **Hacker News** | hertz-dev discussion (significant engagement) | — |
| **Metaverse Post** | FDM-1 technical coverage | [Link](https://mpost.io/standard-intelligence-launches-fdm-1-ai-system-capable-of-learning-complex-computer-tasks-from-video/) |
| **GIGAZINE** | FDM-1 coverage (major Japanese tech outlet) | [Link](https://gigazine.net/gsc_news/en/20260226-fdm-1-general-computer-action-model/) |
| **Digital Applied** | FDM-1 technical analysis | [Link](https://www.digitalapplied.com/blog/standard-intelligence-fdm-1-video-training-guide) |
| **MarkTechPost** | hertz-dev coverage | [Link](https://www.marktechpost.com/2024/11/03/meet-hertz-dev-an-open-source-8-5b-audio-model-for-real-time-conversational-ai-with-80ms-theoretical-and-120ms-real-world-latency-on-a-single-rtx-4090/) |
| **Pascal Bornet's Newsletter** | Featured in Agentic Intelligence #40 | [Link](https://pascalbornet.substack.com/p/agentic-intelligence-newsletter-40) |

**Referenced papers from FDM-1 post:** [V-JEPA](https://arxiv.org/abs/2404.08471) | [OpenAI VPT](https://arxiv.org/abs/2206.11795) | [Behavior Cloning from Observation](https://arxiv.org/abs/1805.01954) | [Masked Diffusion Language Models](https://s-sahoo.com/mdlm)

**Notable absence:** No TechCrunch, Forbes, Bloomberg, Wired, or Verge coverage. No conference talks. No arXiv papers for FDM-1 itself. SI has flown almost entirely under mainstream tech press radar.

**What this means:** Either deliberate under-the-radar positioning (common in the rationalist/EA community) or a company too early and small for mainstream attention. The technical community (Hacker News, niche AI newsletters) has noticed them, but the broader AI press has not. This creates an information asymmetry — most VCs and industry observers are unaware of FDM-1's existence.

**Important clarification:** Standard Intelligence (si.inc) is NOT the same as Standard AI (formerly Standard Cognition), which raised $236M+ including a $150M Series C from SoftBank Vision Fund. Standard AI is a retail checkout technology company. Transpose Platform invested in both, which may cause confusion.

---

## Why This is a Non-Consensus Bet

**What the consensus thinks:**
- Computer use AI should be built on top of existing language models (GPT, Claude, Gemini)
- Screenshots + LLM reasoning is the correct architecture for GUI agents
- Building frontier AI requires hundreds of millions in funding and hundreds of researchers
- The path to AGI goes through language, not video
- A team of 4–6 twenty-somethings with minimal funding can't compete with Anthropic, OpenAI, and Google

**What Standard Intelligence believes differently:**

1. **The "video-native" bet is genuinely contrarian.** Every major player approaches computer use through screenshots + LLMs. SI argues that's fundamentally wrong — computer use should be learned from video the way humans learn from watching. This is not a marginal improvement; it's a deep architectural disagreement about the correct paradigm.

2. **No LLM transfer is radical.** Most computer-use agents are LLM-based systems with vision adapters. FDM-1 trains from scratch on video without language model weights. This bets that the path to general computer use goes *through* video understanding, not through language reasoning with visual grounding.

3. **The team is exceptionally unusual.** The founders are Atlas Fellows — a program for exceptionally talented high schoolers focused on existential risk. Pandey dropped out of high school. Redkar is a UCLA undergrad with a 4.0 and NeurIPS publications. Kumar graduated high school two years early and took UC Berkeley math at 15. These aren't Stanford PhD dropouts from DeepMind — they're teenagers and early-20s from the EA/AI safety community who decided to build AGI themselves.

4. **The cost discipline is remarkable.** 30PB for $500K (vs $13.5M/yr on AWS), ~4–6 person team, used enterprise hardware, 200 lines of Rust instead of Ceph. The opposite of the "raise $6B and build a massive org" approach. Proving that frontier-adjacent AI research can be done on a shoestring.

5. **The autonomous driving demo is the real signal.** FDM-1 drives a car in SF after <1 hour of finetuning. Not a driving company — a demonstration that video-native training produces qualitatively different generalization capabilities. Same model does web, CAD, and driving. No screenshot-LLM system has demonstrated this kind of cross-domain transfer.

6. **The Atlas Fellowship pipeline.** Multiple team members are Atlas Fellows. Contributors come from the EA/rationalist/AI safety ecosystem (MATS, Stanford Existential Risks Initiative, SF Compute). This is a company emerging from the AI safety community that decided the best path to alignment is to build AGI themselves — a controversial position within that community.

7. **PBC structure + AGI ambitions + shoestring budget.** The combination of a Public Benefit Corporation, a stated goal of building aligned AGI, and a tiny team with minimal disclosed funding is either wildly audacious or a signal that they've achieved something genuinely remarkable with very few resources. The FDM-1 demo suggests the latter.

---

## Competitive Landscape

| Company | Product | Approach | Key Metric |
|---------|---------|----------|------------|
| **Anthropic** | Claude Computer Use | Screenshot-based, LLM-driven | Most advanced current product |
| **OpenAI** | Operator / CUA | Screenshot-based, GPT-driven | Largest model behind it |
| **Google** | Mariner (Gemini) | Browser-focused, Gemini-driven | Google resources |
| **Standard Intelligence** | FDM-1 | Video-native, trained on 11M hours | 100x encoder efficiency, cross-domain transfer |

**SI's differentiators:**
1. **Video-native vs screenshot-based** — continuous mouse movement modeling, long-context understanding at 30 FPS
2. **Scale:** 11M hours of video — 550,000x larger than largest open dataset
3. **Efficiency:** Video encoder ~100x more efficient than OpenAI's
4. **Cross-domain generality:** Same model handles web, CAD, and autonomous driving
5. **No LLM dependency:** Trained from scratch on video — entirely different compute/cost profile

**SI's disadvantages:**
1. No standardized benchmark results published — FDM-1 has NOT been tested on OSWorld, WebArena, or similar (for context: GPT-5.4 scores 75.0%, Claude Sonnet 4.5 scores 61.4%, Human 72.4% on [OSWorld](https://os-world.github.io/)). FDM-1's continuous video paradigm makes direct comparison difficult.
2. No commercial product or API
3. Team is 100x smaller than any competitor
4. No disclosed institutional funding
5. Entirely unproven in production environments

---

## Qualitative Assessment

### Conviction Level: MEDIUM-HIGH (with significant uncertainty)

**Why this could be a breakout:**

1. **The technical approach is genuinely differentiated.** Video-native training at 11M hours with a 100x more efficient encoder is not incremental — it's a different paradigm. If the paradigm is correct, SI has a massive data and efficiency moat.

2. **The autonomous driving demo is the strongest signal.** A computer-use model that drives a car in SF after <1 hour of finetuning demonstrates a kind of cross-domain generalization that no screenshot-LLM approach has shown. This is qualitative, not quantitative, evidence — but it's compelling.

3. **The cost engineering is extraordinary.** 30PB for $500K, 200 lines of Rust replacing Ceph, $350 NetApp chassis. This team knows how to do more with less. If they can maintain this efficiency advantage as they scale, the unit economics become a moat.

4. **The video encoder alone could be a company.** 100x more efficient video processing than OpenAI's approach has applications far beyond computer use — video search, surveillance, media, robotics.

5. **The team, while young and unproven, has exceptional raw talent.** ISEF, Davidson Fellowship, Rise, NeurIPS, Atlas Fellowship — the individual credentials are outstanding. Whether this translates to company-building capability is unknown.

### Key Risks:

1. **No benchmarks published.** Without OSWorld or similar standardized results, we don't know how FDM-1 actually performs against Anthropic Computer Use or OpenAI Operator. The demos are impressive but curated.

2. **Video-native might not beat screenshot+LLM at scale.** The thesis is contrarian, and contrarian theses are contrarian because most people disagree. If LLM reasoning is actually the right paradigm for computer use, SI's entire approach is misguided.

3. **The team is very young and inexperienced in company-building.** A high school dropout, a UCLA undergrad, and a UC Berkeley math prodigy is an unusual founding team. They have zero collective experience running a company, raising institutional funding, or selling to enterprises.

4. **Minimal disclosed funding in a capital-intensive field.** Training on 11M hours of video requires serious compute. With minimal disclosed funding and a tiny team, how are they accessing the GPU resources needed?

5. **Turnover signal.** Ulisse Mini's departure for Project Prometheus suggests the team may have difficulty retaining talent, particularly as larger labs with more resources compete for the same people.

### Bottom Line:

Standard Intelligence is the most technically interesting under-the-radar AI company in the world right now. The video-native approach to computer use is a genuine architectural bet that — if correct — gives them a massive efficiency and generalization advantage over every major lab. The autonomous driving transfer demo is the kind of result that makes you stop and reconsider assumptions. But the lack of standardized benchmarks, commercial traction, institutional funding, and operational experience creates substantial execution risk. This is a company to watch very closely — and potentially to invest in early if you believe the video-native thesis.

**Verdict: The most contrarian technical bet in computer-use AI. If video-native training is the right paradigm, SI has a decisive head start. If it's wrong, this is a brilliant team that built something impressive but ultimately outcompeted by better-resourced labs using the LLM approach. High upside, high uncertainty.**

---

*Research compiled: March 2026*
