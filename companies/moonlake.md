# Moonlake AI

| | |
|---|---|
| **Website** | [moonlakeai.com](https://moonlakeai.com) |
| **HQ** | San Mateo, CA (on-site) |
| **Founded** | 2025 |
| **Structure** | Private |
| **Stage** | Seed |
| **Lead Investors** | AIX Ventures (Christopher Manning GP), Threshold Ventures, NVentures (NVIDIA) |
| **Notable Angels** | Jeff Dean (Google Chief Scientist), Steve Chen (YouTube co-founder), Naval Ravikant, Ian Goodfellow (GAN inventor), Guillermo Rauch (Vercel founder), Jared Leto, executives from Hugging Face, Stability AI, DeepMind, OpenAI |
| **Total Raised** | $28M |
| **Valuation** | Undisclosed |

---

## The Big Audacious Idea

**Build the first programmable world model — a system that takes a natural language description and compiles it into a fully interactive, physics-grounded, playable environment in minutes instead of months.**

Game development today works like Hollywood in the 1950s: massive teams, massive budgets, multi-year timelines. A AAA game costs $100M–$300M and requires hundreds of specialized engineers, artists, and designers working for 3–5 years. Independent developers face the same tooling complexity at smaller scale. The result: millions of creative ideas die on sketchpads because the tools to realize them demand skills most people don't have.

Co-founder Fan-Yun Sun: *"Before handheld video cameras, filmmaking was only reserved for well funded Hollywood studios. The gaming world is still running off that model of extremely high moats."*

Moonlake's product, **Reverie**, is a Generative Game Engine (GGE) — not a video model adapted for games, but a purpose-built system that combines multimodal reasoning, code generation, physics simulation, and real-time diffusion to produce interactive worlds from text prompts. When you type "bowling alley with physics and scoring," Reverie generates 3D assets with PBR textures, assigns rigid body physics (ball: 5kg, pins: 1.5kg), writes game logic as code (state machines for pin detection and scoring), adds spatial audio, implements inverse kinematics for character arms, and delivers a playable game.

The key technical claim: unlike video-based world models (Decart/Oasis, Google Genie) that generate pixel sequences, Moonlake conditions generation on **structural 3D signals** — geometry, physics constraints, affordances, symbolic logic. This enables three properties that video models fundamentally lack: persistence (destroyed objects stay destroyed), controllability (authors can specify rules), and unbounded runtime (works for hours of gameplay, not 10-second clips).

Co-founder Sharon Lee: *"The missing piece in generative worlds is control. Our new GGE will allow creators to specify what changes, why it changes, and how long it persists, so the world feels authored, not random."*

---

## The Problem That's So Hard to Solve

### Why game creation is still prohibitively expensive

The game development pipeline is a chain of specialized, labor-intensive steps: concept art → 3D modeling → texturing → rigging → animation → level design → physics setup → game logic programming → playtesting → polish. Each step requires different expertise and different tools. The relationship between world complexity and labor is linear — twice the world means twice the work.

Christopher Manning (Stanford NLP, AIX Ventures GP): *"The bottleneck in digital creation has always been the linear relationship between world complexity and manual labor."*

This linearity kills creativity at scale. A solo developer can make a simple 2D game in weeks, but a rich 3D world with physics, AI agents, and emergent gameplay requires a team. The tools (Unity, Unreal Engine) have gotten better, but they've added complexity rather than removing it. Learning Unreal Engine is itself a multi-month investment.

### Why existing AI approaches fail for interactive worlds

The AI world model space has exploded since 2023, but every approach has fundamental limitations:

1. **Video generation models (Sora, Runway, Decart/Oasis).** Generate stunning visual output but produce pixel sequences — there are no objects, no physics, no state. An "object" in a generated video is just a region of correlated pixels. You can't interact with it because it doesn't exist as a discrete entity. Generated worlds hallucinate constantly — objects drift, details reset, physics is approximated by visual heuristics. As Moonlake's researcher Yitong Deng wrote: video models produce "structure without permanence."

2. **3D scene generation (World Labs, DreamFusion).** Produce geometrically coherent 3D environments but they're static — museum dioramas, not playable worlds. You can look at them; you can't play in them. World Labs' Marble product exports production-ready 3D, but there's no game logic, no physics simulation, no AI agents.

3. **Procedural generation (Minecraft terrain, No Man's Sky).** Produces infinite variety but from handcrafted rules — not creative intent. The output is "random within parameters," not "responsive to imagination." You can't say "make a cozy medieval village with a mystery quest" and get something coherent.

4. **Text-to-3D (single objects).** DreamFusion and similar methods generate individual 3D objects from text. But a world is not a collection of objects — it's objects + spatial relationships + physics constraints + interaction rules + temporal logic + aesthetics. The gap between generating a chair and generating a room with a chair you can sit in is enormous.

### The specific technical challenges Moonlake must solve

- **Multimodal coherence.** The generated world must be visually, physically, logically, and spatially consistent. A chair must look like a chair, have chair-sized mass, be sittable, and be positioned logically in a room. Most AI systems nail one dimension and fail the others.

- **Program synthesis for game logic.** Game rules (scoring, win conditions, state transitions) must be expressed as executable code, not visual approximations. An AI that can generate "bowling" must also generate the scoring algorithm. Moonlake uses LLM-based code generation for this, inheriting all the reliability challenges of AI-generated code.

- **Real-time performance.** Unlike offline rendering, games require 30–60fps. The diffusion model (Reverie) must operate within frame budgets without blocking the gameplay loop. This is a hard constraint that video models don't face.

- **Persistence across time.** A world model that "forgets" between frames is useless for games. If you break a window, it must stay broken. This requires maintaining explicit state separate from the generative model — which is why Moonlake uses structural representations rather than pure pixel generation.

---

## The Technology Stack

### Reverie: Generative Game Engine (GGE)

**Not a video model adapted for games** — a purpose-built five-layer architecture:

**Layer 1: Multimodal Reasoning**
Spatial layout planning using vision-language models. Determines where objects go, how they relate to each other, what the scene topology looks like. Based on Fan-Yun's academic work (Holodeck, 3D-Generalist, LayoutVLM).

**Layer 2: Tool Use over 3D/2D Engines**
The model calls external tools (3D engines, asset libraries) to build scenes rather than generating everything from scratch. This means real geometry, real PBR textures, real physics bodies — not neural approximations.

**Layer 3: Program Synthesis**
Game logic generated as executable code — state machines, scoring systems, timers, win conditions, AI behaviors. Based on Fan-Yun's FactorSim (NeurIPS 2024), which demonstrated that factored POMDP representations enable reliable code-based simulation generation from language.

**Layer 4: Simulation Layer**
Physics simulation and AI agent execution. Real rigid body dynamics (not visually approximated), collision detection, force models. This is where Sharon Lee's work with Ron Fedkiw (legendary computational physics researcher) directly applies.

**Layer 5: Real-time Diffusion (Reverie)**
Visual reskinning — the diffusion model renders the structural world into final visual output, conditioned on the 3D structural signals from layers 1–4. This is the key architectural insight: the diffusion model doesn't have to invent physics or logic because those are handled by layers above. It only handles visual appearance, constrained by the structural representation.

### Multimodal State Space

The world modeling agent maintains state across five dimensions simultaneously:
- **Geometry:** transforms, topology, spatial relationships
- **Physics:** mass, forces, collision constraints
- **Affordances:** possible actions and agents
- **Symbolic logic:** rules, scores, timers, state machines
- **Perceptual mappings:** visual projection and spatial audio

### Product Status

- **Beta launched:** February 17, 2026, accepting 100 waitlist users/day
- **Waitlist:** 10,000+ users, including developers from Microsoft, NVIDIA, Sony, Google, EA
- **Pricing:** Starting at $15/month, scaling with usage
- **Closed-source:** No public GitHub repos or open-source model releases

### Demonstrated Capability: Bowling Game

A single text prompt produced a playable bowling game through 10 automated construction phases: asset generation → physicalization → spatial layout + UI → game logic → ball lifecycle → boundary stabilization → edge case handling → audio integration → IK integration → polish refinement. The level of automation — from natural language to playable game with physics, scoring, and polish — is the most complete end-to-end demo in the space.

---

## What the World Looks Like If This Works

1. **Game creation becomes as accessible as video creation.** Just as YouTube + smartphones democratized filmmaking (from Hollywood studios to anyone with a phone), Moonlake democratizes game creation. Anyone with an idea can describe a world and play it. The creative barrier drops from "years of technical skill" to "the ability to articulate what you imagine." Steve Chen (YouTube co-founder): *"Similar to YouTube opening up a platform for the world to watch and share videos, I look forward to Moonlake doing the same for interactive content."*

2. **AI agents get unlimited training environments.** The other half of Moonlake's thesis — the one the RL/robotics community cares about. Today, training embodied AI agents requires painstakingly hand-built simulation environments. If Moonlake can generate diverse, physics-grounded environments from text descriptions, it unlocks the bottleneck for training robots, autonomous vehicles, and AI agents at scale. Mo Islam (Threshold Ventures): *"This unlocks entirely novel forms of agents in both the digital and physical worlds."*

3. **A new UGC platform emerges.** If millions of people can create playable interactive experiences in minutes, a new content platform forms — games as the next UGC medium, following text (blogs), images (Instagram), and video (YouTube/TikTok). The platform economics of this are enormous.

4. **The $100M–$300M AAA development model erodes.** If AI can generate 80% of the assets, physics, and game logic, the remaining 20% (creative direction, narrative, polish) can be done by small teams. Game development costs drop by an order of magnitude, enabling more experiments, more genres, and more creative risk-taking.

5. **Simulation becomes a general-purpose tool.** Architecture, urban planning, education, therapy, training — any domain that benefits from interactive 3D environments gains access. A teacher describes a historical scene; students explore it. An architect describes a building; clients walk through it. The interactive medium stops being "games" and becomes "spatial computing."

---

## Best Case Scenario / Addressable Opportunity

| Market | Size | Growth |
|--------|------|--------|
| AI Game Generator | $1.64B (2024) → $21.26B (2034) | 29.2% CAGR |
| Generative AI in Gaming | $1.47B (2024) | 22.8% CAGR |
| Broader AI in Gaming | $4.54B (2025) → $81.19B (2035) | 33.6% CAGR |
| Spatial Content Economy | — → $100B (2030) | — |
| Total Gaming Industry | — → $321B (2026) | — |

**The platform TAM:** If Moonlake becomes the YouTube of interactive content — a platform where millions create and share playable experiences — the addressable market isn't "AI game tools" but the intersection of gaming ($321B) and UGC platforms. YouTube generates $30B+ in annual revenue from user-generated video. A UGC platform for interactive content could be similarly large.

**The simulation TAM:** RL training environments, digital twins, architectural visualization, education simulations, military training. Every domain that uses simulation today does so with expensive, hand-built environments. Democratizing simulation creation expands the market far beyond gaming.

---

## The Science: A Brief History

**2014: Ian Goodfellow invents GANs.** Generative adversarial networks demonstrate that neural networks can generate realistic images. Goodfellow later advocates for using generative models in simulations — a thesis Moonlake directly fulfills. Goodfellow is now an angel investor.

**2016–2020: Text-to-image generation matures.** DALL-E, Stable Diffusion, Midjourney demonstrate that natural language can control visual generation. But images are static — no interactivity, no physics.

**2020–2023: Video generation emerges.** Runway, Sora, and others generate video sequences from text. Impressive visually, but still fundamentally 2D pixel sequences without structure.

**2023: Neural Radiance Fields (NeRF) and 3D generation.** DreamFusion, DreamGaussian, and others generate 3D objects from text. But individual objects, not interactive worlds.

**2024: Holodeck and FactorSim (Fan-Yun Sun's PhD work).** Holodeck (CVPR 2024) demonstrates that GPT-4 can plan 3D environment layouts from language descriptions, using Objaverse assets. FactorSim (NeurIPS 2024) demonstrates that factored POMDP representations enable reliable code-based simulation generation from language. These two papers — both from Fan-Yun's research — are the direct technical ancestors of Moonlake's product.

**2024–2025: The world models wave.** World Labs (Fei-Fei Li, $1B+), Decart/Oasis ($100M, $3.1B valuation), Luma AI ($900M), Google Genie 3, Runway GWM-1. Massive capital floods into "world models" — but each approaches it differently. Video-based models (Decart, Genie) generate pixel sequences. 3D models (World Labs) generate static environments. Nobody has the full stack: interactive + physics-grounded + persistent + playable.

**February 2025: Karpathy coins "vibe coding."** The term captures a cultural moment: generating software from natural language descriptions rather than writing code. The concept legitimizes Moonlake's approach to a broader audience — "vibe game design" becomes thinkable.

**2025: Moonlake founded.** Fan-Yun and Sharon leave Stanford with the insight that the world model problem requires structural 3D signals (not just pixels), program synthesis (not just generation), and modular architecture (not monolithic neural networks). They combine their complementary expertise: Fan-Yun's 3D world generation + code synthesis (Holodeck, FactorSim, 3D-Generalist) and Sharon's physics simulation + controllability (Fedkiw lab, NOIR brain-robot interface).

**The "Why Now" convergence:**
- LLM reasoning capability enables spatial planning (Holodeck proved it) ✓
- Diffusion models reach real-time performance at game resolution ✓
- Code generation quality enables program synthesis for game logic (FactorSim proved it) ✓
- 3D asset libraries (Objaverse) provide massive asset pools ✓
- "Vibe coding" cultural moment creates consumer demand narrative ✓
- RL/embodied AI community desperate for training environments ✓
- World Labs, Decart, Luma validate the category with $2B+ in combined funding ✓

---

## Commercial Validation

| Signal | Detail |
|--------|--------|
| **Waitlist** | 10,000+ users, including developers from Microsoft, NVIDIA, Sony, Google, EA |
| **Beta Launch** | February 17, 2026; accepting 100 users/day |
| **Pricing** | $15/month starting, scaling with usage |
| **Hackathon** | a16z co-hosted event at The Dome immersive venue (Jan 2026) |
| **Alpha User Quote** | *"Setting up a VR project used to take me hours, Moonlake did it in two minutes."* |

**No named enterprise customers, revenue, or production deployments disclosed.** The company is pre-revenue and in beta. The waitlist composition (devs from major game/tech companies) is promising but represents individual interest, not enterprise procurement.

---

## Core Team

### Fan-Yun Sun — Co-Founder & CEO

| | |
|---|---|
| **Education** | PhD CS, Stanford (final year at founding); BS, National Taiwan University |
| **Advisors** | Jiajun Wu, Nick Haber (Stanford Vision & Learning Lab / Autonomous Agents Lab) |
| **Prior** | NVIDIA Research (across 3 groups: Learning & Perception, Metropolis/Omniverse, Autonomous Vehicle); Google Graduate Fellowship recipient; 1st place ACM-ICPC Asia Regionals |
| **Publications** | 2,225 citations. 3D-Generalist (arXiv 2025), FactorSim (NeurIPS 2024), Holodeck (CVPR 2024), LayoutVLM (CVPR 2025), ResearchCodeBench (NeurIPS 2025 Spotlight), InfoGraph (ICLR 2020 Spotlight), vGraph (NeurIPS 2019) |

**What's notable:** Fan-Yun's PhD is the R&D lab that produced Moonlake. Three papers in sequence tell the story:

**Holodeck** (CVPR 2024) proved you could use GPT-4 to plan 3D environment layouts from language descriptions, pulling assets from Objaverse. But Holodeck couldn't create interactive, physics-based worlds — just static scenes with positioned objects.

**FactorSim** (NeurIPS 2024) proved you could generate full simulations as executable code by decomposing them into factored POMDP representations. But FactorSim produced 2D simulations, not 3D worlds with visual rendering.

**3D-Generalist** (arXiv 2025) combined both insights — VLMs as policies for sequential 3D world construction, with self-improvement loops. This is Moonlake's direct precursor.

The NVIDIA connection is structural, not incidental. Fan-Yun worked across three NVIDIA Research groups simultaneously — Learning & Perception (vision AI), Metropolis/Omniverse (3D simulation infrastructure), and Autonomous Vehicle (embodied AI training). He saw three problems converging: (1) Omniverse needed easier ways to create simulation environments, (2) AV teams couldn't generate diverse enough training scenarios, (3) the LLM + diffusion model toolkit was finally powerful enough to automate 3D world construction. NVIDIA's NVentures investment in Moonlake reflects this direct lineage.

His competitive programming background (1st place ACM-ICPC Asia Regionals) signals the kind of algorithmic depth needed for real-time systems — generating interactive worlds at frame rate is as much an optimization problem as a generation problem.

### Sharon Lee — Co-Founder

| | |
|---|---|
| **Education** | PhD CS, Stanford (in progress); MS CS, Stanford; BS EECS with Honors, UC Berkeley |
| **Advisors** | Ron Fedkiw (legendary physics simulation), Chris Manning (NLP/AI); previously Jiajun Wu and Fei-Fei Li |
| **Awards** | Knight-Hennessy Scholar (2024); Siebel Scholar (2023) |
| **Publications** | NOIR: Neural Signal Operated Intelligent Robots (CoRL 2023, Oral); BEHAVIOR Vision Suite (CVPR 2024, Highlight); Language-Informed Visual Concept Learning (ICLR 2024) |

**What's notable:** Sharon's advisor pairing — Ron Fedkiw AND Chris Manning — is the intellectual DNA of Moonlake. Fedkiw is the person whose physics simulation algorithms power visual effects in dozens of Hollywood films and are foundational to game physics engines. Manning is the Stanford NLP legend whose work underpins modern language understanding. Moonlake's product is literally "NLP → physics simulation" — language descriptions compiled into interactive, physically-grounded worlds. Sharon studied under both of the people who defined these fields.

Her NOIR project (brain-robot interfaces using EEG signals for long-horizon household tasks) reveals a deeper insight: she has worked on the problem of translating high-level human intent into low-level robotic action. Moonlake does the same thing in the digital world — translating high-level creative intent ("make a bowling alley") into low-level physics/code/rendering execution. The abstraction pattern is identical.

The Knight-Hennessy Scholarship (Stanford's most prestigious graduate fellowship — accepted at Harvard and Princeton PhDs but chose Stanford) and Siebel Scholar designation signal that she was recognized as exceptional before Moonlake. From Georgetown, Penang, Malaysia — she founded a nonprofit providing education access to orphans before coming to Stanford.

Her framing: *"Too many great worlds never made it past the sketchpad... it is not for lack of imagination, but lack of the right tools."*

### Yitong Deng — Researcher

| | |
|---|---|
| **Education** | PhD student, Stanford; MS, Dartmouth (with Bo Zhu); BA summa cum laude, Colby College |
| **Publications** | Go-with-the-Flow (CVPR 2025, Oral), Infinite-Resolution Integral Noise Warping (ICLR 2025), Fluid Simulation on Neural Flow Maps (SIGGRAPH Asia 2023, **Best Paper Award**) |

**What's notable:** A SIGGRAPH Asia Best Paper Award is one of the highest honors in computer graphics. Deng authored Moonlake's technical blog post "Why World Models Need Structure, Not Just Scale" — the intellectual manifesto for why pixel-based generation is insufficient. His fluid simulation expertise directly applies to physics-grounded world generation.

**Team size:** ~15 people. All identifiable members are Stanford PhD students or graduates with top-venue publications.

---

## Investor Depth

### AIX Ventures — Co-Lead

**Christopher Manning** — Stanford NLP professor, one of the most influential figures in modern AI — is a General Partner at AIX Ventures. He is also Sharon Lee's PhD advisor. This is a deeply personal bet.

Manning's endorsement: *"A true world model isn't just beautiful GenAI imagery: It's spatial intelligence that lets you interact with objects and predict how they'll respond."* And: *"Moonlake's programmable world models break this scaling law, achieving a 100x gain in production efficiency by moving the heavy lifting into the model's inference layer."*

**What signal it sends:** Manning doesn't just invest in AI companies — he invests in companies where he has deep technical conviction about the approach. His involvement validates that Moonlake's structural approach to world models is scientifically grounded, not marketing.

### NVentures (NVIDIA) — Co-Lead

NVIDIA's venture arm investing directly in Fan-Yun's company after he worked across three NVIDIA Research groups. The strategic alignment is complete: NVIDIA's Omniverse platform is the existing enterprise simulation infrastructure; Moonlake's world generation technology could feed Omniverse with AI-generated environments. NVIDIA also needs demonstration cases for their GPU-intensive AI workloads.

### Threshold Ventures — Co-Lead

Mo Islam (partner, board seat): *"Moonlake is marrying vibe coding and world generation to create the ultimate reinforcement learning environments. This unlocks entirely novel forms of agents in both the digital and physical worlds."*

### Angel Investors

| Angel | Background | Signal |
|-------|-----------|--------|
| **Jeff Dean** | Google Chief Scientist | Highest-signal individual AI endorsement possible |
| **Ian Goodfellow** | GAN inventor | *"Simulations are an important application of generative models that I've advocated for since 2014."* Direct intellectual lineage. |
| **Steve Chen** | YouTube co-founder | *"Similar to YouTube opening up a platform for the world to watch and share videos."* Validates the UGC platform thesis. |
| **Naval Ravikant** | AngelList founder | Consumer platform conviction |
| **Guillermo Rauch** | Vercel founder | Developer tools / platform conviction |

The angel roster tells two stories: (1) the AI research community (Jeff Dean, Ian Goodfellow, DeepMind/OpenAI execs) believes the technical approach is sound, and (2) the platform/consumer community (Steve Chen, Naval, Guillermo Rauch) believes the market opportunity is real. Having both constituencies invested is unusual for a seed-stage company.

---

## Hiring Signals & Strategic Direction

**8 open roles** (all on-site San Mateo):

| Role | What It Reveals |
|------|-----------------|
| MTS – Code Generation | Core to program synthesis layer (Layer 3) |
| MTS – Diffusion Model | Core to Reverie visual rendering (Layer 5) |
| MTS – Efficient ML ($170K–$234K) | Hitting scaling/cost bottlenecks — need to make inference cheaper/faster |
| MTS – Embodied Agents | **Key signal:** confirms RL/robotics training environment thesis is real, not just marketing |
| MTS – ML Infrastructure & Performance | Deploy models 2–10x faster/cheaper |
| MTS – Product Design Engineer | UX/product layer — investing in the consumer experience |
| Core Operations Lead | Scaling operations post-beta |
| Generalist | Open to exceptional talent |

**Strategic reads:**

1. **6 of 8 roles are technical ML/AI.** No sales, no BD, no marketing. This is a research-heavy company building the core technology, not a go-to-market company.

2. **Embodied Agents hire confirms the dual thesis.** Moonlake isn't just a game creation tool — it's an RL training environment generator. This role suggests they're actively building the pipeline for robotics/AI agent customers.

3. **Two efficiency/infrastructure roles** suggest the product works but is too expensive to run. Getting cost down is a priority — consistent with real-time diffusion being compute-intensive.

4. **All on-site in San Mateo.** Small, concentrated team. No remote engineering.

---

## Conference & Media Presence

### Academic Circuit (Strong via Founders)

Fan-Yun Sun: NeurIPS (2019, 2021, 2022, 2024, 2025), CVPR (2024, 2025), ICLR (2020), CoRL, 3DV, AAMAS, AAAI. Reviewer for NeurIPS, ICLR, CVPR, ICCV, ICML, SIGGRAPH.

Sharon Lee: CVPR (2024), ICLR (2024), CoRL (2023 Oral), IROS (2023).

Yitong Deng: CVPR (2025 Oral), ICLR (2025), SIGGRAPH Asia (2023 Best Paper).

### Industry Circuit (Emerging)

- **TechCrunch Disrupt** (Oct 2025) — Sharon Lee on AI gaming/VR panel
- **GamesBeat** interview with Sharon Lee
- **Fast Company** feature ("I vibe-coded a video game for under $25")
- **a16z hackathon** at The Dome (Jan 2026)
- Active on X, Discord

**Dual-circuit analysis:** Exceptionally strong academic credentials through the founders' individual publication records, but no published papers as Moonlake yet — all academic work is under Stanford/NVIDIA affiliations. The industry presence is PR-heavy (three press releases in five months) with emerging credibility through TechCrunch and GamesBeat. The company hasn't yet established its own research identity distinct from its founders' academic work.

---

## Why This is a Non-Consensus Bet

### What the consensus thinks:

1. **Video-based world models will win.** Decart/Oasis, Google Genie 3, and Runway GWM-1 generate photorealistic video sequences that look like games. The "pixel is all you need" argument: as video models improve, they'll learn physics, persistence, and controllability implicitly from data, without needing explicit structural representations.

2. **World Labs already owns this category.** Fei-Fei Li (one of the most important figures in AI history) raised $1B+ at ~$5B valuation for spatial intelligence / world models. She was both founders' professor at Stanford. If the Stanford vision lab faculty member with $1B can't solve this, why would two of her PhD students with $28M?

3. **"Vibe coding" is a gimmick.** CodeRabbit analysis shows AI-generated code has 1.7x more major issues and 2.74x more security vulnerabilities. METR study shows experienced developers are 19% slower with AI coding. If AI-generated code is unreliable for simple applications, AI-generated game logic (physics, scoring, state machines) is even less trustworthy.

4. **The 100x efficiency claim is unverifiable.** Moonlake claims "100x faster game creation" but has published no independent benchmarks. The bowling demo is impressive as a proof-of-concept but says nothing about creating complex, polished, commercially viable games.

5. **$28M can't compete with $1B+ (World Labs) and $3.1B valuations (Decart).** Capital matters in AI — for compute, for talent, for iteration speed. Moonlake is massively outgunned.

### What Moonlake believes differently:

1. **Video models will NEVER solve persistence, controllability, or physics.** A pixel sequence has no objects, no state, no rules. You can't "interact" with a region of correlated pixels. Structural representations (geometry + physics + logic + code) are necessary for worlds that feel authored rather than hallucinated. This is an architectural argument, not an engineering argument — no amount of scaling makes pixel sequences into interactive worlds. Yitong Deng: video models produce *"structure without permanence."*

2. **World Labs and Moonlake solve different problems.** World Labs generates static 3D environments — beautiful, geometrically accurate, production-ready, but not interactive. Moonlake generates playable worlds with physics, game logic, and AI agents. They're complementary, not competitive. World Labs builds museums; Moonlake builds playgrounds.

3. **Program synthesis makes AI-generated worlds reliable.** Moonlake doesn't generate game logic as neural approximations — it generates executable code (state machines, scoring algorithms, physics parameters). Code can be inspected, debugged, and modified by humans. The "vibe coding" critique applies to general-purpose coding, not domain-specific simulation code where FactorSim demonstrated that factored POMDP representations produce reliable outputs.

4. **The demo proves capability, not final product quality.** The bowling game demo — from text prompt to playable game with physics, scoring, audio, and IK in minutes — demonstrates a capability that no other system has shown. Quality will improve with the product; the architectural paradigm is validated.

5. **$28M is enough to prove the thesis.** The core research is done — Holodeck, FactorSim, and 3D-Generalist validated the approach at Stanford/NVIDIA. Moonlake's job is productionization, not fundamental research. World Labs' $1B is needed to train massive 3D foundation models from scratch. Moonlake's modular architecture (reasoning + code gen + diffusion as separate layers) leverages existing frontier models rather than training new ones. The capital efficiency is structural.

---

## Competitive Landscape

| Company | Funding | Approach | Key Difference vs. Moonlake |
|---------|---------|----------|---------------------------|
| **World Labs** (Fei-Fei Li) | $1B+ ($5B val) | Spatial intelligence, 3D generation (Marble) | Static 3D exports — beautiful but not interactive/playable. No game logic, no physics simulation. |
| **Decart (Oasis)** | $100M ($3.1B val) | Real-time video generation | Pixel-based — no persistence, no controllability, no real physics. Pivoted from gaming to filmmaking. |
| **Luma AI** | $900M | Multimodal video generation | Largest compute partnership but primarily video, not interactive worlds. |
| **Google Genie 3** | Internal | General-purpose world model | 720p/24fps real-time, learned physics. But Google internal — not a product developers can use. |
| **Runway (GWM-1)** | Well-funded | Video world models | Established creative AI brand but video-first, not game-native. |
| **Magica (Mirage 2)** | — | AI-native UGC game engine | Natural language world modification. Closest competitor in approach. |

**Moonlake's positioning:** Smallest by funding but most architecturally differentiated. The only company building from structural 3D signals (not pixels) with program synthesis (not neural approximation) for interactive, physics-grounded, playable worlds. The risk: being right about the architecture but too small to capture the market.

---

## Qualitative Assessment

**Conviction Level: MEDIUM-HIGH**

### Bull Case:

1. **The founders' research IS the product.** Fan-Yun's three-paper sequence (Holodeck → FactorSim → 3D-Generalist) systematically solved the components of text-to-interactive-world generation over 3 years at Stanford/NVIDIA. Moonlake isn't pivoting from unrelated expertise — it's the direct commercialization of research that already works. The founding insight (structural 3D signals, not pixels) comes from years of published, peer-reviewed work, not from reading TechCrunch.

2. **The advisor/advisor-investor alignment is extraordinary.** Sharon's PhD advisor Christopher Manning is a GP at the lead investor and provides detailed technical endorsements. Fan-Yun's NVIDIA research relationships became NVentures' investment. Ian Goodfellow, who advocated for generative models in simulations since 2014, is an angel. Jeff Dean invested personally. This isn't investors betting on a market thesis — it's people who deeply understand the technical approach investing because they believe it works.

3. **The structural approach is architecturally correct.** Pixel-based world models (Decart, Genie) will never achieve persistence, controllability, or physics grounding because pixel sequences don't contain objects, states, or rules. Moonlake's five-layer architecture (reasoning → tools → code → simulation → diffusion) separates concerns correctly: physics is handled by physics engines, logic by code, and visuals by diffusion. Each layer does what it's good at. This is a fundamental architectural advantage, not a marginal optimization.

4. **The dual thesis (consumer creation + RL training environments) expands the TAM.** Consumer game creation is the visible product, but the RL/embodied AI training environment use case may be larger. The Embodied Agents hire confirms this thesis is real. If Moonlake can generate diverse, physics-grounded environments on demand for training robots and autonomous agents, the enterprise market is massive — every robotics company, every AV company, every AI lab needs this.

5. **The 10,000+ waitlist with developers from Microsoft, NVIDIA, Sony, Google, EA validates demand.** Pre-revenue, pre-product demand from developers at the world's largest game and tech companies suggests real pull. These are sophisticated users who understand what exists and what Moonlake offers that's different.

### Key Risks:

1. **$28M vs. $1B+ (World Labs) and $3.1B valuations (Decart).** Capital asymmetry is severe. If world models require massive compute for training or inference, Moonlake may not have the resources to keep up. The modular architecture mitigates this (leveraging existing models rather than training from scratch), but inference costs for real-time diffusion are still high.

2. **The product is in beta with no revenue.** 10,000 waitlist users and 100/day beta access is promising but proves nothing about retention, monetization, or scalability. The gap between "impressive demo" and "product developers use daily" is enormous. Many AI demos generate initial excitement that fades when users discover limitations.

3. **"Vibe coding" backlash is real and growing.** If AI-generated code has 1.7x more bugs and 2.74x more security vulnerabilities (CodeRabbit), AI-generated game logic may have similar reliability issues. Games require precise physics, scoring, and state management — a single bug in the scoring algorithm ruins the bowling game. Program synthesis quality at scale is unproven.

4. **No published Moonlake technical papers.** All academic credibility comes from the founders' Stanford/NVIDIA affiliations. As a company, Moonlake has blog posts but no peer-reviewed publications. The 100x efficiency claim and technical architecture claims haven't been independently validated.

5. **The "authored, not random" promise is the hardest to deliver.** Sharon's framing — worlds that feel authored rather than random — sets an extremely high bar. Authored worlds have narrative coherence, intentional pacing, meaningful challenges, and aesthetic consistency. Current AI can generate variety but struggles with intentionality. If Moonlake's worlds feel "AI-generated" rather than "human-designed," the creative community will lose interest.

**Bottom Line:** Moonlake AI is the most technically grounded company in the world models space — built by founders whose PhD research (Holodeck, FactorSim, 3D-Generalist) systematically solved the components of text-to-interactive-world generation, backed by their own advisors (Manning at AIX, NVIDIA via NVentures) who deeply understand the approach, and endorsed by the people who invented the underlying technologies (Goodfellow on generative models, Jeff Dean on AI infrastructure). The structural approach (3D signals, not pixels; code, not neural approximation) is architecturally correct for building persistent, controllable, interactive worlds. The main risks are capital asymmetry ($28M vs. billion-dollar competitors), unproven product-market fit (beta, no revenue), and the "vibe coding" reliability question.

**Verdict: A research-to-product transition with the right founding team, the right technical approach, and the right early endorsements — but facing a capital asymmetry that requires either rapid PMF or a large follow-on round. MEDIUM-HIGH conviction reflects the extraordinary technical credibility with pre-revenue execution risk.**

---

*Research compiled: March 2026*
