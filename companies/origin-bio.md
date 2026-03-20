# Origin

**Website:** [origin.bio](https://origin.bio)
**HQ:** San Francisco, CA (311 California Street)
**Founded:** 2025
**Structure:** Private
**Stage:** Pre-Seed / Y Combinator W26 batch (Demo Day: March 24, 2026)
**Lead Investors:** Y Combinator
**Other Investors:** Not publicly disclosed beyond YC
**Total Raised:** Undisclosed (YC standard deal)
**Valuation:** Not publicly disclosed

---

## The Big Audacious Idea

**Use AI to make cell and gene therapies safe enough to become mainstream cures.**

Cell and gene therapies have already cured stage IV leukemia, retinal disease, and spinal muscular atrophy. In theory, they could provide durable, one-shot cures for cancer, autoimmune disorders, neurodegenerative diseases, and aging. But in practice, they keep killing patients. Children have died in clinical trials from liver toxicity. Adults have suffered cardiac arrest from immune overreaction. The FDA has approved only ~37 cell and gene therapy products despite thousands in development.

The root cause is deceptively simple: we cannot precisely control *where*, *when*, and *how much* a therapeutic gene turns on. A gene therapy meant to activate only in diseased brain cells might also fire in the liver, the heart, or everywhere — causing catastrophic off-target effects.

Origin's thesis: the key to unlocking safe gene therapies lies in **regulatory DNA** — the enhancers and promoters that act as switches and dials controlling gene expression. If you can design regulatory DNA that activates a therapeutic gene *only* in the right cell type, at the right time, at the right intensity, you eliminate the toxicity problem that has plagued this entire drug class. And AI is now good enough to design these sequences from scratch, something that brute-force biology has failed to do reliably.

---

## The Problem That's So Hard to Solve

### Why regulatory DNA design is the bottleneck

The human genome contains millions of regulatory DNA elements — enhancers, promoters, silencers, insulators — that collectively orchestrate which of your ~20,000 genes turn on in which cells. A neuron and a liver cell have identical DNA, but radically different gene expression profiles, entirely determined by these regulatory elements. Understanding and engineering this regulatory code is arguably the hardest unsolved problem in genomics.

### Why current approaches fail

Today's gene therapies overwhelmingly use blunt-instrument promoters — ubiquitous constitutive promoters like CMV, CBA, or CAG that blast gene expression everywhere, in every cell type. This is like using a megaphone when you need a whisper in one ear. The consequences are real:

1. **Dose-dependent toxicity** — High viral vector doses cause liver damage because the therapy activates indiscriminately. Multiple children have died from this in Astellas trials since 2020.
2. **Immune overreaction** — A Duchenne muscular dystrophy patient died within 8 days of treatment from innate immune signaling triggered by high-dose AAV.
3. **Methylation silencing** — Strong constitutive promoters get shut down by the cell's own defense mechanisms over time, reducing therapeutic durability.
4. **Off-target expression** — Therapeutic proteins produced in the wrong tissues cause cytotoxicity.

### Why hasn't someone solved this?

The regulatory code is combinatorial and context-dependent. A sequence that acts as an enhancer in a kidney cell might be inert in a neuron. Chromatin accessibility, nucleosome positioning, transcription factor availability, and 3D genome architecture all modulate whether a given sequence does anything at all. Traditional approaches — repeating known motifs, random ligation of sequences, screening natural enhancers — either reliably yield poor candidates or require enormous brute-force screening to find even one promising hit. The search space is astronomical: for a 200bp regulatory element, there are 4^200 possible sequences (~10^120).

Critically, 90% of disease-associated genetic variants identified by GWAS lie in non-coding regulatory regions, not in protein-coding genes. The field has known for years that regulatory DNA is where the action is, but lacked the tools to engineer it systematically.

---

## The Technology Stack

### Axis: Unified Generative + Predictive DNA Model

[Announced October 2025](https://origin.bio/introducing-axis/), Axis is Origin's core AI model. It is described as the first model to unify three capabilities in one architecture:

- **DNA-to-DNA** (generation): Generate novel regulatory sequences from scratch
- **DNA-to-function** (prediction): Predict what a given sequence will do in a given cell type
- **Function-to-DNA** (conditional generation): Given a desired expression profile, generate sequences that achieve it

**Architecture:** Shared Transformer backbone with diverging nucleotide and assay prediction heads after the final Transformer layer. Cell type and prompt information (regulatory type, target transcription factor proteins) are tokenized and appended to input DNA sequences. The loss function combines cross-entropy for nucleotide prediction with factorized Poisson and multinomial losses for regulatory region profiles and intensity.

**Training Data:** ENCODE V4 Registry intervals of independent cis-regulatory elements (CREs) from the SCREEN database. CREs are ranked by mean activity with z-score rankings per biosample-assay combination. Training and test sets use separate genomic coordinate scaffolds to prevent data leakage.

**Performance vs. AlphaGenome:**
- Outperforms Google DeepMind's AlphaGenome at predicting regulatory element binding activity by **6.7% on average**
- High-affinity prompts produce sequences with **up to 9x enrichment** of targeted transcription factor binding sites vs. low-affinity prompts
- Entropy-based sampling increases motif enrichment **up to 5x** vs. random unmasking

**Regulatory Element Types:** Operates on three categories: distal enhancer-like sequences (>2,000bp from TSS), proximal enhancer-like sequences (~2,000bp proximity), and promoter-like sequences (within 200bp of TSS).

**Key insight:** Training the model on DNA generation *improved* its ability to predict properties of existing sequences — the multitask approach creates richer internal representations of regulatory biology.

### Switch: Open Regulatory Sequence Library

Origin released **10,000 AI-designed proximal enhancer-like sequences** across three cell types, including:
- Predicted activity data
- Transcription factor binding annotations
- 3D structural predictions

This serves as both a research contribution and a demonstration of Axis's capabilities to potential pharma/biotech partners.

### Proprietary Dataset

Origin is building what they describe as "the largest proprietary dataset" of experimentally validated regulatory DNA sequences across multiple cell and tissue types. This dataset includes:
- Millions of synthetic regulatory sequences
- Sequence-protein interaction data
- Cell-state perturbation data

Over **72% of generated sequences show high diversity** with no alignment matches to known sequences — meaning the model is creating genuinely novel regulatory DNA, not regurgitating the training set.

### Recent Technical Work (March 2026)

- Benchmarked **Muon and Adam optimizer variants** for regulatory DNA modeling, showing MuonW reaches target validation perplexity with ~37% fewer FLOPs than AdamH — suggesting significant compute efficiency gains for training future models.

---

## What the World Looks Like If This Works

1. **Gene therapies become safe enough for common diseases** — Not just rare monogenic disorders, but cancer, Alzheimer's, heart disease, and autoimmune conditions get durable, one-shot genetic cures because expression can be precisely targeted to disease cells only.

2. **Dosing drops by orders of magnitude** — If therapeutic genes only activate in the right cells, you don't need to flood the body with viral vectors. Lower doses = fewer immune reactions = fewer deaths in clinical trials.

3. **Cell and gene therapy approvals accelerate** — The FDA has approved ~37 CGT products despite ~1,986 in development. If Origin's regulatory DNA eliminates the toxicity bottleneck, approval rates could increase dramatically. The current pace of 10-20 new approvals per year could multiply.

4. **A new platform layer emerges in biotech** — Origin becomes the "regulatory DNA design layer" that every gene therapy developer uses, similar to how Twist Bioscience became the DNA synthesis layer. Every AAV, lentiviral, or mRNA therapy needs a promoter/enhancer — Origin designs the optimal one.

5. **Programmable gene expression becomes routine** — Rather than on/off switches, therapies gain rheostat-like control: activate a gene only in certain cell states, at specific intensities, in response to disease signals. This transforms gene therapy from a blunt instrument into precision medicine.

---

## Best Case Scenario / Addressable Opportunity

**Cell & Gene Therapy Market:**
- $9B–$35B in 2025 (depending on scope definition)
- Gene therapy specifically: ~$9.7B in 2025, projected $24.3B by 2030 (CAGR ~20%)
- Combined CGT market projected to reach **$117B–$232B by 2033–2035**
- ~900+ companies worldwide, ~1,000+ clinical trials in progress

**Origin's Addressable Layer:**
- Every gene therapy product needs regulatory DNA (promoters, enhancers, UTRs, insulators)
- The upstream DNA synthesis market is ~$4.5B (2024), growing to $14.2B by 2032
- Origin sits between DNA synthesis and therapeutic development — designing *what* gets synthesized
- If Origin captures even a fraction of R&D spend on regulatory element optimization across ~1,986 products in development, the opportunity is substantial

**Key TAM drivers:**
- Regulatory authorities cleared 9 CGTs in 2024 alone
- FDA RMAT designation trims development time by ~40%
- Starting 2025, 10-20 new advanced therapies could be approved annually
- Asia-Pacific CGT market accelerating at 27.68% CAGR

---

## Commercial Validation

Origin is pre-revenue and pre-commercial as of March 2026. They are actively seeking partnerships with pharma/biotech companies working in cell & gene therapies, offering:
- Regulatory sequence design for target disease cell types
- Access to proprietary dataset of sequence properties, sequence-protein interactions, and cell-state perturbations

| Partner | Deal Type | Value or Domain | What They Did |
|---------|-----------|----------------|---------------|
| Y Combinator | Accelerator (W26) | Standard YC deal | Accepted into W26 batch, Demo Day March 24, 2026 |
| Pharma/Biotech (sought) | Design partnerships | Regulatory DNA design | Actively seeking partners for sequence design collaborations |

**Contact for partnerships:** yash@origin.bio

---

## Core Team

### Yash Rathod — CEO & Co-Founder

| | |
|---|---|
| **Education** | BS Computer Science, University of Illinois Urbana-Champaign (2021–2025) |
| **Prior Roles** | Resolvd AI (startup); PURE Research Program at UIUC; previous startup (sold) |
| **Key Achievement** | First Prize, 2022 OpenCV AI Research Competition (COCOpen project) |
| **Research** | Computer Vision, Reinforcement Learning, robotic manipulation |

**What's notable:** Rathod is a serial entrepreneur who took a gap year from UIUC to build and sell a startup before returning to finish his degree — and then dropped out again to build Origin. His OpenCV-winning project, COCOpen, was a data augmentation tool for computer vision that took "two years of effort researching problems in computer vision" and turned lab research into a user-friendly product — the same pattern he's applying at Origin (turning genomics research into a usable platform). He grew up in India aspiring to be a professional cricketer before pivoting to tech. His background is pure CS/ML, not biology — which is a deliberate choice for a company whose thesis is that AI can crack the regulatory code where biology alone has failed. His [podcast appearance on The UIUC Talkshow](https://creators.spotify.com/pod/profile/uiuctalkshow/episodes/22---Yash-Rathod-Dropping-Out--Startups--and-Religion-e1pc33v) covers his journey from India to UIUC to startups.

### Malhar Bhide — CTO & Co-Founder

| | |
|---|---|
| **Education** | BS Computer Science, University of Illinois Urbana-Champaign (Grainger College of Engineering) |
| **Prior Roles** | Research Engineer, Automorphic (YC S23) — Aug–Dec 2024; ML Intern, Wadhwani AI — Jul–Dec 2020 |
| **Publications** | "COVID-19 activity risk calculator as a gamified public health intervention tool" — *Nature Scientific Reports* (2023). 3 publications, 1+ citations |
| **Research** | Disease modeling, neural networks, CNNs for robotic perception |

**What's notable:** Bhide published in Nature Scientific Reports while still in high school — a COVID-19 risk modeling tool (CovARC) that demonstrated his ability to apply ML to real-world health problems at a remarkably early stage. His time at Automorphic (a YC S23 company building LLM fine-tuning infrastructure) gave him experience building production AI systems, not just research prototypes. At Wadhwani AI (a nonprofit applying AI to social good in India), he worked on ML for healthcare in resource-constrained settings. The through-line across his career is applying ML to biological/health problems — which is exactly what Origin does. Like Rathod, his background is CS/ML rather than biology, reinforcing Origin's bet that this is fundamentally an AI problem.

**Team Size:** 4 people (as of YC profile)

---

## Scientific Advisory Board

### Dr. Manolis Kellis — Professor, MIT & Broad Institute

Head of the MIT Computational Biology Group (CSAIL). Leads research in genomics, epigenomics, and **regulatory genomics** — the exact domain Origin operates in. Co-led the NIH Roadmap Epigenomics Project, led comparative analysis of 29 mammalian genomes, and contributed to ENCODE, GENCODE, and modENCODE projects. His lab generated maps of genomic control elements across **127 primary human tissues and cell types** and tissue-specific regulatory networks linking elements to target genes. 250+ publications, **190,000+ citations**. Awards include Presidential Early Career Award (PECASE) and Sloan Fellowship. PhD from MIT (Sprowls Award for best CS doctorate thesis). Elected member of major scientific academies.

**Why this matters for Origin:** Kellis is one of the world's foremost experts on regulatory genomics — his lab literally built the reference maps of enhancers and promoters across human cell types that inform Origin's approach. His involvement signals that Origin's scientific foundation is credible at the highest level.

### Dr. Nicole Paulk — CEO & Founder, Siren Biotechnology; Former UCSF Faculty

Nearly two decades of AAV gene therapy expertise. BS Medical Microbiology, PhD in AAV Gene Therapy & Regenerative Medicine, postdoc/instructorship in Human Gene Therapy at Stanford. Founded Siren Biotechnology (backed by Founders Fund and Lux Capital) to develop AAV immuno-gene therapy for cancer. Sits on SABs of Sarepta, Astellas, Metagenomi, Dyno Therapeutics, and others. Has written draft CMC guidance for the FDA. In January 2026, Siren received FDA clearance for its first IND.

**Why this matters for Origin:** Paulk is one of the most connected people in the AAV gene therapy world, sitting on SABs of the companies that would be Origin's customers. She provides direct channel to the companies that need better regulatory DNA — and she understands exactly why current promoters are inadequate.

### Dr. Rashid Bashir — Dean of Grainger College of Engineering, UIUC

Pioneer in bio-nanotechnology, BioMEMS, biosensors, and microfluidics. Founding team member of Chan Zuckerberg Biohub Chicago (2023). Co-founder of Prenosis (sepsis diagnostics) and Daktari (microfluidic biochips). Elected to National Academy of Medicine (2023), American Academy of Arts & Sciences (2024), and National Academy of Inventors. Fellow of IEEE, BMES, AIMBE, and others.

**Why this matters for Origin:** As Dean of the engineering college where both founders studied, Bashir provides institutional credibility and UIUC network access. His CZ Biohub Chicago connection (focused on inflammation — a major CGT target) and entrepreneurial track record (two biotech startups) bring practical commercialization expertise.

---

## Investor Depth

### Y Combinator (W26 Batch)

**Why they invested:** YC has been building a growing biotech portfolio, including WhiteLab Genomics (another AI-for-gene-therapy company). Origin fits YC's pattern of backing technical founders who apply CS/ML to hard science problems. The gene therapy safety problem is large enough for a venture-scale outcome, and the founders' ML backgrounds (OpenCV prize winner, Nature-published disease modeler, Automorphic engineer) demonstrate the ability to build production AI systems.

**What signal it sends:** YC acceptance validates that Origin's technical approach is differentiated enough to stand out in a competitive W26 batch of 196 companies. YC partner Ankit Gupta is the assigned partner, suggesting alignment with YC's biotech thesis.

**What's missing:** Origin has not publicly disclosed any additional investors beyond YC. At this stage (4-person team, launched publicly in Feb 2026), they may be raising a seed round around Demo Day (March 24, 2026).

---

## Hiring Signals & Strategic Direction

No specific open roles were found on Origin's website or major job boards as of March 2026. The team is currently 4 people. Given their Y Combinator Demo Day is March 24, 2026, hiring will likely accelerate post-fundraise.

**What to watch for:** Wet lab / experimental biology hires would signal they're building in-house validation capabilities (rather than relying on partner labs). Computational biology hires would signal expansion of the Axis model. Business development hires would signal the start of pharma partnership efforts.

---

## Conference & Media Presence

### Public Presence
- **Y Combinator Launch** (February 2026) — Public launch announcing Axis and the company's mission
- **X/Twitter** (@origin_bio) — Active since September 2025, sharing technical updates and company vision
- **Co-founder Malhar met with PM Narendra Modi** at a CEOs of AI and deeptech startups event at Seva Teerth — notable visibility for an early-stage startup

### Podcast Appearances
- **Yash Rathod on The UIUC Talkshow** (Episode #22: "Dropping Out, Startups, and Religion") — Covers his personal journey, gap year, selling his first company, and returning to UIUC

### Technical Publications
- Blog posts on origin.bio covering Muon/Adam optimizer benchmarks for regulatory DNA modeling and methodology for AI-designed regulatory sequences (March 2026)

**Assessment:** Origin is extremely early-stage. They have minimal media coverage outside of YC and their own channels. Conference presence at ASGCT, ENCODE consortium meetings, or major genomics conferences would be a strong signal to watch for.

---

## Why This is a Non-Consensus Bet

### What the consensus thinks:

1. **Gene therapy's safety problem will be solved by better delivery vectors** — The industry consensus, driven by companies like Dyno Therapeutics ($109M raised, partnerships with Roche, Novartis, Sarepta worth billions), is that the key to safer gene therapy is better AAV capsids that target the right tissues. Fix the delivery vehicle, fix the safety problem.

2. **Regulatory DNA design is an academic exercise** — Enhancer/promoter engineering is viewed as interesting science (ENCODE, Roadmap Epigenomics) but not yet ready for commercial application. The regulatory code is too complex and context-dependent.

3. **You need deep biological expertise to work on gene therapy** — The dominant view is that biotech companies need PhD biologists and MD-PhDs to credibly work in this space. A team of CS undergrads from UIUC would be dismissed by most biotech investors.

4. **AlphaGenome (DeepMind) will dominate genomic AI** — With the full weight of Google DeepMind behind it, published in Nature (January 2026), open-sourced, and already used by 3,000 scientists in 160 countries, AlphaGenome is seen as the definitive regulatory DNA prediction model.

5. **Asimov already owns this space** — With $209M raised, partnerships with major pharma, and their own AI-designed tissue-specific promoters (AAV Edge), Asimov is perceived as the incumbent in computational regulatory DNA design.

### What Origin believes differently:

1. **The promoter/enhancer is the real safety bottleneck, not the capsid** — Better delivery doesn't matter if the cargo activates in the wrong cells. You can deliver a gene precisely to the brain but still get toxic off-target expression if your promoter fires everywhere. Regulatory DNA is the safety layer that sits *inside* the therapeutic vector.

2. **Generative AI has crossed the threshold for de novo regulatory DNA design** — Origin's Axis model doesn't just predict what existing sequences do (like AlphaGenome) — it *generates* novel sequences optimized for specific cell states. This is the difference between a search engine and a design tool.

3. **Pure ML founders have an advantage in this space** — The regulatory code is fundamentally a sequence-to-function prediction problem. Biologists have spent decades trying to decode it with reductionist experiments. Origin's bet is that transformer architectures trained on ENCODE data can learn the combinatorial rules that biology alone cannot — and that ML-native founders build better AI systems.

4. **AlphaGenome is a prediction model, not a design platform** — DeepMind built AlphaGenome to predict what DNA sequences do, not to generate new ones. Origin's Axis unifies prediction AND generation, and claims to outperform AlphaGenome on prediction benchmarks by 6.7% while also being able to design sequences — a fundamentally different product.

5. **Asimov is a platform company, not a regulatory DNA specialist** — Asimov spans cell line development, DNA optimization, host cells, and promoter design. Origin's entire focus is regulatory DNA. Depth of specialization may beat breadth at solving this specific problem.

---

## Competitive Landscape

| Company | Focus | Funding | Differentiation vs. Origin |
|---------|-------|---------|---------------------------|
| **Asimov** | End-to-end genetic design + manufacturing; AAV Edge platform; AI-designed tissue-specific promoters | $209M (Series B) | Broader platform (cell lines, vectors, promoters). Origin is more focused on regulatory DNA specifically. Asimov has pharma partnerships and revenue. |
| **Dyno Therapeutics** | AI-designed AAV capsids for gene therapy delivery | $109M (Series A) | Focuses on the *delivery vehicle* (capsid), not the *cargo control* (regulatory DNA). Complementary rather than directly competitive. Partners include Roche ($1B+ deal), Novartis, Sarepta. |
| **WhiteLab Genomics** | AI simulations for gene/cell therapy optimization (AAV, lentivirus, nanoparticles) | YC-backed, undisclosed | Broader optimization platform across modalities. Less focused on generative regulatory DNA design. |
| **Google DeepMind (AlphaGenome)** | Prediction of regulatory activity from DNA sequence | Internal (Google) | Prediction-only model (not generative). Open-sourced for research. Not a commercial product for drug developers. Published in Nature Jan 2026, 3,000+ users. |
| **regLM (Academic)** | Autoregressive language models for synthetic CRE design | Academic (not commercialized) | Framework for designing synthetic promoters/enhancers. Published methodology but no commercial platform. |
| **DNA-Diffusion (Academic)** | Diffusion models for synthetic regulatory elements | Academic; published in Nature Genetics 2025 | Generative approach, demonstrated enhanced activity in episomal assays. Academic proof-of-concept, not commercialized. |

**Origin's edge:** Only company to unify generation and prediction in a single model (Axis), with a focus exclusively on regulatory DNA for cell/gene therapy safety. The risk is that Asimov, with 50x more funding, adds this capability to their existing platform.

---

## Qualitative Assessment

**Conviction Level: MEDIUM**

### Bull Case:

1. **The problem is real and urgent** — Gene therapy deaths in clinical trials are not hypothetical. Children have died. The FDA has flagged safety as the primary bottleneck. Precise transcriptional control through better regulatory DNA is the highest-leverage intervention.

2. **Technical credibility through Axis benchmarks** — Outperforming DeepMind's AlphaGenome on prediction benchmarks while also offering generation capability is a meaningful technical claim. The 9x enrichment of targeted TF binding sites in generated sequences suggests the model is learning real biology.

3. **World-class SAB for a 4-person startup** — Having Manolis Kellis (190K citations, built the regulatory genomics reference maps), Nicole Paulk (connected to every major AAV gene therapy company), and Rashid Bashir (Dean of Engineering, NAM member) is extraordinary for a pre-seed company. These advisors wouldn't lend their names to bad science.

4. **Timing is right** — AlphaGenome (June 2025) proved that AI can predict regulatory function at scale. The 2026 discovery that promoters and enhancers share unified logic (Cornell) opens new design principles. ENCODE V4 provides unprecedented training data. The AI-for-genomics moment has arrived.

5. **Massive market if CGT safety unlocks** — The cell and gene therapy market could reach $100B+ by the early 2030s, and every product in that pipeline needs regulatory DNA. Origin could become the default design layer.

### Key Risks:

1. **Extremely early stage** — 4 people, no revenue, no disclosed funding beyond YC, no wet lab validation published, no pharma partnerships signed. The gap between AI-predicted sequences and clinically validated regulatory elements is enormous.

2. **Asimov is the 800-pound gorilla** — With $209M, established pharma partnerships, and their own AI-designed promoters, Asimov could absorb Origin's value proposition as a feature. Origin needs to move fast or get acquired.

3. **CS founders in biotech face a credibility gap** — Despite strong ML backgrounds, neither founder has biology training. In a field where wet lab validation is everything, they'll need to hire or partner for experimental capabilities quickly. The SAB partially compensates but doesn't replace in-house expertise.

4. **In silico ≠ in vivo** — Generating sequences that look good computationally is very different from sequences that work in living cells, animal models, and eventually humans. The translation gap in genomics AI is notoriously wide. 72% novel sequences is impressive for diversity but says nothing about function.

5. **AlphaGenome is free and open** — DeepMind open-sourced AlphaGenome for research use. If pharma companies can use AlphaGenome for prediction and combine it with simple generative approaches, Origin's competitive moat narrows. Origin needs to prove that unified prediction+generation significantly outperforms modular approaches.

**Bottom Line:** Origin is attacking a genuine, high-value problem — the safety bottleneck that has prevented cell and gene therapies from reaching their potential. Their Axis model shows promising benchmarks, and their advisory board lends serious scientific credibility. But they are *extremely* early. The company is 4 people, pre-revenue, with no published wet lab validation of their AI-designed sequences actually working in cells. The competitive landscape includes Asimov ($209M), DeepMind (AlphaGenome), and growing academic tools. Origin's path to success requires proving that their sequences work biologically, securing pharma partnerships, and building a proprietary data flywheel before better-funded competitors close the gap.

**Verdict: A high-risk, high-potential bet on two technical ML founders who have assembled a disproportionately strong advisory board and built an AI model that makes credible benchmark claims against DeepMind. Worth watching closely through Demo Day (March 24, 2026) and their first wet lab validation results.**

---

*Research compiled: March 2026*
