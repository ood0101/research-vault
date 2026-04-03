# General Intuition

| Field | Detail |
|---|---|
| **Website** | [generalintuition.com](https://generalintuition.com) |
| **HQ** | New York City (+ Geneva) |
| **Founded** | 2025 (spun out of Medal.tv) |
| **Structure** | Public Benefit Corporation (PBC) |
| **Stage** | Seed |
| **Lead Investors** | Khosla Ventures, General Catalyst |
| **Total Raised** | $133.7M |
| **Valuation** | $3.5B post-money |

---

## The Big Audacious Idea

Large language models can describe the world, but they don't understand it. When you reduce the world to text, you lose the intuition of how things move, interact, and evolve. General Intuition is building foundation models for spatial-temporal reasoning — AI that develops physical intuition by watching billions of gameplay clips where humans demonstrate the highest-bandwidth expression of intelligence: real-time decision-making in complex 3D environments.

The secret weapon: **Medal.tv**, a gaming clip platform with 15M+ monthly active users generating 2.5B action-labeled gameplay clips per year. This isn't generic video data — it's action-conditioned (every frame paired with controller inputs), self-selected for extreme moments (users upload their best/worst plays), and spans thousands of game environments. It's the largest proprietary dataset of human spatial reasoning in existence.

Pim de Witte (CEO): *"Large language models can describe the world, but they don't understand it. When you reduce the world to text, you lose the intuition of how things move, interact, and evolve."*

*"Games are where humans go to express their intelligence at the highest level. They're the perfect merge of all modalities: text, geometry, perception, and action."*

---

## The Problem That's So Hard to Solve

**AI can talk but can't act.** LLMs process text brilliantly but have no model of physical reality — no understanding of gravity, occlusion, momentum, or spatial relationships. The gap between "describe how to catch a ball" and actually catching one is the chasm General Intuition is trying to cross.

**Why this is genuinely hard:**

1. **Sim-to-real transfer is the fundamental unproven assumption.** Whether skills learned in game environments actually transfer to physical reality is an open question. Game physics approximates real physics but doesn't replicate it. The gap between Counter-Strike and a real rescue drone is enormous.

2. **"Do models really reason or just pattern match?"** Ben Goertzel and others argue these systems mimic rather than reason — "fancy autocomplete for spatial prediction." If world models are just very good interpolation, they'll fail catastrophically on out-of-distribution scenarios.

3. **Architectural uncertainty.** Multiple competing approaches: generative pixel prediction (DIAMOND/GI), latent JEPA (Yann LeCun/AMI Labs), 3D spatial intelligence (World Labs). No clear winner. GI is betting on diffusion-based action-conditioned prediction, but the latent approach may prove more robust.

4. **World models are hard to evaluate.** Unlike image generation (you can look at the output), latent world models predict in compressed spaces that can't be visually inspected. Iteration speed suffers because you can't easily tell if the model is improving.

5. **Privacy and consent.** 2.5B gameplay clips capture first-person views, controller inputs, and personal gaming habits. Opt-out exists but consent questions remain. This data was collected for a social gaming platform, not AI training.

6. **The IBM Watson parallel.** *"Brilliant in demos, disappointing in real use."* World models may face the same gap between impressive research results (beating humans on Atari) and practical deployment (replacing NPCs in AAA games or flying rescue drones).

---

## The Technology Stack

### Core Research Papers (All by GI Co-Founders)

**IRIS** (ICLR 2023, Notable Top 5%) — Micheli & Alonso
The breakthrough that started it all. Reframed world modeling as language modeling: GPT-style autoregressive transformer over discrete visual tokens. First learning-in-imagination approach to beat humans on Atari 100k benchmark with only 2 hours of gameplay data. Brought LLM scaling properties to world models.

**Delta-IRIS** (ICML 2024) — Micheli & Alonso
Efficient world models with context-aware tokenization. Reduced computational overhead while maintaining performance.

**DIAMOND** (NeurIPS 2024, Spotlight) — Alonso & Jelley
Diffusion-based world modeling. New state-of-the-art: 1.46 human normalized score on Atari 100k. Demonstrated a **playable Counter-Strike neural game engine** trained from 87 hours of footage on a single GPU. Showed diffusion models preserve visual details critical for RL decisions that discrete tokenization loses.

**GAIA-1/2** (2023-2025) — Anthony Hu (at Wayve, now GI)
First generative world model for autonomous driving. Extended to multi-camera surround-view generation. Confirmed that LLM scaling laws hold for visual world models.

### Architecture: "Frames In, Actions Out"

- Pure visual input → controller output
- No symbolic reasoning, no behavior trees, no NavMesh
- **Action-conditioned prediction**: P(s(t+1) | s(t), a(t)) — predicts what happens next given current state AND the action taken
- This is fundamentally different from video generation (Sora, etc.) which predicts P(x(t+1) | x(t)) with no action conditioning

### The Medal.tv Data Moat

| Metric | Value |
|---|---|
| Monthly active users | 15M+ |
| Clips per year | 2.5B+ |
| Data type | Gameplay video + controller overlay + semantic actions + gameplay events |
| Selection bias | Users upload peak moments (extreme success/failure) — exactly the edge cases most useful for training |
| Coverage | Thousands of game environments across genres |

The data isn't raw keypresses but meaningful contextual descriptions: "Player moved forward," "Goal was scored." This semantic labeling at scale is what makes Medal's dataset categorically different from scraping YouTube gameplay footage.

### Three-Stage Roadmap

1. **Arcade-style games** — Simple, deterministic environments (current capability proven)
2. **Realistic game engines** — Complex physics, occlusion, multiplayer dynamics
3. **Real-world video and robotics** — Transfer from virtual to physical environments

### Open Source / GitHub

- **DIAMOND**: [github.com/eloialonso/diamond](https://github.com/eloialonso/diamond) — the NeurIPS 2024 Spotlight paper code
- **IRIS**: [github.com/eloialonso/iris](https://github.com/eloialonso/iris)
- **Albert**: Differentiable physics engine in PyTorch (Pim de Witte)
- **PDE Engine**: Physics engine project

---

## What the World Looks Like If This Works

1. **NPCs become genuinely intelligent.** Instead of scripted behavior trees that break with complex abilities (Alonso proved this at Ubisoft), game characters learn from billions of examples of human play. They adapt, improvise, and surprise — "variance, unexpectedness, and that's what drives retention."

2. **World models become the foundation for robotics.** If spatial-temporal reasoning transfers from game environments to physical reality, robots trained in simulation (on Medal's data) could navigate complex real-world environments — rescue drones, warehouse logistics, surgical assistants.

3. **A new modality of AI intelligence emerges.** Text (LLMs) captures linguistic reasoning. Vision models capture static perception. World models capture *dynamics* — how things move, interact, and evolve over time. This is the missing piece for embodied AI.

4. **The $200B gaming industry gets AI-native.** Every NPC, physics system, and level generator could be powered by world models trained on Medal's data. GI sells capabilities/agents, not models — avoiding copyright issues while capturing value.

5. **General Intuition becomes the "OpenAI of physical reasoning."** Pim de Witte turned down a reported $500M acquisition offer from OpenAI. The bet is that spatial-temporal reasoning is distinct enough from language to justify a standalone frontier lab.

---

## Best Case Scenario / Addressable Opportunity

| Market | Size |
|---|---|
| Global gaming market | $200B+ |
| Autonomous systems (drones, robotics, vehicles) | $100B+ by 2030 |
| AI infrastructure for spatial reasoning | New category |

The $3.5B seed valuation prices in the broader thesis — not just gaming NPCs but the foundation for embodied AI. If world models power "80% of atoms-to-atoms interactions" by 2030 (per Not Boring), the TAM is measured in trillions.

---

## The Science: A Brief History

- **2018**: Ha & Schmidhuber's "World Models" paper — VAE encoder + RNN dynamics + small controller. Agents can learn entirely "in dreams." Proof of concept.
- **2020**: DreamerV1/V2 (Hafner) — Recurrent State-Space Models. DreamerV2 first to achieve human-level across 55-game Atari on a single GPU.
- **2022**: **IRIS (Micheli & Alonso)** — the inflection point. Reframed world modeling as language modeling. GPT-style transformer over visual tokens beats humans on Atari with 2 hours of data. Brought LLM scaling properties to world models.
- **2023**: GAIA-1 (Anthony Hu, Wayve) — first generative world model for autonomous driving. Confirmed scaling laws hold for visual domains.
- **2024**: **DIAMOND (Alonso & Jelley)** — diffusion-based world modeling. New SOTA on Atari 100k. Playable Counter-Strike neural game engine from 87 hours on single GPU.
- **2024**: Pim de Witte realizes Medal's 2.5B action-labeled clips are the ideal training data for world models. Creates Highlight (AI desktop assistant), which evolves into General Intuition.
- **2025**: GI spins out with $133.7M seed at $3.5B. Recruits the IRIS/DIAMOND research team + Anthony Hu from Wayve + Moritz Baier-Lentz from Lightspeed.

**Why Now**: IRIS and DIAMOND proved world models work (2022-2024). Medal's data asset existed but wasn't recognized as valuable for AI until the world models paradigm crystallized. Anthony Hu's GAIA work confirmed scaling laws apply. And LLMs hitting diminishing returns pushed investors to seek the next frontier beyond text.

---

## Commercial Validation

| Signal | Detail |
|---|---|
| **OpenAI interest** | Reported $500M acquisition offer for Medal's data (The Information) — rejected |
| **Seed valuation** | $3.5B — Khosla's largest single seed since OpenAI |
| **Medal.tv revenue** | ~$18.2M (per GetLatka) |
| **Medal.tv users** | 15M+ MAU |
| **Products** | Targeting H1 2026 for first products |

**No public customers yet.** Pre-product stage. Initial use cases: AI-powered NPCs/game bots, APIs for game engines, autonomous search-and-rescue drones.

---

## Core Team

### Pim de Witte — CEO & Co-Founder

| Field | Detail |
|---|---|
| **Education** | Self-taught (no university degree) |
| **Career** | Age 14: Founded Soulsplit (largest legal RuneScape private server, 3M accounts, $1M+/yr) → MSF/Doctors Without Borders (Ebola treatment software, Mapswipe) → Medal.tv (15M+ MAU, $333M valuation) → General Intuition |
| **Recognition** | Sprout "25 Under 25" entrepreneurs Netherlands (2015); GLOMO award |

**What's notable**: Pim is a self-taught Dutch founder who built a million-dollar gaming business at 14, then pivoted to humanitarian tech (open-source medical records for Ebola treatment centers with Doctors Without Borders), then built Medal.tv to 15M+ users. The "earned secret" is accidental: he built the world's largest action-labeled gameplay clip database as a social gaming product, then realized the data was more valuable for AI than the social platform. He turned down a reported $500M acquisition from OpenAI because he believes spatial reasoning is big enough for a standalone frontier lab. ~60-80% of his original Soulsplit team followed him to Medal and then GI — extraordinary loyalty.

*"Selling now would mean giving up the future. We want to build something that can stand next to OpenAI — not be absorbed into it."*

### Vincent Micheli — Co-Founder, Researcher

| Field | Detail |
|---|---|
| **Education** | PhD Machine Learning, University of Geneva (advisor: Francois Fleuret) |
| **Citations** | 780 |
| **Key Paper** | IRIS (ICLR 2023, Notable Top 5%) — reframed world modeling as language modeling |

**What's notable**: Co-invented the IRIS framework that made world models scalable by applying LLM architecture patterns. His insight that GPT-style autoregressive prediction over visual tokens could beat humans on Atari — with the same amount of gameplay data humans use — is the foundational breakthrough behind GI's approach.

### Eloi Alonso — Co-Founder, Researcher

| Field | Detail |
|---|---|
| **Education** | PhD Reinforcement Learning & World Models, University of Geneva (advisor: Francois Fleuret) |
| **Prior** | Ubisoft La Forge — deep RL for NPC navigation in AAA games |
| **Key Papers** | IRIS (ICLR 2023), DIAMOND (NeurIPS 2024 Spotlight) |

**What's notable**: Alonso saw firsthand at Ubisoft why scripted NPC navigation fails — his IJCAI 2021 paper showed RL could handle complex 3D abilities (grappling hooks, jetpacks, teleportation) that NavMesh systems couldn't. Then he co-invented IRIS and led DIAMOND, achieving a playable Counter-Strike neural game engine from 87 hours of footage on a single GPU. He brings the rare combination of AAA game industry experience + cutting-edge world model research.

### Adam Jelley — Co-Founder, Researcher

| Field | Detail |
|---|---|
| **Education** | MSci Theoretical Physics, Cambridge; PhD Efficient RL, University of Edinburgh (advisors: Amos Storkey + Sam Devlin/Microsoft Research). Microsoft Research Scholarship. |
| **Prior** | Dataiku (Lead Data Scientist), Microsoft Research Cambridge (intern) |
| **Key Paper** | DIAMOND (NeurIPS 2024 Spotlight) |

**What's notable**: His PhD thesis was literally "Generating Environments and Pre-Training Agents for Efficient Reinforcement Learning" — the exact technical problem GI is solving at scale. Cambridge physics → Edinburgh RL → Microsoft Research → GI is a clean trajectory.

### Anthony Hu — Head of World Modeling

| Field | Detail |
|---|---|
| **Education** | Classes Preparatoires (Math/Physics); Diplome d'Ingenieur, Telecom Paris; MSc Statistical Science, Oxford; PhD Computer Vision, Cambridge |
| **Prior** | Wayve (2019-2025) — led GAIA-1 and GAIA-2 generative world models for autonomous driving |
| **Citations** | 1,495 |

**What's notable**: Built the GAIA series at Wayve — the first generative world models for autonomous driving, confirming that LLM scaling laws hold for visual world models. His transition from autonomous driving to gaming world models brings the real-world transfer learning perspective that the academic team lacks. If anyone can bridge the sim-to-real gap, it's someone who's already done it for self-driving cars.

### Moritz Baier-Lentz — Co-Founder (Business)

| Field | Detail |
|---|---|
| **Education** | MBA + MA, Stanford (Arjay Miller Scholar) |
| **Prior** | VP Goldman Sachs (founded gaming practice, advised on $300B+ transactions) → Partner BITKRAFT ($850M AUM) → Partner Lightspeed (Head of Gaming) |
| **Recognition** | Forbes 30 Under 30 (2016), WEF Young Global Leader (2023) |

**What's notable**: The adult in the room. Goldman Sachs → BITKRAFT → Lightspeed gaming practice. Early investments include OpenAI, SpaceX, Palantir. Hosts the annual CEO Forum at GDC with Goldman, McKinsey, Microsoft, Sony. Brings institutional credibility and deal-making capability to a research-heavy team. Former competitive Diablo II player who financed his education partly through virtual goods sales.

### Other Key Team

- **Kent Rollins** (CPO) — MS Business Analytics, William & Mary. Riot Games (League of Legends) → Epic Games (Director, Fortnite Ecosystem). Deep product expertise at gaming's biggest franchises.
- **Florian Laurent** (Founding ML Engineer) — MSc EPFL. CERN (ATLAS experiment) → NyxAI (Stable Diffusion fine-tuning) → Trained Cedille (6B French LLM, open-source).
- **Paula Wehmeyer** — Former Partner at General Catalyst. Now building at GI in NYC.
- **Matt Byington** — Former General Catalyst investment team.

---

## Investor Depth

### Capital Stack

| Round | Amount | Date | Lead | Valuation |
|---|---|---|---|---|
| Seed | $133.7M | Oct 2025 | Khosla Ventures, General Catalyst | $3.5B post-money |

**Other investors (14 total):** Raine, Backed VC, Chapter One, Collaborative Fund, Coolwater Capital, Dune Ventures, and others.

**Khosla Ventures** — This is Khosla's largest single seed investment since OpenAI. Vinod Khosla's thesis on "unreasonable" founders aligns with Pim's trajectory (RuneScape at 14 → Ebola software → Medal → GI). The scale of the check signals conviction that world models are the next frontier after LLMs.

**General Catalyst** — Notable that two former GC team members (Paula Wehmeyer, Matt Byington) left the firm to join GI full-time. When investors leave to join the company, it's the strongest possible conviction signal.

**Context**: Medal.tv (parent company) has raised ~$85-100M across 8 rounds, valued at $333M as of July 2024. GI's $3.5B valuation on a seed round — 10x the parent company's valuation — prices in the world models thesis, not the gaming clip platform.

---

## Hiring Signals & Strategic Direction

**Key open role**: World Model / Action Policy Researcher — NYC/Geneva/Paris/London — **$350K-$450K + equity**. This is the core technical priority. The comp level signals they're competing for top-tier ML talent against DeepMind, Wayve, and AMI Labs.

Also hiring: Data Security Engineer ($150K-$280K), plus Medal roles (Financial Controller, Product Designer, engineers). All on-site, NYC-based.

---

## Conference & Media Presence

**Academic circuit (strong):**
- NeurIPS 2024: DIAMOND (Spotlight)
- ICML 2024: Delta-IRIS
- ICLR 2023: IRIS (Notable Top 5%)
- IJCAI 2021: Deep RL for NPC navigation (Alonso, Ubisoft)

**Industry/media circuit:**
- **Not Boring**: 19,000-word essay by Packy McCormick — massive signal of elite tech audience reach
- **Latent Space / AI Engineer Podcast**: Featured episode
- **Slush 2025**: Pim on panel with John Hanke (Niantic) and Moritz Baier-Lentz
- **Deconstructor of Fun, Naavik, RoboPapers** podcasts
- TechCrunch, SiliconANGLE, Yahoo Tech, Silicon Canals coverage

---

## Why This is a Non-Consensus Bet

**What the consensus thinks:**

1. World models are the new hype cycle — impressive demos (playable CS:GO) but years from practical deployment, like IBM Watson
2. Sim-to-real transfer is unsolved — game physics ≠ real physics, and the gap may be unbridgeable for anything beyond gaming
3. LLMs will eventually develop spatial reasoning through multimodal training — you don't need a separate paradigm
4. Multiple competing architectures (generative pixels vs latent JEPA vs diffusion) with no clear winner — GI could bet on the wrong one
5. $3.5B on a seed with no products is irrational — this is 2021-vintage hype pricing

**What General Intuition believes differently:**

1. Medal's 2.5B action-labeled clips per year is the data moat nobody else has — it's self-selected for extreme moments (the exact edge cases that matter), paired with controller inputs (action-conditioned, not passive video), and spans thousands of environments. YouTube gameplay footage is qualitatively different.
2. The IRIS/DIAMOND research trajectory (their own co-founders' work) proves world models scale like LLMs — and they have 3 years of published evidence that this approach works
3. Selling agents/capabilities instead of world models avoids the copyright and commoditization trap that plagued Stability AI. You can't pirate an NPC.
4. Games ARE the real world for spatial reasoning training — they're where humans express the highest-bandwidth intelligence in real-time. The transfer to robotics follows from this, not the other way around.
5. Anthony Hu's GAIA work already proved sim-to-real transfer for autonomous driving at Wayve. Bringing that expertise to gaming-trained models is the bridge.

---

## Competitive Landscape

| Company | Funding | Valuation | Approach | Key Differentiator |
|---|---|---|---|---|
| **General Intuition** | $133.7M | $3.5B | Action-conditioned agents from gameplay data | 2.5B proprietary action-labeled clips; sells agents not models |
| **AMI Labs** (Yann LeCun) | $1.03B | $3.5B | Latent JEPA (non-generative) | Predicts meaning, not pixels; LeCun's thesis |
| **World Labs** (Fei-Fei Li) | $1B | $5.4B | 3D spatial intelligence | Selling world models (Marble); 3D-native |
| **Wayve** | $1.2B | $8.6B | Autonomous driving world models | GAIA series; real-world driving data |
| **Physical Intelligence** | $600M | $5.6B | Robot foundation models | Physical manipulation |
| **Decart** | $100M | $3.1B | Interactive world simulation | Real-time game simulation |
| **Google DeepMind** | N/A | N/A | Genie, SIMA 2, Veo 3 | Scale + integration |

**GI's unique position**: The only team with both the research (IRIS, DIAMOND — their co-founders' papers) AND the proprietary data (Medal's 2.5B clips). AMI Labs has LeCun but no proprietary data. World Labs has Fei-Fei Li but sells models, not agents. Wayve has real-world driving data but not gaming's diversity of environments. GI's bet is that action-labeled gameplay data is the richest source of spatial reasoning training data in existence.

---

## Qualitative Assessment

**Conviction Level: HIGH**

**Bull case:**

1. **The data moat is real and unique.** 2.5B action-labeled gameplay clips per year, self-selected for extreme moments, across thousands of game environments. No one else has this. OpenAI reportedly offered $500M for it. The data was collected "accidentally" through Medal's social gaming platform — it can't be replicated by scraping.

2. **The research team invented the field.** IRIS (ICLR 2023) and DIAMOND (NeurIPS 2024 Spotlight) are the foundational papers in world modeling. The co-founders aren't applying someone else's research — they created it. Plus Anthony Hu bringing autonomous driving world model expertise from Wayve.

3. **The founder's trajectory is extraordinary.** Pim de Witte: million-dollar gaming business at 14 → Ebola treatment software for MSF → Medal.tv (15M+ MAU) → turns down $500M from OpenAI → raises $133.7M seed at $3.5B. ~60-80% of his original team has followed him across three companies over 15 years.

4. **"Agents not models" is the right business model.** Selling capabilities instead of weights avoids Stability AI's trap (give away the model, struggle to monetize). Game developers don't want to train world models — they want NPCs that work.

5. **The gaming → robotics pathway is credible.** Games offer the highest diversity of environments, physics scenarios, and human decision-making data. If spatial reasoning transfers (GAIA proved it can for driving), gaming-trained models could power drones, robots, and autonomous systems.

**Key risks:**

1. **Sim-to-real transfer is the existential question.** Game physics ≈ real physics, but the gap may matter enormously for robotics/drones. If world models trained on games can't transfer to physical reality, GI is a gaming AI company, not a "foundation for embodied intelligence."

2. **$3.5B seed valuation with no products.** Targeting H1 2026 for first products. The valuation prices in the full thesis (gaming + robotics + autonomous systems), not current reality.

3. **Architectural uncertainty.** Generative pixel prediction (GI's approach) vs latent JEPA (LeCun/AMI Labs) vs 3D spatial intelligence (World Labs). If the latent approach wins, GI's diffusion-based models may be at a disadvantage.

4. **Privacy/consent on Medal data.** 2.5B clips were collected for a social gaming platform, not AI training. Even with opt-out, the consent framework is questionable for a $3.5B AI training dataset.

5. **Well-funded competitors.** AMI Labs ($1.03B), World Labs ($1B), Wayve ($1.2B), Physical Intelligence ($600M). GI has $133.7M. The resource gap is significant, though the data moat partially compensates.

**Bottom line**: General Intuition is the rare convergence of the right data (2.5B action-labeled gameplay clips that can't be replicated), the right research team (the literal inventors of IRIS and DIAMOND), and the right founder (Pim de Witte, who built the data asset "accidentally" and had the vision to recognize its value for world models). The $3.5B seed valuation is aggressive but reflects the thesis that spatial-temporal reasoning is the next frontier after language — and GI has the best data + research combination to pursue it.

**Verdict: The most compelling data moat in the world models space — 2.5B action-labeled clips collected through a social gaming product, paired with the research team that invented the foundational papers. If sim-to-real transfer works (the big if), this is a generational company. If world models stay confined to gaming, it's still valuable but doesn't justify the $3.5B. The OpenAI acquisition interest ($500M) validates the data asset even if the broader thesis takes years to prove. Watch for H1 2026 product launch and first gaming studio partnerships.**

*Research compiled: March 2026*
