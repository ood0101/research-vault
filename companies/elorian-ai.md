# Elorian AI

| Field | Detail |
|---|---|
| **Website** | [elorian.ai](https://elorian.ai) |
| **HQ** | Palo Alto, CA |
| **Founded** | Late 2024 (stealth); public launch April 9, 2026 |
| **Structure** | C-Corp (Elorian AI, Inc.) |
| **Stage** | Series A |
| **Lead Investor** | Striker Venture Partners (Max Gazor) |
| **Other Investors** | Menlo Ventures, Altimeter Capital, NVIDIA, 49 Palms Ventures |
| **Angel** | Jeff Dean (Google's Chief Scientist) |
| **Total Raised** | $55M |
| **Valuation** | Not disclosed |

---

## The Big Audacious Idea

Current AI models are blind. They can describe an image in words, but they can't truly see — they don't understand spatial relationships, physical constraints, or design intent. Every frontier multimodal model (GPT-4o, Gemini, Claude) was built as a language model first, with vision bolted on afterward. Visual information gets converted to text tokens, losing the spatial and relational information that makes vision useful.

Elorian is building **native multimodal models** where visual reasoning is foundational — not an afterthought. Models that directly interact with and manipulate visual representations, interpret structure and constraints in visual space, and reason about the physical world without first translating everything into language.

Andrew Dai (co-founder): Elorian is *"not trying to recreate a ChatGPT"* but to build *"a native multi-modal model that can simultaneously understand and process text, images, videos, and audio."*

The thesis: **visual reasoning precedes language.** Humans understood spatial relationships, physical constraints, and cause-and-effect long before they developed language. AI should too.

---

## The Problem That's So Hard to Solve

**Multimodal AI models can't actually reason visually.** They can caption images and answer questions about photos, but they fail at tasks that require genuine spatial understanding — filling cubes, understanding mechanical constraints, interpreting engineering drawings, reasoning about physical interactions.

**Why this is genuinely hard:**

1. **Text-first architectures lose spatial information.** When you convert a complex 3D scene into text tokens, you lose the geometric relationships that make the scene meaningful. Current models process vision as "two parallel lines, only being roughly brought together at the data level" — visual and language information have never been placed in the same semantic space for genuine integrated reasoning.

2. **Native multimodal training is astronomically expensive.** Microsoft chose mid-fusion (bolting vision onto a language model) specifically because early-fusion approaches require "significantly higher compute, memory, and data cost." Training a model where vision and language are co-trained from scratch requires orders of magnitude more resources than adapting an existing LLM.

3. **Visual reasoning benchmarks expose collective failures.** Studies show frontier models — GPT-4o, Gemini, Claude — all fail at basic visual reasoning tasks like cube filling problems that humans find trivial. The problem isn't just accuracy; it's that these models lack the spatial representation entirely.

4. **$55M is ambitious for this problem.** Training frontier multimodal models from scratch is extremely capital-intensive. Google, Meta, and OpenAI spend billions. Elorian's bet is on algorithmic efficiency — doing more with less through architectural innovation.

5. **No established evaluation framework.** Visual reasoning is "poorly understood from both computational and neuroscience perspectives" — nobody knows the optimal architectures, training procedures, or evaluation metrics.

---

## The Technology Stack

### Native Multimodal Architecture

Elorian's approach differs from the standard pipeline:

**Standard approach (what everyone does):**
1. Take a pretrained visual encoder (ViT)
2. Take a pretrained LLM
3. Connect them with a projection layer
4. Fine-tune on image-text pairs

**Elorian's approach:**
- Train models to directly interact with visual representations from the start
- Vision and language co-trained in a unified semantic space
- Models reason about spatial relationships, physical constraints, and design intent natively in visual space — not through text translation
- Emphasis on algorithmic efficiency to reduce dependence on absolute computational scale

### Team Research Lineage (What They Built Before)

The technical stack inherits directly from the founders' prior work:

| Paper | Author | What It Proved |
|---|---|---|
| **Semi-supervised Sequence Learning** (NeurIPS 2015) | Andrew Dai + Quoc V. Le | Pretraining as foundation for supervised learning — foundational to GPT series |
| **ALIGN** (ICML 2021) | Yinfei Yang | 1.8B noisy web image-text pairs → SOTA vision-language models without expensive annotation. Beat CLIP by 7%+ |
| **MM1/MM1.5** (Apple 2024-2025) | Yinfei Yang, Forrest Huang | Apple's multimodal LLM family — methods, analysis, and insights from pre-training and fine-tuning |
| **Gemini 2.5** | Jared Lichtarge | Reasoning, multimodality, long context, agentic capabilities |
| **Gemini pretraining data** | Andrew Dai | Data curation and quality strategies for Google's flagship model |
| **BLIP-3 / xGen-MM** | Le Xue | Salesforce's open multimodal model family |
| **Scalable DL for EHR** (npj Digital Medicine 2018) | Andrew Dai | Deep learning on 216K patients, 46B+ data points |

### Applications (Stated)

- **Engineering design**: Lighter engines, quieter wings — understanding structural constraints from visual specifications
- **Robotics**: Cross-environment operation with genuine spatial understanding
- **Medicine**: Medical imaging interpretation with physical reasoning
- **Earth observation**: Weather, disaster response, precision agriculture
- **Autonomous vehicles**: Spatial reasoning for navigation
- **Manufacturing QC**: Visual inspection with constraint understanding
- **AR systems**: Real-time visual reasoning

---

## What the World Looks Like If This Works

1. **AI stops being blind.** Models that truly understand spatial relationships, physical constraints, and design intent unlock applications that text-first multimodal models can't touch — engineering CAD review, architectural design, manufacturing quality control, surgical planning.

2. **Robotics gets genuine visual intelligence.** Current robot vision is pattern matching; Elorian's native visual reasoning could give robots actual understanding of what they're seeing and how to interact with it physically.

3. **A new foundation model paradigm emerges.** If native multimodal training (early fusion) proves fundamentally superior to the bolted-on approach (mid-fusion), every model lab will need to retrain from scratch — and Elorian will have a multi-year head start.

4. **Physical AI applications become viable.** Autonomous vehicles, drones, industrial robots — all need AI that reasons about the physical world from visual input. Text-first models are a poor fit; native visual reasoning is exactly what these applications need.

---

## Best Case Scenario / Addressable Opportunity

| Market | Size | Growth |
|---|---|---|
| Multimodal AI market | ~$3.85B (2026) | → $10.89B by 2030 (32-37% CAGR) |
| Physical AI / spatial intelligence | Nascent | Attracting $100M-$1B+ investments |
| Computer vision in industry | ~$19B (2025) | → $33B+ by 2030 |

---

## Core Team

### Andrew Dai — Co-Founder

| Field | Detail |
|---|---|
| **Education** | BA Computer Science, Cambridge (2006); PhD Machine Learning, University of Edinburgh (2012, advisor: Amos Storkey) |
| **Career** | Google Brain (2014) → Google Health (2017) → Google Brain/DeepMind (2020) → **Co-led Gemini pretraining data** → Elorian (2024) |
| **Key Papers** | Semi-supervised Sequence Learning (NeurIPS 2015, foundational to GPT); Scalable DL for EHR (npj Digital Medicine 2018); PaLM 2 Technical Report |
| **Collaborators** | Jeff Dean, Quoc V. Le |
| **Awards** | Google Tech Impact Award (2023) |

**What's notable**: 14 years at Google spanning the entire deep learning revolution. Built SmartReply and SmartCompose. Co-led pretraining data for Gemini — in the current AI arms race, data quality is the key factor determining a model's ceiling. His NeurIPS 2015 paper with Quoc V. Le on semi-supervised sequence learning is explicitly cited as foundational to GPT. Jeff Dean (Google's chief scientist and his former collaborator) personally invested in Elorian — the strongest possible credibility signal from the person who knows his work best.

### Yinfei Yang — Co-Founder

| Field | Detail |
|---|---|
| **Education** | University of Pennsylvania (degree details unconfirmed) |
| **Career** | Amazon/Lab126 (2013-2015) → Redfin (2015-2017) → Google Research (2017-2022, Staff/Senior SWE — built ALIGN, Universal Sentence Encoder) → Apple AI/ML (2022-2024, Principal Research Scientist — built MM1/MM1.5) → Elorian |
| **Key Papers** | ALIGN (ICML 2021 — beat CLIP by 7%+ using 1.8B noisy web pairs), Universal Sentence Encoder (EMNLP 2018), MM1/MM1.5 (Apple, ICLR 2025) |

**What's notable**: Built ALIGN at Google — the paper that proved you can train world-class vision-language models from noisy web-scale data without expensive human annotation. Then built MM1/MM1.5 at Apple — Apple's multimodal LLM family. Has seen both Google's AND Apple's approaches to multimodal AI from the inside, understanding what works and what doesn't in both paradigms. This dual perspective is rare and directly shapes Elorian's native multimodal approach.

### Forrest Huang — Co-Founder

| Field | Detail |
|---|---|
| **Education** | BS UIUC (2017); PhD CS, UC Berkeley (2022, advisor: John Canny) |
| **Career** | Google Research (2022-2023) → Apple AI/ML (2023-2024, co-authored MM1.5) → Elorian |
| **Recognition** | Adobe Research Fellowship 2020 Honorable Mention |

**What's notable**: HCI + multimodal AI intersection specialist. Published at CHI, IUI, UIST on how humans interact with visual/design tools — directly relevant to building AI that reasons visually for practical applications. Co-authored MM1.5 at Apple. Based between Hong Kong and Mountain View.

### Jared Lichtarge — Co-Founder

| Field | Detail |
|---|---|
| **Education** | BS, Washington University in St. Louis |
| **Career** | Software Engineer at Google → Worked on **Gemini 2.5** (reasoning, multimodality, long context, agentic capabilities) → Elorian |
| **Citations** | 244 across 9 papers |

**What's notable**: Directly worked on Gemini 2.5's multimodal and reasoning capabilities — the exact intersection Elorian targets. His hands-on experience building Google's most advanced multimodal system informs what Elorian needs to do differently.

### Key Team Members

**Seth Neel** — Harvard Business School professor (on leave). PhD UPenn (advisors: Michael Kearns, Aaron Roth). Co-founded Welligence Energy Analytics (Forbes 30 Under 30, 2019). Led SAFR AI Lab. Worked on Gemini pretraining data at Google Research NYC. Expertise: data quality, privacy, attribution — critical for building models on massive multimodal datasets.

**Qiuyi "Richard" Zhang** — Princeton BA (2014), UC Berkeley PhD (Applied Math + CS, advisors: Satish Rao, Nikhil Srivastava). Staff Research Scientist at Google DeepMind on Gemini. Co-creator of OSS Vizier. 40+ papers at NeurIPS, ICML, ICLR, STOC, COLT.

**Le Xue** — MS Cornell (2019). Led xGen-MM (BLIP-3) family at Salesforce Research — one of the most successful open-source multimodal model families. First-authored BLIP-3, ULIP (CVPR 2023), ULIP-2 (CVPR 2024). Deep hands-on experience training vision-language models at scale.

**Seo-Jin Bang** — CMU PhD student (Computational Biology). Affiliated with Google DeepMind. 26 publications, 399 citations. Expertise in explainability and active learning.

---

## Investor Depth

**Striker Venture Partners** (Lead) — $165M fund, ~10 investments per fund, all pre-revenue/inception stage, $5-30M checks. Founded by Max Gazor (14+ years at CRV, Forbes Midas List 2022-2025) and Matan Lamdan. Portfolio: Airtable, Cribl, Reflection AI, Dyna Robotics, Lepton.ai. Leading Elorian's round signals conviction that native multimodal is a category-defining opportunity.

**NVIDIA** — Strategic investor. Signals Elorian's models will run on NVIDIA hardware and may integrate into NVIDIA's Physical AI / Cosmos ecosystem. NVIDIA invests in the companies that will drive GPU demand.

**Jeff Dean** (Angel) — Google's Chief Scientist and one of AI's most prolific angel investors (37+ startups: Perplexity, World Labs, Sakana AI, DatologyAI). He co-authored papers with Andrew Dai at Google. When someone's former boss and the most technically credentialed person in AI invests personally, it's the strongest possible signal.

**Menlo Ventures + Altimeter Capital** — Major Silicon Valley VCs providing mainstream institutional validation alongside the specialized investors.

---

## Hiring Signals & Strategic Direction

Only 2 open positions (General Interest + Member of Technical Staff, both Palo Alto hybrid). Consistent with a stealth-mode company that just launched publicly and is hiring primarily through direct networks. "Member of Technical Staff" title signals flat, research-first culture.

---

## Conference & Media Presence

- **Bloomberg exclusive** (April 9, 2026): Launch day feature
- **The Information** (earlier, likely Jan 2026): First broke the fundraising story
- **36kr** (Chinese tech press): Covered founding story with emphasis on Chinese researchers leaving Big Tech
- No podcast appearances, conference talks, or technical blog posts yet — consistent with day-one launch

---

## Why This is a Non-Consensus Bet

**What the consensus thinks:**

1. Bolting vision onto LLMs (mid-fusion) is good enough — GPT-4o, Gemini, and Claude handle multimodal tasks adequately for most applications
2. Native multimodal training from scratch is prohibitively expensive — Google, Meta, and OpenAI spend billions, and $55M won't compete
3. The "visual reasoning" gap is being closed incrementally by existing model labs, not by a paradigm shift
4. Another ex-Google/Apple AI startup in Palo Alto — the market is saturated with talent-driven companies that raise well but struggle to find product-market fit

**What Elorian believes differently:**

1. Mid-fusion fundamentally can't solve visual reasoning — converting visual information to text tokens destroys the spatial and relational information that makes vision useful. You need native multimodal from the ground up.
2. Algorithmic efficiency > raw compute — the founders' expertise in data quality (Gemini pretraining data), efficient training (ALIGN from noisy web data), and architectural innovation means they can do more with $55M than brute-force competitors do with $500M
3. The visual reasoning gap is a paradigm problem, not an incremental one — current models fail at basic spatial tasks not because they need more training but because the architecture is wrong
4. Applications that need genuine visual reasoning (engineering, robotics, medicine, manufacturing) represent massive markets that text-first models can't serve — this isn't competing with ChatGPT, it's creating a new category

---

## Competitive Landscape

| Company | Focus | Funding | Key Differentiator |
|---|---|---|---|
| **Elorian AI** | Native multimodal visual reasoning | $55M | Gemini/MM1 team; native architecture from scratch |
| **World Labs** (Fei-Fei Li) | 3D spatial intelligence | $230M+ | 3D world generation (Marble product) |
| **AMI Labs** (Yann LeCun) | World models via JEPA | Raising at $3.5B | Physical intuition from video |
| **Google DeepMind** | Gemini / Gemma 4 | Internal (billions) | Gemma 4 is first natively multimodal open model |
| **OpenAI** | GPT-4o/5 multimodal | Tens of billions | Scale + distribution |
| **Meta** | V-JEPA 2, Llama vision | Internal | Open-source + massive data |
| **Apple** | MM1/MM1.5 | Internal | On-device integration |
| **Luma AI** | Video + 3D generation | $1B+ | Uni-1 autoregressive multimodal |

---

## Qualitative Assessment

**Conviction Level: MEDIUM-HIGH**

**Bull case:**

1. **The team has built the exact systems this company needs.** Andrew Dai co-led Gemini pretraining data. Yinfei Yang built ALIGN at Google and MM1 at Apple. Le Xue built BLIP-3 at Salesforce. Jared Lichtarge worked on Gemini 2.5's multimodal reasoning. This isn't a team that studied multimodal AI — they built the production systems at Google, Apple, and Salesforce.

2. **Jeff Dean's personal investment is the ultimate credibility signal.** Google's Chief Scientist, who co-authored papers with Andrew Dai, invested his own money. Dean has backed 37+ AI startups; when he invests in a former colleague's company, he's betting on both the person and the approach.

3. **The visual reasoning gap is real and widening.** Current frontier models fail at basic spatial reasoning tasks. If Elorian solves this through native multimodal training, they capture markets (engineering, robotics, manufacturing, medicine) that text-first models structurally can't serve.

4. **NVIDIA's strategic investment signals hardware ecosystem alignment.** Elorian's models will likely run on NVIDIA hardware and integrate into the Physical AI / Cosmos stack — giving them distribution into every NVIDIA customer.

5. **Andrew Dai's NeurIPS 2015 paper is foundational to GPT.** His semi-supervised sequence learning work proved that pretraining improves downstream task performance — a result OpenAI built GPT on. He's done this before.

**Key risks:**

1. **$55M for native multimodal training may not be enough.** Google, Meta, and OpenAI spend billions on multimodal models. Algorithmic efficiency is the bet, but the compute gap is real.

2. **No product, no customers, no published technical work.** The company launched publicly on April 9, 2026 — literally today. Everything is promissory.

3. **The mid-fusion approach keeps improving.** GPT-4o, Gemini 2.5, and Claude are getting better at visual tasks with each generation. The gap Elorian targets may narrow through incremental improvements before native multimodal models ship.

4. **Crowded competitive field.** World Labs ($230M+), AMI Labs (raising at $3.5B), plus Google, Meta, Apple, and OpenAI all pursuing visual/spatial AI. Differentiation will be hard to maintain.

5. **Team assembled from multiple institutions.** Unlike companies where the founders have years of shared history, Elorian pulls from Google, Apple, Salesforce, Harvard, and CMU. Integration and culture formation take time.

**Bottom line**: Elorian AI has assembled a team of builders — not researchers who published about multimodal AI, but engineers who built ALIGN, MM1, BLIP-3, and Gemini's pretraining data in production at Google, Apple, and Salesforce. Jeff Dean's personal investment is an unusually strong credibility signal. The native multimodal thesis is intellectually compelling: current models fail at visual reasoning because the architecture is wrong, not because training is insufficient. The risk is that $55M may not be enough for the compute-intensive approach, and the company is literally one day old with no product. But if native multimodal proves categorically superior to bolted-on vision, Elorian's team is the one best positioned to build it.

**Verdict: The Gemini/MM1/BLIP-3 builders left Google, Apple, and Salesforce to build native multimodal AI from the ground up — backed by Jeff Dean personally and NVIDIA strategically. The visual reasoning gap is real (frontier models fail at basic spatial tasks), and native multimodal training is the theoretically correct solution. $55M is aggressive but the algorithmic efficiency bet could work given the team's data quality expertise. Watch for the first technical publication and any benchmark results on spatial reasoning tasks.**

*Research compiled: April 2026*
