# Proxima (formerly VantAI)

**Website:** [proximabio.com](https://proximabio.com)
**HQ:** New York City
**Founded:** 2019 (as VantAI, Roivant spinout) | Rebranded to Proxima: January 2026
**Stage:** Seed ($80M, January 2026)
**Lead Investor:** DCVC (largest TechBio investment to date through Series A)
**Other Investors:** NVentures (NVIDIA), Braidwell, Roivant, AIX Ventures, Yosemite, Magnetic Ventures, Alexandria Venture Investments, Modi Ventures

---

## The Big Audacious Idea

**Make protein-protein interactions programmable.**

Every biological process in health and disease is mediated by protein-protein interactions (PPIs). Yet fewer than 5% of these interactions have been structurally characterized. Roughly 80% of disease-relevant proteins remain "undruggable" with conventional approaches (small molecules that fit into a protein's binding pocket). The entire history of drug discovery has been constrained by this fundamental limitation.

Proxima's thesis: if you can systematically map how proteins interact at atomic resolution and then train AI models to design molecules that induce, modulate, or block those interactions at will, you unlock an entirely new modality of medicine. You go from finding drugs by accident to programming biology by design.

---

## The Problem That's So Hard to Solve

### Why protein interactions are the final frontier

Traditional drug discovery works by finding a small molecule that fits into a protein's active site — like a key in a lock. But most disease-causing proteins don't have convenient pockets. They operate through flat, transient, context-dependent interactions with other proteins. These protein-protein interfaces are enormous (1,500-3,000 A^2), shallow, and dynamic. For decades, they were considered fundamentally undruggable.

### The molecular glue breakthrough

Molecular glues are small molecules that don't fit into a pocket — they modify a protein's surface to create a new interface, essentially "gluing" two proteins together that wouldn't normally interact (or strengthening a weak existing interaction). This is a paradigm shift: instead of blocking a protein's function, you're reprogramming the cell's machinery.

The catch: molecular glue discovery has historically been almost entirely serendipitous. Thalidomide (1950s), cyclosporine (1970s), and rapamycin (1970s) were all discovered by accident. The field couldn't rationally design molecular glues because it lacked:

1. **Structural data on protein interactions at scale** — you can't design a glue for an interface you've never seen
2. **Generative AI models** capable of designing molecules for ternary (3-body) complexes
3. **A high-throughput experimental platform** to generate the training data these models need

Proxima is attacking all three simultaneously.

---

## The Technology Stack

### NeoLink: Industrial-Scale Structural Proteomics

NeoLink is Proxima's proprietary experimental platform that uses **crosslinking mass spectrometry (XL-MS)** at industrial scale. XL-MS works by chemically crosslinking proteins that are near each other, then using mass spectrometry to identify which residues were crosslinked. This provides distance constraints on protein-protein interfaces — essentially a low-resolution structural map of how proteins interact in their native cellular context.

The key insight: XL-MS is **up to 6 orders of magnitude cheaper than cryo-EM** for generating structural interaction data. By industrializing this technique, Proxima is building the largest proprietary atlas of real-world protein-protein interactions ever assembled.

This is the data moat. In an era where everyone has access to similar foundation models, proprietary biological data is the defensible advantage. NeoLink is to Proxima what the Protein Data Bank was to AlphaFold — except it captures protein *interactions* (dynamic, context-dependent, cellular) rather than individual protein structures (static, purified, crystallized).

### Neo-1: Frontier AI Foundation Model

Neo-1 is a latent diffusion model unveiled at NVIDIA GTC 2025. Key technical properties:

- **Unifies structure prediction and de novo molecular generation** in a single model (first to do this)
- Accepts **multimodal inputs**: any combination of partial sequence, partial structure, and experimental (XL-MS) data
- Generates latent representations of molecules that decode into 3D structures (not just coordinate prediction)
- Can **generate novel small molecules** tailor-made to stabilize or disrupt a specific protein-protein interface
- Among the **largest diffusion-based models in biology**, trained on structural + synthetic datasets using hundreds of NVIDIA H100 GPUs
- Trained on NeoLink's proprietary dataset, giving it capabilities no publicly-trained model can replicate

Real-world impact: generating active small molecules for previously undruggable targets in **weeks** instead of years.

---

## What the World Looks Like If This Works

If Proxima succeeds in making protein interactions truly programmable:

1. **80% of the proteome opens up as drug targets.** Diseases with no current treatment options (many cancers, neurodegenerative diseases, autoimmune conditions) become addressable.

2. **Drug discovery timelines collapse.** The traditional 10-15 year, $2B+ drug development cycle gets compressed because you're designing molecules rationally rather than screening billions of compounds.

3. **Proximity pharmacology becomes a platform.** Molecular glues, PROTACs, molecular chaperones, protein-protein interaction stabilizers — all become designable on demand. Any pharma company that wants to develop proximity therapeutics needs access to this data and these models.

4. **A "Stripe for drug discovery" emerges.** Every pharma company pays Proxima per-target or per-program to access the platform, creating a recurring revenue model with massive network effects (every new target makes the data atlas more valuable).

---

## Best Case Scenario / Addressable Opportunity

- Thalidomide analogs alone (lenalidomide/Revlimid) generated **$12B+ in annual peak revenue** — and those were discovered by accident
- The global targeted protein degradation market is projected at **$10B+ by 2030**
- If you include all proximity-based modalities (glues, PROTACs, stabilizers, bifunctionals), the addressable market is the entire pharmaceutical industry's pipeline for previously undruggable targets
- Platform economics: every major pharma company becomes a customer (already happening with J&J, BMS, Sanofi/Blueprint)
- Proxima could capture value both as a platform (partnerships, royalties) and as a pipeline company (own drug programs)

---

## Commercial Validation (Pre-Seed Round)

| Partner | Deal Type | Value |
|---------|-----------|-------|
| Johnson & Johnson (Janssen) | Multi-year protein degrader discovery | Undisclosed |
| Bristol Myers Squibb | Molecular glue discovery | Up to $674M milestones + royalties |
| Blueprint Medicines (Sanofi) | Expanded collaboration + license | Multi-program |
| Halda Therapeutics | Strategic alliance (RIPTAC medicines) | $1B+ total potential value |

Multiple co-developed programs are advancing toward the clinic, with the first on track to enter clinical trials in 2026.

---

## The Science: A Brief History

### The accidental origins (1950s-1990s)
- **Thalidomide** (1957): Originally a sedative, caused birth defects, later found to degrade specific proteins via cereblon E3 ligase. Became the foundational molecular glue.
- **Cyclosporine** (1970s): Immunosuppressant that works by gluing cyclophilin to calcineurin.
- **Rapamycin** (1975): Antifungal/immunosuppressant that glues FKBP12 to mTOR.
- **FK506/Tacrolimus** (1987): Another immunosuppressant molecular glue.

All discovered by serendipity. Nobody understood the mechanism until decades later.

### The conceptual revolution (2000s-2010s)
- **PROTACs conceived** (early 2000s): Craig Crews (Yale) and Raymond Deshaies (Caltech) conceived heterobifunctional molecules that recruit ubiquitin ligases to degrade target proteins. This was the first rational approach to proximity pharmacology.
- **Cereblon mechanism elucidated** (2010s): Researchers finally understood HOW thalidomide works — it acts as a molecular glue between cereblon and neosubstrate proteins, triggering their degradation.
- **Arvinas, C4, Kymera founded** (2013-2017): The PROTAC concept spawned a wave of companies focused on targeted protein degradation.

### The rational design frontier (2020s)
- **AlphaFold** (2020): Solved single-protein structure prediction but NOT protein-protein interactions.
- **Molecular glue rational design** begins: Structure-guided approaches emerge but remain limited by lack of interaction data.
- **VantAI/Proxima** spins out of Roivant (2023): Bet on XL-MS + generative AI as the path to rational molecular glue design.
- **Neo-1** launched (March 2025): First model to unify structure prediction + molecular generation for ternary complexes.
- **$80M seed** (January 2026): Largest DCVC TechBio investment validates the thesis.

### Why now
Three things converged:
1. Molecular glues went from serendipity to early rational design (last ~5 years)
2. Foundation models reached the capability threshold for generative molecular design (AlphaFold-class models + diffusion models)
3. XL-MS throughput improved enough to be industrialized at proteome-wide scale

---

## Open-Source Contributions: PINDER & PLINDER

Proxima's most credible public technical contribution — and an underappreciated strategic move — is the open-sourcing of two benchmark datasets:

- **PINDER** (Protein INteraction Dataset and Evaluation Resource): A comprehensive benchmark for protein-protein docking, co-developed with **NVIDIA, MIT CSAIL, and University of Basel**. Provides standardized evaluation for how well models predict protein-protein complexes.
- **PLINDER** (Protein-Ligand INteraction Dataset and Evaluation Resource): The equivalent benchmark for protein-ligand interactions.

**Why this matters:** In ML for biology, the field is bottlenecked by evaluation infrastructure, not just models. By open-sourcing PINDER/PLINDER, Proxima does three things: (1) establishes itself as the standard-setter for interaction prediction benchmarks, (2) builds credibility with the academic ML community (NeurIPS MLSB 2024 presentation), and (3) trains the broader field on their problem framing while keeping the proprietary NeoLink data — the actual moat — private. It's an open-source strategy that strengthens rather than undermines competitive advantage.

---

## Core Team

### Zachary Carpenter — CEO & Co-Founder

| | |
|---|---|
| **Education** | BS Biology, College of New Jersey (2009); PhD Genome Sciences / Pharmacology, Columbia University (2009-2014) |
| **PhD Lab** | Raul Rabadan Lab + Adolfo Ferrando, Columbia — cancer genomics, clonal evolution |
| **Pre-Proxima** | McKinsey & QuantumBlack; Head of Computational Discovery, Roivant Sciences |
| **Google Scholar** | ~2,092 citations, 24+ publications |
| **Research Areas** | Computational Biology, Structural Biology, Machine Learning, Drug Discovery |

**Key publications:**
- *Nature Genetics* (2014): Recurrent mutations in epigenetic regulators, RHOA and FYN kinase in peripheral T cell lymphomas — identified novel oncogenic drivers
- *Nature Medicine* (2012): Reverse engineering of TLX oncogenic transcriptional networks — identified RUNX1 as tumor suppressor in T-ALL
- *PNAS* (2016): Mutational landscape, clonal evolution patterns, and role of RAS mutations in relapsed ALL
- *Leukemia* (2014): Point mutation E1099K in MMSET/NSD2 — chromatin methylation in lymphoid malignancies

**What's notable:** Carpenter's PhD work was genuinely at the frontier of cancer genomics, under Rabadan (one of the most important computational biology labs — a physicist turned biologist who brought network theory to cancer). His work wasn't incremental — it identified new oncogenic drivers and tumor suppressors. The pivot from cancer genomics to structural biology/drug design shows intellectual range. McKinsey/QuantumBlack gave him the operator skills; Roivant gave him the drug discovery context.

---

### Luca Naef — CTO & Co-Founder

| | |
|---|---|
| **Education** | ETH Zurich (Molecular Biology + ML); Master's thesis on deep learning |
| **Pre-Proxima** | Software engineer; McKinsey Digital; Principal at Roivant Sciences |
| **Google Scholar** | 204 citations |
| **Key Work** | Led development of Neo-1; co-introduced PINDER & PLINDER benchmark datasets |

**Background:** Engineering family. Built computers from spare parts as a kid. Studied molecular biology at ETH Zurich. Research at Stanford building hardware/software for a cell screening device was his gateway to computer vision. His Master's thesis was on applying deep learning to transportation mode classification — showing early ML fluency. Met Carpenter at McKinsey Digital, joined him at VantAI shortly after founding.

**What's notable:** Naef is the classic technical co-founder — deep engineering instinct + ML fluency + biological domain knowledge. ETH Zurich is Europe's MIT for engineering. His contribution of PINDER/PLINDER benchmark datasets to the community shows he understands that progress in ML for biology requires better evaluation infrastructure, not just better models. Led the Neo-1 development from conception to NVIDIA GTC launch. Named to **Forbes 30 Under 30** before Proxima's major partnership announcements — an early recognition signal suggesting strong network-building among young tech/biotech leaders.

---

### Michael Bronstein — Chief Scientist in Residence

| | |
|---|---|
| **Born** | 1980, Soviet Union (emigrated to Israel 1991) |
| **Education** | MS + PhD (with distinction), Technion — Israel Institute of Technology |
| **Current Academic** | DeepMind Professor of AI, University of Oxford; Founding Scientific Director, Aithyra Institute (Austrian Academy of Sciences) |
| **Prior Academic** | Imperial College London (Chair in ML); University of Lugano; IDSIA |
| **Visiting** | Stanford, MIT, Harvard (Radcliffe Fellow), Princeton (IAS), TUM (Rudolf Diesel Fellow) |
| **Google Scholar** | Highly cited (one of the most cited ML researchers alive) |

**Entrepreneurial track record:**
- **Novafora** (2004): Israeli startup, video processors for consumer electronics. VP of Technology.
- **Invision** (2007): 3D imaging / gesture recognition. **Acquired by Intel (2012)** — became the foundation of Intel RealSense technology.
- **Fabula AI** (2018): Detecting misinformation on social networks using graph neural networks. **Acquired by Twitter (2019).**
- Head of Graph Learning Research at Twitter post-acquisition.

**Foundational intellectual contributions:**
- **Coined the term "geometric deep learning"** — the entire subfield of ML that operates on non-Euclidean data (graphs, manifolds, meshes)
- Co-authored the defining paper: *"Geometric Deep Learning: Grids, Groups, Graphs, Geodesics, and Gauges"* — a unifying framework showing that all major deep learning architectures (CNNs, RNNs, Transformers, GNNs) can be understood as exploiting symmetry principles
- His insight: molecules are graphs, protein surfaces are manifolds, and the right inductive biases for ML on biological data come from geometry and symmetry

**Awards:** EPSRC Turing AI World Leading Research Fellowship; Royal Society Wolfson Research Merit Award; Royal Academy of Engineering Silver Medal; WEF Young Scientist; Fellow of IEEE, IAPR, BCS, ELLIS, Academia Europaea; multiple ERC grants.

**Origin story:** Born in Soviet Union, emigrated to Israel at 10. He and his identical twin brother Alex (also a renowned CS researcher) were challenged by their PhD adviser to build an algorithm that could distinguish between them — a computer vision problem. Bronstein used methods from differential geometry to solve it, which led to his entire research program on geometric deep learning.

**What's notable:** Bronstein isn't just an advisor in name — his intellectual framework (geometric deep learning) is the theoretical foundation of Proxima's AI models. He's also a proven entrepreneur with two successful exits (Intel, Twitter). The fact that he chose to be Chief Scientist at a seed-stage biotech rather than starting his own company or joining a FAANG lab signals deep conviction in the opportunity.

---

## Scientific Advisory Board

### Raymond Deshaies

| | |
|---|---|
| **Born** | 1961, Waterbury, Connecticut |
| **Education** | BS Biochemistry, Cornell; PhD Biochemistry, UC Berkeley; Postdoc, UCSF |
| **Career** | Caltech Professor (1994-); HHMI Investigator (2000-); SVP Global Research, Amgen |
| **Honors** | National Academy of Sciences (2016); American Academy of Arts & Sciences (2011); AAAS Fellow |
| **Awards** | Gabbay Award (2023), Passano Award (2025), Searle Scholar, Beckman Young Investigator |

**Why he matters to Proxima:**
- **Co-invented PROTACs** with Craig Crews (Yale) — literally created the conceptual foundation for all proximity-based therapeutics
- Discovered **SCFCdc4**, the first Cullin-RING ubiquitin ligase — foundational to understanding how cells degrade proteins
- Discovered **Sec61** (protein translocation channel) — fundamental cell biology
- His research led directly to **Kyprolis/carfilzomib** (FDA-approved cancer drug, 2012)
- Co-founded **Proteolix** and **Cleave Biosciences**
- At Amgen, led global research advancing ~5 dozen clinical candidates including Lumakras (sotorasib)
- Having the person who *invented the field* on your SAB is about as strong a signal as it gets

### Juri Rappsilber

| | |
|---|---|
| **Born** | 1971, Germany |
| **Education** | Chemistry, TU Berlin + U. Strathclyde; PhD Proteomics, EMBL Heidelberg / Goethe University Frankfurt (with Matthias Mann) |
| **Current** | Professor of Proteomics, University of Edinburgh + TU Berlin |
| **Google Scholar** | ~50,000 citations |

**Why he matters to Proxima:**
- **Pioneer of crosslinking mass spectrometry (XL-MS)** — the exact data modality that Proxima's NeoLink platform industrializes
- Trained with **Matthias Mann** (one of the most cited scientists alive, co-inventor of modern mass spectrometry for proteomics)
- Developed **xiSEARCH** and other foundational software tools for XL-MS
- Recent work: integrated XL-MS with AlphaFold (AlphaLink) — directly relevant to what Proxima is doing at scale
- Having the inventor of your core data technology on the SAB is the ultimate validation

### Lyn Jones

| | |
|---|---|
| **Education** | PhD Synthetic Organic Chemistry, University of Nottingham; Postdoc, Scripps Research Institute |
| **Current** | Chief Scientist, Center for Protein Degradation, Dana-Farber Cancer Institute; Faculty, Harvard Medical School |
| **Prior** | Head of Chemical Biology + Head of Chemistry, Pfizer; Head of Chemistry, Jnana Therapeutics |
| **Honors** | Fellow of RSC, RSB, AAAS, Linnean Society, Learned Society of Wales |

**Why he matters to Proxima:**
- One of the world's foremost experts on molecular glues and chemical biology for expanding the druggable proteome
- Leads the Center for Protein Degradation at Dana-Farber — the clinical translation hub
- Pioneer of covalent drug discovery beyond cysteine (SuFEx chemistry targeting tyrosine, lysine, histidine)
- Bridges the gap between computational design and medicinal chemistry optimization

---

## Key Advisor: Jason Pontin

| | |
|---|---|
| **Role** | General Partner, DCVC — led the $80M seed |
| **Prior** | Editor-in-Chief, MIT Technology Review |
| **Significance** | Journalism→VC pipeline is rare. Pontin spent years evaluating deep tech claims for publication before writing checks. |

**Why he matters:** Most VCs come from operations, finance, or engineering. Pontin came from science journalism — he spent years at MIT Technology Review deciding what was real, what was overhyped, and what the actual state of the art was. This makes him unusually equipped to evaluate companies like Proxima, where the core question is "does the science actually work?" The fact that he led the largest DCVC TechBio investment to date on Proxima signals deep conviction. Pontin's MIT Technology Review network also gives Proxima an unusual channel to the global deep tech and academic community.

---

## Investor Depth

### DCVC (Data Collective Venture Capital)

$4B AUM across 13 funds — the world's largest exclusively deep tech venture fund. They don't do SaaS or consumer, which means they're structurally patient capital, critical for a company like Proxima where drug development timelines are long. The $80M seed was oversubscribed, suggesting strong LP demand for the thesis. DCVC co-founders Matt Ocko and Zachary Bogue have a track record of backing computational approaches to hard science problems.

### NVentures (NVIDIA)

Strategic investor, not just financial. NVIDIA's involvement goes beyond the check: Neo-1 was launched at **NVIDIA GTC 2025**, trained on hundreds of H100 GPUs, and PINDER/PLINDER were co-developed with NVIDIA researchers. This is a technology partnership disguised as an investment — Proxima gets compute access and co-development, NVIDIA gets a flagship customer for their biotech compute stack.

---

## Hiring Signals & Strategic Direction

Active recruiting as of early 2026: **AI Scientist, ML Infrastructure Engineer, Software Engineer, Sr Computational Biologist, Sr Computational Chemist, Head of Platform.**

What this reveals: heavy ML infrastructure hiring suggests Proxima is scaling compute and data pipelines, not just doing research. The "Head of Platform" role signals they're building a productized offering (not just internal tools) — consistent with the platform economics thesis. ~63 employees and growing.

---

## Conference Strategy

Proxima deliberately straddles both ML and pharma/biotech conference circuits:

- **NVIDIA GTC 2025** — Neo-1 launch (ML/compute audience)
- **NeurIPS MLSB 2024** — PINDER/PLINDER presentation (academic ML audience)
- **JPM Healthcare Conference 2026** — commercial/pharma audience

This dual-conference presence is the right strategy for a company that needs to recruit ML talent AND sell to pharma partners. Most AI-bio companies skew one way or the other — Proxima is credible in both rooms.

---

## Why This is a Non-Consensus Bet

**What the consensus thinks:**
- AI drug discovery has been overhyped (many failures, no FDA-approved AI-designed drugs yet)
- Molecular glues are too hard to rationally design (too much serendipity)
- Structure prediction is "solved" by AlphaFold (so what's left?)

**What Proxima believes differently:**
1. **The data problem, not the model problem, is the bottleneck.** While everyone chases better architectures, Proxima bets that proprietary biological data (XL-MS at scale) is the real moat. Models are commoditizing; data is not.
2. **AlphaFold solved single-protein structure, not the interactome.** Predicting how two proteins interact in a cellular context — dynamically, transiently, with small molecules modulating the interface — is a fundamentally different and harder problem.
3. **XL-MS, not cryo-EM, is the right data modality for this.** Cryo-EM gives beautiful structures but is expensive, slow, and captures static snapshots. XL-MS captures interactions in native cellular conditions at 1,000,000x lower cost.
4. **Molecular glue design is tractable now.** The convergence of foundation models + industrial-scale interaction data makes rational design feasible for the first time.

---

## Competitive Landscape

| Company | Focus | Approach | Differentiation |
|---------|-------|----------|-----------------|
| **Arvinas** | PROTACs | Bifunctional degraders | Clinical-stage (ARV-471, ARV-110), but focused on PROTACs not glues |
| **C4 Therapeutics** | Degraders | Cereblon-focused platform | More narrow E3 ligase focus |
| **Monte Rosa** | Molecular glues | Phenotypic screening + cryo-EM | Screening-based, not generative AI |
| **Kymera Therapeutics** | Degraders | E3 ligase biology | Strong biology, less AI-driven |
| **Recursion** | Broad drug discovery | Phenotypic screening + AI | Different modality (not proximity-focused) |
| **Proxima** | Proximity therapeutics | XL-MS data + generative AI | Only company with industrial-scale interactomics data + frontier generative models |

Proxima's unique position: the only company that has both (a) an industrial-scale platform for generating protein interaction data and (b) frontier generative AI models trained on that proprietary data. Everyone else either has the biology without the AI or the AI without the proprietary data.

---

## Qualitative Assessment: Is This a Generational Company?

### Conviction Level: HIGH

**Why I believe this could be a $100B+ company:**

1. **Team density at seed stage is absurd.** You have a CEO from one of the best computational biology labs (Rabadan at Columbia), a CTO from ETH Zurich who built a frontier foundation model, Michael Bronstein (inventor of geometric deep learning, 2x successful exits), Raymond Deshaies (co-inventor of PROTACs, NAS member, led Amgen research), Juri Rappsilber (inventor of XL-MS, 50K citations), and Lyn Jones (DFCI/Harvard chief scientist for protein degradation). This is the All-Star team for this exact problem.

2. **The data moat is real and growing.** NeoLink generates proprietary interactomics data that no competitor can replicate quickly. Every new protein interaction mapped makes the platform more valuable. This creates a flywheel: more data → better models → more partnerships → more data.

3. **Commercial validation before fundraising.** Multi-billion dollar deals with J&J, BMS, Blueprint/Sanofi, and Halda — all signed before the $80M seed. These aren't speculative partnerships; they're paying customers with milestone-laden deals. The BMS deal alone is worth up to $674M.

4. **Platform economics, not just pipeline.** Proxima can capture value as both a platform company (partnerships, royalties, data licensing) and a pipeline company (own drug programs). This dual model is how you get to Illumina-scale outcomes.

5. **The timing is perfect.** Five years ago, the models weren't good enough. Five years from now, someone else will have figured it out. Right now, Proxima has a window where the convergence of XL-MS industrialization + frontier diffusion models + protein interaction biology creates a unique opportunity.

### Key Risks:

1. **Clinical translation gap:** Computationally designed molecular glues still need to work in patients. No AI-designed drug has been FDA-approved yet.
2. **Selectivity challenge:** Molecular glues that induce new PPIs could create off-target effects that are hard to predict computationally.
3. **Capital intensity:** Drug development is enormously expensive. $80M is a large seed but small for a company with clinical ambitions.
4. **Platform risk:** If the NeoLink data doesn't provide enough signal for the AI models, the entire thesis unwinds.
5. **Competitive convergence:** Pharma companies with deep pockets (Roche, Novartis) could build competing platforms.

### Bottom Line:

This is a company where the science, the team, the timing, and the commercial traction all align. The non-consensus bet on XL-MS as the data modality (rather than cryo-EM or pure computation) is the key differentiator. If NeoLink + Neo-1 can reliably design molecular glues that work in vivo, Proxima becomes the enabling platform for an entirely new era of medicine.

**Verdict: One of the strongest seed-stage TechBio companies I've seen. Generational potential if they execute.**

---

*Research compiled: March 2026*
