# Prima Mente

| | |
|---|---|
| **Website** | [primamente.com](https://www.primamente.com) (formerly cfdx.io) |
| **HQ** | London, UK (also San Francisco, Dubai) |
| **Founded** | 2022–2023 |
| **Structure** | Private |
| **Stage** | Pre-Seed / Seed |
| **Lead Investors** | Octopus Ventures |
| **Other Investors** | Antler, Episode 1 Ventures, Beyond Capital, Bluebirds Capital, 2 undisclosed |
| **Total Raised** | $1.42M (disclosed — likely significantly more undisclosed; see Investor Depth) |
| **Valuation** | Undisclosed |

---

## The Big Audacious Idea

**Build biological foundation models trained on the human epigenome to understand, diagnose, and eventually treat neurodegenerative diseases — starting with Alzheimer's.**

Prima Mente's thesis is that the field has been looking at the wrong layer of biology. The current wave of Alzheimer's blood tests — from Fujirebio, Roche, Quest, Labcorp — measures proteins (pTau-217, amyloid beta ratios). These are real advances, but proteins are downstream markers of damage that's already happened. The epigenome — the chemical modification layer above DNA that controls which genes are active in which cells — captures the disease process as it unfolds, reflecting cellular state, tissue-of-origin, and disease heterogeneity in ways that protein snapshots cannot.

The founding insight came from cell-free DNA (cfDNA) research. When cells die — including brain cells in neurodegeneration — they release DNA fragments into the bloodstream. Those fragments carry methylation patterns that reveal which cell type they came from and what state that cell was in. The company was originally named CFDX ("cell-free DNA X") before rebranding to Prima Mente ("First Mind" in Latin). The name changed; the science didn't.

Co-founder Ravi Solanki, whose PhD at Cambridge studied tau-mediated neurodegeneration at the molecular level: *"Diseases like Alzheimer's, Parkinson's, and other neurodegenerative conditions are heterogeneous to the point where even more classical protein-based ways of detecting or diagnosing disease, while interesting, still don't capture the heterogeneity."*

Co-founder Hannah Madan, who previously worked at Cambridge Cancer Genomics (a YC-backed company applying cfDNA to cancer): *"Imaging and cognitive scores don't necessarily tell you how to intervene or change the path of disease... This is what epigenetics can start to unravel."*

The bet: the same foundation model revolution that transformed NLP can transform biology — if you train large enough models on the right biological data (methylated DNA sequences) with enough compute (256 H200 GPUs). Their core model, Pleiades, uses autoregressive transformer decoders to jointly model DNA sequences and cytosine methylation patterns at single-nucleotide resolution. At 7 billion parameters, it achieves 0.89 AuROC for Alzheimer's detection from blood. Combined with the existing protein biomarker pTau-217, that jumps to 0.97. The epigenome doesn't replace proteins — it completes them.

---

## The Problem That's So Hard to Solve

### Why Alzheimer's diagnostics are still broken

Alzheimer's affects 55 million people globally, is the leading cause of death in the UK and sixth in the US, and costs $1.3 trillion annually. Yet most patients are diagnosed late — often after irreversible neuronal loss — because the diagnostic pathway is slow, expensive, and imprecise:

- **Cognitive testing** catches decline after it's already clinically apparent. By that point, the brain has been degenerating for 15–20 years.
- **PET imaging** can detect amyloid plaques but costs $3,000–$5,000 per scan, requires radioactive tracers, and has limited availability. Most NHS facilities don't have access.
- **Cerebrospinal fluid analysis** is the gold standard for biomarkers but requires a lumbar puncture — invasive, painful, and not scalable for population screening.
- **The new blood tests** (pTau-217, amyloid ratios) are a genuine breakthrough — simple, scalable, FDA-breakthrough-designated. But they measure protein markers of damage, not the underlying disease dynamics. They tell you plaques exist; they don't tell you which cells are dying, why, or how the disease will progress in THIS patient.

### Why epigenomics from blood is so hard

The core technical challenge: brain cells are dying and releasing DNA fragments into the bloodstream, but those fragments are vanishingly rare against the background of cfDNA from all other tissues (blood cells, liver, gut). It's like finding a specific conversation in a stadium of 50,000 people shouting.

1. **Low signal-to-noise ratio.** Brain-derived cfDNA is a tiny fraction of total cfDNA. Most fragments come from hematopoietic (blood) cells. Extracting the neurodegenerative signal requires extraordinary sensitivity.

2. **Fragment degradation.** cfDNA fragments are short (~167bp, one nucleosome wrap) and degraded. Methylation patterns must be preserved through sample collection, processing, and sequencing — each step introduces potential information loss.

3. **Disease heterogeneity.** Alzheimer's isn't one disease. Different patients have different cellular compositions, different rates of progression, different genetic backgrounds. A model that works on average may miss the specific pathology in any given patient.

4. **Interpretability for clinical adoption.** Clinicians won't trust a black-box model that says "Alzheimer's: yes/no." Regulatory approval requires understanding what the model is detecting and why. Most deep learning approaches to cfDNA methylation have been unable to connect predictions to biological mechanisms.

5. **Data generation at scale.** Whole-genome bisulfite sequencing (which preserves methylation information) is expensive. Building a training dataset large enough for a 7B-parameter foundation model requires either massive funding or novel data partnerships. Prima Mente chose to build their own wet lab — unusual for a company this size.

### What previous approaches got wrong

The standard approach in computational epigenomics has been narrow classifiers: train a model on methylation data from 200 patients to distinguish disease vs. healthy. These models work in the training cohort but generalize poorly. They don't learn the "language" of methylation — they memorize statistical correlations that break on new populations, new sequencing protocols, or new disease subtypes.

The foundation model approach is fundamentally different: pre-train a model to understand methylation patterns across the entire epigenome, then fine-tune on specific diseases. The model learns general biological principles (which methylation patterns correspond to which cell types, which regulatory states, which developmental programs) that transfer across tasks. This is the GPT-3 → ChatGPT paradigm applied to biology.

---

## The Technology Stack

### Pleiades: Epigenome Foundation Model

[bioRxiv preprint, July 2025](https://www.biorxiv.org/content/10.1101/2025.07.16.665231v1)

**Architecture:** Autoregressive transformer decoder that jointly models DNA sequences and cytosine methylation states at single-nucleotide resolution. Uses alignment embeddings and stacked hierarchical attention to avoid needing extended context lengths — a critical design choice that reduces compute requirements without sacrificing resolution.

**Model scale:** Family of models from 90M to 7B parameters. The scaling behavior follows power laws analogous to LLM scaling — a finding that biological foundation models obey the same compute/data/performance tradeoffs as language models.

**Training data:** Human epigenomic data generated in-house through Prima Mente's own wet lab, supplemented by academic collaborations with Oxford, Hebrew University, Gothenburg, Stanford, and Edinburgh. The company describes building "100+ petabyte-scale multi-omic datasets."

**Performance:**
- **Alzheimer's detection from blood:** 0.89 AuROC (Pleiades 7B alone); **0.97 AuROC** when combined with pTau-217 protein biomarker
- **Cell-type signal enrichment:** Up to **20x enrichment** of signals from specific cell types in blood — addressing the fundamental rare-signal problem
- **72% novel sequences:** Generated sequences show high diversity with no alignment matches to known sequences

**Key insight from the preprint:** Training the model jointly on DNA sequences AND methylation improved performance on both tasks — the multi-modal approach creates richer internal representations than either modality alone. This mirrors findings in NLP where multi-task training improves individual task performance.

### The Goodfire Discovery

[Goodfire](https://www.goodfire.ai) (AI interpretability company, $1.25B valuation) reverse-engineered Pleiades and discovered that the model primarily considers **cfDNA fragment length** when diagnosing Alzheimer's — a novel class of biomarkers not previously identified in scientific literature. This is described as *"the first major finding in the natural sciences obtained from reverse-engineering a foundation model."*

This matters for two reasons: (1) it demonstrates the model is learning real biology, not statistical artifacts, and (2) it provides the interpretability bridge that clinical adoption requires — regulators and clinicians can understand *what* the model is detecting.

### Compute Infrastructure

- **256 NVIDIA H200 GPUs** via Nebius (NVIDIA Cloud Partner) DGX Cloud Lepton platform
- NVIDIA Inception member; early-access program
- Additional distributed compute from Siam AI and Eternis Labs

Ravi Solanki: *"We are pre-training huge models in-house, with up to 80bn parameters. That infrastructure is something only Uber, Wayve, Google DeepMind and other big tech companies used to have access to."*

### In-House Wet Lab

Prima Mente generates its own multi-omic data — a deliberate strategic choice. Most AI-for-biology companies rely on public datasets or academic partnerships for training data. By vertically integrating data generation, they control data quality, sequencing protocols, and sample annotation — creating a proprietary data flywheel that compounds over time.

### SANDBOX Clinical Study

1,000-patient study across **15 NHS sites** in England, Wales, and Scotland. Sponsored by Prima Mente, led by Imperial College London, supported by Health and Care Research Wales and C2N Diagnostics. Chief Investigator: Dr. Ivan Koychev (Imperial College, also Prima Mente's Head of Clinical Translation).

Novel blood collection kits maintain sample quality at room temperature — no cold-chain logistics required, which is critical for deployment across distributed NHS sites.

### Pipeline

| Program | Description | Stage |
|---------|-------------|-------|
| **Pleiades** | Epigenome foundation model for Alzheimer's diagnostics | bioRxiv preprint; SANDBOX clinical study underway |
| **Parthenon** | Virtual cell model for microglia-related therapeutic target discovery | Early development |
| **Brain Foundation Model** | Expanded model incorporating transcriptomics + proteomics | Planned |
| **Therapeutic Design** | In-house drug design using foundation model insights | Horizon |

Two patents filed covering the Pleiades work.

---

## What the World Looks Like If This Works

1. **Alzheimer's gets caught 10–15 years earlier.** A simple blood draw at your annual physical detects epigenomic signatures of neurodegeneration before any cognitive symptoms appear — while intervention can still change the disease trajectory. The current diagnostic pathway (cognitive decline → imaging → specialist referral → diagnosis) gets inverted: molecular detection → preventive intervention.

2. **Neurodegenerative disease gets subtyped like cancer.** Just as cancer moved from "breast cancer" to "HER2-positive, ER-positive, Stage IIA breast cancer" with targeted therapies for each subtype, neurodegeneration gets molecularly subtyped. The epigenome captures which cells are affected, which pathways are dysregulated, and which intervention might work for THIS patient. Madan's vision: *"treating neurodegenerative conditions molecularly, similar to how cancer now receives targeted therapies for specific types."*

3. **Anti-amyloid therapies find the right patients.** Lecanemab and donanemab are the first disease-modifying Alzheimer's drugs, but they only work in patients with specific amyloid profiles and carry serious side effects (brain swelling, hemorrhage). A 0.97 AuROC diagnostic enables precise patient selection — the right drug for the right patient, reducing both undertreatment and adverse events.

4. **The foundation model becomes a drug discovery engine.** If Pleiades learns the epigenomic "language" of neurodegeneration well enough to diagnose it, it may also learn which epigenomic perturbations reverse it — pointing to novel therapeutic targets. The Parthenon virtual cell model is the first step toward this. Prima Mente goes from diagnostics company to integrated drug discovery platform.

5. **Biological foundation models prove scaling laws apply to biology.** If Pleiades demonstrates that bigger models + more biological data = better clinical performance along predictable scaling curves, it validates a new paradigm for computational biology. Every disease area gets its own foundation model. Prima Mente's infrastructure and methodology become the template.

---

## Best Case Scenario / Addressable Opportunity

| Market | Size | Growth |
|--------|------|--------|
| Global Alzheimer's Diagnostics | $9.2B (2025) → $21.5B (2033) | 11.2% CAGR |
| Blood-Based Biomarker AD Diagnostics | $139.7M (2024) → $429.3M (2033) | 15.1% CAGR |
| Global Neurodegeneration Therapeutics | $43B (2024) → $72B (2032) | ~7% CAGR |
| AI in Drug Discovery | $1.5B (2024) → $13.7B (2032) | 32% CAGR |

**The diagnostic opportunity:** There are 55 million people living with dementia globally, with 10 million new cases per year. Most are undiagnosed or diagnosed late. A blood-based epigenomic diagnostic could become standard-of-care alongside or beyond protein biomarkers.

**The therapeutic opportunity:** If foundation model insights lead to novel therapeutic targets, the addressable market expands from diagnostics ($9B) to therapeutics ($43B+). Anti-amyloid drugs alone represent a $10B+ market opportunity.

**The platform opportunity:** If biological scaling laws hold, Pleiades is the first model in a family that extends to Parkinson's, ALS, frontotemporal dementia, MS, and other neurological conditions. The wet lab + model + clinical study infrastructure becomes a platform.

---

## The Science: A Brief History

**1906:** Alois Alzheimer identifies amyloid plaques and neurofibrillary tangles in the brain of Auguste Deter — the first described case of Alzheimer's disease.

**1990s–2010s: The Amyloid Hypothesis Dominates.** The field bets that amyloid plaques cause Alzheimer's. Billions of dollars go into anti-amyloid drugs. Nearly all fail in clinical trials. The field enters a crisis of confidence.

**2010s: Liquid Biopsy Revolution in Cancer.** Researchers discover that tumors shed DNA into the bloodstream (circulating tumor DNA). Companies like Guardant Health, Foundation Medicine, and Grail build multi-billion-dollar businesses on cfDNA analysis for cancer. The technology proves that blood-based molecular diagnostics can transform clinical practice. Jonathan Wan, Prima Mente's co-founder, is at the center of this revolution — his Nature Reviews Cancer paper "Liquid biopsies come of age" becomes a foundational reference, and his work at the Rosenfeld Lab (Cambridge), Diaz Lab (MSK), and Swanton Lab (Crick) achieves 10x sensitivity improvements in ctDNA detection.

**2012–2019: ENCODE Project and Epigenomics Mapping.** The ENCODE project and Roadmap Epigenomics initiative map millions of regulatory elements across hundreds of cell types, establishing that the epigenome controls cellular identity and disease state. This creates the reference data that makes epigenomic AI possible.

**2017–2020: Early cfDNA Methylation for Tissue-of-Origin.** Researchers demonstrate that cfDNA methylation patterns can identify which tissue a DNA fragment came from — proving that the brain's epigenomic signature is detectable in blood, albeit at very low concentrations.

**2020–2023: Foundation Models Transform NLP, Then Biology.** GPT-3 demonstrates that scaling transformer models on large datasets produces emergent capabilities. AlphaFold (2020) proves the paradigm works for biology. Nucleotide Transformer, DNABERT, Enformer, and other models begin applying transformers to genomic sequences — but none jointly model methylation.

**2022–2023: Anti-Amyloid Drugs Finally Work (Barely).** Lecanemab (Eisai/Biogen) and donanemab (Lilly) show modest but statistically significant slowing of cognitive decline in clinical trials. FDA approval creates massive demand for companion diagnostics to identify eligible patients — the clinical pull that makes Alzheimer's blood tests commercially viable.

**2024–2025: Blood-Based Protein Biomarkers Go Clinical.** Fujirebio gets first FDA-approved Alzheimer's blood test. Roche, Quest, Labcorp, C2N follow. pTau-217 becomes the standard protein biomarker. But protein tests have limitations: they detect amyloid/tau pathology but don't capture disease heterogeneity or predict individual trajectories.

**2025: Prima Mente's "Why Now" Convergence.**
- Transformer architectures from NLP applicable to biological sequences ✓
- DGX Cloud / Nebius making 256 H200 GPU clusters accessible to startups ✓
- Epigenomics data generation costs dropping ✓
- Regulatory pathway validated by protein biomarker approvals ✓
- Anti-amyloid therapy approvals creating clinical pull for diagnostics ✓
- NHS diagnostic backlogs creating institutional demand ✓
- Cancer liquid biopsy proving cfDNA analysis is clinically actionable ✓

Hannah Madan's earned insight from Cambridge Cancer Genomics: she saw cfDNA transform cancer diagnostics and realized the same approach — scaled up with foundation models — could do the same for neurodegeneration. Jonathan Wan literally pioneered the cfDNA analysis methods that make this possible.

---

## Commercial Validation

| Partner | Type | Detail |
|---------|------|--------|
| **NHS (15 sites)** | Clinical Study | SANDBOX: 1,000-patient study across England, Wales, Scotland |
| **Imperial College London** | Academic Lead | Leading SANDBOX study; Dr. Ivan Koychev as Chief Investigator |
| **University of Oxford** | Research Collaboration | Co-authors on Pleiades preprint (Clinical Neurosciences, Psychology, Neurology) |
| **University of Gothenburg** | Research Collaboration | Via Henrik Zetterberg; co-author on preprint |
| **Hebrew University of Jerusalem** | Research Collaboration | Co-authors on Pleiades preprint |
| **Stanford University** | Academic Partner | Listed as organizational partner |
| **University of Edinburgh** | Academic Partner | Listed as organizational partner |
| **Goodfire** | AI Interpretability | Reverse-engineered Pleiades; discovered novel cfDNA fragment length biomarker class |
| **NVIDIA** | Compute | Inception member; early-access DGX Cloud Lepton program |
| **Nebius** | Infrastructure | DGX Cloud Lepton AI platform; 256 H200 GPUs |
| **C2N Diagnostics** | Clinical Support | Supporting SANDBOX study |
| **Dementia Platform UK** | Organizational | Research infrastructure partner |
| **UK Office for Life Sciences** | Organizational | Government partnership |
| **Davos Alzheimer's Collaborative** | Organizational | Global initiative partner |
| **Health and Care Research Wales** | Government | Supporting SANDBOX study |

**Revenue model:** Not yet disclosed. Likely paths include diagnostic test licensing/services, pharma partnership deals (companion diagnostic development), and platform licensing for drug discovery applications.

---

## Core Team

### Ravi Solanki — Co-Founder & CEO

| | |
|---|---|
| **Education** | MB/PhD, Medicine & Neurodegeneration, Trinity College Cambridge (2014–2020) |
| **Prior** | Clinical practice at King's College Hospital NHS (during pandemic); Investment Advisor at Norton Holdings; Frontier VC; Primera Capital (early-stage venture fund); Co-Founder of Synvect (health tech incubator — incubated and sold an e-commerce company) |
| **Research** | 12 works, 326 citations (ResearchGate). PhD on tau-mediated neurodegeneration: how tau mutations cause nuclear membrane deformation and disrupted nucleocytoplasmic transport in human neurons. Key paper on NAT10 acetyltransferase as therapeutic target for frontotemporal dementia (bioRxiv 2024) |

**What's notable:** Solanki is the rare founder who has seen the problem from three angles: as a researcher (PhD studying the molecular mechanics of neurodegeneration at Cambridge's Gurdon Institute), as a clinician (treating patients at King's College Hospital during COVID, witnessing the gap between molecular understanding and clinical tools), and as an investor (evaluating biotech companies at Frontier VC and Primera Capital, understanding what makes or breaks a venture-backed approach to biology).

His PhD work is specifically relevant in a way that transcends "he studied neuroscience." He investigated how tau protein mutations physically deform the nuclear membrane of neurons — a mechanism of cell death in frontotemporal dementia. He saw that the field understood pieces of the disease mechanism but lacked the integrative tools to connect molecular events to clinical trajectories across heterogeneous patient populations. His investing experience then showed him that narrow biomarker companies tend to stall — you need a platform approach. The combination produced Prima Mente's thesis: build foundation models that learn the entire epigenomic language of neurodegeneration, not just individual biomarkers.

His claim about compute infrastructure — *"We are pre-training huge models in-house, with up to 80bn parameters. That infrastructure is something only Uber, Wayve, Google DeepMind and other big tech companies used to have access to"* — signals ambition well beyond what the disclosed $1.42M funding would support, suggesting significant undisclosed capital or compute partnerships.

### Hannah Madan, PhD — Co-Founder

| | |
|---|---|
| **Education** | PhD (diet, diabetes, and bowel cancer link); ThePowerMBA (Business Strategy, 2021–2022) |
| **Prior** | Cambridge Cancer Genomics (Chief of Staff — Y Combinator-backed cancer cfDNA company); Healx (product management); Sano Genetics; early lab experience in Steve Ward's lab at University of Bath |
| **Awards** | Winner, BBSRC BiotechnologyYES competition (hypothetical wound healing company) |

**What's notable:** Madan is the co-founder whose prior experience most directly explains why Prima Mente exists. At Cambridge Cancer Genomics (CCG), she had a front-row seat to the cfDNA revolution in cancer — watching a YC-backed startup apply cell-free DNA analysis to detect and monitor tumors from blood draws. She flew out to CCG's Y Combinator launch party on her 25th birthday — a "baptism by fire" introduction to the intersection of genomics, AI, and venture-backed health tech.

The earned insight: cfDNA works for cancer. The same biology — dying cells releasing DNA fragments into blood — happens in neurodegeneration. But nobody had built a company to apply modern AI to cfDNA methylation for brain diseases. The cancer liquid biopsy market produced Guardant ($12B+ market cap), Grail (acquired by Illumina for $7.1B), and Foundation Medicine (acquired by Roche for $5.3B). The neurodegeneration liquid biopsy market has produced... almost nothing.

Her product management experience at Healx (AI for rare disease drug repurposing) and Sano Genetics (genetic data platform) gave her the operational toolkit for building a bio-AI company that needs to coordinate wet labs, ML teams, clinical studies, and regulatory pathways simultaneously. On the [Healthtech Podcast (#423)](https://www.iheart.com/podcast/256-the-healthtech-podcast-43072482/episode/423-teaching-ai-to-predict-the-future-308230090/), she describes Prima Mente's approach as an "ecosystem play" with "atypical competitive strategies" — suggesting the company sees itself as building infrastructure, not just a diagnostic test.

### Jonathan C. M. Wan, MB BChir PhD — Co-Founder

| | |
|---|---|
| **Education** | MB/PhD, Trinity College Cambridge. PhD with Nitzan Rosenfeld at Cancer Research UK Cambridge Institute |
| **Prior** | Postdoc at Diaz Lab, Memorial Sloan Kettering Cancer Center; Swanton Lab, The Francis Crick Institute. Current: Academic Clinical Fellow in Medical Oncology, UCL Hospitals & The Francis Crick Institute |
| **Publications** | First-author in Nature Reviews Cancer, Science Translational Medicine, Nature Communications. Senior author in Lancet Oncology, Trends in Cancer. Key paper: "Liquid biopsies come of age" (Nature Reviews Cancer, 2017) |
| **Awards** | Forbes 30 Under 30 Europe (Healthcare, 2021); MIT Innovator Under 35 Europe (2023); Nobel Week Invitee (2015) |
| **Patents** | Multiple lead-inventor patents used in industry |

**What's notable:** Wan is arguably one of the world's top experts in cell-free DNA analysis. His career trajectory reads like a deliberate masterclass in every aspect of liquid biopsy science:

- **Rosenfeld Lab (Cambridge CRUK):** Where circulating tumor DNA analysis was pioneered. Wan's PhD here gave him foundational expertise in cfDNA biogenesis, fragmentation patterns, and computational analysis methods.
- **Diaz Lab (Memorial Sloan Kettering):** Luis Diaz led the landmark 2022 trial where immunotherapy achieved **100% complete response** in 18 patients with MMR-deficient rectal cancer — one of the most remarkable clinical results in oncology history. Diaz is also a pioneer in liquid biopsy and is now Prima Mente's advisor. Wan trained directly under him.
- **Swanton Lab (Francis Crick Institute):** Charles Swanton's TRACERx study is one of the most important longitudinal studies of tumor evolution. Wan's exposure to longitudinal molecular analysis of disease progression directly informs Prima Mente's approach to tracking neurodegeneration over time.

His technical contribution: achieving a **10x sensitivity increase** for ctDNA detection, enabling early-stage cancer detection from a single drop of blood. The computational methods he developed for extracting weak biological signals from noisy cfDNA data are directly applicable to the even harder problem of detecting brain-derived cfDNA in blood.

The company was originally named CFDX — literally "cell-free DNA X." Wan's expertise IS the company's core technology.

### Key Technical Staff

| Name | Role | Background | Relevance |
|------|------|-----------|-----------|
| **Pouya Niki** | ML Researcher | First author on Pleiades preprint | Core model architect |
| **Christoforos Nalmpantis** | ML Researcher | Second author on Pleiades preprint | Core model development |
| **Donal Byrne** | AI Researcher | Ex-InstaDeep (large-scale RL training); Jaguar Land Rover; NeurIPS attendee | Scaling infrastructure for large model training |
| **Pooja Kathail** | Research Engineer | PhD Computational Biology, UC Berkeley (Ioannidis & Ye labs); ex-Dana Pe'er Lab at MSK; ex-Datavant; 2,239 citations | Deep computational genomics expertise |
| **Arash Keshavarzi** | Team Member | MS Computational & Mathematical Engineering, Stanford; ex-Mubadala Capital; "MD dropout who loves building" | Quantitative modeling + healthcare domain knowledge |
| **Jay Ganbat** | Founding Bioinformatics Engineer | Co-author on Pleiades preprint | Core data pipeline and bioinformatics |
| **Ivan Koychev** | Head of Clinical Translation | Consultant Neuropsychiatrist, Imperial College Hospital NHS; Chief Investigator of SANDBOX | Bridges model development to clinical deployment |

**Team size:** ~31 people across London, San Francisco, and Dubai.

**Team composition signal:** The team is vertically integrated in an unusual way for a startup this size. They have wet lab scientists generating epigenomic data, ML researchers building foundation models, bioinformatics engineers processing sequencing data, and a clinical neuropsychiatrist running an NHS trial. Most 31-person AI-for-biology companies pick one of these — Prima Mente is doing all four. This is either a sign of exceptional ambition with the capital to back it, or a dangerous overextension of limited resources.

---

## Scientific Advisory Board

### Henrik Zetterberg — Professor of Neurochemistry, University of Gothenburg; Head of UK DRI Fluid Biomarker Laboratory, UCL

1,800+ publications. Co-founded Brain Biomarker Solutions (BBS) in Gothenburg. Showed amyloid pathology precedes tau pathology by ~5 years and that altered amyloid homeostasis is evident in pre-symptomatic disease stages. Advises Abbvie, Alector, Annexon, Denali, Eisai, Roche, Siemens Healthineers, Wave, and many others.

**Why this matters for Prima Mente:** Zetterberg is THE authority on fluid biomarkers for neurodegeneration — full stop. He is not just an advisor; he is a co-author on the Pleiades preprint and holds shares in Prima Mente. His involvement is the single strongest scientific validation signal the company has. If Zetterberg — who has spent his entire career developing and evaluating biomarkers for brain diseases, who advises every major pharma company working on Alzheimer's — believes the epigenomic approach adds something that protein biomarkers miss, that is a non-trivial endorsement.

### Luis A. Diaz Jr., MD — Head of Solid Tumor Oncology, Memorial Sloan Kettering; Editor-in-Chief, Cancer Discovery

Led the 2022 trial achieving **100% complete response** in MMR-deficient rectal cancer with immunotherapy — one of the most extraordinary results in modern oncology. Pioneer in liquid biopsy development. Won 2017 AACR Team Cancer Award. Jonathan Wan's PhD postdoctoral mentor.

**Why this matters for Prima Mente:** Diaz provides two things: (1) deep technical credibility in cfDNA analysis — he built one of the most influential liquid biopsy programs in the world at MSK, and (2) direct access to Memorial Sloan Kettering's clinical ecosystem. His advisory role signals that the cfDNA methods Prima Mente is applying to neurodegeneration are scientifically sound — he trained the co-founder who is applying them.

### James Donovan — Research, OpenAI

Leads research on how AI affects learning outcomes and cognitive processes. Previously supported neuroscience research spanning brain-computer interfaces, large-scale connectomics, and foundation models trained on biological data. Angel investor and startup advisor.

**Why this matters for Prima Mente:** Bridges the gap between biological foundation models and frontier AI research. Provides OpenAI network access and expertise on scaling transformer architectures to non-language domains.

---

## Investor Depth

### The Funding Puzzle

Prima Mente has disclosed only $1.42M in funding, yet claims to operate 256 H200 GPUs, employ 31 people across three cities, run a 1,000-patient NHS clinical study, maintain an in-house wet lab, and pre-train models up to 80B parameters. The math doesn't work at $1.42M.

Possible explanations:
1. **Significant undisclosed funding** — the most likely scenario. PitchBook lists 7 investors (only 5 named). A seed round in the $10-30M range would be consistent with the infrastructure claims.
2. **Subsidized compute** — NVIDIA Inception and early-access DGX Cloud programs provide substantial compute credits. Nebius may be providing infrastructure at below-market rates in exchange for a case study customer.
3. **Both** — a combination of undisclosed equity funding and in-kind compute partnerships.

### Octopus Ventures

One of the UK's largest VC firms ($1.9B AUM), known for deep tech and health tech investments. Their involvement at what appears to be the earliest stage suggests conviction in both the founding team and the technical approach. Octopus has a track record of backing UK biotech companies and staying through multiple rounds.

### Antler

Global early-stage VC/accelerator. Prima Mente may have gone through an Antler cohort (CFDX jobs appeared on the Antler job board). Antler provides pre-seed funding, co-founder matching, and operational support for very early-stage companies.

### Episode 1 Ventures

London-based seed-stage VC. Known for backing technical founders in the UK ecosystem.

---

## Hiring Signals & Strategic Direction

**7 open roles** (all SF/London, visa sponsorship offered):

| Role | What It Reveals |
|------|-----------------|
| Bioinformatics Engineer – Multi-omics (x2, including early career) | Scaling data generation capacity; investing in the wet lab → model pipeline |
| Bioinformatics Software Engineer (GPU Accelerated) | Optimizing the compute-intensive sequencing analysis pipeline |
| ML Engineer – Foundation Models for Biology | Expanding model team; likely scaling Pleiades or building Parthenon |
| Forward Deployed Lead | **Key signal:** building customer/partner-facing deployment. Moving from research to product. |
| Senior Software Engineer, Backend and Cloud – Product | Building a platform/SaaS product layer. Skills: Azure, Kubernetes, Spark, GCP, Go |

**Strategic reads:**

1. **"Forward Deployed Lead"** is the most revealing hire. This is Palantir's terminology for engineers who work on-site with customers to deploy technology. It signals Prima Mente is entering the commercialization phase — deploying Pleiades with pharma partners, diagnostics companies, or NHS sites.

2. **GPU-accelerated bioinformatics** suggests the data processing pipeline (not just model training) is compute-bottlenecked. They're likely processing thousands of whole-genome bisulfite sequencing datasets and need hardware acceleration.

3. **"100+ petabyte-scale multi-omic datasets"** mentioned in job descriptions suggests massive data ambitions — far beyond what most biotech companies at this stage attempt.

4. **No commercial/sales roles yet** — the Forward Deployed Lead straddles engineering and deployment, but there are no pure sales, marketing, or BD hires. Still in build-and-deploy mode, not sell mode.

---

## Conference & Media Presence

### Academic Circuit

- **PMWC 2026** (Precision Medicine World Conference, Stanford/UCSF/Yale) — Ravi Solanki presenting: "Foundation models for neurodegenerative diseases"
- **bioRxiv preprint** (July 2025) — Multi-institutional with Oxford, Hebrew University, Gothenburg, Imperial College
- **SANDBOX trial** publications expected as clinical data matures

### Industry Circuit

- **NVIDIA Case Study** — Featured customer showcase
- **Nebius Blog** — Featured partnership story
- **Sifted** (European tech press) — Hannah Madan interview on compute infrastructure
- **BioSpace, GEN, GenomeWeb** — Press release-driven coverage

### Podcast

- **The Healthtech Podcast #423** — Hannah Madan: "Teaching AI to Predict the Future of Your Brain"

**Dual-circuit analysis:** Prima Mente has early presence on both circuits but hasn't broken through on either. The academic signal is real (bioRxiv preprint with major university collaborators, PMWC presentation, Zetterberg co-authorship) but the paper isn't peer-reviewed yet. The industry signal is real (NVIDIA case study, NHS clinical trial) but media coverage is primarily press-release-driven. The Goodfire collaboration — where an interpretability company reverse-engineered their model and discovered a novel biomarker class — is the most interesting crossover signal. It demonstrates the model is scientifically interesting enough to attract external investigation.

The company's biggest media asset is the Intelligence Squared-level advisory board. Zetterberg and Diaz are household names in their respective fields. As Prima Mente matures, these advisors become the credibility bridge to mainstream medical and scientific press.

---

## Why This is a Non-Consensus Bet

### What the consensus thinks:

1. **Protein biomarkers have won.** pTau-217 blood tests from Fujirebio, Roche, and others achieve >90% sensitivity/specificity, cost $200-500, and are getting FDA approval. The Alzheimer's blood test problem is solved — we just need to deploy what exists.

2. **Epigenomics is too noisy for clinical diagnostics.** cfDNA methylation analysis requires expensive sequencing, produces noisy data, and hasn't been validated in large prospective studies for neurodegeneration. It's a research tool, not a clinical tool.

3. **A 31-person startup can't compete with Roche, Fujirebio, and Quest.** Diagnostics is a scale game. You need regulatory approval, CLIA labs, payer reimbursement, and distribution. Big diagnostics companies have all of these. A startup with $1.42M disclosed funding does not.

4. **Foundation models for biology are overhyped.** AlphaFold was a breakthrough, but most biological foundation models have struggled to demonstrate clinical utility beyond academic benchmarks. Scaling laws for biology may not follow the same curves as language.

5. **The real Alzheimer's problem is therapeutics, not diagnostics.** Why diagnose a disease you can't effectively treat? Lecanemab slows decline by ~27% over 18 months with significant side effects. Until there are better treatments, better diagnostics create more anxiety than clinical value.

### What Prima Mente believes differently:

1. **Proteins capture damage; the epigenome captures disease dynamics.** pTau-217 tells you plaques exist. It doesn't tell you which cells are dying, at what rate, through which mechanisms, or how this patient's disease will progress differently from the next. The epigenome captures cellular state — the regulatory programs that determine whether a neuron is healthy, stressed, dying, or already dead. Prima Mente's 0.97 AuROC when combining Pleiades with pTau-217 (vs. 0.89 alone) proves the epigenome adds signal that proteins miss.

2. **The noise problem is a compute problem, and compute is now available.** Previous cfDNA methylation approaches used small models on small datasets. Prima Mente is training 7B-parameter models on DGX Cloud with 256 H200 GPUs — infrastructure that didn't exist for startups 3 years ago. The 20x cell-type signal enrichment shows the models can extract brain-derived signal from blood noise. Solanki: *"That infrastructure is something only Uber, Wayve, Google DeepMind and other big tech companies used to have access to."*

3. **Diagnostics is the wedge; the platform is the product.** Prima Mente isn't building a diagnostic test company. They're building biological foundation models that understand neurodegeneration at the epigenomic level. Diagnostics is the first clinical application. Therapeutic target discovery (Parthenon), drug design, and patient stratification for clinical trials are downstream applications that expand the TAM from $9B (diagnostics) to $50B+ (therapeutics + diagnostics + clinical trial optimization).

4. **Biological scaling laws DO hold — and they've shown it.** The Pleiades preprint demonstrates that model performance scales with data and compute along power-law curves analogous to LLMs. This is empirical evidence, not speculation. And the Goodfire discovery — that reverse-engineering the model revealed a novel biomarker class — shows these models learn real biology, not just statistical correlations.

5. **Better diagnostics make better therapeutics possible.** The anti-amyloid drugs failed for decades partly because clinical trials enrolled heterogeneous patient populations. If you can molecularly subtype Alzheimer's patients using epigenomics, you can design trials for specific subtypes — increasing the probability that targeted therapies show efficacy. Diagnostics and therapeutics are not sequential; they're synergistic.

---

## Competitive Landscape

| Company | Approach | Funding / Scale | Key Difference vs. Prima Mente |
|---------|----------|----------------|-------------------------------|
| **Fujirebio** | pTau-217 / amyloid ratio blood test | Large cap (subsidiary of H.U. Group) | First FDA-approved Alzheimer's blood test. Protein-only; no epigenomic layer. Prima Mente's data shows epigenomics is additive (0.89 → 0.97 AuROC combined). |
| **Roche** | pTau-217 blood test (Elecsys) | Mega cap | FDA breakthrough designation. Platform scale + distribution. Protein-only approach. |
| **Quest Diagnostics** | AD-Detect (protein biomarkers) | $17B+ | US clinical lab network with massive distribution. >90% sensitivity/specificity. But measures one biomarker class. |
| **C2N Diagnostics** | PrecivityAD (amyloid blood test) | Private | Pioneer in blood-based AD diagnostics. *Partner* on SANDBOX study — potentially complementary, not competitive. |
| **ALZpath / Siemens** | pTau-217 antibody + Atellica platform | Licensed deal | Immunoassay on Siemens automated platform. High throughput but protein-only. |
| **AINOSTICS** | AI + brain imaging analysis | Private (UK) | Microstructural disease detection from scans. Different modality (imaging vs. blood). |
| **iLoF** | Photonics + AI blood analysis | Private | "Optomics" — novel optics-based biomarker analysis. Rapid, non-invasive, but less molecularly detailed. |
| **Grail / Illumina** | cfDNA methylation for cancer (Galleri) | Acquired for $7.1B | Proved cfDNA methylation diagnostics at scale — for cancer. No neurodegeneration program. Prima Mente is the Grail equivalent for the brain. |

**Prima Mente's positioning:** They are NOT competing head-to-head with protein biomarker companies. The 0.97 AuROC when combined with pTau-217 positions them as **complementary** — the epigenomic layer that makes protein tests better. This is a strategically elegant positioning: instead of fighting Roche and Fujirebio, partner with them. The most analogous precedent is Grail, which proved that cfDNA methylation analysis could build a multi-billion-dollar company in cancer. Prima Mente is making the same bet for neurodegenerative disease, with foundation models instead of narrow classifiers.

---

## Qualitative Assessment

**Conviction Level: MEDIUM-HIGH**

### Bull Case:

1. **The founding team has the exact right backgrounds, in the exact right combination.** Solanki studied tau-mediated neurodegeneration at Cambridge's Gurdon Institute, then invested in biotech — he understands both the science and the business. Madan saw cfDNA transform cancer diagnostics at Cambridge Cancer Genomics — she recognized the same approach could work for neurodegenerative disease. Wan is one of the world's foremost cfDNA analysis experts, trained at the three most influential liquid biopsy labs in the world (Rosenfeld, Diaz, Swanton), with a 10x sensitivity improvement to his name. The company was literally named CFDX because it's built on Wan's expertise. This isn't "smart people tackling a big problem" — it's the specific people who have the specific insights to build this specific company.

2. **The advisory board provides disproportionate scientific validation.** Henrik Zetterberg (1,800 publications, THE fluid biomarker authority for neurodegeneration) is not just advising — he's a co-author on the preprint and a shareholder. Luis Diaz (MSK, 100% complete response trial, liquid biopsy pioneer) is Wan's direct mentor. James Donovan brings OpenAI connections. For a company with $1.42M disclosed funding, this advisory board belongs to a Series B company.

3. **The Goodfire discovery proves the model learns real biology.** An external interpretability company reverse-engineered Pleiades and found that it uses cfDNA fragment length — a novel biomarker class not in the literature — to diagnose Alzheimer's. This is described as "the first major finding in the natural sciences obtained from reverse-engineering a foundation model." This addresses the interpretability concern head-on and demonstrates the model is discovering biology, not memorizing correlations.

4. **The complementary positioning is strategically brilliant.** By showing that Pleiades + pTau-217 = 0.97 AuROC (better than either alone), Prima Mente positions as additive to existing protein biomarkers, not competitive. This means Fujirebio, Roche, and Quest are potential partners, not opponents. In a market where everyone is fighting over which protein marker is best, Prima Mente is building the next layer.

5. **The Grail precedent validates the business model.** Grail proved that cfDNA methylation analysis can build a multi-billion-dollar diagnostics company. Illumina acquired Grail for $7.1B. Prima Mente is applying the same approach (cfDNA methylation + AI) to a different disease area (neurodegeneration) with a more powerful architecture (foundation models vs. narrow classifiers). The path from cfDNA analysis → clinical utility → massive valuation has been walked before.

### Key Risks:

1. **The funding gap is concerning.** $1.42M disclosed funding vs. 256 H200 GPUs, 31 employees, 3 offices, a 1,000-patient clinical study, and an in-house wet lab. Either there's significant undisclosed funding (in which case, why not disclose it?), or compute partnerships are subsidizing the infrastructure at unsustainable rates. If the compute credits expire before the company raises a proper round, the training pipeline stops.

2. **The Pleiades preprint is not peer-reviewed.** The 0.89 AuROC and 0.97 combined performance are preprint claims. Peer review may identify methodological issues, overfitting concerns, or reproducibility problems. The clinical validation from SANDBOX (1,000 patients, 15 sites) should address this, but results aren't published yet.

3. **Vertical integration at this scale is risky for a startup.** Wet lab + ML models + clinical studies + compute infrastructure + three offices + 31 people. Most startups this size focus on one capability and partner for the rest. Prima Mente is doing everything internally, which creates a data flywheel advantage if it works but could strain resources if any leg fails.

4. **The "better diagnostics for untreatable disease" problem.** Anti-amyloid therapies exist but are only modestly effective (27% slowing) with significant side effects. Diagnosing Alzheimer's earlier doesn't help patients much if there's no effective intervention. The counterargument (earlier diagnosis enables better clinical trial design → better drugs) is logical but depends on a chain of future events.

5. **Regulatory and reimbursement uncertainty.** Even if the science works, getting a novel epigenomic diagnostic through FDA/MHRA approval, establishing clinical utility, and securing payer reimbursement takes years and millions of dollars. Protein biomarkers are ahead in this regulatory race.

**Bottom Line:** Prima Mente is building the Grail equivalent for neurodegeneration — applying cfDNA methylation analysis and foundation models to diagnose brain diseases from blood. The founding team is surgically assembled: a neurodegeneration researcher who became a biotech investor (Solanki), a cancer-cfDNA veteran who saw the cross-domain opportunity (Madan), and one of the world's top cfDNA analysis experts (Wan). The advisory board (Zetterberg, Diaz) provides scientific validation disproportionate to the company's stage. The Goodfire interpretability discovery and the complementary positioning with protein biomarkers are strategically elegant. The main uncertainty is financial — the disclosed funding ($1.42M) doesn't match the infrastructure claims, and either there's significant undisclosed capital or the company is operating on borrowed compute time.

**Verdict: A scientifically credible, strategically well-positioned company with the exact right founding team for the problem — held back from HIGH conviction only by the opaque funding situation and pre-peer-review status of the core science. If the SANDBOX clinical data validates the preprint claims and the funding picture clarifies, this moves to HIGH.**

---

*Research compiled: March 2026*
