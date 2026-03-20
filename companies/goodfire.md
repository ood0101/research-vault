# Goodfire

**Website:** [goodfire.ai](https://www.goodfire.ai)
**HQ:** San Francisco
**Founded:** June 2024
**Structure:** Public Benefit Corporation
**Stage:** Series B ($150M, February 2026) | Valuation: $1.25B
**Lead Investors:** Lightspeed (Seed), Menlo Ventures (A), B Capital (B)
**Other Investors:** Anthropic, Salesforce Ventures, DFJ Growth, Juniper Ventures, Eric Schmidt, Wing, South Park Commons, Work-Bench
**Total Raised:** $207M+

---

## The Big Audacious Idea

**Make AI models transparent, editable, and scientifically useful from the inside out.**

Every major AI lab treats neural networks as black boxes. You train them, prompt them, fine-tune them, and hope for the best. Nobody truly understands what's happening inside the billions of parameters. This is the central bottleneck of the entire AI industry: we're building the most powerful technology in human history without understanding how it works.

Goodfire's thesis: the intelligence inside neural networks can be reverse-engineered, understood, and surgically designed. Interpretability is not just a safety concern — it's a performance advantage and a new scientific method. If you can open up a model and see how it thinks, you can build better models, extract knowledge that humans haven't discovered yet, and create AI systems that are genuinely trustworthy.

Their CEO Eric Ho frames it: interpretability is "the toolset for a new domain of science: a way to form hypotheses, run experiments, and ultimately design intelligence rather than stumbling into it."

---

## The Problem That's So Hard to Solve

### Why AI is still a black box

Modern AI models contain billions of parameters that interact in complex, non-linear ways. A single neuron doesn't represent a single concept — meaning is distributed across thousands of neurons in patterns (called "superposition") that are extraordinarily difficult to decompose. Traditional interpretability methods (attention visualization, saliency maps, LIME/SHAP) provide shallow explanations that don't capture how models actually compute.

### Why this matters beyond safety

The black box problem isn't just a safety issue — it's a capability ceiling:

1. **Hallucinations** — Models confidently produce false information because nobody can identify which internal circuits cause confabulation
2. **Alignment tax** — RLHF and prompt engineering are crude, expensive approximations of what we actually want: surgical control over model behavior
3. **Lost knowledge** — Superhuman models trained on massive datasets contain knowledge that humans don't yet possess, but we have no way to extract it systematically
4. **Enterprise trust deficit** — Regulated industries (healthcare, finance, defense) can't deploy AI they can't explain

### The mechanistic interpretability breakthrough

Mechanistic interpretability (mech interp) goes deeper than surface-level explanations. It decomposes a model's internal activations into interpretable "features" — meaningful concepts that emerge from neuron interactions. The key technique: **Sparse Autoencoders (SAEs)**, which are trained on a model's hidden states to decompose them into a dictionary of human-interpretable features.

Goodfire is the first company to productize this approach at scale.

---

## The Technology Stack

### Ember: The World's First Interpretability API

Launched December 2024. Ember decodes neurons inside AI models and gives programmable access to model internals. Three core capabilities:

- **Auto Steer** — Describe desired behavior in natural language; the API auto-selects and adjusts internal feature weights to produce it. No retraining, no fine-tuning — surgical edits to model behavior.
- **Feature Search** — Semantic search across thousands of discovered internal features. Find the exact concepts a model has learned.
- **Contrastive Search** — Compare two datasets to identify which internal features differentiate them. This is how they found Alzheimer's biomarkers.

Currently supports Meta's Llama 3.3 70B and Llama 3.1 8B.

### Beyond SAEs: Parameter Decomposition

Goodfire's next-generation research goes beyond the current SAE paradigm. Lee Sharkey's work on **Stochastic Parameter Decomposition (SPD)** decomposes model *parameters* (the weights themselves) rather than *activations* (the outputs at each layer). This addresses fundamental SAE limitations: SAEs don't explain feature geometry, don't converge to a "true" decomposition with scale, and capture correlations rather than causal mechanisms. SPD learns which parts of the network can be deleted for any given input — a causal, not correlational, approach.

This is the kind of research that could define the next era of the field.

### Open-Source Contributions

- **First-ever SAEs trained on DeepSeek R1** (671B parameters) — open-sourced on Hugging Face and GitHub
- SAEs for Llama 3.3 70B
- SQL databases with hundreds of millions of tokens of activating examples
- Auto-interpreted feature labels available as CSV/SQL
- Prisma: open-source toolkit for vision mechanistic interpretability

The open-source strategy mirrors what worked for Proxima Bio — establish yourself as the standard-setter while keeping the productized version (Ember) proprietary.

---

## What the World Looks Like If This Works

If Goodfire succeeds in making AI internals programmable:

1. **AI safety becomes tractable.** Instead of hoping models behave well through RLHF, you can verify and guarantee specific behaviors by inspecting and editing the internal circuits responsible.

2. **A new scientific method emerges.** Models trained on massive datasets contain patterns humans haven't discovered. Interpretability becomes the microscope for AI-generated knowledge — the Alzheimer's biomarker discovery is the first proof point.

3. **Enterprise AI deployment accelerates.** Regulated industries (healthcare, finance, defense) gain the explainability they need to trust AI systems. The compliance bottleneck dissolves.

4. **Model development fundamentally changes.** Instead of training → evaluating → hoping, developers can surgically edit model behavior, debug failure modes at the feature level, and design models rather than stumble into them.

5. **Goodfire becomes essential infrastructure.** Every AI company needs interpretability tooling the way every software company needs observability. Goodfire positions as the Datadog for AI internals.

---

## Commercial Validation

| Partner | Domain | What They Did |
|---------|--------|---------------|
| **Rakuten** | E-commerce / AI agents | First known enterprise SAE deployment — used SAE probes for PII detection in production AI agents |
| **Arc Institute** | Genomics | Applied Ember to Evo 2 genomic foundation model; uncovered new biological concepts |
| **Prima Mente** | Biotech / Epigenetics | Goodfire applied interpretability to Pleiades (7B param epigenetic model). Identified novel Alzheimer's biomarkers. **89% detection rate** for early-stage Alzheimer's/Parkinson's, rising to **97% combined** with protein biomarkers |
| **Mayo Clinic** | Healthcare | Partnership on scientific foundation model analysis |
| **Microsoft** | Tech | Listed as partner (details sparse) |
| **Apollo Research** | AI Safety | Higher safety-benchmark scores using Ember |

The Alzheimer's result is the marquee proof point. If you can reverse-engineer a foundation model trained on epigenetic data and discover biomarkers that clinical researchers missed — that's not AI safety. That's a new scientific method.

---

## Core Team

### Eric Ho — Co-Founder & CEO

| | |
|---|---|
| **Education** | B.S. Computer Science, Yale University |
| **Prior** | Founded RippleMatch (2016) — AI-powered early-career hiring platform. Served as President & CTO. Scaled to $10M+ ARR, raised $80M total. |
| **Recognition** | Forbes 30 Under 30, Enterprise Technology (2022) |

**What's notable:** Ho is not a researcher — he's a builder/operator who knows how to take deep tech commercial. His RippleMatch experience (scaling an AI product to $10M+ ARR) is directly relevant: Goodfire needs someone who can turn breakthrough research into a product that enterprises will pay for. The researcher-operator pairing with McGrath is the classic deep tech founding dynamic.

---

### Tom McGrath — Co-Founder & Chief Scientist

| | |
|---|---|
| **Education** | PhD, Imperial College London (advisors: Nick Jones, Kevin Murphy) |
| **Prior** | Senior Research Scientist, Google DeepMind. **Founded DeepMind's interpretability team.** |
| **Google Scholar** | 1,033+ citations |
| **Key Papers** | Tracr (ground-truth for interp methods); AlphaZero chess interpretability (PNAS, with Demis Hassabis and Vladimir Kramnik); "Bridging the Human-AI Knowledge Gap" (PNAS, 2025); co-author on "Open Problems in Mechanistic Interpretability" |

**What's notable:** McGrath built the interpretability team at DeepMind — one of the three major AI labs. Leaving DeepMind to co-found a startup signals deep conviction that interpretability needed to become a standalone company, not a team inside a larger lab. His AlphaZero work (published in PNAS with Demis Hassabis) showed that interpretability could extract chess concepts that even grandmasters found novel — a direct precursor to Goodfire's "scientific discovery" thesis.

---

### Daniel Balsam — Co-Founder & CTO

| | |
|---|---|
| **Education** | M.S. Computer Science, New York University |
| **Prior** | Founding engineer and Head of AI at RippleMatch. Built the core engineering org and deployed LLMs in production. |

**What's notable:** The engineering execution leader. Not a researcher — the builder who turns research into product. His RippleMatch tenure means he and Ho have years of working together, which reduces co-founder risk.

---

## Key Research Staff

### Lee Sharkey — Research Scientist

- **Prior:** Co-founded Apollo Research (AI safety evals, London). Left Apollo to join Goodfire.
- **Google Scholar:** 2,025+ citations
- **Seminal paper:** "Sparse Autoencoders Find Highly Interpretable Features in Language Models" (2023) — foundational to the entire SAE movement
- **Current work at Goodfire:** Stochastic Parameter Decomposition (SPD) — the beyond-SAE approach

**Why he matters:** If SAEs are the current paradigm, Lee is working on what comes next. His move from Apollo to Goodfire signals that Goodfire's research agenda goes deeper than productizing existing techniques. He's one of the most important researchers in the field.

### Nick Cammarata — Core Contributor / Advisor

- **Prior:** Started the interpretability team at OpenAI alongside Chris Olah (who went on to co-found Anthropic)
- **Google Scholar:** 2,683+ citations
- **Thiel Fellow**

**Why he matters:** One of the original creators of the entire field of mechanistic interpretability. His presence gives Goodfire direct lineage to where the field was born. Combined citations across McGrath + Sharkey + Cammarata: **5,700+**.

---

## Investor Depth

### Lightspeed Venture Partners (Seed — $7M)

Led by **Nnamdi Iregbulem**. Framed Goodfire as "pioneering a new piece of the AI stack." Invested via Anthology Fund (co-led with Anthropic).

### Menlo Ventures (Series A — $50M)

Led by **Deedy Das**. His thesis: Goodfire's team is "cracking open that box to help enterprises truly understand, guide, and control their AI systems." $200M post-money valuation.

### B Capital (Series B — $150M)

Led by **Yan-David "Yanda" Erlich**, who was formerly COO and CRO at Weights & Biases — meaning he has direct pattern recognition for what "developer infrastructure for AI" looks like at scale. His framing: "We are building the most consequential technology of our time without a true understanding of how to design models that do what we want."

### Anthropic ($1M in Series A)

Anthropic's first-ever equity investment in another startup. Symbolic more than financial. Anthropic is where Chris Olah — the godfather of interpretability — built the largest interpretability team in the world. For Anthropic to invest in Goodfire suggests they see it as complementary infrastructure, not a competitor. Or they want to keep a close eye on the leading external interpretability lab. Either way, the signal value is enormous.

### Eric Schmidt (Series B)

Personal investment. Adds government/defense credibility and signaling.

---

## Hiring Signals & Strategic Direction

Active roles as of early 2026: **Head of Engineering, ML Engineer, Research Scientist, GTM Lead, Technical Product Marketing Lead, Business Operations Manager, Senior Founding Recruiter.**

What this reveals: the **GTM Lead** and **Technical Product Marketing** hires signal a clear pivot from research-first to commercial scaling. Post-Series B, they're building a sales engine. The **Head of Engineering** role suggests formalization from "brilliant researchers hacking" to "scalable engineering org." The **Founding Recruiter** posting means headcount is about to ramp hard. ~51 employees as of January 2026, likely growing fast.

---

## Conference & Publication Presence

**Published Research:**
- "Under the Hood of a Reasoning Model" (DeepSeek R1 SAE analysis)
- "Using Interpretability to Identify a Novel Class of Alzheimer's Biomarkers" (with Prima Mente)
- "Deploying Interpretability to Production with Rakuten: SAE Probes for PII Detection"
- "Towards Scalable Parameter Decomposition" (Lee Sharkey, SPD)
- "Understanding Sparse Autoencoder Scaling in the Presence of Feature Manifolds" (arXiv, with MIT)

**Podcasts:** Lee Sharkey on AXRP (Episode 41) and Cognitive Revolution.

**Press:** TechCrunch, Fast Company, SiliconANGLE, VentureBeat, PR Newswire.

---

## Why This is a Non-Consensus Bet

**What the consensus thinks:**
- AI safety is important but secondary to capabilities
- Interpretability is an academic/safety concern, not a commercial one
- The way to make AI work better is to scale it bigger and RLHF it harder
- Black-box prompting and fine-tuning are sufficient for enterprise deployment

**What Goodfire believes differently:**

1. **Interpretability is a performance advantage, not just safety tooling.** The Alzheimer's biomarker discovery and 50% hallucination reduction are capability claims, not safety claims. You can build *better* models by understanding them.

2. **The real value is in what models already know but can't express.** Their scientific discovery pillar assumes superhuman models contain knowledge humans haven't discovered yet, and interpretability is the extraction tool.

3. **Prompt engineering and fine-tuning are crude tools.** Surgical internal edits at the feature/parameter level will replace the current paradigm of trial-and-error prompting and expensive retraining.

4. **Model-agnostic interpretability becomes essential as the ecosystem fragments.** With Llama, DeepSeek, Mistral, Gemma, and others proliferating, enterprises need tools that work across models. Goodfire positions as that horizontal layer.

---

## Competitive Landscape

| Player | Focus | Relationship to Goodfire |
|--------|-------|--------------------------|
| **Anthropic (internal team)** | Largest interp team in the world, led by Chris Olah | Investor AND potential competitor. Complex signal. |
| **OpenAI** | Where the field originated (Olah, Cammarata) | Published SAE scaling work in 2024 |
| **Google DeepMind** | Where McGrath built the interp team before leaving | Talent source, not direct competitor |
| **Apollo Research** | AI safety evals, deception detection | Lee Sharkey's former org. Customer, not competitor. |
| **EleutherAI** | Open-source interp frameworks | Community, not commercial competition |

**Goodfire's differentiation:**
1. **Sole focus** — Unlike Anthropic/OpenAI/DeepMind, interpretability is not a side project; it's the entire company
2. **Model-agnostic** — Works across models and modalities (text, vision, genomic, robotic)
3. **Product, not just research** — Ember is a hosted API with paying enterprise customers
4. **Cross-domain proof points** — Alzheimer's biomarkers, PII detection, hallucination reduction demonstrate breadth

**Key risk:** The organizations that need interpretability most (frontier labs) could build it internally. Anthropic investing $1M while running the world's largest interp team is a genuinely ambiguous signal.

---

## Qualitative Assessment

### Conviction Level: HIGH

**Why this could be a generational company:**

1. **Seed-to-unicorn in 18 months.** $1.25B valuation at Series B, in a space that most VCs couldn't even define two years ago. The fundraising velocity signals something real.

2. **Research lineage is unmatched.** Founded the interp team at DeepMind, adjacent to the OpenAI interp team, wrote the foundational SAE paper, 5,700+ combined citations. This is the All-Star team for this exact problem.

3. **The Alzheimer's result changes the frame.** If interpretability can extract clinically novel biomarkers from a foundation model, it's not just developer tooling — it's a new scientific instrument. The TAM expands from "AI observability" to "AI-powered scientific discovery."

4. **Anthropic's investment is the strongest possible signal.** The world's leading interpretability lab chose to invest in Goodfire rather than compete. This suggests Goodfire is building something complementary to — or beyond — what even Anthropic's internal team can do.

5. **The timing is perfect.** Regulation is coming (EU AI Act, US executive orders). Enterprise AI adoption is accelerating. Both create massive demand for explainability. Goodfire is positioning itself at the intersection.

### Key Risks:

1. **Build vs. buy:** Frontier labs could internalize interpretability tooling, making Goodfire's product unnecessary for the highest-value customers.
2. **Research risk:** SAEs have known limitations. If SPD and parameter decomposition don't pan out, the technical moat narrows.
3. **Commercialization gap:** Going from research lab to enterprise SaaS is a different skill set. The GTM hires are a good sign but unproven.
4. **Dependency on open models:** Ember currently works on Llama. If Meta or others restrict model access, Goodfire's product surface shrinks.
5. **Anthropic ambiguity:** Is Anthropic's investment a blessing (validation) or a Trojan horse (keeping competitors close)?

### Bottom Line:

Goodfire is betting that interpretability is the missing layer of the AI stack — not just for safety, but for performance, scientific discovery, and enterprise trust. The team has the deepest research credentials in the field, the Alzheimer's result is a qualitatively different kind of proof point, and the fundraising velocity suggests institutional conviction. If they can execute the research-to-product transition, this becomes essential AI infrastructure.

**Verdict: The defining company in AI interpretability. First-mover with the research depth to stay ahead.**

---

*Research compiled: March 2026*
