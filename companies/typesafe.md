# Typesafe AI

| | |
|---|---|
| **Website** | [typesafe.ai](https://typesafe.ai) |
| **HQ** | San Francisco, CA |
| **Founded** | 2024 |
| **Structure** | C-corp (Typesafe AI, Inc.) |
| **Stage** | Pre-Seed / Accelerator |
| **Lead Investor** | AWS Generative AI Accelerator |
| **Other Investors** | 10 total investors per CB Insights (mostly undisclosed) |
| **Total Raised** | Undisclosed (up to $1M AWS credits via GAIA) |
| **Valuation** | Undisclosed |

---

## The Big Audacious Idea

Typesafe AI is building frontier AI models designed not for human conversation, but for **AI-to-computer interactions** — autonomous software systems that make reliable decisions in production. Their tagline: "Boring AI that works."

The founding thesis is that the current LLM paradigm is fundamentally misaligned with where AI consumption is headed. In a Transformative AI world, **over 99% of AI consumers will be code and software, not humans**. Every major foundation model today — GPT-4, Claude, Gemini — is optimized for chatbot-style human interaction: fluent, helpful, conversational. But autonomous software systems don't need fluency. They need **type-safe, structured, deterministic outputs** that integrate natively into traditional software architectures. Typesafe is rebuilding the model stack from first principles to serve this machine-to-machine future: models that understand software types natively, process context once and decide in parallel, and compose as modular intelligence that embeds directly into production code. Their GitHub forks of [vLLM](https://github.com/typesafe-ai/vllm) (high-throughput inference) and [LLaDA](https://github.com/typesafe-ai/LLaDA) (diffusion-based language models) hint at an architectural bet on **masked diffusion** rather than autoregressive generation — generating all tokens simultaneously and refining iteratively, rather than left-to-right one-at-a-time.

---

## The Problem That's So Hard to Solve

The reliability gap in AI automation is not a prompting problem — it's an **architectural problem**.

Current autoregressive LLMs generate tokens sequentially, each conditioned on all previous tokens. This design excels at natural language fluency but creates fundamental limitations for production software systems:

1. **Sequential bottleneck**: Generating structured outputs (JSON schemas, API calls, decision trees) token-by-token means the model can't "see" the full output structure while generating. A field value generated early can be inconsistent with a field generated later — and the model can't go back.

2. **Type unsafety**: LLMs operate on token probabilities, not software types. When you ask GPT-4 to return `{"price": 29.99, "currency": "USD"}`, the model has no native concept of "float" or "string" — it's predicting character sequences. Every JSON mode, function calling, and structured output feature is a **post-hoc constraint** bolted onto an architecture that doesn't natively understand types.

3. **Orchestration overhead**: The current solution to unreliable AI automation is layers of orchestration — retry logic, output validators, guardrails, multi-agent frameworks. Each layer adds latency, cost, and new failure modes. The industry is building increasingly elaborate scaffolding around a model that wasn't designed for the task.

4. **Evaluation collapse**: When AI systems are evaluated by other AI systems (the emerging pattern for autonomous agents), conversational fluency becomes irrelevant. What matters is **structured correctness** — did the system return valid data in the expected schema, within the right constraints, deterministically.

The hard technical question: can you build a fundamentally different model architecture — potentially diffusion-based — that generates structured outputs with native type safety, parallelism, and determinism, while still maintaining the general intelligence that makes LLMs powerful? This requires rethinking everything from pre-training objectives to inference algorithms.

---

## The Technology Stack

### Architecture Bet: Diffusion Language Models

Typesafe's most revealing technical signal is their [fork of LLaDA](https://github.com/typesafe-ai/LLaDA) (Large Language Diffusion with Masking), a diffusion-based approach to language generation from [arXiv:2502.09992](https://arxiv.org/abs/2502.09992).

**How LLaDA works:**
- Instead of generating tokens left-to-right (autoregressive), LLaDA **randomly masks tokens** during training and learns to predict them
- At inference, it starts with a fully masked sequence and **progressively unmasks** tokens over multiple steps
- This means **all tokens are generated in parallel** at each diffusion step, then refined
- The model can "see" the entire output structure simultaneously, enabling globally coherent structured generation

**Why this matters for Typesafe's thesis:**
- Parallel generation could enable **native schema awareness** — the model generates all fields of a JSON object simultaneously, ensuring cross-field consistency
- Iterative refinement means the model can correct inconsistencies across the full output, unlike autoregressive models that can't revisit earlier tokens
- The diffusion framework naturally supports **constrained generation** — you can mask/fix certain tokens and generate around them, enabling type-safe outputs by design

### Inference Infrastructure

Their [fork of vLLM](https://github.com/typesafe-ai/vllm) indicates they are building custom high-throughput inference for their models. vLLM is the industry-standard open-source LLM serving engine (PagedAttention, continuous batching). Forking it suggests they need inference modifications specific to diffusion-based generation — the standard KV-cache optimizations in vLLM are designed for autoregressive models.

### Product Surface

- **API-first**: Hiring signals (Founding Product Engineer - API, Backend Engineer - Developer Platform, Full Stack Engineer - Developer Platform) indicate the primary product will be a developer API
- **Preview/alpha stage**: Terms of service reference a "preview version" not suitable for production
- **Active waitlist**: [typesafe.ai/join-the-waitlist](https://typesafe.ai/join-the-waitlist)
- **Forward Deployed Engineers**: Recent role posting suggests beginning customer-embedded development

### GitHub

- **Organization**: [github.com/typesafe-ai](https://github.com/typesafe-ai) — 3 repos, no public members
- No original open-source projects released yet
- The fork selection (inference engine + diffusion LM) reveals their technical stack more than any marketing copy

---

## What the World Looks Like If This Works

1. **Software systems consume AI natively** — instead of wrapping LLM API calls in retry logic and validators, developers embed Typesafe models that produce type-safe outputs by architectural design, reducing AI integration code by 10x

2. **The orchestration layer collapses** — LangChain, guardrails, structured output libraries, and multi-agent retry frameworks become unnecessary as the model itself generates structured, reliable outputs, eliminating an entire software category

3. **AI automation achieves "boring reliability"** — autonomous systems in finance, healthcare, logistics, and infrastructure run on AI decisions with the same determinism expected of traditional software, opening regulated industries to full automation

4. **Diffusion language models become the enterprise standard** — autoregressive models remain dominant for human-facing applications (chatbots, writing), while diffusion-based models capture the larger machine-to-machine market, creating a bifurcation in the foundation model ecosystem

5. **The "AI-native software" era begins** — applications are designed around reliable AI decision-making as a primitive, rather than treating AI as an unreliable external service to be carefully managed

---

## Best Case Scenario / Addressable Opportunity

| Market | Size | Growth | Source |
|--------|------|--------|--------|
| LLM Market | $5.6B (2024) → $35.4B (2030) | 36.9% CAGR | Grand View Research |
| AI Agents Market | $5.1B (2024) → $47.1B (2030) | ~45% CAGR | MarketsandMarkets |
| LLM Infrastructure Layer | $12.5B (2025) | 2x YoY | Industry estimates |
| Enterprise GenAI Spending | $644B (2025) | 76.4% YoY | Gartner |
| Broader GenAI GDP Impact | $2.6–4.4T annually by 2030 | — | McKinsey |

Typesafe's specific wedge — AI models optimized for system-to-system automation — sits at the intersection of the LLM infrastructure layer and the AI agents market. If their thesis is correct that 99%+ of AI consumption will be by software, the machine-to-machine AI model market could dwarf the human-facing chatbot market.

**Near-term SAM**: The AI agents market alone ($5.1B in 2024, growing to $47.1B by 2030) represents the most direct addressable market. Every AI agent deployment that requires structured, reliable outputs is a potential Typesafe customer.

**Enterprise penetration gap**: 92% of Fortune 500 use consumer AI tools, but only 5% have adopted enterprise-grade AI solutions. The gap is largely about **reliability and integration** — exactly what Typesafe claims to solve. If they capture even 1% of enterprise GenAI spending, that's $6.4B.

---

## The Science: A Brief History

| Year | Milestone |
|------|-----------|
| 2015 | Diffusion models introduced for image generation (Sohl-Dickstein et al.) |
| 2017 | Transformer architecture (Vaswani et al., "Attention Is All You Need") |
| 2020 | GPT-3 demonstrates emergent capabilities in autoregressive LLMs |
| 2020 | DDPM makes diffusion practical for high-quality image generation |
| 2022 | InstructGPT/RLHF (Ouyang, Almeida et al.) — Typesafe CEO is co-inventor |
| 2022 | Stable Diffusion / DALL-E 2 prove diffusion dominance in vision |
| 2023 | Structured output features (JSON mode, function calling) bolted onto GPT-4 |
| 2023–24 | AI agent frameworks (LangChain, AutoGPT, CrewAI) emerge to manage LLM unreliability |
| 2024 | Early diffusion-for-language research (MDLM, SEDD, Plaid) shows viability |
| 2025 | LLaDA demonstrates diffusion language models matching GPT-2 scale quality |
| 2024 | Typesafe founded — betting that diffusion is the right architecture for reliable AI automation |

**Why Now**: Three forces converge:

1. **Diffusion-for-language matures**: LLaDA and related work show that masked diffusion can produce coherent language generation, proving the architectural alternative to autoregressive is viable

2. **AI agent reliability crisis**: The explosion of AI agent frameworks has revealed how unreliable autoregressive models are for structured tasks — the industry is drowning in orchestration complexity, creating demand for a model-level solution

3. **Machine-to-machine AI consumption emerges**: As AI agents, coding assistants, and autonomous systems scale, the percentage of AI outputs consumed by software rather than humans is rapidly increasing, validating Typesafe's thesis about the 99% market

---

## Open-Source Contributions

No original open-source projects released yet. Their GitHub presence is currently limited to:

- **vLLM fork**: Indicates custom inference work for non-autoregressive models
- **LLaDA fork**: Signals active development on diffusion-based language generation

Erik Gafni maintains a personal [open-source Python framework](https://github.com/egafni) for distributed scientific workflows, used by several large companies.

The absence of public open-source is notable for a model company at this stage — most competitors (Together AI, Mistral, even frontier labs) use open-source strategically. This could indicate: (a) they are in deep stealth building proprietary model capabilities, (b) the technology is too early to open-source, or (c) a deliberate closed-source strategy for their model IP.

---

## Commercial Validation

| Partner | Deal Type | What They Did |
|---------|-----------|---------------|
| AWS Generative AI Accelerator | Accelerator | Up to $1M AWS credits, mentorship from NVIDIA/Meta/Mistral, <2% acceptance rate |

**No publicly disclosed customers, pilots, or revenue partnerships yet.** Product is in preview/alpha stage with an active waitlist. This is expected for a mid-2024 founded company still building its core model, but means there is zero commercial validation to evaluate.

---

## Core Team

### Diogo Moitinho de Almeida — CEO

| | |
|---|---|
| **Education** | Rensselaer Polytechnic Institute |
| **Prior** | OpenAI (5 years), Google, Enlitic |
| **Citations** | ~49,000+ (Google Scholar) |
| **Notable** | Co-inventor of InstructGPT (RLHF), credited on GPT-4, IMO bronze medalist |

**What's notable**: Diogo is one of the most credentialed technical founders in the current wave of AI startups. He co-authored the [InstructGPT paper](https://arxiv.org/abs/2203.02155) (arXiv:2203.02155) — the foundational RLHF work that directly led to ChatGPT. The GPT-4 technical report specifically credits him for "Foundational RLHF and InstructGPT work," "Dataset contributions," and "Instruction following and API evals." His ~49,000 citations place him in elite territory for AI researchers. He also won an International Math Olympiad bronze medal in 2008, ending the Philippines' 13-year medal drought — signaling exceptional raw intellectual horsepower from a young age. Before OpenAI, he worked at Enlitic (Jeremy Howard's medical AI company) and Google. The combination of deep RLHF expertise and 5 years inside OpenAI during its most transformative period gives him rare insight into what current models can and cannot do — and critically, into where the architectural limitations lie. [Google Scholar](https://scholar.google.com/citations?user=0T4y07QAAAAJ&hl=en) | [LinkedIn](https://www.linkedin.com/in/diogomda/)

### Erik Gafni — CTO

| | |
|---|---|
| **Education** | University of Arizona (CS + Physiology, dual degree) |
| **Prior** | Harvard Medical School, Freenome, Invitae (IPO), Ravel Biotechnologies (co-founder), Eventum AI |
| **Publications** | Nature, BMC Cancer (cell-free DNA cancer detection) |
| **Patents** | 2 patents on genetic variation identification |

**What's notable**: Erik brings the production engineering DNA that complements Diogo's research pedigree. His career arc — Harvard Medical School researcher → early Invitae engineer (IPO, $6.5B peak valuation) → early Freenome engineer ($1B+ raised) → co-founding Ravel Biotechnologies ($9.5M raised for deep learning cancer screening) → Head of ML at Eventum AI — shows a consistent pattern of building ML systems that must work reliably in high-stakes domains (cancer detection, genetic screening). This is precisely the engineering sensibility needed for "boring AI that works." His 2 patents on genetic variation identification and Nature publication demonstrate the ability to bridge research and production. As CTO, he likely owns the inference infrastructure (the vLLM fork) and production reliability architecture. [Personal site](https://www.erikgafni.com/) | [Google Scholar](https://scholar.google.com/citations?user=IiAPlrYAAAAJ&hl=en)

### Sasha Sheng — COO

| | |
|---|---|
| **Education** | University of Michigan (Mechanical Engineering), Stanford Ignite |
| **Prior** | Meta/FAIR (7+ years, Research Engineer), AI Engineer Foundation (Founder/ED) |
| **Publications** | ECCV 2022 co-author (MUGEN) |
| **Community** | ~4,800 Twitter followers, 7 hackathon wins in 2023 |

**What's notable**: Sasha is the community and operations bridge between Typesafe's technical core and the developer market. Founding and running the AI Engineer Foundation — organizing SF hackathons, conferences, and community events — gives her deep relationships across the AI developer ecosystem, which is exactly the audience Typesafe needs for an API-first product launch. Her 7 years at Meta/FAIR provide big-company research engineering experience, while winning 7 hackathons in 2023 demonstrates scrappy builder energy. Her personal story (growing up in rural China, first in family to attend university) and public profile ([freeCodeCamp Podcast #91](https://www.freecodecamp.org/news/podcast/)) give Typesafe a human face for developer relations. The ECCV 2022 publication on multimodal understanding (MUGEN) shows legitimate research capability beyond pure operations. [@hackgoofer](https://x.com/hackgoofer) | [LinkedIn](https://www.linkedin.com/in/sashasheng/)

### Key Team Members

| Name | Role | Background |
|------|------|------------|
| Elise Liu | Product/Strategy | 12 yrs AI/ML, ex-Meta, ex-BCG, early at Human Interest & Clubhouse |
| Clayton Ward | Founding Engineer | 9 yrs, ex-Autodesk, Amazon, SIG |
| Jeff Lin | Engineering | 14 yrs, early Facebook mobile team, ex-founder SignalBiosystems, Stanford lecturer |
| Val Chocklett | ML Engineering | 10 yrs AI/Data Science, founding ML engineer at Trill AI |
| Noam Samuel | Backend Engineering | 10 yrs backend, ex-Stripe, ex-Square |
| Ted Kalaw | Engineering | 12 yrs, ex-Meta, ex-Ripple (developer platform) |
| Eugene Shvarts | AI Research | 9 yrs, ex-founder (October, AI social network), Applied Math PhD |

Total visible team: ~10 people. Strong FAANG/startup pedigree across the board. The Stripe/Square backend experience (Noam Samuel) and developer platform experience (Ted Kalaw at Ripple) are particularly relevant for building a reliable API product.

---

## Scientific Advisory Board / Key Advisors

No advisors publicly disclosed. The AWS GAIA program provided mentorship from NVIDIA, Meta, Mistral AI, and VC partners — these are program-level resources rather than dedicated advisors.

---

## Investor Depth

### AWS Generative AI Accelerator (GAIA)

Typesafe was selected for the 2024 cohort of AWS's Generative AI Accelerator, which accepted only 80 startups from thousands of applications (<2% acceptance rate). The program provides up to $1M in AWS credits, direct mentorship from AWS AI scientists, and access to NVIDIA, Meta, and Mistral AI engineering teams.

**What this signals**: AWS GAIA selection validates the technical premise — AWS reviewed Typesafe's model architecture approach and deemed it credible enough for their most selective AI program. The AWS credits also provide meaningful compute resources for model training without requiring a large fundraise. However, accelerator participation is fundamentally different from a priced venture round — it doesn't signal the same depth of investor conviction that a $10M+ seed from a top-tier fund would.

### The Unknown 9 Investors

CB Insights reports 10 total investors, but only AWS Generative AI Accelerator and AWS Startups are named. The identity of the remaining investors — whether they are angels, micro-VCs, or institutional funds — is a significant unknown. If the unnamed investors include top-tier AI-focused funds or prominent angel investors (e.g., former OpenAI colleagues of Diogo), that would substantially change the conviction profile.

---

## Hiring Signals & Strategic Direction

**11 open roles** as of March 2026, all on-site in San Francisco:

| Category | Roles | What It Reveals |
|----------|-------|-----------------|
| **Developer Platform** | Founding Product Engineer (API), Backend Engineer, Full Stack Engineer | API-first product about to launch |
| **Customer-Facing** | Forward Deployed Product Engineer, Founding Developer Advocate | Beginning customer engagements |
| **Go-To-Market** | Operations - GTM | Sales/marketing buildout starting |
| **Infrastructure** | Infra Engineer (Data Platform), Infra & Reliability Engineer | Scaling for production workloads |
| **Research** | ML Engineer, Data Research Engineer | Core model R&D continues |
| **Open** | Create Your Own Role | Talent-first hiring approach |

**Strategic read**: The hiring pattern reveals a company transitioning from pure research to product launch. Five of 11 roles focus on the developer platform and API — this is where the product will live. The Forward Deployed Product Engineer and Developer Advocate roles signal imminent customer engagement. The GTM role posted in March 2026 suggests they're preparing for a public launch in 2026. Meanwhile, continued ML Engineer and Data Research Engineer hiring indicates the model itself is still under active development — they're building the product and improving the model simultaneously.

All roles on [Ashby](https://jobs.ashbyhq.com/typesafe-ai).

---

## Conference & Media Presence

**Deliberately stealth.** Typesafe has maintained minimal public presence:

- **AWS re:Invent 2024**: Participated in showcase as part of GAIA cohort conclusion
- **Sasha Sheng** is the most publicly visible co-founder — ran AI Engineer Foundation events in SF, appeared on freeCodeCamp Podcast (#91)
- **Diogo Almeida** appeared on TWIML AI Podcast discussing modular deep learning
- No major TechCrunch, VentureBeat, or mainstream tech press coverage
- No conference talks or papers published under the Typesafe name

The stealth posture is consistent with a company that hasn't yet launched its product — there's no reason to generate press before the API is ready. It also suggests Diogo's approach may be more research-first than marketing-first, which is credible given his OpenAI background where the work spoke for itself.

---

## Why This is a Non-Consensus Bet

**What the consensus thinks:**

1. Autoregressive (GPT-style) generation is the proven, dominant paradigm for language AI — scaling laws, RLHF, and chain-of-thought all assume sequential token generation
2. The path to reliable AI automation is better orchestration on top of existing LLMs — frameworks like LangChain, guardrails, and structured output modes can solve reliability without new architectures
3. Structured output is a feature (JSON mode, function calling, tool use) that big labs will continue to improve incrementally within their autoregressive models
4. Small model labs cannot compete on frontier capabilities against Anthropic, OpenAI, and Google's billions in compute spend
5. The value in enterprise AI is in the application layer (agents, workflows), not in the model layer — foundation model APIs are commoditizing

**What Typesafe believes differently:**

1. Autoregressive generation is **architecturally wrong** for machine-to-machine AI — diffusion-based models that generate all tokens in parallel and refine iteratively are fundamentally better suited for structured, type-safe outputs
2. Orchestration layers are **a symptom, not a solution** — no amount of retry logic, validators, and guardrails can fix a model that wasn't designed for deterministic structured output. The model itself must change.
3. The structured output "features" in current LLMs are **post-hoc constraints** on a type-unsafe architecture — native type-safety requires rethinking the model from pre-training objectives to inference algorithms
4. A small team with the **right architectural insight** can build a differentiated model that large labs won't prioritize because it doesn't serve their chatbot-centric business model — this is a different market, not a competition for the same one
5. 99%+ of future AI consumption will be by software, not humans — the machine-to-machine model market will be **larger** than the human-facing chatbot market, and it will require fundamentally different models

---

## Competitive Landscape

| Company | Focus | Funding | Differentiation vs. Typesafe |
|---------|-------|---------|------------------------------|
| **OpenAI / Anthropic / Google** | General-purpose frontier models | $B+ | Conversation-optimized; structured output is a feature, not the architecture |
| **Together AI** | Open-source model training & inference | $200M+ | Cloud platform for existing model architectures, not building new model types |
| **Instructor / Outlines** | Structured output libraries | Open-source | Tooling layer on top of existing LLMs, not model-level |
| **Coval** (YC S24) | AI agent simulation & evaluation | $3.8M | Testing & evaluation, not model building |
| **Vellum** | LLM workflow orchestration | Funded | Prompt engineering & evaluation, orchestration approach |
| **LangChain / CrewAI** | Agent orchestration frameworks | Funded | Orchestration layer — exactly the complexity Typesafe aims to eliminate |
| **Adept** | AI agents for enterprise | $415M | Autoregressive models for computer use, not structured output |
| **Imbue** | AI agents that reason | $210M | Training agents to reason, still autoregressive architecture |

Typesafe occupies a unique position: they're the only company (publicly known) building a **frontier model specifically designed for machine-to-machine AI** using diffusion-based architecture. Most competitors either build on autoregressive models (Adept, Imbue), wrap existing models (LangChain, Instructor), or provide infrastructure for existing architectures (Together AI). If diffusion-based language generation proves superior for structured output, Typesafe has a significant head start. If it doesn't, they've bet the company on the wrong architecture.

---

## Qualitative Assessment

**Conviction Level: MEDIUM**

**Bull Case:**

1. **Diogo Almeida is a generational founder for this problem** — co-inventing InstructGPT/RLHF and being credited on GPT-4 means he understands better than almost anyone on earth where current models fail and why. If anyone can diagnose the architectural problem and build the fix, it's him.

2. **The architectural thesis is intellectually compelling** — diffusion-based language models generating all tokens in parallel and refining iteratively is a genuine architectural advantage for structured output. LLaDA's recent results prove the approach is viable. This is a real technical insight, not marketing.

3. **Massive market if correct** — if 99% of AI consumption shifts to software-to-software, the machine-to-machine model market could dwarf human-facing chatbots. Typesafe would be building the foundation model for the larger market.

4. **Timing is right** — the AI agent reliability crisis is real and worsening. Every enterprise deploying AI agents is hitting the reliability wall. A model-level solution would find immediate product-market fit.

5. **Strong founding team breadth** — InstructGPT co-inventor (Diogo) + production ML veteran with biotech exits (Erik) + AI developer community builder (Sasha) covers research, engineering, and go-to-market.

**Key Risks:**

1. **Zero commercial validation** — no customers, no revenue, no pilots, no benchmarks. The product is in alpha. This is a pure technical thesis bet with no market feedback yet.

2. **Diffusion for language is unproven at scale** — LLaDA shows promise at GPT-2 scale, but it's unknown whether diffusion language models can scale to GPT-4+ capabilities. The autoregressive paradigm has massive scaling evidence behind it.

3. **Big labs could add diffusion modes** — if diffusion-based generation proves superior for structured output, OpenAI/Anthropic/Google could add diffusion heads to their existing models as a feature, not a new company.

4. **Fundraising uncertainty** — no disclosed priced round beyond the AWS accelerator. Building a frontier model company requires hundreds of millions in compute. Their funding path is unclear.

5. **Stealth cuts both ways** — deliberate stealth means less community feedback, less developer mindshare, and less signal on whether the product actually works. By the time they launch, the orchestration approach may have improved enough to satisfy enterprise needs.

**Bottom Line**: Typesafe AI has one of the strongest technical founding theses in the current AI startup landscape — a genuine architectural insight (diffusion for structured machine-to-machine AI) championed by one of the co-inventors of the technology that made ChatGPT possible. The team is exceptional. But this is currently a pure conviction bet: zero commercial validation, unproven architecture at scale, unclear funding for compute-intensive model training, and a timeline risk against rapidly improving structured output features in existing models. The conviction level is MEDIUM rather than HIGH because the gap between the elegant thesis and any evidence that it works in practice remains wide.

**Verdict: A technically brilliant bet on the right problem, led by a founder with rare credibility to attempt it. Worth watching closely for a seed round, first benchmarks, and any commercial traction — but too early and too unproven to commit at high conviction.**

*Research compiled: March 2026*
