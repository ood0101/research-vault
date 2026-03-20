# Evo 2

| | |
|---|---|
| **Website** | [arcinstitute.org/tools/evo](https://arcinstitute.org/tools/evo) |
| **HQ** | Palo Alto, CA (Arc Institute) |
| **Founded** | 2021 (Arc Institute); Evo v1 published 2024; Evo 2 published 2026 |
| **Structure** | Nonprofit research institute (Arc Institute) |
| **Stage** | Research project within Arc Institute — not a company |
| **Funding** | Arc Institute has raised $650M+ (philanthropic, not VC) |
| **Key Funders** | Patrick Collison (Stripe CEO), John Collison, Vitalik Buterin (Ethereum), Ron Conway, Elad Gil, Daniel Gross, Dustin Moskovitz |
| **Compute Partner** | NVIDIA (2,000 H100 GPUs via DGX Cloud) |

---

## The Big Audacious Idea

Evo 2 is the largest and most capable DNA foundation model ever built — a 40-billion parameter autoregressive model trained on 9.3 trillion nucleotides from 128,000+ genomes spanning every domain of life. It reads and writes DNA at single-nucleotide resolution across million-base-pair contexts. It can predict whether a mutation is pathogenic, design regulatory elements for specific cell types, and generate entire synthetic genomes with realistic biological features.

The deeper thesis: DNA is the programming language of life, and Evo 2 is learning to read and write it fluently. Not by encoding human biological knowledge into rules, but by learning the patterns that 4 billion years of evolution have selected for — across bacteria, archaea, plants, animals, and everything in between. Patrick Hsu: *"I think of this as a foundational model that can create an app store for biology."* Brian Hie, whose literary background shapes his thinking: *"I'm still doing literary criticism — applied to biology."*

---

## The Problem That's So Hard to Solve

The human genome is 3.2 billion base pairs. We can sequence it for ~$100. But understanding what it means — which variants cause disease, which regulatory elements control which genes, how to design new biological systems — remains profoundly hard.

**Why prior DNA models failed to generalize:**

1. **Context too short.** Gene regulation involves elements hundreds of thousands of bases apart. DNABERT (2021) processed 512 base pairs. Nucleotide Transformer managed 6-12K. These models literally cannot see the regulatory architecture they're trying to learn. Evo 2 processes 1 million base pairs.

2. **Wrong architecture.** Transformer attention scales quadratically with sequence length. At million-token contexts with single-nucleotide resolution, standard Transformers are computationally infeasible. Evo's scaling laws analysis showed Transformers *"do not scale as well when trained at single-nucleotide, byte-level resolution."* Evo 2 uses StripedHyena 2 — a convolutional multi-hybrid that trains 1.2-2.9x faster than optimized Transformers at 40B scale.

3. **Too narrow.** Most DNA models train on human genome only, or prokaryotes only. Evo v1 was prokaryote-only. Evolution's lessons are written across ALL genomes — the conserved patterns that define what works are only visible when you see what's been tried across 128,000+ species. Hie: *"Evolution is a unifying theory of biology, so why stop machine learning models on individual proteins or single genes?"*

4. **Prediction without generation.** Models like Enformer and AlphaGenome predict function from sequence but can't generate new sequences. Evo 2 is autoregressive (GPT-style) — it can both predict variant effects zero-shot AND generate novel DNA sequences, including entire synthetic genomes.

5. **Tokenization destroys resolution.** K-mer tokenization (used by DNABERT, Nucleotide Transformer) groups nucleotides into chunks, losing the single-base resolution needed for clinical variant interpretation. A single nucleotide change can cause disease. Evo 2 treats every nucleotide as its own token.

---

## The Technology Stack

### Architecture: StripedHyena 2

Not a Transformer. A convolutional multi-hybrid using three types of operators at different scales:

- **Short Hyena** (kernel length ~7): Captures local motifs — codon patterns, splice sites, binding sites
- **Medium Hyena** (hundreds of tokens): Regularized convolutions for intermediate-range dependencies — promoter-gene relationships, exon structure
- **Long Hyena** (implicit, full-sequence): Aggregates information across the entire million-base context — chromosome-scale regulatory patterns

Plus rotary attention layers (RoPE) adjusted for context extension to 1M tokens. [FlashFFTConv](https://arxiv.org/abs/2311.05908) provides efficient Fourier and convolution kernels on tensor cores.

**Why not Transformers?** Training efficiency: 1.2-2.9x faster than optimized Transformers at 40B scale, with near-linear scaling vs quadratic. Can generate 500K+ nucleotides on a single 80GB GPU via recurrent mode. Paper: [arXiv:2503.01868](https://arxiv.org/abs/2503.01868).

### Training Dataset: OpenGenome2

| Source | Count | Notes |
|--------|-------|-------|
| Eukaryotic genomes | 15,032 | Plants, animals, fungi |
| Prokaryotic genomes | 113,379 | Bacteria, archaea |
| Organelle genomes | 32,241 | Mitochondria, chloroplasts |
| Metagenomes | 41,253 | Environmental samples |
| **Total** | **128,000+ genomes** | **9.3 trillion nucleotides** |

Sources: GTDB, NCBI, IMG/VR, IMG/PR, JGI, MGnify, MG-RAST, Tara Oceans. Curation: split at ambiguous nucleotide stretches, minimum 1kb length, must contain ORF, 90% protein identity clustering for redundancy removal. Functional enrichment: training data weighted toward genic regions to avoid poor performance from naively training on mostly non-coding eukaryotic DNA. Biosecurity: eukaryotic viruses excluded; increased perplexity on eukaryote-infecting virus sequences confirmed. Available on [HuggingFace](https://huggingface.co/datasets/arcinstitute/opengenome2).

### Model Sizes

| Model | Parameters | Context Length |
|-------|-----------|---------------|
| Evo 2 1B | 1 billion | 8K bp |
| Evo 2 7B | 7 billion | 8K / 262K / 1M bp |
| Evo 2 40B | 40 billion | 8K / 1M bp |

Two-phase training: pretraining at 8K context with enriched functional regions, then midtraining extending context to 1M with whole-genome patterns.

### Training Compute

2,000 NVIDIA H100 GPUs via DGX Cloud on AWS. NVIDIA researchers and engineers collaborated on AI scaling and optimization. Evo 2 is integrated into [NVIDIA BioNeMo](https://blogs.nvidia.com/blog/evo-2-biomolecular-ai/) as a NIM microservice.

### Open Source

Fully open: model weights ([HuggingFace](https://huggingface.co/arcinstitute)), training code ([Savanna framework](https://github.com/Zymrael/savanna)), inference code ([GitHub](https://github.com/ArcInstitute/evo2)), training dataset (OpenGenome2). Apache 2.0 license.

---

## What the World Looks Like If This Works

1. **Clinical variant interpretation at scale.** The human genome contains ~3 million variants per individual, most of uncertain significance (VUS). Evo 2 already achieves >90% accuracy on BRCA1 pathogenic vs benign classification zero-shot. If this generalizes across the genome, every patient's sequencing report becomes immediately actionable — no more "variant of uncertain significance."

2. **Programmable biology becomes a design discipline.** Evo 2 can design regulatory elements that produce specific chromatin accessibility patterns in target cell types (AUROCs 0.92-0.95 in mouse embryonic stem cells). This means designing gene therapies that activate in exactly the right cells, or engineering organisms with precisely controlled gene expression — moving from trial-and-error to computational design.

3. **Synthetic genomics goes from art to engineering.** Evo 2 generates entire prokaryotic and eukaryotic genomes with realistic coding regions, tRNAs, promoters, and structural features. Genome engineer Patrick Yizhi Cai called this *"the 'ChatGPT moment' for synthetic genomics."* Whole-genome design could enable new organisms for biomanufacturing, bioremediation, or medicine.

4. **Understanding non-model organisms.** Evo 2 annotated a woolly mammoth genome from raw sequence without any training reference. For the millions of species with sequenced but unannotated genomes, this provides instant functional annotation — transforming conservation biology, agriculture, and basic ecology.

5. **An "app store for biology" emerges.** If Evo 2 serves as the GPT-equivalent for biological sequence, domain-specific fine-tuned models proliferate: one for crop genetics, one for human disease, one for synthetic biology, one for drug target discovery. The 200+ citations and 88,000+ GitHub downloads in the first year suggest this ecosystem is already forming.

---

## Best Case Scenario / Addressable Opportunity

| Market Segment | 2025 Estimate | 2030 Projection | CAGR |
|---------------|--------------|-----------------|------|
| AI in Genomics (overall) | $700M-$1.9B | $4B-$21B | 32-50% |
| Genomics (total) | ~$32B | ~$95B | ~20% |
| AI in Drug Discovery | $2.5B | $8-14B | 25-30% |
| Precision Medicine | ~$85B | ~$175B | ~15% |

Key context: Sequencing costs dropped from $300M to ~$100 per genome over two decades. Genomics data is growing to 2-40 exabytes in the next decade. But interpretation — not sequencing — is now the bottleneck. DNA foundation models that can interpret variants, design therapeutics, and annotate genomes address the gap between data generation and understanding.

Evo 2 itself is a nonprofit research project, but the commercial applications flow through: (1) NVIDIA BioNeMo integration, (2) spinout companies (Stylus Medicine, Terrain Biosciences), (3) pharma/biotech companies building on the open-source models, and (4) potential future Arc Institute licensing or partnerships.

---

## The Science: A Brief History

| Year | Milestone | Significance |
|------|----------|--------------|
| 1977 | Sanger sequencing invented | First DNA sequencing method |
| 2003 | Human Genome Project completed | $3B, 13 years for one genome |
| 2012 | CRISPR-Cas9 gene editing | Programmable genome modification |
| 2018 | AlphaFold1 wins CASP13 | Deep learning enters structural biology |
| 2021 | **DNABERT** | First DNA language model (512bp context, BERT-based) |
| 2021 | Enformer (DeepMind) | CNN+Transformer for gene expression prediction (200K context) |
| 2021 | **Arc Institute founded** | Collison, Konermann, Hsu. $650M+ philanthropic funding |
| 2023 | **HyenaDNA** (Stanford/Hazy Research) | Sub-quadratic architecture enables 1M context, but single-species |
| 2023 | Nucleotide Transformer (InstaDeep) | Multi-species encoder, 6-12K context |
| 2023 | DNABERT-2 | BPE tokenization, improved multi-species performance |
| Nov 2024 | **Evo v1** — Science cover | 7B params, 131K context, 300B nt prokaryotic data. First DNA LM with CRISPR system codesign. Emergent gene essentiality prediction. |
| 2025 | **Evo 1.5 / Semantic Design** — Nature | SynGenome database (120B bp synthetic DNA). Semantic gene design. |
| Mar 2025 | AlphaGenome (DeepMind) | Predictive (not generative) model for variant effect prediction. Human/mouse only. API-only access. |
| Mar 2026 | **Evo 2** — Nature | 40B params, 1M context, 9.3T nt across all life. BRCA1 prediction, epigenomic design, genome generation. |

**Why Now:** Four things converged: (1) Genomic databases reached critical mass with 128K+ complete genomes; (2) StripedHyena/Hyena operators (2023) solved quadratic scaling, enabling million-token contexts; (3) NVIDIA DGX Cloud made 2,000 H100s available to a nonprofit; (4) Evo v1 proved DNA language models exhibit emergent capabilities when scaled — validating the bet on 40B/9.3T.

---

## Core Team

### Patrick D. Hsu — Co-Founder, Arc Institute; Co-Senior Author

| | |
|---|---|
| **Education** | BS Bioengineering, UC Berkeley. PhD, Harvard (biochemistry/biological engineering under Feng Zhang at Broad Institute) — completed by age 21. Taking Stanford classes at age 14. Homeschooled. |
| **Prior Roles** | Led early discovery at Editas Medicine. Independent research group as Salk Fellow at Salk Institute (age 23). Venture Partner at Thrive Capital (Sept 2025). |
| **Key Inventions** | First programmable recombinases (Bridge RNAs), CRISPR-Cas9 foundational studies in human cells, most widely used CRISPR RNA-targeting tools, Evo/Evo2 |
| **Spinouts** | Co-founded Stylus Medicine ($85M, 2025 — programmable recombinases), Terrain Biosciences ($9M seed, 2025 — AI RNA design) |
| **Recognition** | Forbes 30 Under 30 in Science (2015), MIT Technology Review Innovators Under 35 (2017). Evo named "Most Important Breakthrough of 2024" by The Atlantic. Recombinases named Forbes Top 5 Medical Breakthroughs (2024). |

**What's notable:** Hsu is a once-in-a-generation scientific founder — PhD at 21, independent lab at 23, co-founding a $650M+ institute at 28. His career arc from CRISPR gene editing to DNA foundation models follows a clear logic: he built the tools to modify genomes (Cas9, Cas13, Bridge RNAs), then realized the field needed AI to understand what to design. His quote captures the vision: *"ML for bio is not just drug design. This is actually ultimately a very important but narrow part of the potential."* His self-assessment — *"My main skill, if I have one, is to recruit really, really smart people"* — is validated by the team he assembled. The dual spinouts (Stylus Medicine for recombinases, Terrain for RNA) show the commercial ecosystem growing around Arc's research.

### Brian L. Hie — Co-Senior Author; Stanford Assistant Professor

| | |
|---|---|
| **Education** | BS Computer Science, Stanford (also studied English literature). PhD EECS, MIT. Stanford Science Fellow in Biochemistry. Visiting researcher at Meta AI (ESM protein LM team) |
| **Current** | Assistant Professor of Chemical Engineering, Stanford. Arc Innovation Investigator. Leads Laboratory of Evolutionary Design |
| **Key Papers** | Evo (Science cover 2024), Evo 2 (Nature 2026), ESMFold (Science), efficient evolution of antibodies (Nature Biotechnology), evolutionary velocity (Cell Systems) |
| **Recognition** | Dieter Schwarz Foundation Stanford Data Science Faculty Fellow |

**What's notable:** Hie is the intellectual architect of the "evolution as language" thesis. His literary background is not incidental — it's foundational. He described his approach: *"At one point in my life, I wanted to pursue a Ph.D. in English literature. My affinity for scanning a sonnet is similar to wanting to develop models that make genomic sequences more interpretable."* His visiting stint on Meta AI's ESM protein language model team gave him direct experience with the state-of-the-art in biological language models, and his insight was that protein-only models miss the bigger picture: *"Evolution is a unifying theory of biology, so why stop machine learning models on individual proteins or single genes?"* Train on raw DNA, and the model learns proteins "for free" but also captures regulatory architecture, non-coding RNA, genome organization — everything evolution has optimized.

### Eric Nguyen — Core ML Lead, Co-First Author (Evo v1)

| | |
|---|---|
| **Education** | PhD student, Stanford Bioengineering. Advised by Steve Baccus (neurobiology) and Chris Ré (CS/Hazy Research) |
| **Key Papers** | Evo (Science 2024, co-first author), HyenaDNA (NeurIPS 2023 spotlight, co-first author), S4ND (NeurIPS 2022), FlashFFTConv (ICLR 2024), Hyena operator, StripedHyena |
| **Current** | Co-founded Radical Numerics (Aug 2025). Google DeepMind Co-Scientist team (summer 2025) |

**What's notable:** Nguyen is the architecture innovator — he co-created the entire lineage of sub-quadratic sequence models (Hyena → HyenaDNA → StripedHyena → StripedHyena 2) that make Evo possible. Without his work in Chris Ré's Hazy Research group, million-token DNA processing at single-nucleotide resolution would be computationally infeasible. His dual advising (neurobiology + CS) is unusual and gives him intuition about biological sequence processing that pure CS researchers lack. His departure to found Radical Numerics and consult at DeepMind suggests the architecture innovations have broader applications beyond biology.

### Michael Poli — Core ML Lead

| | |
|---|---|
| **Education** | PhD student, Stanford. Advised by Stefano Ermon and Chris Ré |
| **Key Papers** | StripedHyena (lead author), Hyena (lead author), Evo (Science 2024, co-first author), T1 |
| **Current** | Research group lead at Liquid AI. Previously at Together AI |

**What's notable:** Poli brings a signal processing and dynamical systems perspective to sequence modeling — his architectures are grounded in classical first principles of numerical linear algebra, not just empirical scaling. His move to Liquid AI (building efficient inference architectures) and prior role at Together AI (open-source model training infrastructure) shows the bidirectional flow between Evo's biology needs and the broader efficient-architecture research community.

### Garyk Brixi — First Author, Evo 2

| | |
|---|---|
| **Education** | BS Computer Science, Harvard (2023). PhD student, Stanford Genetics with Brian Hie |
| **Prior** | Liang Lab, Harvard T.H. Chan School of Public Health |
| **Key Papers** | Evo 2 (Nature 2026, first author), SaLT&PepPr (Communications Biology 2023). 1,355+ citations |

**What's notable:** Brixi went straight from Harvard undergrad to first-authoring a Nature paper on a 40B-parameter model in 2.5 years. His prior work on protein degrader design (SaLT&PepPr) shows early facility with ML-for-biology, and his placement in Brian Hie's Stanford lab positioned him perfectly for the Evo 2 scale-up.

### Matthew G. Durrant — Co-First Author, Evo 2

| | |
|---|---|
| **Education** | PhD, Stanford (2020). Labs of Ami Bhatt and Stephen Montgomery |
| **Prior** | Senior Scientist at Arc Institute (Hsu Lab). VastBiome, UC Berkeley, January Inc. |
| **Key Contribution** | Led computational biology subteam for Evo. Expanded known large serine recombinase diversity 100x+ |
| **Current** | At **Anthropic** |

**What's notable:** Durrant's move to Anthropic is fascinating — it suggests cross-pollination between biological and general-purpose language models. His computational biology expertise (characterizing mobile genetic elements, curating training data from the messy PDB/GenBank ecosystem) is the unglamorous but essential work that makes models like Evo actually work. His recombinase discovery work directly fed Hsu's Bridge RNA/Stylus Medicine spinout.

### Hani Goodarzi — Co-Senior Author

| | |
|---|---|
| **Education** | BS Biotechnology (University of Tehran), PhD Molecular Biology (Princeton), Postdoc Systems Biology (Princeton), Postdoc Cancer Systems Biology (Rockefeller) |
| **Current** | Arc Institute Core Investigator. Associate Professor, UCSF |
| **Recognition** | Vilcek Prize for Creative Promise, AACR-MPM Transformative Cancer Research Award, Kimmel Scholar |

**What's notable:** Goodarzi bridges computational and experimental genomics — his focus on non-coding RNAs in cancer brings the biological depth that keeps Evo grounded in real biology rather than benchmark chasing. His dual appointment at Arc and UCSF provides clinical/translational perspective.

### Team Structure

Three subteams built Evo:
1. **Core ML** (Nguyen, Poli) — Architecture, training, scaling
2. **Computational biology** (Durrant, Hsu Lab) — Dataset curation, downstream evaluation
3. **Experimental biology** (Brian Kang, David Li from Hie Lab; Dhruva Katrekar from Hsu Lab) — Wet lab validation

Evo 2 paper has **59 authors** spanning Arc Institute, NVIDIA, Stanford, UCSF, UC Berkeley, Goodfire, University of Washington.

---

## Scientific Advisory Board / Key Advisors

Arc Institute board and advisors:
- **Nat Friedman** (Board) — Former GitHub CEO
- **Reid Hoffman** (Board) — LinkedIn co-founder
- **Susan Li** (Board) — Meta CFO
- **Carolyn Bertozzi** (Scientific Advisory Board) — Nobel Laureate in Chemistry (2022)
- **Aviv Regev** (Scientific Advisory Board) — Head of Genentech Research & Early Development

---

## Investor Depth (Funders)

Arc Institute operates on philanthropic funding, not venture capital. This is a deliberate structural choice.

**Patrick Collison (Stripe CEO)** — Co-founder of Arc. Origin story: during COVID, Collison co-led Fast Grants with Tyler Cowen, providing 30-minute applications with funding in 48 hours. The key finding: 80% of recipients said they would change their research "a lot" if funding were unconstrained. This insight — that the grant system itself constrains scientific ambition — drove Arc's design. Investigators get 8-year fully funded lab terms with up to 20 people and complete intellectual freedom. Collison's involvement signals that he views Arc as potentially as transformative as Stripe — infrastructure for scientific discovery the way Stripe is infrastructure for payments.

**Vitalik Buterin (Ethereum)** — Major Arc funder. Buterin has been increasingly focused on longevity and biology, and his funding of Arc aligns with his thesis that transformative scientific research requires institutional innovation, not just more money flowing through existing structures.

**Dustin Moskovitz (Facebook co-founder, Asana CEO)** — Funds Arc through his broader philanthropic portfolio focused on scientific research and global health (via Open Philanthropy). His involvement signals effective altruism-adjacent reasoning: DNA foundation models could have outsized impact per dollar.

**NVIDIA** — Provided 2,000 H100 GPUs via DGX Cloud and embedded researchers/engineers for optimization. This is NVIDIA's pattern for frontier bio-AI: provide compute in exchange for integration into BioNeMo. The strategic value for NVIDIA is enormous — every pharma company using Evo 2 through BioNeMo is a customer for NVIDIA's inference infrastructure.

---

## Hiring Signals & Strategic Direction

Arc Institute is not a company, so "hiring" means recruiting investigators and research scientists. Key signals:

- The 8-year fully funded lab model attracts researchers who want to work on ambitious, long-horizon problems without grant-writing overhead
- Investigators come from Stanford, UC Berkeley, UCSF — Arc is recruiting from the highest tier of Bay Area academic institutions
- The dual structure (open research at Arc → commercial spinouts like Stylus Medicine, Terrain Biosciences) creates a talent flywheel: researchers get academic freedom AND the option to spin out companies when discoveries are ready

The fact that Matthew Durrant (Evo co-first author) moved to Anthropic suggests brain drain is a real risk — top ML-for-biology talent is being recruited by general AI labs.

---

## Conference & Media Presence

**Publication Circuit:**
- **Evo v1**: Science cover, November 2024
- **Evo 1.5 / Semantic Design**: Nature, 2025
- **Evo 2**: Nature, March 2026
- **StripedHyena 2**: [arXiv:2503.01868](https://arxiv.org/abs/2503.01868)
- 200+ citations for Evo 2 preprint in one year

**Media Circuit:**
- [Nature News](https://www.nature.com/articles/d41586-025-00684-7): "AI can write genomes — how long until it creates synthetic life?"
- [Quanta Magazine](https://www.quantamagazine.org/the-poetry-fan-who-taught-an-llm-to-read-and-write-dna-20250205/): "The Poetry Fan Who Taught an LLM to Read and Write DNA" (Brian Hie profile)
- [Asimov Press](https://www.asimov.press/p/evo-2): "Evo 2 Can Design Entire Genomes"
- The Atlantic: Named Evo one of "The Most Important Breakthroughs of 2024"
- [Eric Topol interview](https://erictopol.substack.com/p/patrick-hsu-a-trailblazer-in-digital) with Patrick Hsu
- [Sequoia Capital podcast](https://sequoiacap.com/podcast/training-data-patrick-hsu/) (Training Data) with Patrick Hsu
- [Cognitive Revolution podcast](https://www.cognitiverevolution.ai/the-evolution-revolution-scouting-frontiers-in-ai-for-biology-with-brian-hie/) with Brian Hie
- [Benchling Transcribed podcast](https://www.benchling.com/transcribed/patrick-hsu-on-crispr-ai-open-science) with Patrick Hsu
- NVIDIA Blog, Stanford Report, SynBioBeta, GEN, R&D World

The publication trajectory (two Science papers, two Nature papers in under three years) is elite-tier. The media coverage spans science press (Nature, Quanta), tech press (NVIDIA, Sequoia), and general interest (The Atlantic) — suggesting Evo has crossed from niche genomics into mainstream AI consciousness.

---

## Mechanistic Interpretability (with Goodfire)

A notable collaboration: [Goodfire](https://www.goodfire.ai/research/interpreting-evo-2) trained BatchTopK sparse autoencoders on Evo 2's layer 26 and discovered interpretable features for:

- Coding sequences (CDS), UTRs, exons, alpha-helices, beta sheets
- RNA stem-loops, exon-intron boundaries, transcription factor binding sites
- Prophage regions, CRISPR elements
- Species' position on the tree of life (recovered from model activations)

This suggests Evo 2 has learned genuine biological ontologies — not just statistical patterns — which partially addresses the skeptic concern about memorization vs understanding. Interactive visualizer at [arcinstitute.org/tools/evo/evo-mech-interp](https://arcinstitute.org/tools/evo/evo-mech-interp).

---

## Why This is a Non-Consensus Bet

**What the consensus thinks:**

1. DNA foundation models are "just conservation scores" — they learn nucleotide conservation patterns that already exist in phylogenetic databases, not genuine biological understanding.
2. Generated genomes are scientifically interesting but practically useless — none would actually replicate in a cell, and DNA synthesis costs bottleneck any generative application.
3. AlphaGenome (DeepMind) is the real contender — it predicts regulatory function directly and trains in 4 hours on TPUs, while Evo 2 required months on 2,000 H100s.
4. Genomic language models are "another useful modeling tool, much like Hidden Markov Models" (Benegas et al.) — not the transformative breakthrough the hype suggests.
5. Biosecurity risks of generative DNA models may outweigh benefits — GeneBreaker demonstrated jailbreak attacks, and fine-tuning on pathogen data transferred to unseen harmful organisms.

**What the Evo team believes differently:**

1. **Evolution IS the training signal, and it's vastly more informative than conservation scores.** Hie: *"The environment leaves a clear imprint on DNA sequences... enabling models to learn higher-order concepts purely from raw sequence."* The Goodfire interpretability work shows the model learning biological ontologies (protein secondary structure, regulatory elements, species phylogeny) that conservation scoring can't capture.
2. **Generative capability is the gateway to design, not an end in itself.** The epigenomic design results (AUROCs 0.92-0.95 for cell-type-specific chromatin accessibility) show the model can already design functional regulatory elements — you don't need whole-genome generation to be useful. Inference-time scaling (the first demonstration in biology) suggests generation quality will improve with compute, just as it did for language models.
3. **Evo 2 and AlphaGenome are complementary, not competitive.** AlphaGenome predicts function; Evo 2 generates sequence. The vision: use AlphaGenome to define objective functions, then use Evo 2 to generate sequences that meet those objectives. And Evo 2 is fully open-source; AlphaGenome is API-only.
4. **The scaling hypothesis works for biology.** Evo v1 (7B, 300B nt) → Evo 2 (40B, 9.3T nt) showed clear capability gains. BRCA1 variant prediction emerged only at scale. Hie: *"We're not just going to train DNA language models for the next decade. The real question now is: what's the next model we need to build?"* — suggesting they see this as an early point on a capability curve, not a plateau.
5. **Biosecurity is addressed through data curation, not model restriction.** Eukaryotic viruses were excluded from training. Perplexity on pathogenic sequences increased. The team chose to publish openly rather than restrict access, betting that open science enables faster defensive applications than closed models prevent offensive ones.

---

## Competitive Landscape

| Model | Organization | Architecture | Parameters | Context | Species | Generative | Open Source | Key Strength |
|-------|-------------|-------------|-----------|---------|---------|-----------|------------|-------------|
| **Evo 2** | Arc / NVIDIA | StripedHyena 2 | 40B | 1M bp | 128K+ (all life) | ✅ | ✅ Full | Cross-species, genome generation, fully open |
| **AlphaGenome** | Google DeepMind | CNN + Transformer | Undisclosed (smaller) | 1M bp | Human + mouse | ❌ | API only | Best variant effect prediction, multi-modal regulatory output |
| **Nucleotide Transformer v2** | InstaDeep/BioMap | Transformer | 2.5B | 6-12K bp | 3,202 genomes | ❌ | ✅ | Strong on promoter/splicing tasks |
| **DNABERT-2** | Various | BERT + BPE | 117M | Flexible | Multi-species | ❌ | ✅ | Consistent across human genome tasks |
| **Enformer** | DeepMind | CNN + Transformer | ~40M | 200K bp | Human + mouse | ❌ | ✅ | Best on enhancer/chromatin prediction |
| **HyenaDNA** | Stanford/Hazy | Hyena | 1.6B | 1M bp | Human only | ✅ | ✅ | Efficient long context, single species |
| **Caduceus** | Various | Bidirectional Mamba | 128K-7B | 131K bp | Multi-species | ❌ | ✅ | Novel bidirectional genomic modeling |

**Key positioning:** Evo 2 is the only model that combines: (1) cross-species training on all domains of life, (2) generative capability, (3) million-base context, (4) 40B+ parameters, and (5) full open-source release. AlphaGenome is the main competitor on prediction tasks but lacks generation and open access. The complementary use case — AlphaGenome for objective functions, Evo 2 for sequence generation — may mean they converge rather than compete.

---

## Adoption & Community

| Metric | Value (1 year post-release) |
|--------|---------------------------|
| Preprint citations | 200+ |
| GitHub downloads | 88,000+ |
| GitHub forks | 380 |
| HuggingFace API requests | 8M+ (2M for 7B, 6M for 40B) |
| Model downloads | 100,000+ across variants |
| OpenGenome2 dataset downloads | 48,000+ |

**Notable community applications:**
- **Evo2HiC** (Fang et al.) — 3D genome organization prediction, 500x reduced compute
- **Alzheimer's disease** variant analysis (Zhu et al.)
- **Farm animal genetics** — AUROC 0.921 across domesticated species (Jiang et al.)
- **In-context learning** demonstration (Breslow et al.)
- **Epigenomic design** validated in mouse embryonic stem cells and human cell lines

---

## Commercial Ecosystem

While Evo 2 itself is a nonprofit research project, a commercial ecosystem is forming:

| Entity | Relationship | What It Does |
|--------|-------------|-------------|
| **Stylus Medicine** | Spinout from Hsu's Arc/recombinase work | Programmable recombinases for gene insertion. $85M raised (2025). Investors: J&J, Eli Lilly, RA Capital, Khosla |
| **Terrain Biosciences** | Spinout from Arc | AI-powered RNA design-build platform. $9M seed (2025) |
| **Radical Numerics** | Founded by Eric Nguyen (Evo ML lead) | Building AI that can design and improve itself |
| **NVIDIA BioNeMo** | Compute partner | Evo 2 available as NIM microservice for enterprise deployment |
| **Goodfire** | Interpretability collaborator | Sparse autoencoders revealing what Evo 2 has learned |

---

## Qualitative Assessment

**Conviction Level: HIGH**

**Bull case:**

1. **The team is unmatched in both biology and ML depth.** Hsu (PhD at 21, CRISPR pioneer, institute co-founder), Hie (ESMFold co-author, evolution-as-language thesis), Nguyen (StripedHyena creator), Poli (Hyena architect), Durrant (data curation at scale), Goodarzi (experimental genomics). No other DNA foundation model project has this concentration of talent across both the biology and ML stacks. The 59-author paper reflects genuine cross-disciplinary integration, not just name-collecting.

2. **The scaling trajectory is validated and unique.** Evo v1 → 1.5 → 2 is the clearest capability curve in genomic AI: 7B/300B/prokaryotes → 7B/fine-tuned → 40B/9.3T/all life. Each step showed emergent capabilities (CRISPR codesign → semantic design → BRCA1 prediction, epigenomic design). Hie's candor — *"We're not just going to train DNA language models for the next decade"* — suggests the roadmap extends to multi-modal models incorporating experimental data, not just bigger DNA models.

3. **Arc's nonprofit structure is a genuine advantage for this type of research.** 8-year funding horizons, no pressure to ship products, no IP restrictions, full open-source release. This is exactly the institutional structure needed for foundational research that creates platforms, not products. The spinout model (Stylus, Terrain) captures commercial value when discoveries are ready without distorting the research agenda.

4. **The NVIDIA partnership provides compute that no academic lab could access.** 2,000 H100 GPUs is a resource level previously available only to DeepMind, Meta AI, and frontier AI labs. NVIDIA's integration into BioNeMo creates distribution to every pharma company already using NVIDIA's platform — the model rides the NVIDIA ecosystem for free.

5. **Full open-source release creates ecosystem lock-in.** 88K downloads, 200+ citations, 8M API requests in year one. Every researcher who builds on Evo 2 creates switching costs. Every fine-tuned model extends the ecosystem. AlphaGenome being API-only means researchers can't customize it — Evo 2 becomes the Linux of genomic AI.

**Key risks:**

1. **Generative models may not learn real biology.** The skeptic critique is serious: if models "just" learn conservation patterns, their utility for truly novel biology (designing proteins not seen in nature, predicting effects of variants in uncharacterized genes) may be limited. The Goodfire interpretability work partially addresses this, but the ultimate test is experimental validation of generated sequences — which remains laborious and expensive.

2. **Biosecurity is a genuine concern.** GeneBreaker showed jailbreak attacks work. Fine-tuning on pathogenic data transfers to unseen pathogens. As models get better at genome generation, the dual-use risk increases. Regulatory intervention could restrict model access, undermining the open-source strategy.

3. **Brain drain to industry.** Key contributors have already left: Durrant to Anthropic, Nguyen to found Radical Numerics, Poli to Liquid AI. If the core ML talent continues to migrate to higher-paying industry positions, the research velocity could slow — and Arc's academic compensation can't match DeepMind or Anthropic salaries.

4. **DeepMind could open-source AlphaGenome and out-resource Evo.** Google has effectively unlimited compute. If AlphaGenome goes open-source with training code and scales to more species, DeepMind's institutional resources could overwhelm Arc's. The 4-hour training time for AlphaGenome vs months for Evo 2 highlights the efficiency gap.

5. **Clinical translation is far off.** BRCA1 variant prediction is impressive but well-studied. The real test is variants of uncertain significance in poorly characterized genes, where ground truth is scarce. Regulatory approval for clinical genomic AI tools adds years of delay. Hie's own timeline — *"by 2030, accurate virtual cell models that make a cell biologist feel emotion"* — acknowledges this is a multi-year horizon.

**Bottom Line:** Evo 2 represents the most ambitious and technically accomplished DNA foundation model to date — the first to train across all domains of life at genome scale with both generative and predictive capabilities. The Arc Institute's nonprofit structure, 8-year funding horizons, and NVIDIA compute partnership create the rare conditions needed for foundational research that wouldn't survive VC pressure for quarterly metrics. The team's publication record (two Science papers, two Nature papers in three years) is extraordinary. The core question is whether DNA language models will follow the LLM scaling trajectory — where emergent capabilities justify enormous compute — or plateau at "useful but not transformative" conservation-aware prediction tools. The first year of adoption (200+ citations, 88K downloads, 8M API calls) and the growing commercial ecosystem (Stylus Medicine, Terrain, BioNeMo integration) suggest the field is betting on the former.

**Verdict: Evo 2 is the frontier DNA foundation model by a wide margin — the only one that combines cross-species training, generative capability, million-base context, and full open-source release. The Arc Institute's structure solves the funding-horizon problem that has killed every prior academic attempt to compete with DeepMind at scale. If DNA language models follow the LLM scaling curve, Evo 2 is the GPT-3 moment for genomics.**

---

*Research compiled: March 2026*
