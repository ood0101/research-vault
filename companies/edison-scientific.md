# Edison Scientific

**Website:** [edisonscientific.com](https://edisonscientific.com)
**Blog:** [edisonscientific.com/blog](https://edisonscientific.com/blog)
**Platform:** [platform.edisonscientific.com](https://platform.edisonscientific.com/)
**Parent Org:** [FutureHouse](https://www.futurehouse.org/) (501(c)(3) nonprofit)
**HQ:** San Francisco, CA
**Founded:** 2025 (spinout of FutureHouse, November 2025)
**Structure:** For-profit (commercial spinout of FutureHouse nonprofit)
**Stage:** Seed ($70M, December 2025)
**Lead Investors:** Triatomic Capital, Spark Capital, undisclosed major biotech investor
**Other Investors:** Pillar VC, Susa Ventures, Striker VP, Hawktail VC, Olive VC
**Angels:** Jeff Dean (Google Chief Scientist), Dmitri Alperovitch (CrowdStrike co-founder), plus "famous AI researchers, CEOs of multiple frontier AI labs, and leadership of major biotech and pharma companies"
**Valuation:** ~$250M
**Team Size:** ~30

---

## The Big Audacious Idea

**Build autonomous AI agents ("AI Scientists") that compress months of scientific research into hours — and fundamentally accelerate the pace of human discovery.**

Edison Scientific is the commercial spinout of FutureHouse, a philanthropically-funded nonprofit AI research lab backed by Eric Schmidt (former Google CEO). Edison builds autonomous AI agents that read millions of papers, design hypotheses, write analysis code, and produce fully-cited research reports at a speed no human team can match.

**Core insight:** Science is too slow. The fundamental bottleneck in biology and chemistry is not data or compute — it is **human effort**. No individual scientist can read millions of papers, design thousands of hypotheses, or analyze complex datasets at the scale needed. Edison's agents do this autonomously.

CEO Sam Rodriques frames it with unusual honesty: on the NYT Hard Fork podcast (Dec 26, 2025), he argued AI probably won't cure diseases anytime soon. The real bottleneck isn't hypothesis generation — it's testing hypotheses in humans (clinical trials). This suggests Edison's long-term play may extend beyond literature synthesis into clinical trial infrastructure.

**Positioning:** "The world's first unified AI platform for scientific discovery." Unlike chatbots that answer questions, Edison's agents autonomously read, reason, experiment, analyze data, and produce fully-cited research reports.

---

## The Problem That's So Hard to Solve

### Why drug development costs $2.6B and takes a decade

The pharmaceutical industry's central paradox: we have more biological data than ever, yet drug development costs are rising, not falling. The average new drug costs $2.6B and takes over a decade to reach patients. ~90% of drugs that enter clinical trials fail.

The problem breaks into two bottlenecks:

**Bottleneck 1: Scientific literature is drowning researchers.**
Over 150 million scientific papers exist. Biomedical literature alone adds ~1 million papers per year. No human can read, synthesize, and cross-reference even a fraction of what's relevant to their research question. This means:
- Hypotheses are generated from incomplete literature understanding
- Researchers unknowingly duplicate existing work
- Cross-disciplinary connections are missed
- Key findings are buried in obscure journals

**Bottleneck 2: Data analysis requires specialized skills.**
Modern biological research generates massive datasets (genomics, proteomics, imaging). Analyzing these requires programming, statistics, and domain expertise — a combination few individual researchers possess. The result: datasets sit underanalyzed, insights remain hidden.

### What's been tried and why it's insufficient

- **Literature search tools** (Google Scholar, PubMed, Semantic Scholar) help find papers but don't synthesize or reason across them
- **AI chatbots** (ChatGPT, Claude) can answer questions but hallucinate citations and can't autonomously design and execute multi-step research workflows
- **Specialized biotech AI** (Insilico, Recursion, Isomorphic Labs) focus on specific drug discovery steps, not general-purpose scientific research

Edison's bet: the right approach is a **general-purpose AI Scientist** that can autonomously execute the full research loop — read, reason, hypothesize, analyze, and report — across any scientific domain.

---

## The Technology Stack

### Core Products

**Kosmos — The flagship "AI Scientist"**

A multi-agent system that autonomously conducts research:

| Metric | Detail |
|--------|--------|
| Papers read per run | ~1,500 |
| Analysis code written | ~42,000 lines |
| Run duration | 6–12 hours |
| Output | Fully cited research reports with publication-ready figures |
| Accuracy | **79.4% of conclusions validated** by human researchers (85.5% data analysis, 82.1% literature synthesis) |
| Compression | Beta users estimate ~6 months of work → 1 day |
| Cost | 200 credits (~$200) per run |

**Edison Analysis — Data analysis agent**
- Operates within Jupyter notebooks for full transparency/auditability
- **Outperforms Biomni and Claude Code on BixBench** (46% overall accuracy vs. 17% for GPT-4o and Claude 3.5 Sonnet)
- Supports Python, R, and Bash

**Agent Suite (inherited from FutureHouse):**

| Agent | Function |
|-------|----------|
| **Crow** | Literature Q&A with citations |
| **Falcon** | Deep literature synthesis (automated reviews) |
| **Owl** | Prior-work detection ("Has anyone done X before?") |
| **Phoenix** | Experimental chemistry (integrates ether0) |
| **Finch** | Data analysis |
| **Robin** | Integrated end-to-end research |

### Architecture

- Multi-agent system with agents operating in parallel sharing information through a structured "world model"
- Uses OpenAI, Google, Anthropic models + Edison's own proprietary models
- Full citation traceability — every conclusion traces to a line of code or published study
- Access to ~150 million papers
- Encrypted in transit and at rest; user data not used for training

### The Science: How PaperQA2 Achieved Superhuman Literature Search

**PaperQA2** — Apache-licensed literature agent. The first AI to achieve **superhuman performance on scientific literature search**.

On the LitQA2 benchmark (scientific literature Q&A):

| Agent | Accuracy | Precision |
|-------|----------|-----------|
| **PaperQA2** | 66.0% | **85.2%** |
| Human researchers (PhD/postdoc) | 67.7% | 73.8% |

PaperQA2 achieves **higher precision** than human PhD/postdoc researchers (**p=0.0036**, statistically significant) — meaning when it gives an answer, it's more likely to be correct. Its slightly lower accuracy comes from choosing to abstain (say "I don't know") more often, which is actually a desirable property for scientific research.

**Failure mode analysis:** When Kosmos gets conclusions wrong (the 20.6%), failures cluster in two categories: (1) tangential reasoning paths — the agent follows a plausible but ultimately irrelevant line of investigation, and (2) irrelevant statistical findings — the agent identifies a statistically significant result that doesn't actually answer the research question. Both are human-recognizable failure modes, meaning human-in-the-loop review can catch them.

→ [GitHub](https://github.com/Future-House/paper-qa) | [arXiv](https://arxiv.org/pdf/2409.13740)

### ether0: First Scientific Reasoning Model Trained via RL

**ether0** is a 24B parameter open-weights reasoning model for chemistry (based on Mistral-Small-24B, **Apache 2.0 license**). First scientific reasoning model trained via reinforcement learning. **Accepted to NeurIPS 2025 main track.** Featured in Nature.

**Training methodology — Expert Iteration RL (EIRL):**

A four-stage pipeline that represents a novel approach to training domain-specific reasoning models:

1. **SFT (Supervised Fine-Tuning)** — Initial training on chemistry data
2. **Specialist RL (GRPO)** — Reinforcement learning via Group Relative Policy Optimization on 640K chemistry problems
3. **Distillation** — "Data checkpoint" approach: export completions from the RL-trained model, filter incorrect answers, deduplicate, then SFT a fresh base model on the filtered data. This transfers the RL gains with <10% performance drop while being much cheaper than full RL.
4. **Generalist RL** — Final RL stage on the distilled model to recover general reasoning capabilities

**Notable training artifact:** During training, ether0 invented "reductamol" — a made-up chemistry token — revealing how the model creates internal representations of chemical concepts through the RL process.

**Key result:** ether0 outperforms frontier models (GPT-4, Claude 3.5 Sonnet) on chemistry tasks despite being 10-20x smaller. This validates the thesis that domain-specific reasoning models trained via RL will beat general-purpose models in narrow scientific domains.

→ [HuggingFace](https://huggingface.co/futurehouse/ether0)

---

## What the World Looks Like If This Works

If Edison's AI Scientists achieve reliable, scalable autonomous research:

1. **The research phase of drug development collapses.** Target identification, mechanism elucidation, and hypothesis generation — which currently take years and teams of PhDs — are compressed into days. The $2.6B drug development cost is disproportionately front-loaded in research; Edison attacks that bottleneck directly.

2. **Cross-disciplinary discovery becomes routine.** No human can read 150 million papers across biology, chemistry, physics, and medicine. Edison's agents can. The connections between a cardiac fibrosis gene and an obscure biochemistry paper are exactly the kind of cross-domain insights that AI Scientists will find and humans will miss.

3. **Small research groups compete with large pharma.** A 5-person biotech with Edison access can conduct literature synthesis and data analysis at the pace of a 50-person team at Pfizer. This democratizes research capability.

4. **A new scientific method emerges.** The 79.4% accuracy rate means 1 in 5 conclusions may be wrong — unacceptable for clinical decisions, but perfectly useful for hypothesis generation. Edison's value is in generating hypotheses faster than humans can test them, creating a pipeline that accelerates the experimental loop.

5. **Edison becomes essential research infrastructure.** Every university, pharma company, and biotech that conducts scientific research needs AI-assisted literature synthesis and data analysis. Edison positions as the platform layer for scientific discovery.

---

## Best Case Scenario / Addressable Opportunity

### The Economics of Drug Development

A single new drug costs **$985M–$2.6B** and takes 10–15 years to reach patients. ~90% of drugs that enter clinical trials fail. The research phase — target identification, hypothesis generation, literature synthesis, data analysis — consumes a disproportionate share of this cost and time.

| Market | Current Size | Projected Growth | Edison's Entry |
|--------|-------------|------------------|----------------|
| **Global pharma R&D spend** | $300B+ annually | Growing 3–5% CAGR | Kosmos reduces time-to-hypothesis across all R&D |
| **Drug discovery CRO market** | $63.2B (2024) | $96.5B by 2033 | AI Scientist replaces manual literature/data analysis workflows |
| **Discovery services** | $16.36B (2024) | $70.3B by 2034 | Edison Analysis for automated bioinformatics |
| **Academic research tools** | ~$15B | Expanding with AI adoption | Free .edu tier for adoption → commercial conversion |
| **Chemical process R&D** | ~$10B | — | ether0 and Phoenix for chemistry reasoning |

**Adjacent markets:** Materials science R&D ($50B+), agricultural biotech ($20B+), environmental science research.

**Bull case TAM:** If Edison becomes standard infrastructure for all scientific R&D (not just pharma), the addressable market exceeds **$400B+**. The CRO market alone ($63B → $96B by 2033) represents a massive displacement opportunity — every hour a CRO analyst spends on literature review is an hour Kosmos could do in minutes.

---

## Why Now: Six Converging Factors

| Factor | What Changed |
|--------|-------------|
| **1. LLM capability explosion** | GPT-4, Claude 3.5, Gemini 2.0 crossed the threshold for reliable scientific reasoning in 2023–2024. Before this, AI could not reliably reason across 150M+ papers. |
| **2. Reasoning models validated** | Domain-specific RL training (ether0) proved that smaller models can outperform frontier models in narrow scientific domains. NeurIPS 2025 acceptance validated the approach. |
| **3. Agentic architectures matured** | Multi-agent systems with tool use, code execution, and structured workflows became reliable enough for autonomous research loops. |
| **4. Foundation models for science** | AlphaFold (2024 Nobel Prize) proved that AI can make fundamental scientific contributions. This shifted pharma's willingness to adopt AI from "interesting" to "necessary." |
| **5. Open scientific data** | 150M+ papers digitized and accessible via APIs. Genomic, proteomic, and clinical datasets increasingly available. The raw material for AI Scientists finally exists at scale. |
| **6. Multimodal parsing** | Modern models can parse figures, tables, chemical structures, and equations from papers — not just text. This unlocks the ~40% of scientific knowledge trapped in non-text formats. |

**Demand signal:** VP/C-level executives at **6 of the top 10 pharma companies** expressed inbound interest before the spinout. Sam Altman (OpenAI CEO) called the work "one of the most important impacts of AI."

---

## Open-Source Contributions

| Project | Description | Key Result | Link |
|---------|-------------|------------|------|
| **PaperQA2** | Literature search agent | First AI to achieve superhuman precision on scientific literature search (85.2% vs 73.8% human) | [GitHub](https://github.com/Future-House/paper-qa) \| [arXiv](https://arxiv.org/pdf/2409.13740) |
| **ether0** | 24B chemistry reasoning model | First scientific reasoning model trained via RL; NeurIPS 2025 main track; featured in Nature | [HuggingFace](https://huggingface.co/futurehouse/ether0) |
| **BixBench** | Bioinformatics benchmark | 50+ scenarios, ~300 questions for evaluating AI on real-world bioinformatics tasks | [arXiv](https://arxiv.org/abs/2503.00096) |
| **WikiCrow** | Gene article generator | Generated Wikipedia-style summaries for 15,616 human genes; more accurate than Wikipedia per blinded PhD evaluation | — |
| **ChemCrow** | Chemistry LLM agents | First LLM agents in chemistry; best paper at international AI workshop | — |
| **Aviary** | RL framework for scientific agents | Integrated with NVIDIA NeMo for training scientific agents with RL | — |

**Open-source strategy:** Individual components (PaperQA, ether0) are Apache-2.0 open source. But Kosmos — the integrated agent system with the world model, orchestration, and enterprise features — is proprietary. Smart moat: the building blocks are free, the assembled product is what you pay for.

---

## Notable Scientific Discoveries

| Discovery | Domain | Significance | Method |
|-----------|--------|-------------|--------|
| **SOD2 and cardiac fibrosis** | Cardiology | Genetic evidence that high circulating SOD2 protein levels causally reduce cardiac fibrosis. Used Mendelian randomization across multiple genomic datasets to establish causal (not just correlational) link. | Kosmos — autonomous literature synthesis + data analysis |
| **Tau and flippase in Alzheimer's** | Neuroscience | New neurodegeneration mechanism — neurons with early tau accumulation lose flippase proteins, exposing phosphatidylserine "eat-me" signals that trigger immune cell-mediated destruction. Collaboration with Martha Foiani (UCL Dementia Research Institute). | Kosmos — cross-domain literature reasoning |
| **Universal brain connectivity principles** | Neuroscience | Identified fundamental organizing principles of brain connectivity across species | Literature synthesis |
| **Dry AMD treatment** | Ophthalmology | Promising new treatment for dry age-related macular disease — **first discovery with lab-in-the-loop integration** (AI hypothesis → wet lab validation) | Robin — end-to-end research agent |

**80% reproducibility rate** on scientific discoveries — significantly above the typical ~50% reproducibility rate in biomedical research.

**Why the SOD2 discovery matters for investors:** This is not an AI finding a correlation in a dataset. Mendelian randomization is a gold-standard causal inference technique. The fact that Kosmos autonomously chose this methodology, sourced the right genomic datasets, ran the analysis, and produced a publishable conclusion demonstrates genuine scientific reasoning — not just pattern matching. The tau/Alzheimer's finding is equally significant: connecting flippase protein loss to neuronal destruction required reasoning across cell biology, immunology, and neuroscience — exactly the cross-domain synthesis that no single human researcher can do at scale.

---

## Commercial Validation

| Signal | Detail |
|--------|--------|
| **Pharma interest** | VP/C-level executives at **6 of the top 10 pharma companies** expressed inbound interest before the spinout |
| **Spinout trigger** | Cross-industry interest exceeded what FutureHouse could support under nonprofit structure |
| **Academic validation** | Testimonials from researchers at **MIT, UCL Dementia Research Institute, and Broad Institute/Harvard** |
| **AI industry recognition** | Sam Altman (OpenAI CEO) called it "one of the most important impacts of AI" |
| **Enterprise features** | Auditability, data governance, secure proprietary dataset handling |
| **Partners** | CROs, biotechs, and industrial R&D groups |
| **Compression claim** | Beta users: 6 months of work → 1 day |

**No named pharma customers disclosed yet** — the gap between "inbound interest from 6 of top 10 pharma" and "signed contract with [specific pharma]" is where the real commercial risk lives.

---

## Core Team

### Sam Rodriques — Co-Founder & CEO

| | |
|---|---|
| **Education** | PhD Physics, MIT (Media Lab, Brain & Cognitive Sciences, Broad Institute); MPhil Engineering Neuroscience & Physics, Cambridge (Churchill Scholar); BS Physics, Haverford College (summa cum laude, highest honors) |
| **Awards** | Hertz Foundation Graduate Fellowship; NSF Graduate Research Fellowship; **TIME100 AI 2025** (100 Most Influential People in AI) |
| **Career Path** | MIT/Boyden Lab (PhD, invented **Slide-seq**) → Petri Bio → Saturn5 → Group Leader, The Francis Crick Institute → FutureHouse (CEO) → Edison Scientific (CEO) |
| **Key Invention** | **Slide-seq** — spatial transcriptomics method that maps gene expression across tissue sections. Foundational tool in modern biology. |
| **Google Scholar** | ~4,075+ citations |
| **Speaking** | [TED Talk: "What we'll learn about the brain in the next century"](https://www.ted.com/talks/sam_rodriques_what_we_ll_learn_about_the_brain_in_the_next_century) |
| **Podcasts** | [NYT Hard Fork](https://www.nytimes.com/column/hard-fork) (Dec 26, 2025, ~39 min); [Scaling Biology / Decoding Bio](https://www.decodingbio.com/); [Existential Hope](https://www.existentialhope.com/); [SVIcons](https://www.svicons.com/) |
| **Press** | Bloomberg, Nature, Freethink, TIME100 AI |

**What's notable:** Rodriques is unusually honest for a CEO at a $250M valuation. On NYT Hard Fork, he argued AI probably won't cure diseases anytime soon — the bottleneck is testing in humans (clinical trials), not generating hypotheses. This intellectual honesty is either a liability (undercutting his own pitch) or a signal that he's thinking longer-term about where the real problem is. His invention of Slide-seq — a foundational spatial transcriptomics technique now used in labs worldwide — establishes him as a genuine scientific contributor, not just an operator. The career path (MIT/Boyden → Crick Institute → FutureHouse → Edison) shows a consistent trajectory in bioengineering with increasing leadership scope. TIME100 AI recognition and elite physics credentials (Churchill Scholar, Hertz Fellow) establish scientific credibility most AI startup CEOs lack.
→ [sam-rodriques.com](https://www.sam-rodriques.com/)

---

### Andrew White — Co-Founder & CTO

| | |
|---|---|
| **Education** | BS Chemical Engineering, Rose-Hulman (2008) |
| **Position** | Associate Professor of Chemical Engineering, University of Rochester |
| **Google Scholar** | ~7,077+ citations; **50+ publications** |
| **Key Work** | Built ChemCrow (first LLM agents in chemistry), PaperQA series (superhuman literature agent), ether0 (first scientific reasoning model) |
| **Policy** | Red-teamed GPT-4 for chemistry risks for OpenAI → meetings with White House and NSC on AI policy |
| **Awards** | NSF and NIH junior investigator awards; Chemical Sciences Roundtable at National Academy of Science |
| **Advisory** | Advisory board at Acellera (computational chemistry/drug discovery); peer reviewer for 30+ journals |

**What's notable:** White is the rare academic who has both deep research impact (7,077+ citations, 50+ publications) and direct policy influence (White House/NSC meetings on AI safety). Red-teaming GPT-4 for chemistry risks for OpenAI shows he's trusted by frontier labs. His advisory role at Acellera (computational chemistry/drug discovery) extends his network into exactly the enterprise segment Edison targets. The combination of ChemCrow (first LLM chemistry agents), PaperQA (superhuman lit search), and ether0 (first RL-trained science model) means he's personally built the three foundational technologies Edison commercializes. His peer reviewer service for 30+ journals means he knows the scientific publishing landscape intimately — critical for building agents that navigate it.
→ [@andrewwhite01](https://twitter.com/andrewwhite01)

**Combined founder citations: ~11,150+**

---

### Key Team Members

| Person | Role | Background |
|--------|------|-----------|
| **Ludovico Mitchener** | Founding MTS | Two-time founder, interdisciplinary scientist/engineer |
| **Jon (surname undisclosed)** | Molecular biologist | Co-founded Pandemic Response Labs (primary COVID testing for NYC, 12M+ tests) |
| **Michaela Hinks** | Scientist | Synthetic biology & genomics, PhD 2024 |
| **Nghia Nguyen** | Business ops | Previously SpaceX (liquid propulsion) and Palantir (FDA regulatory) |
| **Michael Skarlinski** | Head of Platform | Leads engineering for deploying/scaling AI agents |

**Nghia Nguyen's background is strategically significant:** SpaceX (hardware-meets-software at scale) and Palantir (FDA regulatory experience + the Forward Deployed Engineer model) directly maps to Edison's Palantir-style enterprise deployment strategy.

---

## Academic Collaborators & Advisors

| Person | Institution | Collaboration |
|--------|------------|---------------|
| **Tonio Buonassisi** | MIT | Materials science applications — extending Edison's agents beyond biology into energy/materials |
| **Martha Foiani** | UCL Dementia Research Institute | Neuroscience research using Edison agents; source of the tau/Alzheimer's discovery |
| **Daniel Barabasi** | Broad Institute / Harvard | Computational biology; network science applications |

**What this reveals:** The collaborator set maps Edison's expansion strategy — biology (Foiani/UCL), materials science (Buonassisi/MIT), and computational biology (Barabasi/Broad). These are the beachhead institutions that validate Edison for the broader academic and pharma markets. The UCL collaboration already produced the tau/Alzheimer's mechanism discovery — demonstrating real output, not just partnership branding.

---

## The FutureHouse → Edison Structure

Edison's nonprofit-to-commercial structure mirrors OpenAI:

| Entity | Status | Role | Funding |
|--------|--------|------|---------|
| **FutureHouse** | Nonprofit | Basic research, open-source work, talent pipeline | Philanthropically funded by Eric Schmidt (ongoing) |
| **Edison Scientific** | For-profit | Commercial products, enterprise customers | $70M seed from VCs |

**FutureHouse Board:**

| Name | Role | Background |
|------|------|-----------|
| **Tony Kulesa** | Founding Board Member | Partner at Pillar VC; also a founding investor in Edison |
| **Adam Marblestone** | Board Member | Neuroscientist, former Schmidt Futures; deep connections to Eric Schmidt's AI philanthropy network |
| **Tom Kalil** | Board Member | Former Deputy Director, White House OSTP (Obama); Chief Innovation Officer, Schmidt Futures |

**Eric Schmidt's involvement:**
- Estimated **~$20M** in philanthropic funding to FutureHouse
- **No direct governance role** at Edison Scientific
- **Not an investor** in Edison's $70M seed round — his involvement is entirely through FutureHouse's nonprofit structure
- Continues to fund FutureHouse, effectively subsidizing Edison's R&D without taking equity

**Key dynamics:**
- Edison gets **philanthropically-subsidized R&D** — FutureHouse continues to develop foundational technology (PaperQA, ether0, new agents) that Edison commercializes
- **Open-source credibility** from FutureHouse work transfers to Edison's commercial brand
- **Talent pipeline** — FutureHouse researchers can transition to Edison
- Eric Schmidt continues funding FutureHouse, effectively subsidizing Edison's R&D costs — but without governance control over the commercial entity
- No listed science/ML research roles at Edison — research likely continues at FutureHouse; Edison focuses on commercial deployment
- **IP controls:** FutureHouse retains IP rights on foundational research; Edison licenses for commercial use. This creates a clean separation but also a dependency.

**Governance assessment:** The board composition (Kulesa from Pillar VC, Marblestone from Schmidt Futures, Kalil from White House/Schmidt Futures) suggests tight alignment with Eric Schmidt's orbit. The fact that Schmidt has no governance role at Edison and didn't invest in the seed round is structurally clean — but the FutureHouse→Edison IP dependency means Schmidt's continued philanthropic support is critical infrastructure. If Schmidt redirects funding, Edison's R&D subsidy evaporates.

---

## Investor Depth

### Triatomic Capital (Co-lead)

| | |
|---|---|
| **Founded** | 2022, founder-driven VC |
| **Thesis** | "Century-defining" technologies in applied AI for physical-world and life-science domains |
| **Check size** | $100K–$25M |
| **Portfolio** | ~8 companies including Chemify (digitizing chemistry) and Chalk ($50M Series A) |
| **Team** | Co-founder Jeff Huber; co-founder Steve co-founded Ascent Biomedical Ventures, founding Board Member of SLR Capital ($8B family of BDCs) |

**What's notable:** Edison sits at Triatomic's core thesis intersection: AI + life sciences + new materials. The Chemify portfolio company (digitizing chemistry) shows Triatomic has specific conviction in AI-for-science, not just AI generally.

### Spark Capital (Co-lead)

Major generalist VC (Twitter, Slack, Affirm). Involvement signals Edison is being taken seriously beyond deep-tech/bio circles.

### Pillar VC (Founding investor)

Tony (Partner) was a **founding board member of FutureHouse**. Portfolio includes Latent Labs, Nabla Bio, Portal Biotech, Amber Bio, Rowan Science — a clear life sciences focus. The FutureHouse connection gives Pillar deep context on the research foundation.

### Susa Ventures (Founding investor)

Early-stage VC (2013, SF). One of two funds that "backed us at founding."

### Jeff Dean (Angel)

| | |
|---|---|
| **Role** | Google's Chief Scientist, co-founder Google Brain |
| **AI investments** | 37+ including Perplexity, Roboflow, Sakana AI, World Labs |
| **Pattern** | Clear AI-for-science theme in portfolio |

**What's notable:** Jeff Dean's personal investment in an AI-for-science company carries enormous technical credibility. His 37+ AI investments suggest deep pattern recognition, and the AI-for-science theme (alongside Sakana AI) indicates he sees this as a category with legs.

### Dmitri Alperovitch (Angel)

Co-founder and former CTO of CrowdStrike ($10B+ IPO). Chairman of Silverado Policy Accelerator. Adds cybersecurity/defense-tech credibility and network.

---

## Product & Pricing

**Platform:** [platform.edisonscientific.com](https://platform.edisonscientific.com/)

| Tier | Cost | Includes |
|------|------|----------|
| Free | $0 | 10 expiring credits/month, standard agents |
| Paid | Subscription | 650 credits/month, Kosmos access, unlimited standard queries, priority |
| Founding Kosmos | Subscription | 2,000 discounted credits/month |
| Academic (.edu) | Free | 650 credits/month with Kosmos access |

**Kosmos run:** 200 credits (~$200) per run

**ACU Grant Program** for academic researchers — smart distribution strategy to build adoption in academia before enterprise sales cycles close.

---

## Hiring Signals & Strategic Direction

**Current open roles:**
- Principal Infrastructure Engineer
- Senior Full-Stack Engineer
- **Forward Deployed Engineer** (Palantir-style embedded deployment)
- Frontend Software Engineer
- Principal Full-Stack Engineer

**What this reveals:**

1. **Heavy emphasis on engineering/platform buildout** — core AI/science tech is mature enough from FutureHouse; bottleneck is now productization, scalability, deployment

2. **"Forward Deployed Engineer" = Palantir playbook in pharma.** Engineers embed with customers (pharma/biotech) to deploy and customize. Consistent with top-10 pharma inbound interest. Nghia Nguyen's Palantir background is directly relevant.

3. **No science/ML research roles listed** — research continues at FutureHouse; Edison focuses on commercial deployment

4. **Senior engineering titles** (Principal, Senior) suggest they're building a production-grade platform, not a prototype

**Strategic inference:** Edison is executing a **Palantir-for-pharma** model — deep enterprise embedding with Forward Deployed Engineers rather than self-serve SaaS. For pharma with proprietary datasets and compliance requirements, this may be the only viable model — but it's expensive and doesn't scale easily.

---

## Conference & Media Presence

### Press Coverage

| Outlet | Coverage | Link |
|--------|----------|------|
| **TIME100 AI 2025** | Sam Rodriques named 100 Most Influential People in AI | [FutureHouse announcement](https://www.futurehouse.org/research-announcements/futurehouse-co-founder-and-ceo-sam-rodriques-named-to-the-time100-ai) |
| **Nature** | Feature on ether0 — first scientific reasoning model trained via RL | — |
| **Bloomberg** | $70M seed raise coverage; Sam Rodriques video interview | [Bloomberg Video](https://www.bloomberg.com/news/videos/2023-11-01/sam-rodrigues-announces-new-venture) |
| **TechCrunch** | FutureHouse platform launch; AI tools for science | [TechCrunch](https://techcrunch.com/2025/05/01/futurehouse-releases-ai-tools-it-claims-can-accelerate-science/) |
| **TechFundingNews** | Edison $70M seed round deep dive | [TFN](https://techfundingnews.com/edison-raises-70m-ai-scientist-platform/) |
| **HPCwire / AIwire** | Edison spinout + Kosmos launch | [HPCwire](https://www.hpcwire.com/aiwire/2025/11/07/futurehouse-spins-out-edison-scientific-launches-kosmos-ai-for-research/) |
| **ALZFORUM** | Kosmos AI Scientist detailed review | [ALZFORUM](https://www.alzforum.org/news/research-news/introducing-kosmos-ai-scientist-makes-discoveries-overnight) |
| **MarkTechPost** | Kosmos technical deep-dive | [MarkTechPost](https://www.marktechpost.com/2025/11/09/meet-kosmos-an-ai-scientist-that-automates-data-driven-discovery/) |
| **Freethink** | Sam Rodriques profile | — |
| **NVIDIA Blog** | Aviary RL framework integration | — |

### Podcast Appearances

| Podcast | Guest | Link |
|---------|-------|------|
| **NYT Hard Fork** | Sam Rodriques (Dec 26, 2025, ~39 min) | [Apple Podcasts](https://podcasts.apple.com/us/podcast/where-is-all-the-a-i-driven-scientific-progress/id1528594034?i=1000742774838) |
| **Scaling Biology / Decoding Bio** | Sam Rodriques | [Substack](https://decodingbio.substack.com/p/scaling-biology-003-sam-rodriques) |
| **Existential Hope** | Andrew White — "Building an AI Scientist to Automate Discovery" | [existentialhope.com](https://www.existentialhope.com/podcasts/andrew-white-building-an-ai-scientist-to-automate-discovery) |
| **SVIcons** | Sam Rodriques | [svicons.com](https://www.svicons.com/) |

### Academic Venues

| Venue | Paper/Event | Year |
|-------|-------------|------|
| **NeurIPS (main track)** | ether0 — first scientific reasoning model via RL | 2025 |
| **Nature** | ether0 feature | 2025 |
| **arXiv** | Kosmos: An AI Scientist for Autonomous Discovery | 2025 |
| **arXiv** | PaperQA2: Superhuman Literature Search | 2024 |
| **arXiv** | BixBench: Bioinformatics Benchmark | 2025 |
| **National Academy of Science** | Andrew White — Chemical Sciences Roundtable | — |
| **White House / NSC** | Andrew White — AI policy meetings (after GPT-4 red-teaming) | — |

→ Kosmos paper: [arXiv:2511.02824](https://arxiv.org/abs/2511.02824)

### Edison Blog Posts

| Date | Title | Link |
|------|-------|------|
| Nov 2025 | Introducing Edison Scientific | [edisonscientific.com](https://edisonscientific.com/articles/announcing-edison-scientific) |
| Nov 2025 | Announcing Kosmos | [edisonscientific.com](https://edisonscientific.com/articles/announcing-kosmos) |

### FutureHouse Research Announcements

| Date | Title | Link |
|------|-------|------|
| Dec 2025 | OXtal: Generative Molecular Crystal Structure Prediction | [futurehouse.org](https://www.futurehouse.org/research-announcements/oxtal) |
| Nov 2025 | Announcing Edison Scientific | [futurehouse.org](https://www.futurehouse.org/research-announcements/announcing-edison-scientific) |
| Aug 2025 | TIME100 AI Recognition | [futurehouse.org](https://www.futurehouse.org/research-announcements/futurehouse-co-founder-and-ceo-sam-rodriques-named-to-the-time100-ai) |
| Jul 2025 | ~30% of Humanity's Last Exam answers are wrong | [futurehouse.org](https://www.futurehouse.org/research-announcements/hle-exam) |
| Jun 2025 | ether0: Scientific Reasoning Model for Chemistry | [futurehouse.org](https://www.futurehouse.org/research-announcements/ether0-a-scientific-reasoning-model-for-chemistry) |
| May 2025 | Robin: End-to-End Scientific Discovery | [futurehouse.org](https://www.futurehouse.org/research-announcements/demonstrating-end-to-end-scientific-discovery-with-robin-a-multi-agent-system) |
| May 2025 | FutureHouse Platform Launch | [futurehouse.org](https://www.futurehouse.org/research-announcements/launching-futurehouse-platform-ai-agents) |
| Mar 2025 | PaperQA2 SOTA on RAG-QA Arena | [futurehouse.org](https://www.futurehouse.org/research-announcements/paperqa2-achieves-sota-performance-on-rag-qa-arena-science-benchmark) |
| Mar 2025 | Announcing BixBench | [futurehouse.org](https://www.futurehouse.org/research-announcements/bixbench) |
| Dec 2024 | Aviary: Training Language Agents | [futurehouse.org](https://www.futurehouse.org/research-announcements/aviary) |
| Sep 2024 | PaperQA2: Superhuman Scientific Literature Search | [futurehouse.org](https://www.futurehouse.org/research-announcements/wikicrow) |

**Media positioning:** Edison benefits from dual credibility — top-tier academic venues (NeurIPS, Nature, arXiv) and mainstream press (TIME, NYT, Bloomberg). The TIME100 AI recognition for Rodriques is a tier of visibility most seed-stage founders never achieve. The FutureHouse research announcement cadence (~monthly since 2024) demonstrates sustained output, not just launch hype. The ALZFORUM coverage is especially notable — it's a niche neuroscience publication read by exactly the pharma researchers Edison needs to convert into customers.

---

## Why This is a Non-Consensus Bet

**What the consensus thinks:**
- AI will cure diseases — it's just a matter of scaling models and getting more biological data
- Drug discovery AI should focus on narrow, well-defined tasks (protein folding, molecular design)
- General-purpose "AI Scientists" are premature and unreliable
- The Palantir model doesn't scale in pharma (long sales cycles, regulatory complexity)
- Nonprofit-to-commercial transitions create governance headaches

**What Edison believes differently:**

1. **The CEO is openly skeptical of AI-cures-diseases hype.** On NYT Hard Fork, Rodriques argued AI probably won't cure diseases anytime soon. The real bottleneck is testing hypotheses in humans (clinical trials), not generating them. This unusual honesty for a $250M-valuation CEO suggests Edison's value proposition is acceleration of research, not replacement of it — and that their long-term play may extend into clinical trial infrastructure.

2. **Domain-specific reasoning models are the contrarian compute bet.** While most companies rely on general-purpose frontier models, Edison/FutureHouse trains its own domain-specific reasoning models via RL. ether0 (24B) outperforms frontier models at chemistry tasks. The bet: smaller, domain-tuned models trained via RL will beat general-purpose models in narrow scientific domains — even as those models get bigger.

3. **Nonprofit-to-commercial structure is a moat, not a liability.** FutureHouse (nonprofit, Schmidt-funded) does basic research → Edison (for-profit) monetizes it. Edison gets philanthropically-subsidized R&D, open-source credibility, and a talent pipeline. Schmidt continues funding FutureHouse. This is the OpenAI playbook — and it gives Edison an R&D cost advantage no pure-commercial competitor can match.

4. **Open-source components, proprietary orchestration.** PaperQA and ether0 are Apache-2.0 open source. But Kosmos is proprietary. Smart moat: individual components are free, but the orchestration, world model, and enterprise features are what you pay for.

5. **Forward Deployed Engineers = Palantir playbook in pharma.** Deep enterprise embedding rather than self-serve SaaS. For pharma with proprietary datasets and compliance requirements, this may be the only viable model. It's expensive and doesn't scale easily — but pharma doesn't need to scale easily; it needs to work at high value per deployment.

6. **79.4% accuracy is a feature, not a bug.** Acceptable for hypothesis generation, not for clinical decision-making. The gap between "AI generates hypotheses" and "AI makes discoveries" is where the real product value lives — accelerating the human scientific loop, not replacing it.

7. **Google AI Co-Scientist is the existential threat — but not yet.** Released Feb 2025, months before Edison's launch. Edison's edge: available *now*, commercially, with citation traceability and Forward Deployed Engineers. But Google could make this broadly available through Google Cloud, potentially at lower cost.

---

## Competitive Landscape

| Competitor | Focus | Stage | vs. Edison |
|------------|-------|-------|-----------|
| **Google AI Co-Scientist** | Hypothesis generation (Gemini 2.0) | Internal/beta | Google resources but not commercially available; data sovereignty concerns |
| **Insilico Medicine** | AI drug discovery | Phase 1/2 clinical trials | Further in clinical pipeline; narrower focus on drug design |
| **Recursion Pharma** | End-to-end AI drug discovery + wet lab | Public ($150M+ revenue) | Owns physical labs; more mature revenue |
| **Isomorphic Labs** | Protein structure (DeepMind/AlphaFold) | Google subsidiary | Google resources; molecular biology focus only |
| **Sakana AI** | Autonomous AI Scientist | Well-funded | Full research loop demonstrated; more academic/generalist |
| **Exscientia/BenevolentAI** | AI drug design | Clinical trials | Further in trials; narrower pharma focus |
| **Insitro** | ML + biology | Well-funded | Daphne Koller-led; biology data generation focus |

**Edison's differentiation:**
1. **Only player offering a general-purpose, commercially available AI Scientist platform** across disciplines (not just drug discovery)
2. **Full citation traceability** — every conclusion traceable to a line of code or published study
3. **Open-source underpinnings** (PaperQA, ether0) build trust and scientific credibility
4. **Unique nonprofit-to-commercial lineage** — philanthropically-subsidized R&D via FutureHouse
5. **Domain-specific reasoning models** (ether0) trained via RL — a differentiated technical approach
6. **Forward Deployed Engineer model** — embedded deployment for pharma compliance requirements

---

## Qualitative Assessment

### Conviction Level: HIGH

**Why this could be a generational company:**

1. **The science is real.** SOD2/cardiac fibrosis, tau/Alzheimer's mechanism — these are genuine scientific discoveries made by AI agents, not marketing demos. 80% reproducibility rate significantly exceeds the ~50% baseline in biomedical research.

2. **PaperQA2's superhuman precision is published and validated.** 85.2% precision vs. 73.8% for human PhD/postdoc researchers on LitQA2 — this is a peer-reviewed result, not a cherry-picked benchmark. Superhuman literature search is a building block that competitors haven't matched.

3. **ether0 is NeurIPS-accepted.** The first scientific reasoning model trained via RL, accepted to the main track of the most prestigious ML conference. The EIRL training methodology (SFT → specialist RL → distillation → generalist RL) is a genuine technical contribution.

4. **The investor syndicate signals deep conviction.** $70M seed with Jeff Dean, frontier AI lab CEOs, and major biotech leadership as angels. When Google's Chief Scientist personally invests in an AI-for-science startup, it's a meaningful technical endorsement.

5. **Eric Schmidt's continued funding of FutureHouse is a hidden subsidy.** Edison gets free R&D from a well-funded nonprofit. No competitor has this structure.

6. **TIME100 AI recognition and 6-of-10 pharma inbound create a demand moat.** Rodriques's visibility and the pre-spinout interest from top pharma suggest the market is pulling Edison forward, not the other way around.

### Key Risks:

1. **No named pharma customer.** "Inbound interest from 6 of top 10 pharma" is promising but not the same as a signed contract. Pharma sales cycles are notoriously long (12–18 months).

2. **79.4% accuracy means 1 in 5 conclusions may be wrong.** Acceptable for hypothesis generation but creates trust challenges in risk-averse pharma environments. The gap between "AI generates hypotheses" and "AI makes reliable discoveries" is real.

3. **Google AI Co-Scientist could commoditize the space.** If Google makes a competitive product broadly available through Google Cloud, Edison's pricing ($200/run) faces downward pressure from a company that can subsidize indefinitely.

4. **Forward Deployed Engineer model is expensive.** Palantir-style embedded deployment works for high-value pharma contracts but limits the number of simultaneous customers and creates scaling challenges.

5. **FutureHouse governance is opaque.** The exact relationship — IP licensing, board representation, exclusivity — between FutureHouse and Edison is undisclosed. Governance complexity could create conflicts as Edison scales.

6. **The CEO's own skepticism cuts both ways.** Rodriques publicly arguing that AI won't cure diseases soon is refreshingly honest — but it also caps the narrative ceiling for a company that needs to sell the dream to pharma executives and investors.

### Bottom Line:

Edison Scientific has the deepest technical foundation of any AI-for-science company: superhuman literature search (PaperQA2), NeurIPS-accepted reasoning model (ether0), genuine scientific discoveries (SOD2, tau mechanism), and an unusual nonprofit-to-commercial structure that subsidizes R&D. The $70M seed with Jeff Dean and frontier lab CEOs as angels is the strongest possible early signal. The key questions are: (1) Can they convert pharma inbound interest into signed contracts? (2) Can the Forward Deployed Engineer model scale? (3) Will Google commoditize the space? If they execute on enterprise sales, Edison becomes essential scientific research infrastructure.

**Verdict: The most technically credentialed AI-for-science platform, with the only published superhuman scientific AI result (PaperQA2) and NeurIPS-accepted domain reasoning model (ether0). High conviction on the research foundation; the commercial execution — converting pharma interest to revenue — is the critical unknown.**

---

*Research compiled: March 2026*
