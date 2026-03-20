# Ditto Bio (Ditto Biosciences)

| Field | Detail |
|---|---|
| **Website** | [dittobio.com](https://www.dittobio.com) |
| **HQ** | San Francisco, CA |
| **Founded** | 2025 |
| **Structure** | C-Corp (YC company) |
| **Stage** | Pre-seed (YC W26) |
| **Investors** | Y Combinator (W26 batch) |
| **Total Raised** | ~$875K (standard YC deal) |
| **Valuation** | Not disclosed |

---

## The Big Audacious Idea

Parasites are the world's best immunologists. Viruses, ticks, and worms have spent millions of years evolving proteins that manipulate, suppress, and redirect the human immune system — because their survival depends on it. These are molecules honed by natural selection to do exactly what autoimmune drugs try to do: turn down the immune system's attack on self.

Ditto Bio's thesis: **use AI to systematically mine the protein arsenals of every parasite that infects humans, find the molecules that structurally mimic human immune targets, and engineer them into drugs for autoimmune disease.**

The GLP-1 precedent proves this works at massive scale. Exendin-4 — a peptide from Gila monster venom with 53% similarity to human GLP-1 but resistant to enzymatic breakdown — became the Ozempic/Wegovy drug class now worth $50B+. That was one molecule from one reptile. Ditto Bio wants to computationally screen *millions* of parasite proteins across *all* parasite types.

---

## The Problem That's So Hard to Solve

**The autoimmune drug market is dominated by blunt instruments.** Anti-TNF biologics (Humira), JAK inhibitors (Xeljanz), and corticosteroids suppress the immune system broadly, creating infection risk, cancer risk, and requiring lifelong treatment.

**Why this is genuinely hard:**

1. **Immunogenicity is the existential risk.** Parasite-derived proteins are foreign. The human immune system may mount antibody responses against the therapeutic itself. There is no established playbook for making parasite proteins safe for repeated human dosing. Ditto Bio is building a tissue biobank to map immune memory to parasite proteins — but this is unsolved science.

2. **Structural mimicry ≠ functional mimicry.** The Arcadia benchmarking paper acknowledges: *"There is no clear threshold between true mimicry and generic protein similarity."* High structural similarity can be biologically meaningless.

3. **The clinical failure precedent looms large.** Coronado Biosciences ran pig whipworm (TSO) trials for Crohn's. TRUST-1 (250 patients, 2013) failed. FALK trial (240 patients) discontinued for futility. These failures set the field back a decade.

4. **Translation gap.** Animal models consistently show promise. Human trials have repeatedly failed. *"The failed therapeutic potential of helminth treatment in humans has been surprising to some scientists."*

5. **The selectivity problem.** Parasite proteins evolved to suppress host immunity broadly. A molecule that dampens everything risks making patients vulnerable to infections and cancer.

---

## The Technology Stack

### MoleculeMapper Platform

1. **Input**: ~1M+ protein sequences/structures from primate-infecting viruses, ticks, and parasitic worms
2. **Structure prediction**: AlphaFoldDB for 3D structures of uncharacterized parasite proteins
3. **Structural comparison**: Foldseek for rapid comparison against the human proteome
4. **Statistical filtering**: Bayesian Gaussian Mixture Modeling to cluster and rank candidates
5. **Output**: Ranked list of parasite proteins predicted to mimic specific human immune targets

**Key results:**
- Recovered **10 of 19 FDA-approved RA drug targets** in top 100 predictions
- Identified substantial viral proteins that inhibit TNF signaling
- Proteins achieve "extremely tight binding (1-2 nM)" with drug-like properties
- **>98% of viral and parasite proteins remain uncharacterized**

### Organism Sources

| Source | Examples | Strategy |
|---|---|---|
| **Viruses** | Herpesviruses (EBV), poxviruses | Molecular mimicry of cytokines, receptors, apoptosis regulators |
| **Ticks** | *Ixodes ricinus/scapularis* | Saliva proteins suppressing T-cell activation, complement, inflammation |
| **Parasitic worms** | Schistosomes, hookworms | Secreted proteins dampening Th1/Th2, blocking macrophage activation |

### Benchmarking Validation

| Human Target | Viral Mimic | Function |
|---|---|---|
| Bcl-2 | BHRF1, BALF1 (EBV) | Apoptosis inhibition |
| IL-10 | BCRF1, UL111A (herpesviruses) | Immune suppression |
| CD47 | VACWR162, 128L (poxviruses) | "Don't eat me" signal evasion |
| IFNgR1 | B9R, VACWR190 (poxviruses) | Interferon response blocking |
| IL-18BP | MC054L, 14L, D5L (poxviruses) | Inflammatory response suppression |

### Tissue Biobank

Building a human tissue biobank to map real-world immune memory to parasite proteins — the key infrastructure for predicting and engineering around immunogenicity.

[GitHub: dittobio/2024-mimic-benchmarking](https://github.com/dittobio/2024-mimic-benchmarking) — Forked from Arcadia Science. Snakemake + Foldseek + Gaussian mixture modeling. MIT license.

---

## What the World Looks Like If This Works

1. **Autoimmune drug discovery shifts from rational design to evolutionary mining** — screening nature's solutions pre-optimized by millions of years of arms races
2. **The GLP-1 story repeats across autoimmune disease** — parasites have evolved thousands of immunomodulatory proteins, each a potential new drug class
3. **Precision immunosuppression becomes possible** — different parasites target different pathways, enabling matching the right immunomodulator to the right disease
4. **The hygiene hypothesis becomes a drug development strategy** — the epidemiological signal finally becomes actionable through purified protein therapeutics
5. **Nature-derived biologics become a recognized drug category** alongside monoclonal antibodies and cell therapies

---

## Best Case Scenario / Addressable Opportunity

| Market | Size | Growth |
|---|---|---|
| Global autoimmune disease drugs | ~$116-231B (2025) | 5-8% CAGR |
| Biologics segment | 40-60% of market | Fastest growing |
| U.S. autoimmune market | ~$32B (2025) | → $49B by 2033 |

Target diseases: RA, eczema, IBD, psoriasis, lupus, MS, Type 1 diabetes, Crohn's.

---

## The Science: A Brief History

- **1989**: Strachan proposes the **Hygiene Hypothesis** — decreased infection correlates with increased autoimmune disease
- **1990s-2000s**: Epidemiological data accumulates. Endemic parasitic infection countries have dramatically lower autoimmune rates. Migration studies confirm: autoimmune disease rises within one generation
- **2004-2013**: **Live helminth therapy trials.** Coronado Biosciences leads with pig whipworm for Crohn's
- **2013**: **Coronado's catastrophic failure.** TRUST-1 and FALK both fail. Field devastated
- **2014-2020**: Shift to molecular approaches. Academic labs isolate individual worm proteins. Slow — one at a time
- **2020-2023**: **AlphaFold + Foldseek.** Computational structural analysis of millions of parasite proteins becomes possible for the first time
- **2021-2024**: **Arcadia Science** (Seemay Chou, $500M, funded by Sam Altman) builds structural mimicry pipeline. Borges, Sun, Weiss develop the tools
- **2024**: Arcadia shelves the project — *"doesn't play to the unique strengths of our platform."* Founders take the research
- **2025**: MoleculeMapper recovers 10/19 RA drug targets. YC W26

**Why Now**: AlphaFold + Foldseek made this approach literally impossible 5 years ago. Coronado proved the biology but showed live worms were wrong. >98% of parasite proteins remain uncharacterized.

---

## Commercial Validation

**None yet.** Pre-revenue, 3 people, just emerged from stealth via YC W26.

---

## Core Team

All three founders worked together 3+ years at **Arcadia Science** ($500M, funded by Sam Altman). The viral structural mimicry pipeline they co-authored is MoleculeMapper's direct ancestor.

### Adair Borges, PhD — CEO & Co-Founder

| Field | Detail |
|---|---|
| **Education** | BS Microbiology, Pittsburgh (Goldwater Scholar); PhD Biomedical Sciences, UCSF (Bondy-Denomy Lab) |
| **PostDoc** | Miller Fellow, UC Berkeley (Jill Banfield Lab) |
| **Citations** | 2,256 (50+ papers) |
| **Key Work** | Anti-CRISPR proteins (Cell, Science, Nature Microbiology); phage cooperation ("viral altruism") |
| **Recognition** | Harold M. Weintraub Graduate Student Award (2019) |

**What's notable**: Borges's entire career is about how parasites defeat host immune systems. Her PhD on anti-CRISPR proteins — evolved by phages to inhibit bacterial CRISPR immunity — is conceptually identical to Ditto Bio's thesis. The Weintraub Award previous winners include Jennifer Doudna. One of Joe Bondy-Denomy's earliest grad students. Postdoc with metagenomics pioneer Jill Banfield. Undergraduate work on *Toxoplasma gondii*. She's been studying parasite immune manipulation since day one.

### Dennis Sun, PhD — Co-Founder

| Field | Detail |
|---|---|
| **Education** | BA Human Dev & Regenerative Biology, Harvard (magna cum laude, Phi Beta Kappa); PhD MCB, UC Berkeley (NSF Fellow, Patel Lab) |
| **Citations** | 156 |
| **Key Work** | Hox gene regulatory evolution; ProteinCartography (Arcadia) |
| **Prior** | Chief of Staff, Arcadia Science |

**What's notable**: Built **ProteinCartography** at Arcadia — the direct technical ancestor of MoleculeMapper. PhD on how Hox genes evolve different regulatory mechanisms across crustacean species gave him deep intuition for computational cross-species protein comparison. Father is an immunologist. Unusually multidisciplinary — also a designer (Mezarque Design), writer (founded Harvard Writers' Workshop).

### Emily C.P. Weiss, PhD — Co-Founder / CTO

| Field | Detail |
|---|---|
| **Education** | PhD Microbiology, UCSD (Dutton Lab) |
| **Citations** | 1,288 |
| **Key Work** | Bacterial-fungal interactions (first-author Nature Microbiology, 87 pages) |
| **Prior** | DuPont, Illumina, Scientist at Arcadia Science |

**What's notable**: High-throughput genetic screening expertise translates directly to screening parasite proteins at scale. Industrial experience at DuPont and Illumina adds practical pipeline development skills. Co-authored the viral structural mimicry paper at Arcadia with Borges.

**YC Partner**: Ankit Gupta (GP; co-founded Reverie Labs, ML drug discovery → acquired by Ginkgo Bioworks).

---

## Investor Depth

**Y Combinator (W26)** — Standard deal. No additional investors disclosed.

---

## Hiring Signals & Strategic Direction

3 employees (founders only). Seeking: industry immunologists, biologics drug developers, protein designers. Next hires will signal the transition from computation to wet-lab validation.

---

## Conference & Media Presence

Minimal — just emerged from stealth. YC Launch page. BioByte 150 (Decoding Bio newsletter). Founders' academic records provide scientific credibility.

---

## Why This is a Non-Consensus Bet

**What the consensus thinks:**

1. Parasite-derived therapeutics are dead — Coronado's 2013 failures proved it
2. Foreign proteins will trigger dangerous immune responses
3. Structural similarity doesn't guarantee functional mimicry
4. The autoimmune market is well-served by current drugs
5. A 3-person pre-seed can't compete with Holoclara (Phase 1, $16M)

**What Ditto Bio believes differently:**

1. Coronado failed because live worms were wrong — purified proteins are fundamentally different, and the epidemiological signal remains one of immunology's strongest
2. Immunogenicity is solvable with modern protein engineering + tissue biobank data
3. AlphaFold + Foldseek created capabilities that didn't exist before — 10/19 RA target recovery validates the approach
4. Nature already solved selectivity — different parasites target different pathways
5. GLP-1 (one reptile peptide → $50B+) proves nature-derived biologics create new drug classes at enormous scale

---

## Competitive Landscape

| Company | Approach | Stage | Funding | Differentiator |
|---|---|---|---|---|
| **Ditto Bio** | AI parasite protein discovery (viruses, ticks, worms) | Pre-seed / YC W26 | ~$875K | Computational-first; broadest organism scope |
| **Holoclara** | Worm-derived small molecules | Phase 1 clinical | $16M | Most advanced clinically; oral; worms only |
| **Kyverna** | CAR-T for autoimmune | Clinical | $300M+ | Cell therapy; different modality |
| **Cabaletta** | CAR-T for autoimmune | Clinical | $400M+ | Cell therapy; different modality |
| Anti-TNF biologics | Monoclonal antibodies | Marketed | — | Standard of care; going biosimilar |
| JAK inhibitors | Small molecules | Marketed | — | Oral; black box safety warnings |

---

## Qualitative Assessment

**Conviction Level: MEDIUM-HIGH**

**Bull case:**

1. **Exceptional team perfectly matched to this problem.** Borges (2,256 citations, Weintraub Award) has studied parasite immune manipulation her entire career. Sun built the computational platform. Weiss brings high-throughput screening. 3+ years together at Arcadia.
2. **Compelling computational proof of concept.** 10/19 FDA-approved RA drug targets in top 100 predictions.
3. **Thesis rests on one of immunology's strongest epidemiological signals.**
4. **>98% of parasite proteins uncharacterized.** Enormous unexplored space. GLP-1 precedent shows one peptide → $50B+.
5. **"Why Now" is real.** AlphaFold + Foldseek made this impossible 5 years ago.

**Key risks:**

1. **Immunogenicity remains unsolved.** No playbook for making foreign proteins safe for chronic dosing.
2. **Coronado shadow.** Field's biggest failure makes everyone skeptical.
3. **Long translational chain.** Computational hit → functional binder → drug → in vivo efficacy.
4. **3 people, ~$875K.** Gap to clinical candidate requires hundreds of millions.
5. **Arcadia shelved this.** Could mean insufficient commercial promise or just different priorities.

**Bottom line**: The strongest scientific foundation I've seen at pre-seed. The team has studied parasite immune manipulation for a decade across PhDs, postdocs, and Arcadia. MoleculeMapper's target recovery is real signal. The question is whether they can solve immunogenicity and survive the translational journey.

**Verdict: Exceptional founder-problem fit backed by one of immunology's strongest signals. If even one parasite-derived protein validates clinically, the GLP-1 precedent suggests transformational outcomes. Watch for first wet-lab validation data.**

*Research compiled: March 2026*
