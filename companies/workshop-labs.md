# Workshop Labs

| | |
|---|---|
| **Website** | [workshoplabs.ai](https://www.workshoplabs.ai) |
| **HQ** | London, UK (HQ) + San Francisco, CA (engineering) |
| **Founded** | 2025 |
| **Structure** | Public Benefit Corporation (PBC) |
| **Stage** | Pre-Seed |
| **Investors** | Brad Burnham (USV co-founder), Brendan McCord (Cosmos Institute), Character Capital (Jake Knapp / John Zeratsky), Juniper Ventures, OVO Fund, Seldon Lab |
| **Notable Connections** | Advisors from Anthropic, Google DeepMind, and UK AISI; investors who were early at Anthropic, Slack, Prime Intellect, DuckDuckGo, and Goodfire |
| **Total Raised** | Undisclosed (pre-seed) |
| **Valuation** | Undisclosed |

---

## The Big Audacious Idea

**Workshop Labs is building privacy-preserving personal AI — billions of individually fine-tuned models, one per person, running on confidential computing infrastructure that even the founders can't see into.**

The founding thesis comes from a specific diagnosis: AGI isn't a tool like the plow or the computer. It's a resource like oil or coal. When powerful actors create non-human intelligence that can replace human labor across the economy, they lose the incentive to invest in people — the same dynamic that turns mineral-rich nations into extractive kleptocracies. Luke Drago and Rudolf Laine call this **The Intelligence Curse**, a 7-part essay series that became their company's intellectual foundation before a single line of product code was written.

The proposed antidote: instead of centralized AI systems that automate humans away, build decentralized AI that augments each individual — models fine-tuned on your data, reflecting your voice, your expertise, your judgment. The tagline is "Make people irreplaceable." The technical bet is that open-source models (Kimi-K2, DeepSeek) have reached near-frontier quality, confidential computing hardware (NVIDIA TEEs, Intel TDX) has matured enough to guarantee data privacy cryptographically, and post-training infrastructure can be democratized so that fine-tuning isn't a $100K engineering project but a single click.

As Drago put it on the [Future of Life Institute podcast](https://podcast.futureoflife.org/breaking-the-intelligence-curse-with-luke-drago/): *"If you have non-human factors of production, and they become your dominant source of production, your incentives aren't to invest in your people."*

---

## The Problem That's So Hard to Solve

### The economic incentive failure

The Intelligence Curse thesis rests on a structural analogy: countries that discover oil tend to develop worse governance, not better. The government no longer needs citizen productivity for tax revenue, so it stops investing in education, healthcare, and institutions. Citizens become economically irrelevant. Drago and Laine argue AGI creates the same dynamic at civilizational scale — but worse.

Rudolf Laine's formulation is sharper than most AI displacement arguments: *"AI will keep improving. Rather than just providing the government an alternative income stream that still requires humans to manage, AI and robotics will replace the need for humans across the economy, military, and government bureaucracy entirely. You also can't 'run out' of AI like you can with oil."*

The evidence they marshal: the DRC sits on $24 trillion in mineral wealth while 73.5% of its population lives on less than $2.15/day. Oman invested oil revenue in child mortality reduction; Equatorial Guinea didn't. The difference isn't the resource — it's the institutional response. And right now, the institutional response to AI is full-speed automation with no structural plan for what happens to the people displaced.

### The technical problem: personal AI that's actually private

Even if you accept the thesis, building the solution is genuinely hard:

1. **Privacy-preserving fine-tuning at scale.** Training a model on someone's emails, documents, and calendar — without anyone (including Workshop) being able to see that data — requires confidential computing enclaves (TEEs) that add latency, limit hardware access, and constrain training approaches. Most fine-tuning infrastructure assumes you can inspect the data.

2. **Efficient batching of thousands of personalized models.** If every user gets their own fine-tuned model, you can't serve them all from one set of weights. You need infrastructure that handles thousands of distinct model checkpoints efficiently — a fundamentally different serving architecture than "one big model, many users."

3. **Post-training is broken at the open-source level.** Workshop's ML engineer Addie Foote documented this directly in a [blog post](https://www.workshoplabs.ai/blog/open-weights-open-training): attempting to fine-tune Kimi-K2-Thinking across HuggingFace, PEFT, PyTorch, Accelerate, and vLLM produced 6+ distinct bugs. Her conclusion: *"open weights isn't open training"* — the weights exist but the training infrastructure is fragmented, undocumented, and unreliable. Workshop's Trellis project is their direct response.

4. **Making personalization actually useful.** A model that knows your writing style but can't do anything with it is a novelty. The hard product question: what tasks does a personalized model unlock that a general-purpose model can't already do well enough?

---

## The Technology Stack

### Trellis: Open-Source Post-Training Infrastructure

[Announced March 2026](https://www.workshoplabs.ai/blog/post-training-50x-faster), Trellis is Workshop's open-source post-training codebase, currently targeting Kimi-K2-Thinking (a 1 trillion parameter MoE model).

**Performance claims:**
- **6,600 tokens/second** on a single 8xH200 node
- **50x faster** than existing open-source post-training infrastructure
- **2x cheaper** than commercial APIs for the same workload

**Key technical innovations:**
- **Expert parallelism for MoE training** — distributing Mixture-of-Experts layers across GPUs efficiently
- **Dequantization optimization** — the original pipeline spent 80% of training time on dequantization. Workshop vectorized int4 extraction, dramatically reducing this bottleneck
- **Sequence packing** — 10x throughput improvement by efficiently batching variable-length sequences

Built on top of PrimeRL (from Prime Intellect). Currently pending safety evaluations before full open-source release.

**Why this matters for the thesis:** If Workshop wants billions of personalized models, they need post-training to be fast and cheap. Trellis is the infrastructure layer that makes per-person fine-tuning economically viable. The 50x speedup isn't an academic benchmark — it's the difference between "personalized AI for enterprises that can afford $100K per model" and "personalized AI for everyone."

### Evergreen: Consumer Product (Beta)

Available at [beta.workshoplabs.ai](https://beta.workshoplabs.ai). Three-phase workflow:

1. **Plant** — Connect data sources (emails, docs, calendar)
2. **Grow** — AI learns your voice, writing style, expertise, preferences
3. **Use** — Surfaces insights and acts on your behalf

Privacy architecture: confidential computing enclaves ensure that *"even we can't see it"* — Workshop cannot access user data even if compelled.

### GitHub

No public original repositories yet beyond the Trellis codebase (pending release). The team's individual GitHub profiles show active ML research work.

---

## What the World Looks Like If This Works

1. **AI becomes a personal asset, not a corporate service.** Instead of renting intelligence from OpenAI or Google, every person owns a model trained on their data that reflects their expertise and judgment. The relationship flips from "user of AI product" to "owner of AI capability."

2. **Economic displacement slows because humans remain in the loop.** If AI augments individuals rather than replacing them, the person + their AI becomes more productive than AI alone — maintaining human economic relevance. Drago points to Cursor (the AI code editor) as the model: augmentation that makes developers more valuable, not automation that replaces them.

3. **Data ownership becomes economically meaningful.** If your personal data trains your personal model, and that model generates economic value, the data itself becomes an asset you control — reversing the current dynamic where platforms extract user data for their own models.

4. **A new class of AI infrastructure emerges.** Privacy-preserving fine-tuning, confidential computing serving, personalized model management — these become infrastructure categories analogous to how cloud computing created AWS, the personal AI era creates a new platform layer.

5. **The political economy of AI changes.** Drago's thesis is explicitly political: *"Your economic value is an important part of your political value."* If AI eliminates human economic contribution, democratic accountability weakens. Distributed personal AI preserves the economic foundation of political agency.

---

## Best Case Scenario / Addressable Opportunity

| Market | Size | Growth |
|--------|------|--------|
| Personal AI Assistants | $15.8B (2025) → $84.5B (2030) | 39.8% CAGR |
| AI Fine-Tuning / Post-Training | $3.2B (2025) → $18.7B (2030) | ~42% CAGR |
| Confidential Computing | $5.3B (2024) → $60B+ (2032) | 36% CAGR |
| Digital Identity / Personal Data | $35B (2025) → $87B (2030) | 20% CAGR |

Workshop sits at the intersection of personal AI, fine-tuning infrastructure, and confidential computing — three rapidly growing categories.

**The Meta/Limitless signal:** Meta acquired Limitless AI (formerly Rewind) in December 2025, validating the personal AI category but concentrating it in big tech — exactly the centralization dynamic Workshop argues against. Limitless's shutdown post-acquisition creates an opening for a privacy-first alternative.

**Enterprise angle:** If Workshop can offer "personalized AI for every employee, with data that never leaves the enclave," enterprise buyers in regulated industries (legal, healthcare, finance) have a compelling procurement story that general-purpose AI APIs can't match.

---

## The Science: A Brief History

**2013–2019: Personal assistants plateau.** Siri, Alexa, and Google Assistant demonstrate the concept of personal AI but remain shallow — no learning, no personalization, no memory. They're voice interfaces to search, not personal models.

**2020–2022: The foundation model era.** GPT-3 and its successors demonstrate that large language models can be general-purpose reasoners. Fine-tuning becomes a research technique but remains expensive and inaccessible. The idea that you could have "your own model" is technically conceivable but economically absurd.

**2022–2023: Rewind (now Limitless) pioneers personal AI.** Dan Siroker's Rewind records everything on your screen and makes it searchable. The product validates consumer demand for AI that knows your personal context, but raises immediate privacy concerns. The approach (record everything, search later) doesn't involve personalized models.

**2023–2024: Open-source models approach frontier quality.** LLaMA, Mistral, DeepSeek, and Kimi demonstrate that open-weight models can match or approach closed-model performance. This is the key unlock: if frontier-quality models are open, fine-tuning them on personal data becomes technically feasible.

**2024–2025: Confidential computing matures.** NVIDIA adds TEE support to H100/H200 GPUs. Intel TDX and AMD SEV provide CPU-level confidential computing. Google launches Confidential Space. For the first time, you can train and serve models on data that even the infrastructure operator can't access.

**2024–2025: The Intelligence Curse crystallizes.** Drago and Laine spend a year studying AI economics at BlueDot Impact and writing their 7-part essay series. Dario Amodei warns that AI could eliminate half of entry-level white-collar jobs within five years. The essay goes viral, gets covered in TIME, and becomes the intellectual framework that precedes the company.

**2025: The "Why Now" convergence.**
- Open-source models reach quality parity → fine-tuning produces useful personalized models
- Confidential computing hardware matures → privacy guarantees are cryptographic, not contractual
- Post-training infrastructure remains broken → opportunity for Workshop's Trellis to become the standard
- Meta acquires Limitless → personal AI category validated but centralized, creating demand for a privacy-first alternative
- The founders' specific backgrounds converge: policy diagnosis (Drago) + ML safety research (Laine) + the thesis (Intelligence Curse) = a company that's a direct product of its intellectual framework

---

## Open-Source Contributions

### Trellis

Workshop's strategic open-source bet. By open-sourcing the post-training infrastructure that makes personalized AI possible, they're:

1. **Building credibility in the ML engineering community** — the Trellis blog post demonstrates genuine technical depth (finding and fixing the dequantization bottleneck, implementing expert parallelism)
2. **Creating ecosystem dependency** — if researchers and companies adopt Trellis for post-training, Workshop becomes the default infrastructure provider when they need managed, privacy-preserving fine-tuning
3. **Validating their thesis through action** — open-sourcing your core infrastructure is a credible signal when your thesis is "diffuse AI that augments humans and decentralizes power"

### Rudolf Laine's SAD Benchmark

[GitHub: LRudL/sad](https://github.com/LRudL/sad) — The Situational Awareness Dataset, published at NeurIPS 2024. 7 task categories, 13,000+ questions evaluating whether LLMs understand they are AI systems. **Used by OpenAI in pre-deployment safety testing.** This isn't Workshop Labs IP, but it's the CTO's prior work — and it's directly relevant to building personalized AI systems that behave faithfully.

### Addie Foote's Unlearning Research

"Distillation Robustifies Unlearning" — NeurIPS 2025 Spotlight. Directly relevant to Workshop's mission: if personal AI learns from your data, you need robust mechanisms to make it forget when you ask. Foote's research on robust unlearning provides the scientific foundation for user control over personalized models.

---

## Commercial Validation

| Signal | Type | Detail |
|--------|------|--------|
| Seldon Lab Batch 1 | Accelerator | Selected for first batch; batch companies collectively raised >$10M, closed contracts with xAI and Anthropic |
| Juniper Ventures | AI Safety VC | Portfolio alongside Apollo Research and Goodfire — serious AI safety company signal |
| Brad Burnham (USV) | Angel | Co-founder of Union Square Ventures investing personally — career-long thesis on user-owned data |
| Character Capital | Seed VC | Creators of Google Ventures' Design Sprint; actively working with Workshop on product-market fit |
| Meta/Limitless Acquisition | Category Validation | Meta bought Workshop's closest competitor (Dec 2025), validating personal AI but centralizing it |
| Evergreen Beta | Product Signal | Live beta product accepting users, though no disclosed user numbers or engagement metrics |

**No named enterprise customers, revenue, or partnerships disclosed.** The company is pre-product-market-fit, which is expected for a 2025-founded pre-seed company. The strongest validation signal is the investor quality relative to stage.

---

## Core Team

### Luke Drago — Co-Founder & CEO

| | |
|---|---|
| **Education** | BA History & Politics, University of Oxford (2020–2023) |
| **Prior** | BlueDot Impact (AI Governance Specialist — designed AI economics curriculum, trained 5,000+ professionals); Encode Justice (leadership team, co-authored AI 2030 policy platform); U.S. House of Representatives (Congressional intern, tech policy); Campaign Manager (won first place, beat two incumbents) |
| **Writing** | TIME Magazine op-ed; "The Intelligence Curse" (7-part series at intelligence-curse.ai); "Technocalvinism" (Cosmos Institute) |
| **Podcasts** | Future of Life Institute, Cognitive Revolution, Bankless/Limitless |

**What's notable:** Luke is not a technical founder — he's a thesis founder. He spent two years systematically studying why AI might break the social contract: designing AI economics curriculum at BlueDot (whose alumni include people at Anthropic, DeepMind, and UK AISI), co-authoring the AI 2030 policy platform (endorsed by Nobel laureate Daron Acemoglu, Stuart Russell, Yoshua Bengio, and 300+ signatories), then crystallizing the diagnosis into the Intelligence Curse essay series. The company is a direct product of the thesis, not the other way around.

His political background matters more than it initially appears. He managed campaigns that beat incumbents, wrote 43 constituent response letters on tech policy for Congress, and has an instinctive understanding of how economic value creates political leverage — which is the core of his argument for why personal AI matters. When he says *"your economic value is an important part of your political value,"* that's not an academic claim — it's a campaign strategist's insight applied to AI economics.

The risk is the obvious one: a History & Politics graduate from Oxford, not an ML researcher, leading a company that needs to solve hard infrastructure problems in confidential computing and distributed fine-tuning. The counter: he's paired with Rudolf Laine, and the CEO's job is narrative + fundraising + strategy, not kernel optimization.

### Rudolf Laine — Co-Founder & CTO

| | |
|---|---|
| **Education** | BS & MPhil Computer Science, University of Cambridge; PhD Machine Learning, University of Oxford (suspended to co-found Workshop) |
| **Prior** | CERI (Cambridge Existential Risks Initiative — ran the org); MATS Scholar (mentored by Owain Evans); Owain Evans Research Group |
| **Publications** | "Me, Myself, and AI: The Situational Awareness Dataset (SAD) for LLMs" — NeurIPS 2024 Datasets & Benchmarks; used by OpenAI in pre-deployment testing |
| **Writing** | "Capital, AGI, and Human Ambition" (viral post); "Positive Visions for AI"; "A History of the Future" (scenario planning) |

**What's notable:** Rudolf is the rare technical co-founder whose published research is directly, causally relevant to the company he's building. The SAD benchmark measures whether LLMs understand they are AI systems — whether they behave differently when they know they're being evaluated vs. deployed. OpenAI uses it in pre-deployment safety testing. This isn't adjacent expertise; it's foundational to building personalized AI that behaves faithfully and predictably.

His intellectual trajectory reveals someone who was dissatisfied with the AI safety community's posture. In "Positive Visions for AI," he argues the discourse is too fixated on catastrophe: DeepMind and OpenAI began as moonshot projects but have been *"eaten by the corporate machinery"* and *"captured by profit and product considerations."* The e/acc movement, meanwhile, exhibits *"incoherence"* by worshipping *"thermodynamic will"* rather than human flourishing. Workshop Labs is his attempt at a third path: build something that's neither doomerist handwringing nor accelerationist indifference.

He suspended an Oxford ML PhD to co-found Workshop. That's a meaningful signal — he saw a window where the thesis and the technology converged, and chose to build rather than continue researching.

### Key Technical Staff

| Name | Background | Relevance |
|------|-----------|-----------|
| **Addie Foote** | BS CS, UT Austin Turing Scholars; MATS extension scholar; NeurIPS 2025 Spotlight ("Distillation Robustifies Unlearning") | Robust unlearning research = user control over what personal models learn/forget |
| **Tim Kostolansky** | MEng CS + BS Physics + BS CS, MIT; NeurIPS 2025 ("CoT Red-Handed: Stress Testing Chain-of-Thought Monitoring") | CoT monitoring = ensuring personalized models reason faithfully |

**Team composition signal:** A 5-7 person company with two NeurIPS papers (one spotlight) on unlearning and monitoring — exactly the safety capabilities needed for personal AI that handles sensitive data. This isn't accidental; the hiring reflects the thesis.

---

## Scientific Advisory Board / Key Advisors

No formal SAB announced, but the company states advisors have held senior roles at **Anthropic, Google DeepMind, and UK AISI**. Given Rudolf's position in the AI safety research community (CERI, MATS, NeurIPS publications), these are likely direct professional connections rather than cold outreach.

The investor network functions as an extended advisory board:
- **Brendan McCord** — teaches AI & philosophy at Oxford, founded DoD's first applied AI org, authored DoD AI strategy
- **Seldon Lab** network includes **Geoff Ralston** (former YC President), **Jeremie Harris** (Gladstone AI CEO), **Nitarshan Rajkumar** (UK AISI founding member)

---

## Investor Depth

### Brad Burnham — Co-founder, Union Square Ventures

Burnham co-founded USV with Fred Wilson in 2003, building one of the most thesis-driven venture firms in history. His career-long belief: *"data could live outside its application"* — that users should own their data rather than platforms extracting it. He previously invested in 3box (personal data stores on distributed networks) and has been a vocal advocate for decentralization: *"I'm a believer in decentralized emergent bottom up startup innovation."*

Workshop Labs maps directly onto Burnham's 20-year thesis: personal data trains personal models, running on infrastructure where even the operator can't access the data. This isn't an angel bet on a hot sector — it's a thesis-aligned investment from someone who has been arguing for user-owned data since before most AI founders started college.

### Brendan McCord — Founder, Cosmos Institute

McCord is the most intellectually aligned investor in the round. He founded the Cosmos Institute (a tech + philosophy organization), teaches AI & philosophy at Oxford, and previously founded DoD's first applied AI organization and authored the DoD's inaugural AI strategy. His two prior AI startups were acquired for a combined $400M.

The intellectual connection is direct: Luke Drago published "Technocalvinism" — his rebuttal of the accelerationist argument that full automation is inevitable and blameless — on the Cosmos Institute blog. McCord's three principles for AI (reason/Mill, decentralization/Tocqueville, human autonomy/Aristotle) map precisely onto Workshop's thesis. This is an investor who shares the founders' philosophical framework, not just their market thesis.

### Juniper Ventures

AI safety-focused VC led by Nick Fitz and Griffin Bohm, backed by **Reid Hoffman, Eric Ries, Geoff Ralston, Jan Leike** (former OpenAI alignment lead who resigned over safety concerns), and **Woj Zaremba** (OpenAI co-founder). Portfolio includes Apollo Research (deceptive alignment research) and Goodfire (mechanistic interpretability) — Workshop Labs sits alongside the most serious AI safety companies in venture.

Juniper's thesis: *"AI safety will be a big market, but it is not yet big."* They reportedly achieved 10x return on their Goodfire investment, proving the thesis can generate financial returns, not just mission alignment. Having Jan Leike (who left OpenAI because safety wasn't being prioritized) as a backer sends a specific signal about Workshop's positioning.

### Character Capital (Jake Knapp & John Zeratsky)

Creators of Google Ventures' Design Sprint methodology, NYT bestselling authors of *Sprint* and *Make Time*. Their Fund II ($52M, May 2025) focuses on early-stage AI startups. Character Capital runs an accelerator specifically focused on product-market fit — they're likely actively working with Workshop on the Evergreen consumer experience, not just providing capital.

### Seldon Lab

AI security accelerator that selected Workshop for its first batch. First-batch companies collectively raised >$10M and closed contracts with xAI and Anthropic. Connected to Geoff Ralston (former YC President) and Nitarshan Rajkumar (UK AISI founding member). Workshop graduating from Seldon's inaugural batch provides both technical credibility (AI security expertise) and network access to frontier lab procurement.

---

## Hiring Signals & Strategic Direction

**3 open roles**, all on-site in San Francisco:

| Role | What It Reveals |
|------|-----------------|
| Founding ML Infrastructure Engineer | Confidential computing + distributed training infrastructure |
| Founding ML Research Engineer | Post-training personalization + model quality research |
| Software Engineer | Product engineering for Evergreen |

**Strategic reads:**

1. **London HQ, San Francisco engineering** — the founders are British (Oxford/Cambridge), but the ML engineering is in SF. This suggests they want access to the Bay Area ML talent pool and proximity to GPU cloud providers.

2. **"Founding" titles = employees 3–5** — extremely early stage. The team is ~5-7 people total.

3. **The job post philosophy is a recruiting filter:** *"If the current AI path feels off"* — explicitly targeting builders disillusioned with frontier lab approaches. This is values-based hiring, not just skills-based.

4. **No GTM or sales roles** — all hiring is technical. They're in build mode, not sell mode.

---

## Conference & Media Presence

### Intellectual Circuit (Strong)

- **TIME Magazine** — Op-ed: "What Happens When AI Replaces Workers?" (co-authored with Rudolf Laine)
- **Future of Life Institute Podcast** — "Breaking the Intelligence Curse" (Sep 2025). FLI is the most prominent AI safety media platform, reaching policymakers and researchers.
- **The Cognitive Revolution** — Rebroadcast of FLI episode. Nathan Lebenz's podcast is a top-tier AI strategy audience.
- **Bankless/Limitless** — 1.5hr episode on the Intelligence Curse thesis. Reaches the crypto/web3 audience interested in decentralization and ownership.
- **LessWrong / Alignment Forum** — Intelligence Curse essays posted and debated. Core AI safety community engagement.
- **AI 2027 analysis** — Intelligence Curse cited as a reference in the influential AI 2027 scenario planning document.

### Events

- **80,000 Hours career planning event** — Luke Drago + Ben Todd on "Planning a career in the age of AI"
- **BlueDot x EF AI Security Hackathon** — Workshop Labs co-hosted

**Dual-circuit analysis:** Workshop's media presence is unusually skewed toward the intellectual and policy circuit rather than the tech press circuit. No TechCrunch or VentureBeat coverage. This is a company that built its narrative (Intelligence Curse essays, TIME op-ed, FLI podcast) before building its product — the intellectual framework IS the go-to-market strategy. The risk: strong narrative, unproven product. The upside: they've created a category frame ("the Intelligence Curse") that gives Workshop a conceptual moat — every conversation about AI displacement now has a vocabulary that leads back to their company.

---

## Why This is a Non-Consensus Bet

### What the consensus thinks:

1. **AI displacement is a transition problem, not a structural one.** The standard techno-optimist view (Bill Gates, most economists) is that AI creates new jobs faster than it destroys old ones, just like previous technological revolutions. There will be friction, but markets adjust.

2. **Personal AI is a feature, not a company.** Apple Intelligence, Google Gemini, Microsoft Copilot — every major platform is adding personalization. A startup can't compete with distribution advantages of companies that own the device, the OS, and the data.

3. **Privacy-preserving AI is too slow and expensive.** Confidential computing adds latency and limits hardware utilization. The market has shown repeatedly that users choose convenience over privacy (Facebook, Google, etc.). Privacy-first personal AI is a niche product for a niche audience.

4. **"Augmentation over automation" is a losing strategy.** AI systems that fully automate tasks will outperform AI systems constrained to augment humans. Companies that bet on augmentation will be outcompeted by companies that bet on automation. As one Alignment Forum commenter put it: *"Skeptical of any proposal which looks like 'generally make humans+AI rather than just AI more competitive.'"*

5. **The Intelligence Curse is just the resource curse analogy, and it doesn't hold.** A LessWrong commenter: *"I don't believe the standard story of the resource curse"* — Norway and Congo differ in too many ways beyond oil. The analogy may be intellectually provocative but not economically rigorous.

### What Workshop Labs believes differently:

1. **This time IS different — AI replaces cognitive labor, not just physical.** Previous technological revolutions displaced specific tasks (farming, manufacturing) but created new cognitive tasks. AGI threatens to displace cognitive labor itself — leaving no obvious "next category" of human work. Drago: *"If you are someone who's hesitated on doing the risky thing... you are going to be on the last chopper out of Saigon."*

2. **Personal AI is infrastructure, not a feature.** Platform companies will add personalization as a feature that serves their interests (more engagement, more data extraction). Workshop's PBC structure and confidential computing architecture make personal AI that serves the user's interests — a fundamentally different product. The Meta/Limitless acquisition proves the point: big tech buys personal AI to centralize it.

3. **Privacy is becoming a competitive advantage, not a constraint.** Regulated industries (legal, healthcare, finance) can't use general-purpose AI APIs because of data sovereignty requirements. Privacy-preserving personal AI unlocks enterprise markets that ChatGPT can't enter. And post-GDPR/CCPA, consumer privacy preferences are shifting.

4. **Augmentation creates economic relevance; automation destroys it.** The question isn't "which is more productive" but "which preserves human agency?" Workshop's thesis is explicitly political: if humans have no economic value, they have no political leverage. Augmentation preserves the human-in-the-loop not for efficiency reasons but for democratic reasons.

5. **The Intelligence Curse is predictive, not analogical.** Drago and Laine argue the resource curse isn't just an analogy — it's a structural prediction about what happens when a powerful actor no longer needs its population for value creation. The intelligence version is worse because *"you can't run out of AI like you can with oil"* and AI replaces the need for humans *"across the economy, military, and government bureaucracy entirely."*

---

## Competitive Landscape

| Company | Approach | Status | Key Difference vs. Workshop |
|---------|----------|--------|---------------------------|
| **Limitless AI (fmr. Rewind)** | Screen recording + searchable memory | Acquired by Meta (Dec 2025); shutting down original product | Validated category, then centralized it — exactly what Workshop argues against |
| **Microsoft Recall** | Native Windows screen memory | Shipping in Copilot+ PCs | Platform feature, not privacy-preserving; Microsoft owns the data |
| **Proton Lumo** | Zero-access encrypted AI assistant | Beta (2025) | Pure privacy play but no fine-tuning — no personalization beyond context |
| **Screenpipe** | Open-source local screen recording + AI | Shipping ($400 lifetime) | Local-first but no cloud training infrastructure; individual developer project |
| **Pieces** | Developer-focused AI memory | Shipping | Vertical (developers only) with on-device nano models |
| **Personal.ai** | Digital twin for enterprise | Shipping | Enterprise-focused, different privacy architecture |
| **Mechanize** | "Automate the whole economy" | Backed by Nat Friedman, Daniel Gross, Patrick Collison, Jeff Dean | Philosophical opposite — explicitly building what Workshop is building against |

**Key competitive dynamics:**

1. **The Limitless acquisition reshapes the landscape.** Meta buying the category leader validates demand but also removes the most direct competitor. Workshop's privacy-first positioning becomes more differentiated, not less, when the alternative is Meta owning your personal AI.

2. **Mechanize is the intellectual antagonist.** Founded by Epoch AI alumni to *"automate the whole economy."* Co-founder Matthew Barnett estimated *"a 2-in-3 probability that AGI drives human wages below subsistence levels within 100 years"* — and founded the company anyway. Workshop's "Technocalvinism" essay is a direct rebuttal. The Mechanize vs. Workshop debate is a proxy for the industry's deepest question: should AI augment or replace human labor?

3. **Platform companies are the real threat.** Apple, Google, and Microsoft are all adding personal AI features into their operating systems. Workshop's bet is that platform-native personal AI serves the platform's interests (engagement, data extraction), not the user's — and that a PBC with confidential computing offers something structurally different. This is a bet on values differentiation, which historically has a mixed track record (Signal vs. WhatsApp is the bull case; every privacy-first social network vs. Facebook is the bear case).

---

## Qualitative Assessment

**Conviction Level: MEDIUM**

### Bull Case:

1. **The intellectual framework is genuinely original and rigorous.** The Intelligence Curse isn't a blog post — it's a 7-part essay series endorsed by Nobel laureates, covered in TIME, cited in AI 2027 scenario analysis, and debated on LessWrong. Most AI startups have a product looking for a narrative. Workshop has a narrative so compelling it attracted investors, media, and talent before the product was built. This is the rarest kind of founding story: a thesis so well-articulated that the company feels inevitable.

2. **The team's research backgrounds are surgically relevant.** Rudolf's SAD benchmark (LLM self-awareness, used by OpenAI) directly informs building personalized models that behave faithfully. Addie Foote's NeurIPS spotlight on robust unlearning directly enables user control over personal data. Tim Kostolansky's chain-of-thought monitoring directly supports trustworthy personalized inference. This isn't "smart people from good schools" — it's specific published research that maps to specific product requirements.

3. **The investor composition tells a coherent story.** Brad Burnham (20-year thesis on user-owned data), Brendan McCord (AI + philosophy, published Luke's essay), Juniper Ventures (AI safety fund backed by Jan Leike and Woj Zaremba), Seldon Lab (AI security accelerator). These aren't hype-cycle investors — they're people who have been thinking about this specific intersection of AI safety, data ownership, and human agency for years.

4. **The technical open-source play (Trellis) demonstrates real capability.** 50x speedup on post-training for a trillion-parameter model, with specific innovations (dequantization optimization, expert parallelism) that show genuine ML infrastructure depth. This addresses the "can this team actually build?" question that the thesis-heavy narrative might otherwise leave open.

5. **The Meta/Limitless acquisition validates the timing.** The personal AI category leader getting absorbed by big tech in December 2025 is the strongest possible signal that the market exists — and creates a specific opening for a privacy-first alternative. Workshop's PBC structure and confidential computing architecture are positioned precisely for this moment.

### Key Risks:

1. **The product is embryonic.** Evergreen is in beta with no disclosed user numbers, engagement metrics, or retention data. The gap between "brilliant thesis" and "product people use daily" is enormous. Many companies with great narratives have failed at product-market fit.

2. **"Augmentation beats automation" is an empirical claim that may be wrong.** If fully autonomous AI agents outperform human+AI augmentation on most economically valuable tasks, Workshop's thesis becomes a moral argument without an economic engine. The Alignment Forum skeptic is right to point out that *"generally making humans+AI more competitive"* may not work if the AI alone is just better.

3. **Privacy-preserving AI has a performance and cost penalty.** Confidential computing enclaves add latency and constrain hardware utilization. If the privacy overhead makes Workshop's personalized models noticeably worse than general-purpose alternatives, users will choose performance over privacy — as they historically have.

4. **Extremely early stage with undisclosed funding.** A pre-seed company with ~5-7 people competing against platform companies with billions in resources. The funding amount isn't disclosed, which likely means it's small. They need to demonstrate product traction quickly to raise a meaningful seed round.

5. **The thesis might attract mission-aligned users but not mainstream users.** People who care about the Intelligence Curse and AI-driven economic displacement are a specific, relatively small audience. The mass market wants a personal AI that works well, not one that preserves their democratic agency. Workshop needs a product value proposition that stands independent of the thesis.

**Bottom Line:** Workshop Labs is the most intellectually rigorous company I've evaluated at this stage — the Intelligence Curse thesis, endorsed by Nobel laureates and debated in serious forums, provides a founding narrative that most companies spend years trying to develop after launch. The team has surgically relevant research backgrounds (LLM self-awareness, robust unlearning, CoT monitoring) and the investor composition reflects deep thematic alignment rather than trend-chasing. But this is a pre-product company. The thesis is exceptional; the evidence that it translates into a product people will use daily is zero. The primary question isn't "is this team smart?" or "is this thesis right?" — it's "can a PBC with confidential computing and personalized fine-tuning build a consumer product that competes on experience, not just values?"

**Verdict: Workshop Labs is a thesis-first company with rare intellectual depth, a surgically relevant research team, and thematically aligned investors — but zero product validation. MEDIUM conviction reflects the gap between one of the most compelling founding narratives in current AI and the complete absence of product-market evidence. Worth watching closely for Evergreen beta metrics, Trellis adoption, and seed round details.**

---

*Research compiled: March 2026*
