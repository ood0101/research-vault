# Ndea

| Field | Detail |
|---|---|
| **Website** | [ndea.com](https://ndea.com) |
| **HQ** | San Francisco, CA (fully remote) |
| **Founded** | 2024 |
| **Structure** | C-Corp (YC W26) |
| **Stage** | Seed |
| **Investors** | Y Combinator, Coatue Management, Factorial Capital, Quiet Capital |
| **Total Raised** | $43M |
| **Valuation** | Not disclosed |

---

## The Big Audacious Idea

The entire AI industry is scaling the wrong thing. LLMs are getting better at doing things they've seen before — but not at learning new things. More data and more compute yield more skill but not more intelligence. Ndea is building AGI through a fundamentally different paradigm: **deep learning-guided program synthesis** — using neural networks for perception and intuition to guide discrete program search for reasoning and logic.

The name comes from Greek: "ennoia" (intuitive understanding) + "dianoia" (logical reasoning). The thesis: true intelligence isn't pattern matching on training data — it's the ability to synthesize novel solutions to problems you've never seen before.

Francois Chollet: *"We believe we have a small but real chance of achieving a breakthrough — creating AI that can learn at least as efficiently as people, and that can keep improving over time with no bottlenecks in sight."*

*"OpenAI single-handedly changed the game... set back progress towards AGI by quite a few years, probably like 5-10 years"* — by convincing the world that scaling is the answer.

Mike Knoop: *"Most AI evals were saturating up to human level performance... instead, what I found [with ARC] was basically the opposite... it was actually decelerating over time."*

---

## The Problem That's So Hard to Solve

**LLMs can't reason.** They interpolate from training data with extraordinary sophistication, but they cannot synthesize genuinely novel solutions to problems outside their training distribution. The ARC-AGI benchmark — designed by Chollet specifically to test this — exposes this limitation brutally: frontier LLMs score near 0% on ARC-AGI-2, while average humans solve it easily.

**Why this is genuinely hard:**

1. **Combinatorial explosion.** Program synthesis means searching through an astronomically large space of possible programs. Even with deep learning guidance, the branching factor for complex problems is enormous. Current approaches require thousands of synthesis attempts per task, and gains diminish over time.

2. **The symbol grounding problem.** Ensuring that symbolic representations in synthesized programs correspond to meaningful concepts — not just statistical patterns — is a foundational unsolved problem in AI.

3. **Transfer learning is superficial.** Critics argue that apparent knowledge transfer typically involves superficial similarities rather than deep structural understanding. Whether DL-guided program synthesis can achieve genuine transfer remains unproven.

4. **Historical pattern of overconfidence.** "Initial progress on simplified versions of problems leads to overconfidence about solving the general case." Program synthesis works on toy problems; scaling to real-world complexity is where every prior attempt stalled.

5. **Program synthesis is where deep learning was in 2012.** Chollet's own framing — which means potentially a decade+ of development needed before the approach yields practical results. This is a long bet.

6. **The approach doesn't yet decisively beat baselines.** Deep learning-guided program synthesis does not currently decisively outperform brute-force DSL-based approaches on ARC. The theoretical case is strong; the empirical case is still forming.

---

## The Technology Stack

### Core Architecture: System 1 + System 2

Ndea's approach mirrors the dual-process theory of human cognition:

**System 1 (Deep Learning)** — Perception, intuition, pattern recognition
- Parses situations into discrete building blocks suitable for program synthesis
- Provides "intuitive program sketches" that reduce the branching space during search
- Maps state spaces — embeds initial and target states, draws manifold lines between them
- Embeds program space itself, making discrete search tractable

**System 2 (Program Synthesis)** — Discrete reasoning, explicit logic, combinatorial search
- Searches over domain-specific languages (DSLs) for programs that transform inputs to outputs
- Each solution is a verifiable, interpretable program — not a black-box neural output
- Solutions can be composed, debugged, and extended

**The key innovation**: Using deep learning to make program search tractable — not as a minor optimization, but as the primary guidance mechanism. Chollet: *"You use type 1 intuition to make type 2 calculation tractable."*

### Intellectual Foundation

**"On the Measure of Intelligence"** (Chollet, 2019, [arXiv:1911.01547](https://arxiv.org/abs/1911.01547))
Redefines intelligence as *"skill-acquisition efficiency over a scope of tasks, with respect to priors, experience, and generalization difficulty."* Argues all existing AI benchmarks measure skill (what you can already do), not intelligence (how quickly you learn new things). This paper is the theoretical foundation for everything Ndea builds.

**"Kaleidoscope Hypothesis"**
The world's apparent complexity is built from a small finite set of "atoms of meaning" that can be abstracted and recombined. True intelligence is the ability to perceive these atoms, extract reusable patterns, and recombine them for novel situations.

**ARC-AGI Benchmark** (Chollet, 2019)
Each task is a visual grid puzzle requiring a unique solution program. No task repeats. You cannot memorize solutions in advance — you must synthesize a new program on the fly. This is the primary benchmark for measuring progress toward the kind of intelligence Ndea is building.

### What They're NOT Building

Job postings explicitly exclude candidates with "LLM-only RLHF" or "world model scaling" experience. This is a deliberate anti-pattern to the dominant AI paradigm. Ndea is not competing with OpenAI/Anthropic/Google on scaling — they're pursuing a fundamentally different approach.

---

## What the World Looks Like If This Works

1. **AI that invents, not just interpolates.** Systems that synthesize genuinely novel solutions to problems outside their training distribution — drug mechanisms, mathematical proofs, engineering designs, scientific hypotheses — not by pattern-matching against prior examples but by reasoning from first principles.

2. **The scaling paradigm hits a ceiling; program synthesis breaks through.** If Chollet is right that scaling yields diminishing returns on intelligence (even if skill keeps improving), the companies that solve reasoning through program synthesis leapfrog the entire LLM scaling race.

3. **"A factory for rapid scientific advancement."** Ndea's stated mission — AGI capable of "inventing and commercializing N ideas." If program synthesis-based AI can genuinely learn new domains efficiently, it becomes the ultimate tool for scientific discovery.

4. **Verifiable, interpretable AI.** Unlike LLM outputs (opaque, uncheckable), synthesized programs can be verified, debugged, and understood. This makes program synthesis-based AI inherently more trustworthy for high-stakes applications.

5. **Intelligence becomes decoupled from compute.** If the key to AGI is architectural innovation (System 1 guiding System 2 search) rather than raw scaling, then AGI doesn't require trillion-dollar GPU clusters — it requires the right algorithms.

---

## Best Case Scenario / Addressable Opportunity

If Ndea's approach works, the addressable market is literally "everything AI." Chollet frames this as addressing the entire AGI market — various estimates put the value at $4-15 trillion+ by the 2030s.

More concretely, program synthesis-based reasoning would be transformative for:
- Drug discovery (novel mechanism identification)
- Materials science (novel material design)
- Mathematics (automated theorem proving)
- Software engineering (genuine program generation, not code completion)
- Scientific research (hypothesis generation and testing)

---

## The Science: A Brief History

- **1945**: Alan Turing envisions machines generating programs autonomously
- **1957**: Alonzo Church proposes synthesizing circuits from mathematical requirements
- **1960s-1980s**: Formal verification era — program synthesis as theorem proving. Extremely brittle.
- **2015**: Chollet releases Keras; joins Google. Begins work that will lead to his intelligence framework.
- **2016**: Chollet publishes Xception (18,000+ citations) — depthwise separable convolutions
- **2019**: Chollet publishes "On the Measure of Intelligence" — redefines intelligence as skill-acquisition efficiency. Creates ARC-AGI benchmark.
- **2020**: First ARC competition — dominated by brute-force DSL search. Deep learning approaches fail.
- **2021**: DreamCoder (Kevin Ellis, MIT) — bootstrapped inductive program synthesis with wake-sleep library learning. Discovered 93% of 60 physical laws after 8 iterations. Academic predecessor to Ndea's approach.
- **2023-2024**: LLMs improve at code generation but fundamentally stall on ARC-AGI. Progress actually *decelerates*.
- **2024**: Chollet and Knoop launch ARC Prize ($1M competition). o3 scores well on ARC-AGI but methodology is questioned. ARC-AGI-2 launched — frontier LLMs score near 0%.
- **January 2025**: Chollet leaves Google after 9 years. Co-founds Ndea with Mike Knoop.
- **2025-2026**: Ndea raises $43M, joins YC W26. ~15 person team. Pure research, no product.

**Why Now**: Chollet explicitly compares program synthesis today to where deep learning was in 2012. Three things converge: (1) deep learning has matured enough to provide reliable perception/intuition layers for guiding search, (2) ARC-AGI finally provides an objective measure of genuine reasoning (the benchmark the field needed), and (3) LLMs have proven their limits — the scaling emperor has no clothes on reasoning, and the industry is ready for a paradigm complement.

---

## Commercial Validation

**None.** Zero customers, zero revenue, zero products, zero demos, zero API. This is a pure research lab with no announced commercialization timeline. The bet is entirely on the team and the thesis.

---

## Core Team

### Francois Chollet — Co-Founder

| Field | Detail |
|---|---|
| **Education** | Diplome d'Ingenieur, ENSTA Paris (2012) |
| **Career** | University of Tokyo (cognitive robotics, 2012) → Google (2015-2024, Senior Staff Engineer — created Keras, Xception, ARC-AGI; co-led Gemini pretraining data) → Ndea |
| **Citations** | 72,237 |
| **Key Works** | Keras (used by YouTube, Waymo, Spotify, ByteDance), Xception (18K citations), "On the Measure of Intelligence" (2019), ARC-AGI benchmark |
| **Books** | "Deep Learning with Python" (100K+ copies, 10+ languages) |
| **Recognition** | TIME 100 Most Influential People in AI (2024), Global Swiss AI Award (2021) |

**What's notable**: Chollet is one of the most influential AI researchers alive — Keras is used by millions of developers, Xception is among the most-cited computer vision papers, and "On the Measure of Intelligence" is the foundational text for a new paradigm of AI evaluation. His 9 years at Google gave him a front-row seat to the scaling paradigm's strengths AND limitations. His core intellectual contribution is the distinction between skill (what you can do) and intelligence (how efficiently you learn new things) — and his conviction that LLMs optimize the former while ignoring the latter. He's not a contrarian for the sake of it; he built the tools the industry runs on and concluded from inside that the dominant paradigm has a ceiling.

### Mike Knoop — Co-Founder & CEO

| Field | Detail |
|---|---|
| **Education** | BS Mechanical Engineering, University of Missouri (commencement speaker 2024) |
| **Career** | Graduate research (FEM optimization) → Co-founded Zapier (2011, one of the most capital-efficient SaaS companies ever) → Head of AI at Zapier → ARC Prize co-founder → Ndea CEO |
| **Angel Portfolio** | Cognition (Devin AI), Cartesia, Inception Labs, Limitless, Braintrust, others |

**What's notable**: Knoop built Zapier into one of the most capital-efficient SaaS companies in history — a remote-first automation platform that defined a category. His mechanical engineering background in optimization gives him mathematical intuition about search problems. He was "nerd-sniped" by ARC when he realized it was the one benchmark where AI was going backwards — and his intellectual honesty about what LLMs can't do, despite running an AI automation company, is the conviction signal. He stepped back from Zapier's day-to-day (remaining on the board) to go all-in on this — a bet-your-career move.

---

## Investor Depth

**Y Combinator (W26)** — YC Partner: Tyler Bosmeny. Notable that YC accepted a pure-research AGI lab with no product into their batch — signals YC's willingness to bet on foundational bets, not just product companies.

**Coatue Management** — Growth-stage fund backing a seed-stage research lab. Previously led Sunday Robotics Series B at $1.15B. Their presence at $43M seed signals conviction that program synthesis is a category worth entering early.

**Factorial Capital** — Also backed GenBio AI. Thesis: back founders with deep technical expertise building category-defining companies.

**Quiet Capital** — Stealth-oriented fund. Limited public information.

---

## Hiring Signals & Strategic Direction

**2 open roles** (both globally remote):

1. **Technical Staff — Search Guidance** ($175K-$250K + 0.10-0.20% equity) — Training models to make structured search more efficient. Requires: RL, planning, or search experience. Explicitly excludes "LLM-only RLHF" or "world model scaling."

2. **Technical Staff — Symbolic Reasoning** — Logic, formal methods, symbolic AI systems.

**What this reveals**: Two parallel pillars being built — (1) the deep learning guidance layer and (2) the symbolic reasoning/search engine. The explicit exclusion of LLM-scaling candidates is a deliberate ideological filter. $10K referral bonuses suggest urgency. ~15 person team, globally remote.

---

## Conference & Media Presence

**Podcast circuit (extensive — Chollet is a sought-after voice):**
- Dwarkesh Podcast (June 2024) — Chollet & Knoop on ARC Prize
- Sean Carroll's Mindscape #280 (June 2024) — Chollet on intelligence
- MLST / Machine Learning Street Talk (multiple episodes)
- Sequoia "Training Data" — Knoop on ARC Prize and AGI
- MAD Podcast with Matt Turck (April 2025) — both founders
- Gradient Dissent / W&B (September 2025) — Knoop as Ndea CEO
- Cognitive Revolution (January 2026)
- Google "People of AI" — Chollet on Keras 3

**Press**: TechCrunch (founding), VentureBeat (feature), SiliconANGLE, The Decoder, Maginative

**Academic**: ARC-AGI benchmark attracts hundreds of research teams globally. "On the Measure of Intelligence" widely cited in AGI benchmarking literature.

---

## Why This is a Non-Consensus Bet

**What the consensus thinks:**

1. Scaling works — GPT-4, Claude, Gemini keep getting better with more data and compute. The scaling paradigm hasn't hit a wall yet.
2. Program synthesis is a niche academic curiosity — it works on toy problems but can't handle real-world complexity
3. ARC-AGI is one benchmark, not proof that LLMs can't reason — and o3 scored well on ARC-AGI (though not on ARC-AGI-2)
4. A 15-person pure-research lab with $43M can't compete with OpenAI ($10B+), Anthropic ($10B+), or Google (unlimited)
5. Even Chollet admits this is "where deep learning was in 2012" — which means a decade+ before practical results

**What Ndea believes differently:**

1. LLMs are confusing skill and intelligence. More scaling yields more skill (better at things in training distribution) but not more intelligence (ability to learn genuinely new things). ARC-AGI-2 proves this — frontier models score near 0%.
2. Program synthesis is the correct paradigm because it produces verifiable, interpretable, composable solutions — unlike LLM outputs. The field just needed deep learning to mature enough to guide the search.
3. You don't need trillion-dollar compute to solve intelligence — you need the right algorithm. If intelligence is about efficient learning (Chollet's definition), then the solution is architectural, not scale-based.
4. $43M is enough for a 15-person research team to prove the concept. If DL-guided program synthesis shows clear capability gains on ARC-AGI-2, funding will follow. The paradigm shift doesn't require GPT-4-scale training runs.
5. The decade-long timeline is a feature, not a bug. Chollet and Knoop are building for the long term, not the next demo. The companies that solved problems "everyone knew were 10 years away" (SpaceX, Tesla) are the ones that mattered most.

---

## Competitive Landscape

| Entity | Approach | Funding | Relationship to Ndea |
|---|---|---|---|
| **OpenAI** | Scaling LLMs + RLHF | $10B+ | Fundamental paradigm disagreement |
| **Anthropic** | Constitutional AI + scaling | $10B+ | Same paradigm Chollet critiques |
| **Google DeepMind** | Hybrid (AlphaFold + LLMs) | Internal (billions) | Chollet's former employer; hybrid but scaling-dominant |
| **DreamCoder** (MIT/Kevin Ellis) | Wake-sleep library learning for program synthesis | Academic | Academic predecessor; Ndea aims to industrialize this |
| **Numenta** | Neuroscience-inspired AI | Venture-backed | Different framework but similar "alternatives to scaling" thesis |
| **AMI Labs** (Yann LeCun) | JEPA / world models | $1B+ | Different non-scaling approach; LeCun and Chollet agree LLMs aren't enough but disagree on the solution |

**Ndea's unique position**: The only well-funded lab explicitly pursuing DL-guided program synthesis as the primary path to AGI. Others treat program synthesis as a minor component; Ndea treats it as the main event.

---

## Qualitative Assessment

**Conviction Level: MEDIUM-HIGH**

**Bull case:**

1. **Chollet's intellectual framework is the most rigorous critique of the scaling paradigm.** "On the Measure of Intelligence" isn't blog-post contrarianism — it's a 62-page formal framework with mathematical definitions. ARC-AGI is the benchmark that operationalizes it. If he's right that intelligence ≠ skill, the entire $100B+ scaling race is optimizing the wrong metric.

2. **The ARC-AGI results vindicate the thesis.** Frontier LLMs score near 0% on ARC-AGI-2. Average humans solve it easily. This is the clearest empirical evidence that scaling doesn't produce reasoning — and it's Chollet's benchmark, designed specifically to test this.

3. **Chollet has earned the right to be contrarian.** Creator of Keras (used by millions), Xception (18K citations), TIME 100 AI. He spent 9 years inside Google watching the scaling paradigm from the inside and concluded it has a ceiling. This isn't an outsider critique — it's an insider's diagnosis.

4. **Mike Knoop brings operational credibility.** Building Zapier (one of the most capital-efficient SaaS companies ever) proves he can execute. His willingness to leave day-to-day operations at a successful company for a pure-research AGI bet signals extraordinary conviction.

5. **Program synthesis produces verifiable, interpretable solutions.** Unlike LLM outputs, synthesized programs can be checked, debugged, and composed. If the approach works, it solves both the capability AND the alignment problem simultaneously.

**Key risks:**

1. **No product, no customers, no revenue, no demo.** $43M for pure research with no commercialization timeline. If the research doesn't produce clear capability gains within 2-3 years, funding becomes difficult.

2. **Program synthesis hasn't beaten baselines on ARC yet.** DL-guided approaches don't currently decisively outperform brute-force DSL search. The theoretical case is compelling; the empirical case is still forming.

3. **"Where deep learning was in 2012" = decade+ timeline.** Chollet's own framing suggests this is a very long bet. Investors expecting near-term returns will be disappointed.

4. **Combinatorial explosion is a fundamental obstacle.** Even with DL guidance, program search spaces are astronomically large for complex problems. Gains diminish over time.

5. **Conflict of interest on ARC.** Chollet and Knoop both define the benchmark (ARC Prize Foundation) and build technology to solve it (Ndea). The nonprofit structure is meant to maintain independence, but the optics are challenging.

**Bottom line**: Ndea is the most intellectually rigorous bet against the scaling paradigm — founded by the person who created the benchmark that exposes LLMs' reasoning limitations and the framework for measuring true intelligence. Chollet's 72K citations, Keras adoption by millions, and 9 years inside Google give him unmatched credibility to critique the dominant approach. The risk is that program synthesis may be "correct but too early" — like investing in neural networks in 2005. If the approach works, Ndea redefines what AI can do. If it doesn't produce clear results within 3-5 years, it becomes an expensive research project that validated a thesis the industry wasn't ready for.

**Verdict: The most intellectually honest AGI bet in the market — Chollet proved LLMs can't reason (ARC-AGI-2: near 0%), proposed a formal definition of intelligence, and is now building the alternative. The Keras creator + Zapier co-founder combination is unusually strong for a pure-research lab. But $43M, 15 people, and "where deep learning was in 2012" means this is a 5-10 year bet with no near-term commercial path. For patient capital betting on paradigm shifts, this is the clearest play. For anyone needing returns within 3 years, look elsewhere.**

*Research compiled: April 2026*
