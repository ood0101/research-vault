# Core Automation

**Website:** [coreauto.com](https://www.coreauto.com)
**HQ:** San Francisco, California
**Founded:** January 2026 (incorporated shortly after Tworek's OpenAI departure)
**Structure:** Delaware C-Corp (stealth-era)
**Stage:** Seed / Early — emerged from stealth April 22, 2026
**Current Fundraise:** Targeting up to **$1B at ~$4B valuation** (per *The Information*, May 7, 2026 — 6-week-old company at announcement)
**Disclosed Investors:** Not yet public (round in progress)
**Notable Public Endorsers:** Jacob Effron (Redpoint, podcast host who broke much of the coverage)
**Twitter:** [@CoreAutoAI](https://x.com/CoreAutoAI)

---

## The Big Audacious Idea

**Build the world's most automated AI lab — starting by automating its own research.** A small team of frontier researchers, each paired with highly capable AI agents, taking on work that previously required entire organizations of hundreds of engineers and researchers. The bet is that the next step-change in AI will *not* come from scaling the current recipe (larger models, more data, static deployment) but from:

1. **New learning algorithms** that supersede large-scale pretraining and reinforcement learning
2. **Architectures that scale better than transformers**
3. **A small-team-plus-agents operating model** that compounds research velocity

Core Automation's stated vision goes further: if the bet works, *small teams with powerful AI systems will take on work that once required entire organizations*. "A corner store with the logistical capabilities of a multinational corporation. A small workshop with demand from around the world. A project that starts in a group chat and grows far beyond its origins." The thesis is that AI doesn't just make existing institutions more efficient — it dissolves the need for organizations as the basic unit of ambitious work.

The lab's own operating model is the prototype. **Automate your own research first; what you learn feeds back into the research itself.**

---

## The Problem That's So Hard to Solve

The deep belief animating Core Automation — and the dozens of "Neo Labs" (Thinking Machines, Safe Superintelligence, AMI Labs, Ineffable Intelligence, Ricursive, Periodic, Humans&, etc.) that have emerged in 2024-2026 — is that **the current paradigm of "scale transformers via pretraining + RLHF + post-training" is exhausted**, or at least no longer producing the gains it once did. Tworek's own framing of why he left OpenAI: deep learning research, in the form practiced at OpenAI through GPT-5, is *"done"*; the interesting research is now elsewhere.

The specific technical bets being made implicitly (the company is still stealth on most details):

1. **Continual / online learning.** Per *The Information*: *"Core Automation plans new AI models with continual learning"* — the ability for models to learn from new experience after deployment, rather than the current snapshot-and-freeze paradigm. This is a long-sought capability that current frontier labs have struggled to crack.

2. **New optimizers and learning algorithms.** Rohan Anil's prior work at Google was deeply in this area (Shampoo, Distributed Shampoo, SOAP, and other large-scale optimization advances). The bet is that there are still order-of-magnitude gains available from better optimizers, not just larger compute.

3. **Architectures beyond transformers.** Anmol Gulati's prior work (Conformer architecture, Gemini long-context retrieval) suggests deep architectural intuition. The bet is that *something* — state-space models, hybrid attention, novel inductive biases, or some yet-unpublished idea — outperforms transformers at scale.

4. **Research-process automation.** The most concrete and operationally distinct bet. "Systems that automate the process of building itself" (Gulati's framing) — agentic pipelines for experiment design, hyperparameter search, evaluation, training-run management, paper-writing. Every other frontier lab is *researcher-bottlenecked*; Core Automation wants to be *compute-bottlenecked*.

The hard part is that each of these bets has been pursued — and largely failed to deliver — by the major labs. Continual learning is *the* unsolved problem of LLMs. Better optimizers have produced 10-20% gains, not 10x. Architecture search has not yet produced a clear post-transformer winner. Research automation is in vogue (Sakana AI's AI Scientist, DeepMind's AlphaResearch concepts, OpenAI's own internal tooling) but has not produced production breakthroughs.

Core Automation's wager: a small team with the *right* mix of expertise — and the willingness to ignore the existing recipe — will succeed where 5,000-person labs got stuck. As Tworek put it on the Jacob Effron podcast (paraphrased from his X quote): *"100 researchers thinking the same thing = 1 researcher."*

---

## The Technology Stack

Core Automation is in stealth on technical specifics. What can be inferred from public messaging, hires, and Tworek's prior work:

### Three explicit research directions (per company homepage)

1. **New learning algorithms** beyond pretraining + RL
2. **New architectures** scaling better than transformers
3. **A research-automation stack** — agentic systems orchestrating experiments, evaluation, and iteration

### What the hires suggest

- **Tworek's o1/o3/Codex lineage** → strong RL + reasoning expertise; likely focus on reasoning-time scaling and continual learning
- **Anil's Gemini + optimizer work** → large-scale training, distributed optimization, model architectures
- **Gulati's Conformer/Gemini work** → speech, long-context retrieval, multimodal architecture
- **Sai Surya Duvvuri (ex-Google, ex-Meta intern)** → fundamental research background

### What the model itself looks like

Almost certainly *not* a competitor to GPT-5/Claude-5/Gemini-3 as a chat product. The company explicitly says it is not building a consumer product or even a typical foundation model. Instead, the artifact is *the lab itself* — an operating model where small teams + agents produce frontier research at speeds that big labs cannot match.

Whether what they ship is a model, a research paper, a developer platform, or something else entirely is genuinely unclear from public information. Tworek's Jacob Effron interview characterizes the bet as "types of research that are hard to do at OpenAI" — not as a product roadmap.

---

## What the World Looks Like If This Works

1. **Frontier AI research becomes high-leverage individual-contributor work.** A single researcher with an agentic pipeline can run 100 experiments in parallel, iterate on architectures weekly, and ship insights that previously required teams of 50. The 5,000-person frontier lab becomes obsolete the way the 50,000-person semiconductor design house became obsolete with EDA tools.

2. **The "Neo Lab" thesis is validated as a structural shift.** If Core Automation produces meaningfully new research within 18-24 months, it confirms that the talent dispersion from OpenAI/Anthropic/DeepMind into focused startups is not a fluke but a permanent restructuring of how frontier AI is produced. The big labs continue to dominate productization; small labs dominate fundamental research.

3. **Continual learning becomes a default capability.** If Core Automation cracks online learning, every shipped AI system — from coding agents to medical diagnostics — improves with usage. This is the missing piece for true "agentic AI that gets better at your specific job."

4. **Post-transformer architectures emerge.** State-space models, hybrid attention, new inductive biases — *something* displaces vanilla transformers at frontier scale. Core Automation is positioned to be one of the labs that ships it.

5. **The "research-automation" layer becomes a category.** Tools that orchestrate AI research workflows (experiment management, automatic evaluation, agentic literature review, automated training-run analysis) become a real software category — comparable to how MLOps emerged in 2018-2022. Core Automation may release internal tools that seed this market.

6. **Tworek becomes one of the defining figures of post-OpenAI AI.** His prior position (VP of Research at OpenAI driving o1/o3/Codex) was already top-tier; if Core Automation succeeds, he joins Sutskever/Murati/LeCun as one of the named founders of the post-scaling era.

---

## Best Case Scenario / Addressable Opportunity

Core Automation is best understood as **an AI research lab valued like a frontier model company, not an applications company**. Pricing reference points:

- **Safe Superintelligence (Sutskever):** ~$30B valuation at last raise on roughly zero public revenue
- **Thinking Machines Lab (Murati):** ~$10B+ valuation, $1B+ raise, NVIDIA partnership
- **Ricursive Intelligence:** $4B valuation in 4 months
- **AMI Labs (LeCun):** $1B raise, ~$10B+ valuation
- **Ineffable Intelligence (David Silver, DeepMind):** $1.1B raise
- **Humans& (ex-OpenAI):** $480M raise at $4.5B valuation
- **Periodic Labs (ex-OpenAI):** ~$7B valuation in talks

By this standard, Core Automation's reported **$4B valuation target at 6 weeks old** is consistent with — and possibly conservative relative to — the broader Neo Lab market. If the team executes for 18-24 months and produces visible technical artifacts (papers, models, demos), the next-round valuation in the $15-30B range is plausible.

**What does success look like financially?**
- A genuine architectural or learning-algorithm breakthrough → acquired by NVIDIA/Microsoft/Google at $50B+, or IPO at $100B+ valuation in 4-6 years
- A "very good research lab" that produces strong papers and a moderate model → acquired by a hyperscaler at $5-15B
- A research result that influences the field but doesn't produce a defensible product → quiet absorption (acqui-hire) at the high single digit billions

The downside risk is mostly *time* and *opportunity cost* — these companies rarely fail outright with this caliber of team; the risk is they produce work that's *interesting* but not *category-defining*.

---

## The Science: A Brief History

**2019–January 2026: Tworek at OpenAI.** Joined as a research scientist; rose to VP of Research. Led work on:
- **Codex** — the predecessor to GitHub Copilot, the first significant code generation model
- **GPT-4** — co-author on the broader research effort
- **o1** — the breakthrough reasoning model released September 2024 that demonstrated chain-of-thought reasoning as a scalable axis
- **o3** — the further-scaled reasoning model
- **ChatGPT** — broader contribution to OpenAI's product

By early 2025, Tworek was one of the half-dozen most senior research executives at OpenAI. His departure was a meaningful event in AI talent flow.

**January 2026: Tworek leaves OpenAI.** Public statements indicate dissatisfaction with the type of research possible at OpenAI's current scale and commercial pressure. His "Core Memory" interview ("He Left OpenAI to Think Bigger") and Jacob Effron podcast (Ep. 81) lay out the thesis: scaling-as-recipe is exhausted; he wants to pursue fundamentally new directions.

**January 28, 2026: First *The Information* coverage** — *"Ex-OpenAI Researchers' Startup Targets $1 Billion Funding to Develop New Type of AI."* The piece reveals continual learning as a focus.

**Through Q1 2026: Recruitment wave.** Tworek "nerdsnipes" multiple senior researchers from Anthropic and Google DeepMind. The team forms quickly — within 2-3 months of founding.

**April 21-22, 2026: Public emergence.**
- First X post: *"Building the world's most automated AI lab."*
- Anthropic researcher Rohan Anil posts that he left Anthropic to join.
- Anmol Gulati posts that he left DeepMind Gemini work to join.
- BusinessInsider reports the wave of departures: *"New AI lab Core Automation 'nerdsniped' researchers from Anthropic, Google DeepMind."*
- The Decoder, BusinessInsider, multiple Reddit r/singularity threads, and the AI commentary ecosystem cover the launch.

**May 7, 2026: *The Information* reports $4B valuation target** — *"Ex-OpenAI Researcher's Six-Week-Old Startup Targets Funding at $4 Billion Valuation."*

### "Why Now" Convergence

- **The scaling-laws-are-tapping-out narrative** became consensus among insiders by late 2025. GPT-5 underwhelmed; Claude 4.5 underwhelmed; Gemini 3 underwhelmed. The marginal returns from "bigger model + more data + longer training" visibly fell.
- **The "Neo Lab" wave** crested in early 2026. Sutskever, Murati, LeCun, David Silver, Yann LeCun, and dozens of others left big labs to pursue fundamentally different research bets. The funding environment was uniquely receptive.
- **Agentic AI maturity** — by 2026, AI agents had become capable enough that small teams could realistically use them to multiply their research throughput. The "research automation" thesis became technically viable, not just aspirational.
- **OpenAI's internal dynamics** — by 2026, OpenAI had become large enough that fundamental research (long-horizon, speculative, paradigm-shifting) was structurally hard. The departures of Sutskever, Murati, Tworek, and many others reflect that.

---

## Commercial Validation

Core Automation is pre-commercial — they have shipped no product and disclosed no revenue. What they have:

| Validation | Source |
| --- | --- |
| **Targeting $1B raise at $4B valuation** at 6 weeks old | *The Information*, May 7, 2026 |
| **CEO is ex-OpenAI VP of Research** (drove o1, o3, Codex, contributed to GPT-4) | Multiple |
| **Distinguished hires from Anthropic and DeepMind** within first 60 days | Public X announcements + BusinessInsider |
| **Rohan Anil's joining** — ~31k Google Scholar citations, Gemini co-author, ex-DeepMind Distinguished Engineer | His own X post |
| **Anmol Gulati's joining** — Gemini and Conformer architect | His own X post |
| **Joanne Jang's joining** — ex-OpenAI GM (Dec 2021 – April 2026) | LinkedIn / X bio |
| **Julia Villagra's joining** — ex-OpenAI Head of People | BusinessInsider |
| **Inclusion in the "Neo Lab" tracker** alongside Thinking Machines, SSI, AMI Labs, Ineffable, Periodic, Humans&, Hark, Recursive | cleverhack.com |
| **Top-tier press coverage** within 48 hours of emergence: BusinessInsider, The Decoder, The Information, multiple Reddit threads | April 22, 2026 |
| **Jacob Effron podcast** (Redpoint Ventures) — Ep. 81 of Effron's podcast was Tworek's first major post-OpenAI interview | January 21, 2026 |

---

## Core Team

### Jerry Tworek — CEO and Co-Founder

| Background | Detail |
| --- | --- |
| Prior | **VP of Research at OpenAI, 2019–2025** (some sources say January 2026 departure). Drove the development of **o1, o3, and Codex**. Contributed to GPT-4. Joined OpenAI early enough to be one of the architects of the modern reasoning-model era. |
| Personal site | [millionintegrals.com](https://millionintegrals.com/) |
| Twitter | [@MillionInt](https://x.com/MillionInt) |
| Public profile | Top-tier figure in AI research; described in his Jacob Effron podcast interview as *"one of the most influential (and least public) figures behind the modern AI boom."* |

**What's notable:** Tworek is one of the most credentialed individual contributors to leave OpenAI to date. The o1/o3 line — the breakthrough reasoning models that defined OpenAI's 2024-2025 product strategy — was largely driven by his team. He is the rare combination of (a) deeply technical (his homepage describes him as a "research lead focused on teaching language models to solve problems within Science, Technology, Engineering, Mathematics and Programming"), (b) operationally proven (VP of Research = managed researchers, hired researchers, set strategy, ran training runs), and (c) low-public-profile (unlike Ilya, Mira, or Yann, he was relatively unknown to the broader AI community until his departure). The combination of "highest-tier technical depth + executive operating experience + clear founder mission + restraint on public profile" is exactly the founder template that defines successful Neo Labs.

### Rohan Anil — Co-Founder / Founding Researcher

| Background | Detail |
| --- | --- |
| Prior at Anthropic | Senior researcher (joined from DeepMind; departed Anthropic Q1 2026 to join Core) |
| Prior at Google DeepMind | **Distinguished Engineer** until January 2025 — **led work on Gemini models**. Co-author on Gemini foundational paper. |
| Citation count | ~31,000 on Google Scholar |
| Notable work | Foundational work on large-scale optimization (Shampoo / Distributed Shampoo optimizers), Gemini, Gemma, distributed training |
| Twitter | [@_arohan_](https://x.com/_arohan_) |

**What's notable:** Anil is one of the most respected researchers in large-scale ML systems, with a particular strength in optimization algorithms. The Shampoo optimizer family (which he and collaborators developed) is one of the few real post-Adam advances in deep learning optimization. His Gemini work at DeepMind put him at the center of Google's frontier-model effort. His move from DeepMind → Anthropic → Core Automation in roughly 18 months is itself a remarkable signal of how mobile the very top AI talent has become. Per BusinessInsider, *"Jerry Tworek nerdsniped me into starting this with him and others"* — language that strongly implies co-founder status and that Anil is at the technical core of whatever Core Automation is building.

### Anmol Gulati — Founding Researcher

| Background | Detail |
| --- | --- |
| Prior | Research scientist at Google DeepMind; worked on **Gemini** (long-context retrieval, multimodal architecture). Earlier: co-author of the **Conformer** architecture (speech recognition; ICASSP 2020) — one of the most influential post-2020 architectures in speech ML. |
| Education | Indian Institute of Technology |
| Twitter | [@anmol01gulati](https://x.com/anmol01gulati) |

**What's notable:** Gulati is an architecturally-deep researcher with significant prior contributions to scalable architectures. His public statement framing the bet — *"I've increasingly felt that the current research paradigm — scaling models, data, and static deployment won't get us all the way... new learning algorithms, architectures beyond today's stack, and systems that automate the process of building itself"* — is the cleanest single-sentence articulation of Core Automation's thesis. The fact that someone of his caliber is so on-message at public launch suggests he is centrally involved in setting the technical direction.

### Other Confirmed Joiners

| Name | Prior |
| --- | --- |
| **Joanne Jang** | General Manager at OpenAI (Dec 2021 – April 2026). Her X bio reads *"trying to automate myself @coreautoai."* Brings operational/product depth. |
| **Julia Villagra** | Ex-Head of People at OpenAI. People/ops leadership. |
| **Ehsan Amid** | Ex-Google DeepMind researcher. |
| **Avery Lamp** | Ex-Google DeepMind. |
| **Sai Surya Duvvuri** | Ex-research intern at Google and Meta. |
| **Dilip Krishnan** | Listed on LinkedIn at Core Automation. LLM background. |

The team composition is heavily research-weighted, with explicit operational coverage (Jang on product/GM; Villagra on people/HR). The implied team size at launch was 8-15 people — small, dense, and deliberately so per the company's "small teams with capable agents" thesis.

---

## Investor Depth

Core Automation has not publicly disclosed its investor roster as of the latest public reporting (May 7, 2026). What is known:

- **Targeting up to $1B** in the current round (per *The Information* and LinkedIn coverage)
- **$4B valuation target** at 6 weeks of company age — implying ~25% dilution if the full round closes
- **Multiple major VCs reportedly in discussions** but no public confirmations as of last coverage

### Likely investor profile (inferred from Neo Lab comparables)

The investor mix for similar Neo Labs in 2024-2026 has been:
- **Hyperscaler strategic capital:** NVIDIA (Thinking Machines, others), Microsoft, Google
- **Top-tier tech VCs:** Andreessen Horowitz, Sequoia, Founders Fund, Lightspeed
- **AI-specialist funds:** Khosla, Conviction, Felicis, NFDG
- **Sovereign / strategic LPs:** UAE entities, Norwegian / Saudi sovereign wealth, etc.

For a company at this valuation profile with this team, expect a Series A led by one or more of the above, with multi-billion-dollar participation from a hyperscaler infrastructure partner (compute access is a key term for Neo Labs at this scale).

### What the funding signal tells us

A $4B valuation at 6 weeks for a company that has shipped no product is **the strongest possible signal of investor faith in the founding team**. It is also a clear statement of the broader Neo Lab thesis: that talent flow from established labs is *the* defining feature of the 2025-2027 AI investment landscape, and that the people who built o1/Gemini/Claude are worth backing at frontier-lab prices the day they leave their employers.

This valuation is, however, **also a significant risk indicator**. Companies funded at $4B at concept stage need to grow into 5-10x larger valuations to make venture economics work — meaning Core Automation has 18-36 months to produce technical or commercial validation that justifies a $20-40B next-round valuation. If the technical breakthroughs don't materialize on that timeline, the round becomes overhanging dilution.

---

## Hiring Signals & Strategic Direction

The company's homepage has a single CTA: *"Want to join us? hello@coreauto.com"*

What this implies about strategic direction:

1. **Recruiting is the primary go-to-market motion.** At seed stage with no product, the most valuable thing Core Automation can do is concentrate the world's best AI research talent. Every senior researcher hire is worth more than any technical milestone.
2. **The team will stay small.** "Small teams with capable agents" is a stated thesis. Expect headcount in the 15-50 range for 18-24 months, not 200-500. This is structurally different from how Thinking Machines or SSI are scaling (both have been more aggressive on headcount).
3. **The hires will continue to be from the very top of frontier labs.** Tworek's "nerdsnipe" mechanic — pulling specific named senior researchers from Anthropic, DeepMind, OpenAI by giving them a research bet they personally find more compelling than their current work — is structurally hard for big labs to defend against. Expect more high-profile departures from Anthropic and DeepMind into Core Automation throughout 2026-2027.
4. **The lab itself is the artifact.** No public product roadmap. No demo. No public model. The thing being built is a research organization optimized for a specific kind of work; the technical outputs (papers, models, demos) will follow.

---

## Conference & Media Presence

**As of May 2026, Core Automation has chosen a deliberately minimal public profile:**

- Single static homepage, no blog, no public papers
- Active Twitter (@CoreAutoAI) for hiring announcements only
- Public-facing communications driven by individual researchers' Twitter posts, not company channels
- One major podcast interview (Jacob Effron, Ep. 81, January 2026 — Tworek)
- No conference appearances under the Core Automation brand yet

**Expected next-12-month presence:**
- Initial technical papers or blog posts — likely small but high-quality artifacts demonstrating the research direction
- NeurIPS / ICLR / ICML submissions in 2026-2027
- Possible MLSys-adjacent paper on the research-automation pipeline itself
- Continued individual-researcher Twitter presence as recruiting funnel

This is the same minimal-public-profile playbook used by SSI in its first year. Whether it persists or shifts to a more conventional model-release cadence depends on what they ship.

---

## Why This Is a Non-Consensus Bet

**What the consensus thinks:**
1. The big labs (OpenAI, Anthropic, Google DeepMind) have insurmountable compute, data, and talent advantages — no new lab will catch up.
2. Most "Neo Labs" (Thinking Machines, SSI, AMI, etc.) will end up either acquired or marginalized; only one or two will become category-defining companies.
3. "Continual learning" and "post-transformer architecture" have been promised for years and have not materialized — bets on these are speculative research, not commercial product.
4. $4B at 6 weeks is a clear valuation bubble — the Neo Lab funding rounds will look ridiculous in retrospect.

**What Core Automation (and its backers) believe differently:**
1. **Talent concentration > compute concentration at the research frontier.** The big labs' compute advantage matters for product (deploying ChatGPT-scale services); it matters less for fundamental research breakthroughs, where a small dense team with strategic compute access can outperform a 5,000-person org.
2. **The scaling-as-recipe paradigm is genuinely exhausted at the very top.** This is not bluster from departing researchers; it is the explicit, on-the-record view of Tworek (who shipped o1/o3), Sutskever (chief scientist of OpenAI through the GPT-4 era), Anil (Gemini lead), Murati (CTO of OpenAI through GPT-4o), and LeCun (Meta CAS). When 8-10 of the most senior architects of the current paradigm all say the same thing, it is most likely true.
3. **The research-automation thesis is unique.** No other Neo Lab is publicly committing to "automate the research process itself" as a first-class objective. If Core Automation cracks this, it has a structural research-velocity advantage that compounds over time.
4. **$4B is cheap if the bet works.** At Neo Lab valuations, the upside multiplier on a true paradigm-shifting research breakthrough is 50-100x in 5-7 years. Even at 10% probability of that outcome, the expected value at $4B is well in excess of the cost of capital.

---

## Competitive Landscape

Core Automation operates in the **"Neo Lab"** category — research-first AI startups founded by departing senior researchers from frontier labs.

| Company | Founder | Thesis | Stage |
| --- | --- | --- | --- |
| **Thinking Machines Lab** | Mira Murati (ex-OpenAI CTO) | Hardware-software co-design + post-training | ~$10B+ valuation, NVIDIA partnership |
| **Safe Superintelligence (SSI)** | Ilya Sutskever (ex-OpenAI Chief Scientist) | Direct path to safe superintelligence | ~$30B valuation |
| **AMI Labs** | Yann LeCun (ex-Meta CAS) | World models, joint embedding architectures | $1B raise, 2025 |
| **Ineffable Intelligence** | David Silver (ex-DeepMind, AlphaGo) | RL without human data, self-play at scale | $1.1B raise, April 2026 |
| **Ricursive / Recursive Intelligence** | (ex-Big Tech) | Self-improving AI | $4B valuation in 4 months |
| **Periodic Labs** | (ex-OpenAI) | AI for science | ~$7B valuation talks |
| **Humans&** | (ex-OpenAI) | TBD | $4.5B valuation, $480M seed |
| **Logical Intelligence (Aleph)** | (LeCun on board) | Formal reasoning / verified code generation | Series in progress |
| **Sooth Labs** | AI Pioneers | Models to predict events | Stealth → public April 2026 |
| **Flapping Airplanes** | TBD | Beyond scaling — data-first AI | $180M, Jan 2026 |
| **Standard Intelligence** | TBD | Computer-use agents from video | In this vault |
| **General Intuition** | (ex-frontier) | Spatial reasoning from gameplay | $134M seed, in this vault |
| **Core Automation** | Jerry Tworek (ex-OpenAI VP of Research) | Beyond pretraining/RL + automated research lab | Targeting $1B at $4B valuation, May 2026 |

**Core Automation's positioning differentiation:**
- **Unique technical thesis** — research-automation as first-class objective is distinct from every other Neo Lab
- **Strong RL/reasoning lineage** — Tworek's o1/o3 work is arguably the most recent "real breakthrough" from OpenAI, more recent than Sutskever's last shipped work
- **Aggressive top-talent recruiting** — the "nerdsnipe" mechanism is unusually effective for this founding team
- **Smaller intended scale** — explicitly committed to staying small in headcount, unlike SSI/Thinking Machines/AMI Labs which are scaling more aggressively

---

## Qualitative Assessment

**Conviction Level: HIGH**

### Bull Case

1. **The founding team is among the strongest in the Neo Lab category.** Tworek (VP Research at OpenAI, drove o1/o3) + Anil (Gemini Distinguished Engineer) + Gulati (Gemini, Conformer) is a constellation of researchers that no other 2026 startup has matched. The bench depth (Jang on operations, Villagra on people, multiple ex-DeepMind researchers) is genuinely complete.
2. **The thesis is internally consistent and aligned with the strongest insider consensus.** When the people who shipped the current paradigm all say "the current paradigm is exhausted," they're probably right. Core Automation is positioned to capitalize on that insight.
3. **Research-automation is a uniquely defensible differentiation.** Every other Neo Lab is "small frontier model team with new ideas." Core Automation is "small frontier model team with new ideas + a research-automation pipeline that compounds velocity." The latter has been demonstrated at small scales (Sakana AI Scientist, DeepMind FunSearch) and could provide structural advantages at frontier scale.
4. **The funding environment is uniquely receptive.** $4B valuation at 6 weeks reflects an investor consensus that this team will produce; the next round will be at $15-30B valuation if any visible artifacts ship. This funding ladder is precisely what's needed to compete on compute scale with Anthropic and DeepMind.
5. **Tworek's restraint on public profile is a positive signal, not negative.** Unlike some Neo Lab founders who optimize for media attention, Tworek's profile is low-key — focused podcast appearance, minimal Twitter, technical homepage. This is the dispositional pattern of researchers who actually ship.

### Key Risks

1. **The technical thesis (post-transformer architectures + continual learning) may not yield breakthroughs on a venture timeline.** Both of these are 10+ year research problems that the big labs have invested billions into without conclusive results. Even with the best team, the probability of a "real" breakthrough in 24-36 months is uncertain.
2. **The "research automation" pipeline could be more hype than substance.** Sakana AI Scientist, Auto-AI, and similar agent-driven research tools have produced interesting demos but no production breakthroughs. The intermediate failure mode is Core Automation ships *automation tooling* that's neat but not transformative, and never produces the underlying research breakthroughs the automation was supposed to compound.
3. **Big labs may close the gap on continual learning.** OpenAI, Anthropic, and DeepMind are all working on online learning. If one of them ships a real version (and they have far more compute), Core Automation's lead window may not exist.
4. **Valuation overhang is real.** $4B at 6 weeks → needs to be $20-40B in 24-36 months to make Series A economics work. If artifacts don't materialize on time, the company faces a flat or down round, which is materially bad for talent retention and recruitment.
5. **Founder concentration risk on Tworek.** As with most founder-led research labs, the company's identity, recruiting power, and technical direction are heavily concentrated in one person. Any disruption to Tworek's involvement would be disproportionately damaging.
6. **Team poaching dynamics work both ways.** The same "nerdsnipe" mechanism that pulled Anil from Anthropic could pull Core Automation's researchers to the *next* Neo Lab in 18 months. Researcher retention is a structural risk.
7. **The lab may produce no shipped artifacts at all.** Some Neo Labs (notably SSI) have been operating for >18 months with zero public artifacts. Core Automation may follow the same pattern — which makes the bet entirely faith-based on the team rather than evidence-based on results.

### Bottom Line

Core Automation is among the most credible 2026 Neo Lab bets — a thesis-driven, team-first research lab founded by one of the most credentialed researchers to leave OpenAI in the past decade, with a unique focus on automating the research process itself. The team density, investor signal ($4B at 6 weeks), and clarity of technical bet are all top-decile in the Neo Lab category.

The bet is structurally venture-appropriate: high probability of being interesting, moderate probability of being category-defining, low probability of clear failure. The downside outcome is "interesting but absorbed by a hyperscaler at high-single-billion valuation"; the upside is "the lab that proves automated research produces real frontier breakthroughs," which is a $50B-$100B+ outcome.

**Verdict: A top-tier Neo Lab bet, defined by exceptional founder quality, a structurally novel research-automation thesis, and the strongest possible team signal (sustained "nerdsnipe" recruiting from Anthropic and DeepMind in the first 60 days). The signal-to-noise ratio on team is among the highest in the entire 2026 frontier AI landscape. The bet is on whether the research-automation thesis translates into compounding velocity at frontier scale — a thesis that has been technically aspirational for years and may finally be ready for execution. Worth tracking closely.**

---

*Research compiled: May 2026*
