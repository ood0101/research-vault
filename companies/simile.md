# Simile

**Website:** [simile.ai](https://www.simile.ai)
**HQ:** Suite 315, 435 Tasso St, Palo Alto, CA 94301
**Founded:** 2025
**Structure:** C-Corp
**Stage:** Series A ($100M, February 12, 2026)
**Lead Investor:** Index Ventures (Shardul Shah)
**Other Investors:** Bain Capital Ventures, Hanabi Capital, A*, CVS Health Ventures
**Angels:** Andrej Karpathy, Fei-Fei Li, Adam D'Angelo, Guillermo Rauch, Scott Belsky
**Team Size:** 11–50
**Legal Counsel:** [Latham & Watkins](https://www.lw.com/en/news/latham-advises-simile-ai-inc-on-us-100-million-series-a)
**Blog:** [simile.ai/blog](https://simile.ai/blog/the-simulation-company)
**Index Ventures writeup:** ["Life, the Universe, and Simile"](https://www.indexventures.com/perspectives/life-the-universe-and-simile-leading-similes-series-a/)
**CEO Twitter:** [@joon_s_pk](https://x.com/joon_s_pk) | [Launch thread](https://x.com/joon_s_pk/status/2022023097017421874)

---

## The Big Audacious Idea

**Build the first AI simulation of society populated by digital twins of real humans — and replace the $150B market research industry in the process.**

Simile creates "generative agents" — AI replicas trained on two-hour interviews with real people, their transaction histories, and behavioral science data — that predict what those people will do and why. The founding team literally invented generative agents at Stanford. Now they're commercializing the breakthrough.

CEO Joon Sung Park's framing: consequential decisions — which product to launch, which policy to enact, which message to send — should not rely on intuition, small focus groups, or month-long surveys. If you can simulate how real humans react before committing resources, you fundamentally change how organizations make decisions.

**The positioning is not "market research tool."** It's foundational infrastructure for decision-making in an AI-native world. Their stated ambition extends beyond consumer surveys to simulating "trillions of interacting decisions across individuals, organizations, cultures, and states."

No prior seed round was disclosed — Simile went straight to a $100M Series A out of stealth. That's extreme founder leverage built on world-class academic reputations and immediate commercial traction.

---

## The Problem That's So Hard to Solve

### Why traditional research is broken

The global market research industry generates ~$150B annually using fundamentally 20th-century methods:

- **Focus groups** cost $5K–$20K per session, take weeks to organize, and sample ~8–12 people
- **Surveys** capture what people *say* they'll do, not what they *will* do — stated vs. revealed preference gap
- **Polling** struggles with non-response bias, social desirability bias, and declining response rates
- **A/B testing** only works once you've already built and deployed something

All of these methods share a critical flaw: they're **slow, expensive, and small-scale**. By the time results arrive, the decision window has often closed.

### The deeper problem: you can't ask everyone

Even if you could make traditional research instant and free, you'd still be limited by what people *consciously* know about their own behavior. Behavioral science has shown that humans are unreliable narrators of their own decision-making. What people say in a survey diverges from what they do in the real world.

### Why existing "synthetic" approaches fall short

Several competitors have attempted AI-generated synthetic research, but most fall into two camps:

1. **Pure synthetic** (Aaru, Artificial Societies) — generate personas from demographic data and LLM priors. Fast and cheap, but untethered from real human behavior. Essentially asking "what does GPT think a 35-year-old mother in Ohio would do?" — which reflects LLM training biases, not actual human behavior.

2. **AI-conducted interviews** (Listen Labs) — use AI to conduct live interviews at scale. Better than surveys, but still bound by what people consciously report.

Simile's approach is different: ground every agent in a deep interview with a real person, then simulate that person's behavior in novel situations they haven't been asked about.

---

## The Technology Stack

### Architecture: Generative Agents

The core technical approach extends LLMs with three cognitive components:

1. **Memory streams** — complete log of experiences stored in natural language
2. **Reflection mechanisms** — periodically synthesize experiences into higher-level insights
3. **Planning systems** — translate accumulated understanding into coherent future action

Agent twins are constructed from: (a) ~6,500-word qualitative interviews with real people, (b) historic transaction/purchasing data, (c) behavioral science literature.

**Key technical insight:** Simile uses **prompt augmentation**, not fine-tuning. The interview transcript and behavioral data are structured into the agent's prompt context, not used to retrain model weights. This means:
- Agents can be updated with new data without retraining
- The underlying LLM's general reasoning capabilities are preserved
- Thousands of unique agents can be created without per-agent training costs

**Robustness finding:** Even trimmed transcripts (80% shorter than full interviews) retain high accuracy (0.79–0.83 correlation), suggesting the approach captures deep behavioral patterns rather than surface-level details.

### Foundational Papers

**"Social Simulacra: Creating Populated Prototypes for Social Computing Systems" (UIST 2022)**
*The precursor.* First paper from this team on simulating social dynamics with LLMs — designed a system that populates community prototypes with AI-generated members who interact realistically. Established the research trajectory from simulated communities → simulated individuals → simulated real people.
→ [arXiv](https://arxiv.org/abs/2208.04024) | [ACM DL](https://dl.acm.org/doi/abs/10.1145/3526113.3545616) | [Demo](https://social-simulacra.herokuapp.com/)

**"Generative Agents: Interactive Simulacra of Human Behavior" (UIST 2023)**
*The "Smallville" paper.* 25 AI agents in a sandbox world autonomously planned days, formed relationships, spread news, organized a Valentine's Day party — no human intervention. One of the most cited AI papers of recent years. **Best Paper at UIST 2023. Best Paper Honorable Mention, UIST 2025.**
→ [arXiv](https://arxiv.org/abs/2304.03442) | [ACM DL](https://dl.acm.org/doi/10.1145/3586183.3606763) | [GitHub](https://github.com/joonspk-research/generative_agents)

**"Generative Agent Simulations of 1,000 People" (November 2024)**
Direct precursor to Simile as a company. Simulated 1,052 real individuals from two-hour voice interviews.
- **Key result:** Agents replicated participants' responses on the General Social Survey at **85% the accuracy of participants replicating their own answers two weeks later** — equivalent to **90% of human test-retest reliability** in a study of 9,300 responses
- Cross-experiment correlation coefficient of **r = 0.98**
- Outperformed both demographic-based and persona-based agents (ANOVA p < 0.001)
- Architecture reduces accuracy biases across racial and ideological groups vs. agents given demographic descriptions alone
→ [arXiv](https://arxiv.org/abs/2411.10109) | [GitHub](https://github.com/joonspk-research/genagents) | **EMNLP 2025 accepted (oral)**

All codebases are open source — establishing credibility before commercializing. The research trajectory is clear: Social Simulacra (2022) → Generative Agents (2023) → 1,000 People (2024) → Simile (2025).

---

## What the World Looks Like If This Works

If Simile succeeds in building accurate, scalable human simulations:

1. **Product development collapses from months to hours.** Instead of spending 6 months on focus groups, concept testing, and iterative surveys, a CPG company simulates 10,000 customers reacting to 50 product variants in an afternoon. CVS is already doing a version of this across 9,000+ stores.

2. **Polling becomes continuous and instant.** Gallup's partnership signals the transformation: instead of expensive monthly polls with declining response rates, simulate a representative population panel and query it on any question in real-time.

3. **Policy simulation becomes possible.** Governments simulate how populations react to proposed policies before enacting them — healthcare, tax, education. Simile's TED talk and World Economic Forum appearances signal this ambition.

4. **Personalization reaches a new level.** Instead of A/B testing between two options, simulate how each individual customer would react to thousands of personalized variants. Wealthfront's use case (15x research scope) hints at this.

5. **A new form of social science emerges.** Simile enables experiments that would be unethical or impossible with real humans — testing how populations respond to crises, misinformation, or policy shocks at scale.

6. **Simile becomes the infrastructure layer.** Every organization making decisions about people — retailers, pharma, governments, financial institutions — needs a simulation engine. Simile positions as the foundational platform.

---

## Best Case Scenario / Addressable Opportunity

**Core market — Market research industry:** ~$93B annually (ESOMAR Global Report)

**Breakout:**
| Segment | Size | Simile's Play |
|---------|------|---------------|
| Quantitative research (surveys, panels) | ~$50B | Digital twin panels replace traditional survey panels |
| Qualitative research (focus groups, IDIs) | ~$25B | Simulated agents replace in-person qualitative |
| Data analytics & insights | ~$40B | Agent-based predictive analytics |
| Consulting & advisory | ~$35B | Simulation-informed strategy consulting |

**Adjacent and expansion markets:**
| Market | Size | Simile's Entry Point |
|--------|------|---------------------|
| MarTech (marketing technology) | ~$552B | Simulated consumer behavior for targeting/personalization |
| Simulation & analysis software | ~$20B | Human behavior modeling layer |
| Polling & public opinion | ~$5B | Gallup partnership — digital polling panels |
| Product testing | ~$10B | Virtual concept testing, packaging, shelf placement |
| Pharmaceutical market access | ~$8B | Patient behavior simulation, adherence modeling |
| Political consulting | ~$3B | Electorate simulation and message testing |

**Bull case TAM:** If Simile achieves the stated ambition of simulating "trillions of interacting decisions across individuals, organizations, cultures, and states," the addressable market extends far beyond market research into policy simulation, urban planning, defense/intelligence, and enterprise decision infrastructure — a combined opportunity approaching $700B+.

**Why the timing is right:**
- Foundation model capabilities crossed the threshold for believable human simulation in 2023–2024
- Declining survey response rates make traditional research increasingly unreliable (response rates dropped from 36% in 1997 to ~6% in 2018 — Pew Research)
- Enterprise AI budgets are expanding rapidly — 63% of organizations increased AI spending in 2025
- The 1,000 People paper provided the peer-reviewed validation to justify enterprise spend
- Generative AI cost curves dropping 10x annually, making large-scale agent simulation economically viable
- Regulatory momentum around synthetic data and AI ethics creates moats for consent-based approaches

**Simile's pricing:** $150,000 to several million dollars per year (confirmed by CEO in press interviews). Enterprise sales, demo-only, no self-serve.

---

## Why Now — Convergence Factors

Six forces are converging to make Simile's approach viable now but not before:

1. **Foundation model capability threshold crossed (2023–2024).** GPT-4, Claude 3, and Gemini achieved the reasoning and instruction-following quality necessary for believable human simulation. The Smallville paper (UIST 2023) was only possible with GPT-4-class models.

2. **Generative AI cost curves dropping 10x annually.** Simulating 1,000 people requires massive context windows and inference volume. The economics only work when inference costs are low enough to run thousands of agents in parallel — which became viable in 2024–2025.

3. **Declining survey response rates create market urgency.** Response rates dropped from 36% in 1997 to ~6% in 2018 (Pew Research). Traditional market research is becoming unreliable precisely as AI alternatives become viable. Enterprise buyers have budget pressure to find new approaches.

4. **Peer-reviewed validation provides enterprise air cover.** The 1,000 People paper (published November 2024, EMNLP oral) gave enterprise buyers the academic validation needed to justify spend. Without published, peer-reviewed accuracy metrics, enterprise procurement committees won't approve a new approach.

5. **Consent infrastructure is now scalable.** Digital consent frameworks, privacy regulations (GDPR, CCPA), and institutional review processes have matured enough to enable large-scale consented data collection. CVS's 400K consented participants shows the pipeline works.

6. **Regulatory momentum creates moats for consent-based approaches.** As AI regulation tightens, Simile's grounded-in-real-people approach (with full consent) becomes defensible in ways that pure-synthetic competitors are not. The consent infrastructure is a competitive moat, not just a compliance requirement.

---

## Open-Source Contributions

All three foundational codebases are open source:

| Project | Year | Description | Link |
|---------|------|-------------|------|
| **Social Simulacra** | 2022 | Populated prototypes for social computing | [GitHub](https://github.com/joonspk-research) · [Demo](https://social-simulacra.herokuapp.com/) |
| **Generative Agents** | 2023 | Smallville sandbox — 25-agent interactive simulation | [GitHub](https://github.com/joonspk-research/generative_agents) |
| **GenAgents** | 2024 | 1,000 People — agent twins from real human interviews | [GitHub](https://github.com/joonspk-research/genagents) |

The open-source strategy is deliberate: publish the foundational research to establish credibility and field-defining status, then commercialize the scaled, production-grade version as Simile's proprietary platform. Each repo establishes a citation-driven moat — competitors must cite Simile's founders' work to justify their own approach.

---

## Commercial Validation

| Customer | Industry | Use Case | Key Metric |
|----------|----------|----------|------------|
| **CVS Health** | Retail pharmacy | Store layouts, product placement, new product designs, medication adherence across 9,000+ stores | 2.9M consented responses from 400K+ participants across **200+ behavioral scenarios**; **95% accuracy** on known findings; plans to scale to **100K simulated people** |
| **Wealthfront** | Fintech | Qualitative research expansion | **15x research scope** without losing depth |
| **Gallup** | Polling/Research | Digital polling panels for policy, trends, workplace | Partnership to augment traditional polling |
| **Telstra** | Telecom (Australia) | Early adopter | — |
| **Suntory Beverages** | Beverages (Japan) | Product development acceleration | Faster time to market |
| **Banco Itaú** | Banking (Brazil) | Product development, team alignment | Faster alignment across teams |
| **Garnett Station Partners** | Private Equity | Not disclosed | — |

**Additional demonstration:** In a Bloomberg interview (Feb 2026), Park revealed that Simile's agents **predicted 8 of 10 analyst questions** on a simulated earnings call — suggesting the system captures professional behavior patterns, not just consumer preferences.

**CVS Health deep dive:** The partnership is the most detailed public case study. CVS built digital twins from 2.9M consented responses spanning 200+ behavioral scenarios — covering store layouts, product placement optimization, new product designs, and medication adherence surveys. VP of Enterprise Customer Experience Sri Narasimhan called it "a really big unlock for us." Agents are "always on" unlike human respondents. CVS discovered consumers don't perceive giving medication to pets as a burden — a counterintuitive insight used for marketing. Plans to scale to 100,000 simulated people across 9,000+ stores.
→ [CVS Health blog](https://www.cvshealth.com/news/innovation/how-cvs-health-test-drives-better-care-experiences-using-generative-agents.html) | [Simile case study](https://www.simile.ai/blog/simile-cvs-health)

**Key commercial signals:**
- 7 months of model training + 5 months of commercial deals before funding announcement
- Cross-industry, cross-geography customer base suggests horizontal product-market fit
- CVS as both customer AND investor is the strongest validation signal
- Enterprise pricing at $150K+ confirms willingness to pay at scale
- No prior seed round disclosed — went straight to $100M Series A out of stealth

---

## Core Team

### Joon Sung Park — Co-Founder & CEO

| | |
|---|---|
| **Education** | PhD CS, Stanford University (2024); MS CS, UIUC; BS CS, Swarthmore College (2018) |
| **Google Scholar** | 16,707+ citations |
| **Awards** | Microsoft Research PhD Fellowship; Siebel Scholar Class of 2020; Best Paper at CHI; Best Paper Honorable Mention at UIST 2025; EMNLP 2025 accepted paper |
| **Press** | Covered by NYT, The Guardian, Nature, Science, Nikkei |
| **Speaking** | [TED AI](https://www.ted.com/talks/joon_sung_park_a_simulation_of_human_reality_powered_by_ai) (Oct 2023), WEF Global Tech Retreat, Google DeepMind, Stanford Law FutureLaw Keynote, SAP d-com Keynote, a16z AI Town, ICML, ODSC, Bank of England |
| **Podcasts** | [TWIML AI](https://twimlai.com/podcast/twimlai/modeling-human-behavior-with-generative-agents), [The Gradient](https://thegradientpub.substack.com/p/joon-park-generative-agents-and-human), TBPN |

**What's notable:** Park is the rare founder who created an entirely new subfield of AI (generative agents) and is now the one commercializing it. His "Smallville" paper is one of the most cited AI papers in recent years. He gave the definitive TED talk on simulated societies, has spoken at the World Economic Forum, Google DeepMind, and the Bank of England. Described by Index Ventures as "an oil painter turned entrepreneur" — suggesting a creative/humanistic sensibility unusual in AI founders. Before the company even launched, Apple, Riot Games, and Microsoft Research all invited him for internal seminars — a demand signal that commercial applications were obvious to industry incumbents. The combination of 16,700+ citations with a willingness to leave academia for a startup signals deep conviction that this technology needs to become a product, not just a paper.
→ [@joon_s_pk](https://x.com/joon_s_pk) | [joonsungpark.com](https://www.joonsungpark.com/) | [GitHub](https://github.com/joonspk-research) | [Launch thread](https://x.com/joon_s_pk/status/2022023097017421874)

---

### Percy Liang — Co-Founder

| | |
|---|---|
| **Education** | BS/MEng, MIT; PhD UC Berkeley (advisors: Michael I. Jordan, Dan Klein) |
| **Position** | Associate Professor of CS, Stanford; Director, Center for Research on Foundation Models (CRFM) |
| **Google Scholar** | ~133,153 citations |
| **Awards** | Presidential Early Career Award (2019), IJCAI Computers and Thought Award (2016), NSF CAREER, Sloan Fellow, Microsoft Research Faculty Fellow |
| **Other** | Co-coined the term "foundation model"; created HELM (Holistic Evaluation of Language Models); also co-founder of Together AI |

**What's notable:** Arguably one of the 10 most influential AI academics alive. Liang co-coined the term "foundation model" — the framing that the entire industry now uses. He literally defines how the field evaluates these systems (HELM). His involvement signals this is not a startup using off-the-shelf APIs — this is the team that shaped how the field thinks about the underlying technology. His dual affiliation creates a unique positioning: Stanford (research credibility) + Together AI (AI infrastructure) + Simile (AI application). Together AI is complementary (infrastructure layer) rather than competitive, and the cross-pollination between all three creates network effects. The risk is bandwidth — but Liang has maintained simultaneous high-output roles for years.

---

### Michael S. Bernstein — Co-Founder

| | |
|---|---|
| **Education** | BS Symbolic Systems, Stanford; MS/PhD CS, MIT |
| **Position** | Professor of CS, Stanford (Bass University Fellow); Senior Fellow, Stanford HAI |
| **Google Scholar** | ~102,269 citations |
| **Key Work** | Co-author of the ImageNet Large Scale Visual Recognition Challenge paper (catalyzed the deep learning revolution) |
| **Status** | **On leave from Stanford until Fall 2026** to work on Simile full-time |
| **Awards** | Sloan Fellow, Computer History Museum Tech for Humanity Prize, nationally bestselling author |

**What's notable:** Bernstein co-authored the ImageNet paper — one of the most consequential publications in AI history, which directly triggered the deep learning revolution. His 100K+ citations put him in rarefied air. That he's taken formal leave from a tenured Stanford professorship through Fall 2026 is the strongest conviction signal possible from an academic founder. He's not "advising" — he's all-in.

---

### Lainie (Elaina) Yallen — Co-Founder & CCO

| | |
|---|---|
| **Education** | McGill University, Desautels Faculty of Management (BCom, Entrepreneurship & Finance) |
| **Base** | New York |
| **Role** | Chief Commercial Officer |
| **Prior** | **Hebbia AI** (employee ~#8, Head of Customer, scaled revenue 15x; backed by a16z, Index, Google Ventures) → **Valence** (Interim COO & Head of Product) → **TriplePlay** (Co-Founder, Head of Growth; acquired by Roblox 2022) → **BCG** (Summer Associate) → **Kroll** (Financial Investigations) |
| **LinkedIn** | [elaina-yallen](https://www.linkedin.com/in/elaina-yallen-619156127/) |

**What's notable:** Yallen is the commercial engine in a heavily academic founding team — and she has a track record that makes her more than a business hire. At TriplePlay (formerly Lobby), she co-founded a company that was acquired by Roblox in 2022. She then joined Hebbia as approximately the 8th employee and Head of Customer, where she helped scale revenue 15x — at an AI company also backed by Index Ventures. The Hebbia → Simile pipeline is not a coincidence: Shah at Index saw her operating ability firsthand. Based in New York, she positions Simile for East Coast enterprise relationships across finance, pharma, and media.

**Combined founders' Google Scholar citations: ~252,000+** — a number that is essentially unmatched in the startup world.

---

### Notable Hire: Mihika Kapoor

| | |
|---|---|
| **Education** | Princeton (CS, Visual Arts & Entrepreneurship) |
| **Prior** | PM at Figma (early PM on FigJam — Figma's go-to for 0-to-1 products); Product roles at Meta; Founded Design Nation (national nonprofit) |
| **Press** | Featured on Lenny's Podcast |

**What's notable:** Left Figma — one of the most desirable product companies in tech — for Simile. As the PM who helped launch FigJam from zero, she brings exactly the 0-to-1 product-building experience that academic founders typically lack. This hire directly addresses the "can professors build a product?" risk.

Team has also attracted "veterans from the Index family and former leaders from Figma and Hebbia."

---

## Investor Depth

### Index Ventures — Shardul Shah (Lead, Series A)

- Major European/US VC behind Datadog, Wiz, Figma, Dropbox, Roblox
- Shah focuses on cybersecurity, AI, enterprise software; Forbes Midas List multiple times
- Previously invested in Datadog (NASDAQ: DDOG) and Wiz ($12B acquisition offer from Google within 4 years)
- **Compared Simile's market pull to "the early days of Wiz"** — implying he believes Simile could become a generational enterprise company
- Called the team's combination of imagination, research pedigree, and market pull "undeniable"

**Why this matters:** Shah's Wiz comparison is the bull case. Wiz reached a $12B acquisition offer within 4 years of founding. If Shah sees similar enterprise demand signals, the implied trajectory is extraordinary.

### Hanabi Capital

- Early-stage VC in Palo Alto founded by Mike Volpi, Bryan Offutt, Ishani Thakur — all formerly of Index Ventures
- Essentially a sidecar vehicle for the Index network investing Volpi's personal money
- Portfolio includes LiveKit, Anysphere (Cursor), Applied Compute, Arcade.dev
- The Index → Hanabi connection means this is a **concentrated bet by the Index ecosystem**

### CVS Health Ventures

- Strategic investor. CVS is already a customer — the customer-turned-investor alignment is the strongest possible commercial validation signal

### Bain Capital Ventures

- Growth-stage investor adding institutional credibility and enterprise go-to-market expertise

### A*

- Participation adds to the syndicate depth

### Angel Investor Significance

| Angel | Why It Matters |
|-------|---------------|
| **Andrej Karpathy** | Former Director of AI at Tesla, founding member of OpenAI. Technical legitimacy endorsement from someone who knows AI infrastructure. |
| **Fei-Fei Li** | Stanford professor, ImageNet pioneer, co-director of Stanford HAI. Personal connection to founding team (co-author with Bernstein on ImageNet). |
| **Adam D'Angelo** | CEO of Quora, former CTO of Facebook, OpenAI board member. 68 angel investments. |
| **Guillermo Rauch** | CEO of Vercel (Next.js). Developer platform expertise. |
| **Scott Belsky** | Partner at A24, former CSO/EVP at Adobe. Design/product perspective. |

---

## Hiring Signals & Strategic Direction

**Current openings:**
- Fullstack Engineer (via Paraform)

**What this reveals:**
- Small team (11–50) still in early scaling mode
- Engineering hires focused on building product layer on top of research
- Pulling senior talent from Figma, Hebbia, and the Index network
- No large public careers page yet — consistent with pre-scale phase
- No research hiring signals — the core research is done; the challenge is now productization

**Strategic implication:** Simile is in the "research is mature, now build the product" phase. The Figma/Hebbia talent pipeline signals they're building a design-forward enterprise product, not a research demo.

---

## Conference & Media Presence

### Press Coverage (with links)

| Outlet | Title / Detail | Link |
|--------|---------------|------|
| **Bloomberg** (Feb 12, 2026) | "AI Startup Nabs $100 Million to Help Firms Predict Human Behavior" — CEO video interview with Caroline Hyde & Ed Ludlow. Park discussed earnings call prediction demo (8/10 analyst questions predicted). | [Article](https://www.bloomberg.com/news/articles/2026-02-12/ai-startup-nabs-100-million-to-help-firms-predict-human-behavior) · [Video](https://www.bloomberg.com/news/videos/2026-02-12/ai-startup-aims-to-predict-human-behavior-video) |
| **Wall Street Journal** (Mar 9, 2026) | "Can AI Replace Humans for Market Research?" by Belle Lin (CIO Journal) | [WSJ](https://www.wsj.com/cio-journal/can-ai-replace-humans-for-market-research-4f818890) |
| **TechCrunch** (Feb 17, 2026) | Listed among 17 US AI companies raising $100M+ in 2026 | [TechCrunch](https://techcrunch.com/2026/02/17/here-are-the-17-us-based-ai-companies-that-have-raised-100m-or-more-in-2026/) |
| **Gizmodo** (Mar 2026) | "An AI Company Apparently Inspired by 'the Sims' Wants to Revolutionize Public Opinion Research" | [Gizmodo](https://gizmodo.com/an-ai-company-apparently-inspired-by-the-sims-wants-to-revolutionize-public-opinion-research-2000731038) |
| **SiliconANGLE** (Feb 12, 2026) | "AI digital twin startup Simile raises $100M in funding" | [SiliconANGLE](https://siliconangle.com/2026/02/12/ai-digital-twin-startup-simile-raises-100m-funding/) |
| **PYMNTS** (Feb 2026) | "Simile Raises $100 Million for AI That Aims to Predict Human Behavior" | [PYMNTS](https://www.pymnts.com/artificial-intelligence-2/2026/simile-raises-100-million-for-ai-that-aims-to-predict-human-behavior/) |
| **Academic press** | Research covered by NYT, The Guardian, Nature, Science, MIT Technology Review, Nikkei | — |

### Speaking Engagements (Joon Sung Park)

| Date | Event | Notes |
|------|-------|-------|
| Oct 17, 2023 | **TED AI** — ["A simulation of human reality, powered by AI"](https://www.ted.com/talks/joon_sung_park_a_simulation_of_human_reality_powered_by_ai) | Definitive talk on simulated societies |
| May 29, 2024 | **World Economic Forum** Global Tech Retreat | San Francisco |
| Apr 12, 2024 | **Stanford Law FutureLaw** Keynote | Implications of human simulation |
| Nov 15, 2023 | **Google DeepMind** Multiagent Seminar | Invited presentation |
| Sep 21, 2023 | **a16z** AI Town Panel | San Francisco |
| Mar 13, 2025 | **SAP d-com** Keynote | Enterprise applications |
| Oct 29, 2024 | **ODSC** | San Francisco |
| Jul 18, 2025 | **ICML** | Vancouver |
| Aug 2023 | **Apple** Internal Seminar, **Riot Games** Internal Seminar, **Microsoft Research** Seminar | Corporate demand signals |
| Jun–Sep 2023 | **Bank of England**, Scale Ventures, Sutter Hill Ventures, Unusual Ventures | Financial & VC circuit |

### Podcast Appearances

| Podcast | Episode | Link |
|---------|---------|------|
| **TWIML AI Podcast** | "Modeling Human Behavior with Generative Agents" (Jun 2023) | [TWIML](https://twimlai.com/podcast/twimlai/modeling-human-behavior-with-generative-agents) |
| **The Gradient** (Ep. 77) | "Joon Park: Generative Agents and Human-Computer Interaction" (Jun 2023) | [The Gradient](https://thegradientpub.substack.com/p/joon-park-generative-agents-and-human) |
| **TBPN Podcast** | Simile launch discussion — Park's goal to simulate all 8 billion people (Feb 2026) | [Spotify](https://open.spotify.com/episode/4rO3Gynz7fJcCxFkr9AQ1h) |

### Academic Venues

| Venue | Detail |
|-------|--------|
| **UIST 2022** | Social Simulacra paper |
| **UIST 2023** | Generative Agents — **Best Paper** |
| **UIST 2025** | Generative Agents — **Best Paper Honorable Mention** |
| **EMNLP 2025** | 1,000 People paper — **accepted as oral** |

**Media positioning:** Simile benefits from an unusual dual presence — both top-tier academic venues (Nature, Science, UIST, EMNLP) and mainstream business press (Bloomberg, WSJ, TechCrunch). The Bank of England, Apple, and Riot Games internal seminars show cross-sector demand before the company even launched. Very few AI startups operate credibly in both worlds.

---

## Why This is a Non-Consensus Bet

**What the consensus thinks:**
- AI synthetic research is a hot space but undifferentiated — several well-funded competitors (Aaru at ~$1B valuation, Listen Labs at $500M)
- Pure synthetic approaches (no real human data needed) will win on speed and cost
- Academic founders struggle with the operational intensity of enterprise scaling
- Market research disruption is incremental, not transformational
- $100M Series A with no disclosed seed implies an aggressive valuation relative to early revenue

**What Simile believes differently:**

1. **"Grounded" vs. "pure synthetic" is the defining philosophical bet.** Simile insists on real human interviews as the data substrate — more expensive and harder to scale than competitors like Aaru. The bet is that accuracy matters more than speed/cost in enterprise contexts. The 85% replication rate (vs. humans replicating themselves at 100%) is the proof point. If pure-synthetic approaches achieve comparable accuracy without interview overhead, Simile's moat narrows significantly.

2. **Academic founders are the feature, not the bug.** Three co-founders with 252K+ combined citations who literally invented the technology is not a "professor startup" risk — it's the only team that could credibly build this. The Mihika Kapoor hire (Figma PM) and Bernstein's full-time leave through Fall 2026 directly address the execution concern.

3. **The consent/ethics frontier is a moat, not a liability.** Building accurate digital twins of real people raises significant ethical questions. CVS's 2.9M consented responses from 400K people establishes the precedent. As this scales to populations, the consent infrastructure becomes a competitive moat — it's hard to replicate at scale and creates regulatory defensibility.

4. **The gap between current and vision is immense — and that's the opportunity.** Current: 1,000 simulated people, market research use cases. Vision: simulating trillions of interacting decisions across civilizations. Whether the architecture bridges that gap is the fundamental open question. But if it does, the value creation is measured in hundreds of billions.

5. **The Gallup partnership signals something bigger than market research.** Augmenting America's most trusted polling institution with digital twin technology positions Simile at the intersection of AI and democratic infrastructure. This isn't consumer packaged goods testing — it's potentially reshaping how societies understand themselves.

---

## Competitive Landscape

The synthetic research space has attracted $300M+ in VC in the past year.

| Company | Approach | Funding | Valuation | Key Differentiator |
|---------|----------|---------|-----------|-------------------|
| **Simile** | Grounded agents from real human interviews | $100M Series A (Feb 2026) | Not disclosed | Invented generative agents; 85% human replication; 252K citations |
| **Aaru** | Pure AI synthetic (no real human data) | $50M+ Series A (Dec 2025, [Redpoint](https://techcrunch.com/2025/12/05/ai-synthetic-research-startup-aaru-raised-a-series-a-at-a-1b-headline-valuation/)) | ~$1B headline (blended below) | Speed; EY/Accenture partnerships; predicted NY Dem primary |
| **Listen Labs** | AI-conducted live interviews at scale | [$69M Series B](https://venturebeat.com/technology/listen-labs-raises-usd69m-after-viral-billboard-hiring-stunt-to-scale-ai) (Jan 2026, Ribbit); $100M total | $500M | 1M+ AI interviews; 30M-person panel; 15x revenue growth |
| **Ditto** | Population-grounded synthetic personas | Not disclosed | — | 300K+ pre-built personas; self-serve |
| **Evidenza** | AI "impersonas" of C-suite buyers | Not disclosed | — | B2B sales focus |
| **Artificial Societies** | Audience simulation | YC-backed | — | 500K+ AI personas |
| **Qualtrics Edge** | Enterprise synthetic research | Qualtrics division | — | Incumbent advantage |

**Philosophical camps:**
- **"Grounded" simulators** (Simile, Listen Labs) — prediction requires tether to real human data
- **"Pure synthetic" simulators** (Aaru, Artificial Societies) — replace human feedback entirely
- **"Workflow" simulators** (Ditto, Evidenza) — embed simulation into existing tools

**Simile's moat:**
1. **The founding team literally invented generative agents** — no competitor can claim this
2. **Grounded in real human interview data** vs. pure synthetic
3. **Published, peer-reviewed validation** (1,000 People paper: 85% replication accuracy, p < 0.001)
4. **~252K combined citations** across founders — unmatched academic credibility
5. Enterprise-first with $100M and blue-chip customers from day one

---

## Qualitative Assessment

### Conviction Level: HIGH

**Why this could be a generational company:**

1. **The team is unreplicable.** 252K combined citations, the literal inventors of generative agents, open-source codebases that defined the field, and peer-reviewed validation. No other company can claim to have created the technology category they're commercializing at this level.

2. **Commercial validation is immediate and cross-industry.** Seven enterprise customers within 5 months of selling — CVS, Wealthfront, Gallup, Telstra, Suntory, Banco Itaú, Garnett Station. Cross-geography (US, Australia, Japan, Brazil) suggests horizontal product-market fit.

3. **The Wiz comparison from Shardul Shah is the bull case.** Index's Shah — who backed Wiz to a $12B acquisition offer in 4 years — compared Simile's enterprise demand to Wiz's early days. If he's right, the implied trajectory is extraordinary.

4. **CVS as customer AND investor is the strongest signal.** A Fortune 4 company with 2.9M consented responses from 400K people that also invested in the Series A. That's not a pilot — that's a strategic commitment.

5. **The Bloomberg earnings call demo (8/10 analyst questions predicted) expands the TAM.** If Simile can predict professional behavior — not just consumer preferences — the addressable market extends far beyond market research into strategy, policy, and intelligence.

### Key Risks:

1. **Grounded vs. pure synthetic may not matter.** If Aaru or similar pure-synthetic approaches achieve comparable accuracy without the interview overhead, Simile's cost and scalability position weakens.

2. **Consent infrastructure at scale is unproven.** 400K consented individuals is impressive but tiny relative to the population-scale ambition. Regulatory developments around AI digital twins could help (moat) or hurt (restrictions).

3. **Academic founders executing enterprise sales.** Three of four co-founders are tenured/tenure-track professors. Bernstein's formal leave and Kapoor's hire address this, but the proof is in the execution.

4. **Percy Liang's dual affiliation with Together AI.** Adds complexity — though Together AI (infrastructure) and Simile (application) are complementary, not competitive.

5. **$100M Series A with no disclosed seed and no public valuation.** Unusual structure — implies either extreme founder leverage or a very high valuation relative to early revenue.

### Bottom Line:

Simile sits at the intersection of world-class research and genuine enterprise demand. The founding team didn't just read the generative agents paper — they wrote it. The 85% human replication accuracy, 0.98 correlation, and cross-industry customer base within months of selling are strong proof points. The key question is whether "grounded" simulation (requiring real human interviews) can maintain accuracy advantages over pure-synthetic competitors while scaling to the population-level ambitions. If it can, Simile becomes the simulation layer underneath every major decision in the world.

**Verdict: The most academically credentialed AI startup ever built, with unusually fast commercial validation. High conviction on the team and research foundation; medium conviction on the scalability of the grounded approach vs. pure synthetic competitors.**

---

*Research compiled: March 2026*
