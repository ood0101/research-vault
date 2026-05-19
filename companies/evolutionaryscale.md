# EvolutionaryScale

**Website:** [evolutionaryscale.ai](https://www.evolutionaryscale.ai) (now redirecting to [biohub.org](https://biohub.org/))
**HQ:** New York City (research) + remote
**Founded:** 2023 (incorporated as Delaware Public Benefit Corporation after Meta disbanded its FAIR Protein Team in April 2023)
**Structure:** Public Benefit Corporation
**Stage:** **Acquired by Chan Zuckerberg Biohub — November 6/9, 2025**
**Seed Round (June 2024):** $142M
**Seed Investors:** Nat Friedman, Daniel Gross, Lux Capital (lead); Patrick Hsu (co-lead); AWS; NVentures (NVIDIA's VC arm); plus others
**Total Raised:** $142M
**Acquirer:** Biohub (501(c)(3) supported by the Chan Zuckerberg Initiative); financial terms undisclosed
**Post-Acquisition Status:** Team of ~50 researchers absorbed into Biohub; Alex Rives became Biohub's Head of Science; ESM3/Cambrian models continue to be available through Forge under the Biohub umbrella

> **This dossier documents an acquired company.** EvolutionaryScale ceased to operate as an independent venture in November 2025 when its team joined Chan Zuckerberg Biohub as the core of Biohub's new AI-for-biology initiative. The dossier is preserved here because (a) ESM3 is the most influential protein foundation model after AlphaFold and is referenced by multiple companies in this vault (notably Immunera, which uses ESM-2 in its Mal-ID diagnostic), and (b) the founding team's trajectory through Meta FAIR → independent PBC → philanthropic research org is a defining 2023–2025 arc in AI-for-biology.

---

## The Big Audacious Idea

**Train a language model on every protein nature has ever produced, then use it to "speak" biology fluently — generating new proteins from scratch, predicting structure and function jointly, and effectively simulating evolution in silico.**

The thesis: every living organism uses the same 20-amino-acid alphabet and the same biological grammar. Sufficiently large language models trained on the full diversity of natural proteins (billions of sequences across the tree of life) should learn the underlying patterns of how sequence determines structure determines function. Once you have such a model, you can do for proteins what GPT-4 does for English: generate, edit, complete, transform — but the outputs are new molecules that fold, bind, and function.

If that bet pays off, you can:
- Design **medicines** (antibodies, enzymes, peptide therapeutics) from prompts
- Engineer **enzymes** that break down plastics, capture carbon, or synthesize industrial chemicals
- Predict **disease mutations** and their functional consequences from sequence alone
- Compress **decades of protein engineering** into hours of compute

Alex Rives' summary in the original ESM3 announcement: *"ESM3 takes a step toward a future where AI is a tool to engineer biology from first principles, the way we engineer structures, machines, microchips, and write computer programs."* Lux Capital's Josh Wolfe called it *"a ChatGPT moment for biology."*

---

## The Problem That's So Hard to Solve

For 60+ years, protein engineering has relied on **directed evolution** — make random mutations, screen for the ones that work, iterate. This is slow (years per project), expensive (millions of dollars in wet-lab work), and limited (you can only search a tiny corner of sequence space).

The reason no one had cracked it before:

1. **Protein space is astronomical.** A 229-amino-acid protein has 20²²⁹ possible sequences — more than the number of atoms in the visible universe. Brute-force search is impossible.
2. **The sequence → structure → function map is non-obvious.** Two sequences that look 99% similar can fold into completely different shapes; two sequences that look completely different can perform the same function. Classical bioinformatics (BLAST, MSA, Rosetta) has been chipping at this for 30 years.
3. **AlphaFold (2020) was a breakthrough — but only on prediction.** AlphaFold2 and AlphaFold3 (DeepMind) revolutionized *structure prediction* — given a sequence, what does it fold into. But they don't *generate* novel proteins. The inverse problem — given a desired function, generate a sequence — was still open.
4. **Protein language models existed but lacked scale.** ESM-1, ESM-1b, ESM-2 (Meta FAIR, 2019–2022) showed that masked language modeling on protein sequences worked — but at <15B parameters they were "interesting research artifacts" rather than transformative tools.
5. **Combining sequence + structure + function in a single model was the open question.** Generating *just* a sequence isn't enough — you need a model that reasons jointly about all three properties, so you can say "design me a protein with this 3D active site, this function annotation, and this length."

EvolutionaryScale's central technical bet: at sufficient scale (~100B parameters, 10²⁴ FLOPS, billions of proteins), a *multimodal* protein language model would develop emergent capabilities that smaller models lacked — the same scaling-laws phenomenon that turned GPT-2 into GPT-4.

That bet paid off. ESM3 demonstrated emergent atomic-coordination capability (the ability to design a protein where amino acids distant in sequence sit close in 3D space) — a capability that scaled with model size and became dramatically more apparent at the 98B-parameter scale.

---

## The Technology Stack

### ESM3 (released June 2024, published in *Science* January 2025)

**Architecture:** Multi-track transformer that jointly reasons over three modalities:
- **Sequence** — the amino-acid chain
- **Structure** — discretized into a "structure alphabet" so 3D conformation can be tokenized
- **Function** — annotations like enzyme class, fold family, GO terms

**Training scale (largest model):**
- **98 billion parameters**
- **2.78 billion natural proteins** sampled from Amazon rainforest, ocean depths, hydrothermal vents, soil microbiomes, etc.
- **771 billion unique training tokens**
- **>10²⁴ FLOPS** of compute — claimed at release as "the most compute ever applied to training a biological model"
- Trained on one of the highest-throughput GPU clusters in the world (built on NVIDIA H100s in partnership with AWS)

**Training objective:** Masked-language-modeling, generalized to three modalities. Each protein's sequence, structure, and function are tokenized, randomly partially masked, and the model is trained to reconstruct the masked positions. This forces the model to learn the joint distribution P(sequence, structure, function) across evolutionary-scale data.

**Generation:** Start with fully-masked tokens; iteratively unmask; the model fills in sequence + structure + function simultaneously. Any combination of partial specification works as a prompt — you can fix the 3D active site and let the model generate everything else around it, or fix a function annotation and let the model design from scratch.

**Alignment:** RLHF-style preference learning, but with self-generated feedback (since human feedback on protein quality is harder to scrape than on natural language). Lab feedback can also be incorporated.

### The esmGFP Demonstration

The flagship demonstration in the ESM3 paper: design a novel **Green Fluorescent Protein (GFP)** from scratch.

GFP is one of the most famous proteins in biology (Nobel Prize 2008). It has a unique self-forming chromophore — atoms in the protein chain spontaneously reorganize to create a fluorescent unit. Natural variants have been found over 100s of millions of years of evolution; engineering distant variants in the lab is hard because most mutations destroy fluorescence.

ESM3 was prompted with the structure of a few residues in GFP's core, then asked to generate candidates via chain-of-thought reasoning. After two rounds of experiment:
- **esmGFP** (in well C10 of the experiment plate) had **only 58% sequence similarity** to the closest natural GFP — 96 mutations across 229 residues — yet matched natural GFPs in brightness.
- Using rates of natural GFP divergence as a clock, **esmGFP would have taken nature ~500 million years to evolve.**

This is the kind of result that doesn't have a 10-year precedent. It's the protein-design equivalent of GPT-4 writing a working program from a prompt — and it's what convinced the protein-engineering field that something fundamental had changed.

### ESM Cambrian (released March 2025)

A **parallel model family** to ESM3, focused on **representation learning** rather than generation. Where ESM3 is the generative flagship, Cambrian is optimized for the downstream tasks where protein language models are used as feature extractors — variant effect prediction, function annotation, fitness prediction, single-cell biology embedding, etc.

Cambrian is the "BERT to ESM3's GPT" — it sets the new state of the art for embedding-style applications. This is critical because the vast majority of practical use of protein LMs in industry is *not* generation but *representation* — taking a protein sequence and getting a useful vector for downstream tasks.

### Forge Platform

[forge.evolutionaryscale.ai](https://forge.evolutionaryscale.ai/) — closed-beta API for commercial access to the full ESM3 model family (small/medium/large). Now operated under the Biohub umbrella but still branded ESM/EvolutionaryScale.

### Open Model Strategy

A defining choice: **ESM3-open (a 1.4B-parameter model) weights and source code released on GitHub** under a non-commercial license ([github.com/evolutionaryscale/esm](https://github.com/evolutionaryscale/esm)). The full 98B model is API-only via Forge or via partner platforms (AWS SageMaker, Bedrock, NVIDIA BioNemo NIM). This mirrors the Llama 2 / Mistral middle path: open enough that researchers and small biotechs can iterate; closed enough that commercial use is monetizable.

The non-commercial license has been controversial in some quarters of the protein-engineering community (where free-as-in-beer is the norm), but it has clearly worked — the open weights have seeded dozens of downstream research projects, including Immunera's Mal-ID.

### Distribution Partnerships

| Partner | What |
| --- | --- |
| **AWS** | ESM3 available on Amazon SageMaker; planned for AWS Bedrock and Amazon Omics |
| **NVIDIA** | ESM3 available on NVIDIA BioNemo and as an NVIDIA NIM microservice, optimized in collaboration with NVIDIA's bio team |
| **Open source** | ESM3-open 1.4B model weights on GitHub under non-commercial license |

---

## What the World Looks Like If This Works

(*Note: "this" here means the ESM platform broadly — Biohub will now carry the agenda forward.*)

1. **Protein engineering compresses from years to days.** Drug discovery, enzyme engineering, antibody optimization — the workflows that took postdocs years now take days of compute + a focused wet-lab validation cycle. The 10-year, $2B drug development pipeline gets restructured around AI-designed candidates.

2. **Antibodies become programmable.** ESM2 has already been used by groups like Hie et al. to evolve therapeutic antibodies for improved binding, thermostability, and viral neutralization. Scaled-up successors (ESM3+, Cambrian) push this from "interesting paper" to "this is how antibodies are designed industry-wide."

3. **Enzymes for industrial decarbonization become real.** PETase for plastic degradation, carbonic anhydrase for carbon capture, novel CRISPR variants — all are explicit demos in the ESM3 release. The economic implication: bio-manufacturing displaces chemical manufacturing across hundreds of $B-scale industries.

4. **Foundation-model biology becomes the default.** Just as every NLP startup now uses a transformer LLM, every protein-engineering or drug-discovery startup will use ESM3 (or its successors) as the substrate. The companies that succeed will be the ones that build differentiated *applications* on top — Immunera (autoimmune diagnostics from BCR/TCR sequencing) is an early example.

5. **Virtual biology becomes mainstream.** Biohub's stated next-step roadmap — "digital twins of cells and physiological systems, virtual experiments at scale" — is a 5-10 year arc that builds directly on the ESM/Cambrian foundation, integrated with single-cell datasets and imaging. If it lands, "decades of discoveries in months" becomes plausible.

---

## Best Case Scenario / Addressable Opportunity

**Pre-acquisition framing (June 2024):** Lux's thesis was that the protein-foundation-model market alone is comparable to the LLM-API market — a $10-50B/year revenue pool over a decade, distributed across pharma R&D services, biotech infrastructure, and biomanufacturing. EvolutionaryScale plus a successor commercial platform was an explicit Hugging-Face-of-bio play.

**Post-acquisition reality (November 2025):** The commercial monetization path was deliberately abandoned. The team and assets now live inside a 501(c)(3) — Biohub — which is committed to publishing models openly and democratizing access. The economic value that *would have* accrued to EvolutionaryScale equity holders is now being redistributed across the entire scientific community.

For investors, the relevant number is the **acquisition consideration** — undisclosed, but reported by AP and the NYT as "the team — not the company itself" was acquired, with the LinkedIn-circulated note that *"EvolutionaryScale is effectively over."* That language suggests an asset/talent acquisition rather than a standard cash-and-stock buyout. **Investors likely received some return of capital plus an upside-share mechanism**, but the path to a 10x venture outcome was traded for the path to maximum scientific impact.

For the field, the relevant number is the **addressable scientific value** — which Biohub is sizing as nothing less than "cure or prevent all diseases this century" with a tenfold compute expansion to 10,000 GPUs by 2028.

---

## The Science: A Brief History

**2018–2020: ESM-1 era at Meta FAIR.** Alex Rives and the Facebook AI Research Protein Team publish the first influential paper showing that masked-language-modeling on protein sequences learns useful representations of protein biology. ESM-1, ESM-1b, ESM-1v follow over 2019–2021.

**2022: ESM-2 and ESMFold.** Rives team scales ESM to 15B parameters, releases ESM-2. Couples it with ESMFold — a *prediction-only* structure model that competes with AlphaFold2 on single-sequence inputs (without the MSA dependency AlphaFold needs). ESMFold predicts 617M metagenomic protein structures, releasing the ESM Atlas — at the time, the largest open structure database. Published in *Science* (Lin et al., 2023, doi:10.1126/science.ade2574).

**April 2023: Meta disbands the FAIR Protein Team.** As part of Meta's broader AI restructuring, the protein team is dissolved. Rives and several core team members leave to form EvolutionaryScale.

**Mid-2023 – Mid-2024: Stealth.** EvolutionaryScale operates in stealth as a Public Benefit Corporation, building the next-generation model (ESM3) and the compute infrastructure to train it.

**June 25, 2024: Launch + $142M seed.** Simultaneous unveiling of (a) the company, (b) ESM3, (c) the $142M seed round led by Nat Friedman + Daniel Gross + Lux Capital, and (d) the esmGFP demonstration. Coverage in Reuters, TechCrunch, Synbiobeta, NVIDIA blog. Lux Capital's Josh Wolfe coins the "ChatGPT moment for biology" frame.

**January 2025: ESM3 published in *Science*.** Hayes et al., "Simulating 500 million years of evolution with a language model," *Science* (doi:10.1126/science.ads0018). The peer-reviewed paper validates the company's core technical claims.

**March 2025 (approx): ESM Cambrian released.** The parallel representation-learning model family launches.

**November 6, 2025: Chan + Zuckerberg announce Biohub restructuring.** Press release and NYT article: *"It also acquired the team of an A.I. start-up, Evolutionary Scale, and named Alex Rives, the company's chief scientist, its new head of science."* Biohub commits to 10,000 GPUs by 2028 and four scientific grand challenges (Virtual Immune System; unified cell model; inflammation monitoring; AI-immune-system reprogramming).

**November 9, 2025: Formal close** (per PitchBook acquisition date).

### "Why Now" Convergence (at the time of the bet)

- **Protein databases reached evolutionary scale.** 2.78B distinct natural proteins is roughly *every protein ever sequenced* — a uniquely rich training corpus that didn't exist 5 years ago.
- **Transformer architectures + masked-LM training transferred cleanly from NLP to proteins.** The same scaling laws hold; the same emergent capabilities appear at scale.
- **Compute commoditized at biology-relevant scale.** NVIDIA H100 + AWS made 10²⁴ FLOPS training runs accessible to a well-capitalized startup, where 5 years earlier they required a hyperscaler.
- **Pharma demand exploded.** Every major pharma (Roche/Genentech, Sanofi, Pfizer, AstraZeneca, Lilly) launched or accelerated AI-driven drug discovery programs in 2022–2024. The buyer side was ready for an "ESM-as-platform" offering.
- **Meta's exit created a once-in-a-cycle talent dislocation.** When Meta disbanded the protein team, the entire ESM core team became simultaneously available — exactly the kind of supply shock that lets a new venture form at scale.

---

## Commercial & Scientific Validation

| Validation | Source |
| --- | --- |
| ***Science* paper for ESM3** (Hayes et al., Jan 2025) | doi:10.1126/science.ads0018 |
| ***Science* paper for ESMFold/ESM-2** (Lin et al., 2023) | doi:10.1126/science.ade2574 |
| **esmGFP wet-lab validation** — designed GFP 58% similar to nearest natural variant, validated as functional in cell-based fluorescence assays | ESM3 paper |
| **$142M seed at PBC stage** — exceptional for a deep-tech AI/bio company at launch | June 2024 |
| **AWS + NVIDIA strategic participation** as both investors and distribution partners | June 2024 |
| **NVIDIA optimized ESM3 as a NIM microservice** — first-tier go-to-market integration | June 2024 |
| **Acquired by CZ Biohub Nov 2025** — confirms the team's strategic value to a $7B+ philanthropic biomedical research effort | Biohub press release |
| **Downstream usage:** ESM models are referenced or used in dozens of published papers — antibody evolution (Hie et al.), COVID variant detection (BioNTech/InstaDeep), clinical mutation effects (Brandes et al.), anti-CRISPR engineering (Marsiglia et al.), enzyme function (Yu et al.), single-cell foundation models (Rosen et al.), and immune-repertoire diagnostics (Zaslavsky et al. → Immunera) | ESM3 release blog post |

---

## Core Team

### Alex Rives — Co-Founder, Chief Scientist (now Head of Science at Biohub)

| Background | Detail |
| --- | --- |
| Prior role | Founder and scientific lead of the ESM team at Meta FAIR (2018–April 2023). Led the team from ESM-1 through ESM-2 + ESMFold. |
| Academic appointments | Core institute member at the **Broad Institute**; **assistant professor**, Dept of Electrical Engineering and Computer Science, MIT (continues both affiliations under Biohub) |
| New role (Nov 2025) | **Head of Science, Biohub** — leads integrated research strategy across experimental biology, data, and AI |
| Public profile | One of the most cited researchers in AI-for-biology; pioneered the application of masked-language-modeling to proteins |

**What's notable:** Rives is, depending on how you count, one of the 3–5 most influential researchers in AI-for-biology globally — his peers being John Jumper (AlphaFold lead at DeepMind/Isomorphic), David Baker (Rosetta/Baker Lab; 2024 Nobel laureate for protein design), and a handful of senior figures at DeepMind, Genentech, and academic labs. The fact that Mark Zuckerberg and Priscilla Chan named him **Head of Science at Biohub** — a role that includes leading research strategy across the entire CZI biomedical research portfolio, not just the AI piece — is a remarkable statement of confidence. He is also one of the rare figures who has a productive cross-affiliation across **Broad + MIT + Biohub** simultaneously, a configuration that essentially gives him access to the entire Boston-Cambridge biomedical research ecosystem plus the SF/CZI compute and dataset infrastructure.

### Tom Sercu — Co-Founder

Per TechCrunch's launch coverage (June 2024): *"Rives, along with Tom Sercu, [co-founded EvolutionaryScale] to build on the work they'd started [at Meta FAIR]."*

| Background | Detail |
| --- | --- |
| Prior role | Senior research engineering lead, Meta FAIR Protein Team (worked alongside Rives on ESM-1 through ESM-2) |
| Role at EvolutionaryScale | Co-founder; reported to be the engineering lead on ESM3's training infrastructure |

**What's notable:** Sercu represents the systems/scaling-engineering half of the ESM partnership. Training a 98B-parameter model on 2.78B proteins with 10²⁴ FLOPS on one of the largest GPU clusters in the world is a serious engineering undertaking — the protein-LM equivalent of OpenAI's compute team's work on GPT-3/4. Sercu's prior public output includes work on speech recognition (his pre-protein-LM specialty at IBM and Meta) and large-scale neural training infrastructure.

### The ESM Team (~50 researchers, now at Biohub)

The combined research team that joined EvolutionaryScale from Meta FAIR plus subsequent hires through 2024–2025 includes the bulk of the world's most experienced practitioners in protein language modeling. Per Biohub's announcement, *"the combined team of scientists, engineers, and AI researchers"* now staffs Biohub's AI-for-biology initiative.

This team will now have access to:
- **10,000 NVIDIA GPUs by 2028** (10x expansion from Biohub's existing compute)
- The **Chan Zuckerberg Biohub network** of imaging, single-cell, and experimental biology labs across San Francisco, Redwood City, Chicago, and New York
- **The Virtual Cells Platform** (CZI's existing single-cell foundation-model initiative)
- **CZI's existing model library** including VariantFormer (gene expression from genetic variants), CryoLens (cryoET structure analysis), scLDM (single-cell data generation), GREmLN (gene regulatory networks), and rBio (biological reasoning LLM)

---

## Investor Depth

### Lead Investors (Seed, June 2024)

#### Nat Friedman + Daniel Gross (NFDG)

The most-discussed individual angel/seed investing partnership in tech, fresh off of leading the Series A in Magic.dev, Perplexity, Cursor, Sakana AI, and dozens of others. Friedman is the former CEO of GitHub (acquired by Microsoft, where he ran it 2018–2021); Gross is the former Apple AI lead and former Y Combinator partner. Their thesis at EvolutionaryScale (per public statements) was that **AI-for-biology was at the same inflection point AI-for-language was in 2019** — and that backing the most credible protein-LM team in the world at the moment of scale was the highest-leverage bet available. The Friedman/Gross stamp of approval on EvolutionaryScale was a significant signal to the broader investor community and almost certainly accelerated the round.

#### Lux Capital

**Josh Wolfe (co-founder/MP)** publicly framed the round as a "ChatGPT moment for biology." Lux is one of the few VCs with both deep-tech investing muscle and bio-investing muscle (Recursion, Anduril, Tempus, Variant, Cradle, and many others). **Peter Hsu (Partner)** — a Berkeley professor and HHMI investigator who runs a CRISPR/biology lab — is a co-lead on the round (per his LinkedIn post). The combination of Wolfe's tech-platform sensibility and Hsu's bench-biology credibility gave Lux unusual standing to evaluate and lead this kind of company.

#### Amazon Web Services

Strategic investor and distribution partner. AWS's interest is structural: protein language models will be among the largest compute customers in life-sciences AWS for the next decade, and locking in the leading protein-LM team's models on SageMaker / Bedrock / Omics was a multi-decade infrastructure bet. AWS's participation gave EvolutionaryScale the H100 access needed for the 10²⁴ FLOPS ESM3 training run.

#### NVentures (NVIDIA's VC arm)

NVIDIA's strategic-investment vehicle. Like AWS, NVIDIA's interest was structural: ESM3 became a flagship NIM (NVIDIA Inference Microservice) in BioNemo, which is NVIDIA's bio-AI platform. NVIDIA's bio team (which has dramatically expanded under Kimberly Powell's leadership) co-optimized ESM3 for H100 inference performance.

### What the Investor Mix Tells Us

The seed round composition is unusual: *not* dominated by traditional biotech VCs (no Flagship, no ARCH, no Third Rock, no Polaris). Instead, the round is dominated by **tech-side investors who treated EvolutionaryScale as a foundation-model company that happened to operate on proteins rather than language**. This was the right framing — biotech VC underwriting models would have valued ESM3 like a drug-discovery platform (long timelines, big NPV-discounted pipelines), whereas the tech-VC framing valued it like an OpenAI-equivalent at a much earlier stage.

The acquisition outcome — into a 501(c)(3) at terms that aren't a traditional venture exit — is unusual but logically consistent with PBC structure. EvolutionaryScale was always a Public Benefit Corporation, meaning its charter explicitly subordinated shareholder returns to mission. The Biohub merger maximizes the mission; the financial return to investors is presumably structured around return-of-capital with some carry mechanism, but the upside-cap relative to a hypothetical Series A → C → IPO path is real.

For Friedman/Gross/Lux, this is plausibly seen as a *win on mission terms* — the team and platform they backed are now resourced 10x better than they would have been at a Series A — and a *moderate financial outcome* given the modest acquisition value.

---

## Open-Source Strategy

EvolutionaryScale's strategic choice was **partial open-source**: the smallest ESM3 model (1.4B parameters) was released with weights and code on GitHub under a non-commercial license; the production-grade models (medium and large, up to 98B) were API-only via Forge.

**Why this worked:**
1. **Open weights seeded the academic and small-biotech ecosystem.** Dozens of research projects built on ESM3-open — including the Immunera diagnostic that's the topic of another dossier in this vault. Academic citations compounded; downstream applications validated the platform.
2. **API + commercial license preserved monetization optionality.** Pharma and large biotechs paid for access to the full model via Forge / AWS / NVIDIA. The non-commercial license on the open weights ensured commercial users couldn't trivially route around the paid platform.
3. **The community license has been controversial** but has worked. Some open-source-purists (notably parts of the BioML community) have argued that non-commercial licenses are an obstacle to research progress. EvolutionaryScale's position — that releasing *any* weights of a 98B model is more open than the closed-source standard for foundation models — has prevailed in practice.

Under Biohub, the licensing trajectory will likely shift further toward open — Biohub's 501(c)(3) mandate makes open release of models the natural default, and the November announcement explicitly says *"datasets and models will be shared freely to democratize access."*

---

## Hiring Signals & Strategic Direction (Pre-Acquisition)

Through 2024 and 2025, EvolutionaryScale's hiring pattern was:
- **Research scientists** focused on protein engineering, molecular biology, and ML
- **Research engineers** for large-scale model training and inference infrastructure
- **Forge platform engineers** for the commercial API
- **Strategic partnerships and BD** for pharma deals

Notably **no large sales-org build-out** — consistent with a research-org-first culture and an API + strategic partnership go-to-market rather than enterprise direct-sales.

Under Biohub, the team's directional focus has shifted explicitly toward:
1. **Virtual Immune System** — a flagship CZI initiative to model immune biology computationally
2. **Unified AI-based cell model** — predicting cellular behavior across cell types
3. **AI-driven imaging integration** — coupling protein/cell models to next-gen microscopy
4. **Immune reprogramming for early disease detection** — AI-designed immune interventions

---

## Conference & Media Presence

EvolutionaryScale had an outsized media profile relative to its age:
- **Reuters, TechCrunch, Synbiobeta, NVIDIA blog** — at June 2024 launch
- ***Science* publication (Jan 2025)** — peer-reviewed validation
- **NYT cover treatment (Nov 2025)** — for the Biohub merger and CZI restructuring
- **AWS re:Invent 2024 keynote mentions** — as a SageMaker flagship customer
- **NVIDIA GTC 2024 + 2025** — featured in BioNemo announcements
- **NeurIPS, ICLR, ICML** — multiple papers from the team

Rives himself has been a high-profile speaker at AI conferences (Strange Loop, AI@Stanford, MIT events) and major bio meetings.

Under Biohub, the conference presence is shifting toward big biomedical research venues (HUPO, AAAS, Nature Conferences) while maintaining the AI venues.

---

## Why This Was a Non-Consensus Bet (Pre-Acquisition)

**What the consensus thought (2023–2024):**
1. AlphaFold has already solved protein structure prediction; the market is filled. A new protein-AI company is duplicative.
2. Pharma will build its own models internally — Genentech, Roche, Pfizer, Recursion. There's no room for an independent platform.
3. The economics of training 100B-parameter models from scratch are unsustainable for a startup; only hyperscalers can afford it.
4. Protein engineering is a "compounding 10-year science" problem, not a 3-year venture problem. Investor returns don't fit.

**What EvolutionaryScale (and its backers) believed differently:**
1. **Structure prediction (AlphaFold) is a narrow slice of the protein AI opportunity.** *Generation* — designing proteins to specification — is the larger and harder problem, and AlphaFold doesn't do it. ESM3's joint sequence/structure/function reasoning is fundamentally different.
2. **The foundation-model abstraction is structurally better than vertical-pharma models.** Just as OpenAI/Anthropic outcompete pharma's internal NLP efforts, an independent protein-foundation-model company will outcompete pharma's internal protein-AI efforts.
3. **At PBC structure with NFDG/Lux/AWS/NVIDIA backing, the capital availability is real.** $142M seed is enough to train ESM3 and get to commercial traction; later rounds (with strategic AWS/NVIDIA infrastructure access) would scale.
4. **The 10-year science framing was wrong.** The post-2024 acceleration in AI-for-biology is real and is collapsing science timelines into product timelines.

**What the November 2025 outcome demonstrated:**
The non-consensus bet on the *technology* was correct — ESM3 works, was published in *Science*, and is now the substrate for the broader AI-for-biology field. The non-consensus bet on the *commercial path* was more ambivalent — the team chose to optimize for mission impact over equity value, which is consistent with the original PBC charter but inconsistent with traditional venture-return optimization. Whether this is judged as "success" depends on the investor's frame.

---

## Competitive Landscape

| Company | Approach | Why They Were Different from EvolutionaryScale |
| --- | --- | --- |
| **Isomorphic Labs** (Alphabet/DeepMind spinout) | AlphaFold-based platform for drug discovery; closed commercial drug-discovery partnerships with Eli Lilly, Novartis | Closed-source / proprietary; vertical pharma BD model rather than foundation-model-as-platform |
| **Generate Biomedicines** (Flagship Pioneering) | Generative biology platform; in-house drug pipeline | Vertically-integrated drug company with proprietary models; not a platform play |
| **Cradle Bio** | AI-assisted protein design; sells to pharma | Smaller scale, tighter focus on antibody/enzyme design; uses ESM-family models internally |
| **Profluent** | Protein language models for antibody/enzyme design; open-sources some models (OpenCRISPR) | Direct competitor in the protein-LM space; smaller scale; more open-source focused |
| **Salesforce Research / ProGen** | ProGen-family protein LMs | Research-only at Salesforce; not productized |
| **Inceptive** | RNA design (different modality but adjacent) | RNA-focused, not protein-focused |
| **Recursion Pharmaceuticals** | Phenotypic screening + AI; less protein-LM-focused | Different approach to AI-for-bio; commercial pharma model |
| **Baker Lab (RoseTTAFold / RFDiffusion)** | Academic-led protein design; open-source models | Foundational research source; not a commercial entity but profoundly influential |
| **AlphaFold + AlphaFold3 (DeepMind)** | Structure prediction, now also some generation in AF3 | Prediction-focused; Isomorphic is the commercial extension |

**Post-Biohub:** Most of the above remain commercial. Biohub is now uniquely positioned as the **open, philanthropic, vertically-integrated** alternative — the AlphaFold-of-everything model rather than the Isomorphic model.

---

## Qualitative Assessment

**Conviction Level: ACQUIRED (HIGH historical conviction on team, platform, and scientific contribution)**

### Why This Worked (Pre-Acquisition)

1. **The team was unmatched.** The ESM team at Meta FAIR was the *single most experienced* group in protein language modeling globally — moving them en masse to an independent PBC was a uniquely large talent concentration.
2. **The science delivered.** ESM3 was the most important protein-AI release of 2024, peer-reviewed in *Science* in 2025, and remains the substrate for many downstream applications (Immunera, antibody-evolution work, single-cell foundation models, etc.).
3. **The capital was right-sized.** $142M was exactly the right amount to train ESM3, build Forge, and reach commercial traction without dilutive Series A pressure.
4. **The distribution was real.** AWS + NVIDIA partnerships gave the company hyperscaler-grade go-to-market the day it launched.

### Why the Path Ended in Acquisition (Not Independent Build)

1. **PBC charter aligned the team toward mission, not equity.** When Biohub came knocking with 10,000 GPUs by 2028 and zero commercial pressure, the team's optimization function pointed to "accept" rather than "continue independent build with Series A."
2. **Open-source-friendly commercial models are hard.** The non-commercial license worked but capped near-term monetization. Building a true SaaS revenue line against a freely-available 1.4B model is harder than building one against a fully-closed product.
3. **Pharma BD cycles are long.** Closing $10M+ enterprise pharma deals takes 12-18 months. The team would have been 2-3 years from material recurring revenue at the time of the merger discussion.
4. **CZI/Biohub's open-mission philanthropic structure was an irresistible fit.** For a team whose stated mission was "AI for biology for the benefit of human health and society," there is no better operating environment than a 501(c)(3) with hyperscaler compute and no commercial pressure.

### What Investors Learned

For **NFDG and Lux**, this is plausibly a high-information outcome — they backed the best team in protein AI, got peer-reviewed validation of the platform, got real distribution partnerships, and exited via acquisition into one of the most well-resourced research organizations on Earth. The financial return is moderate; the **scientific and reputational return** is large.

For **AWS and NVIDIA**, the strategic outcome is positive — ESM3 is now part of their infrastructure stacks, the integrations are deep, and the Biohub partnership will continue to drive AWS/NVIDIA consumption (especially if Biohub buys NVIDIA H100/H200/B100 for the 10,000-GPU expansion).

### What the Field Learned

The November 2025 outcome is a **template** for what happens when a Public Benefit Corporation is acquired by an aligned 501(c)(3). Expect to see more of this structure in AI-for-biology and AI-for-science generally: PBC raises seed capital, builds a foundational model, reaches scientific validation, then either (a) raises commercial Series A and goes commercial, or (b) merges into a mission-aligned non-profit or philanthropic research org with greater long-term resources. Outcome (b) was previously rare; ES → Biohub may make it more common.

### Bottom Line

EvolutionaryScale built one of the most important foundation models in the post-AlphaFold era, published peer-reviewed validation of it, raised $142M from a who's-who of strategic investors, and exited into Chan Zuckerberg Biohub in November 2025 as the team-and-tech foundation for Biohub's $7B+ AI-for-biology initiative. The independent company is over; the platform lives on; the team is now resourced at a scale they couldn't have achieved independently.

**Verdict: A landmark scientific outcome with an unusual but mission-consistent financial outcome. The single most important data point in 2025 for understanding how AI-for-biology will be structured going forward — and a useful reference point for evaluating other companies in the protein-LM and AI-for-biology spaces. The ESM platform is now a public-good piece of infrastructure that other companies (Immunera being one example in this vault) will build commercial applications on top of.**

---

*Research compiled: May 2026*
