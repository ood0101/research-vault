# Cumulus Labs

| Field | Detail |
|---|---|
| **Website** | [cumuluslabs.io](https://cumuluslabs.io) |
| **HQ** | San Francisco, CA |
| **Founded** | 2025 |
| **Structure** | Cumulus Compute Labs Corporation |
| **Stage** | Pre-seed (YC W26) |
| **Investors** | Y Combinator |
| **Total Raised** | ~$875K (standard YC deal) |
| **Valuation** | Not disclosed |

---

## The Big Audacious Idea

Every inference provider is either fast-but-expensive (Together AI, Fireworks — paying for always-on GPUs) or cheap-but-DIY (Modal, RunPod — configure vLLM yourself and deal with cold starts). Cumulus Labs claims both: faster AND cheaper, by building a custom inference engine from scratch specifically for NVIDIA's Grace Hopper architecture.

The insight: everyone else runs generic inference engines (vLLM, SGLang) on generic GPU setups. Cumulus built **IonAttention** — a C++ runtime that exploits the GH200's unique 900 GB/s coherent CPU-GPU memory link in ways impossible on standard discrete GPUs. Hardware-specific optimization, not software abstraction, is the competitive moat.

Suryaa (co-founder): *"We really wanted better performance and utilization. We tried forking open source solutions and monkey patching but didn't really work, so we decided to build ground up."*

And: *"How did cloud ever become more expensive than on-prem?"*

---

## The Problem That's So Hard to Solve

**GPU inference is simultaneously too expensive and too slow for the AI agent era.** As AI shifts from training to inference-heavy workloads (agents making thousands of API calls), the economics of GPU compute become the binding constraint.

**Why this is genuinely hard:**

1. **The cold start problem.** Serverless GPU platforms need to load model weights into GPU memory when a request arrives. This takes seconds to minutes. Modal solved it with GPU memory snapshots (sub-second). RunPod uses FlashBoot (sub-200ms). Cumulus claims 2-second cold starts on GH200 — competitive but not clearly better than the best incumbents.

2. **Generic engines leave performance on the table.** vLLM and SGLang are designed to run on any NVIDIA GPU. This means they can't exploit architecture-specific features like the GH200's coherent CPU-GPU memory fabric. But building a hardware-specific engine means rewriting when the hardware changes — which NVIDIA does every ~2 years.

3. **Multi-model serving is wasteful.** Thousands of open-source models need hosting, but dedicating a GPU to each model means most GPUs sit idle. Model multiplexing (sharing a GPU across models) requires near-instant weight swapping — Cumulus claims <750ms for 7B models.

4. **The pricing squeeze.** Together AI, Fireworks, and Groq compete aggressively on price. HN commenters found Cumulus is NOT cheapest on all models — MiniMax is cheaper on DeepInfra, GLM-5 is cheaper elsewhere. Pricing advantages are model-specific, not universal.

5. **Scale-to-zero without cold start pain.** The ideal is: pay nothing when idle, serve instantly when requests arrive. This requires execution state capture and rapid restoration — possible with CRIU-based GPU checkpoint/restore (2025 breakthrough) but not yet proven at scale.

---

## The Technology Stack

### IonAttention — Custom Inference Engine

Built from scratch in C++ for NVIDIA GH200/GB200 architecture. NOT a fork of vLLM or SGLang. Three core innovations:

**1. Coherent CUDA Graphs**
Leverages GH200's hardware cache coherence so CPU can update CUDA graph parameters between replays without re-capture. GPU picks up new values during execution. *"Appears novel to published literature."* Eliminates re-capture overhead and per-node patching costs.

**2. Eager KV Cache Writeback**
Filled KV blocks are immutable — once all token positions are written, blocks can be copied to CPU memory (LPDDR5X) in background. Reduces blocking eviction from 10ms+ to <0.25ms (40x improvement). Concurrent bidirectional streaming adds ~1.2x throughput.

**3. Phantom-Tile Attention Scheduling**
Over-provisions GPU grid beyond actual KV length requirements. Extra tiles perform bounds checks and exit immediately. Fills streaming multiprocessors at small batch sizes. Reduces attention time 60%+ in worst-case regimes.

### Supporting Optimizations

- **GPU-side sampling**: Sorting-free top-p at ~150μs/step vs 37-50ms on CPU
- **Three-stream pipelining**: Coordinated compute, prefetch, writeback for layer-by-layer weight staging
- **ARM co-processing**: Speculative draft model on 72 ARM Neoverse V2 cores + vision encoder caching on CPU (10-20% throughput gain)
- **Multi-model serving**: Shared workspace/KV pools, NVLink-C2C weight migration, <750ms 7B model swap, <100ms switch time
- **Fractional GPU sharing**: NVIDIA MPS-based "GPU Credits" (100 credits = 100% of one GPU)
- **CRIU-based GPU migration**: Forked from kaito-project/grit — checkpoint/restore for GPU workloads in Kubernetes

### Benchmarks (Self-Reported)

| Metric | Cumulus | Competitor | Improvement |
|---|---|---|---|
| Qwen2.5-7B throughput | 7,167 tok/s | — | Single chip, no TP |
| Qwen3-VL-8B multimodal | 588 tok/s | Together AI: 298 tok/s | ~2x |
| KV eviction latency | <0.25ms | Baseline: 10ms+ | 40x |
| Model swap (7B) | <750ms | — | — |
| P50 latency | 1.46s | Together AI: 0.74s | **Worse** (2x) |

**Critical note**: All benchmarks are self-reported. P50 latency is worse than Together AI — Cumulus optimizes for throughput over latency.

### Products

1. **IonRouter** — Managed inference API (OpenAI-compatible, drop-in replacement)
2. **Cumulus Cloud** — Serverless GPU deployment (deploy any containerized model)
3. **Cumulus OS** — On-premises GPU cluster management

### Hardware

- Primary: NVIDIA GH200 Grace Hopper Superchip (99GB HBM3 + 452GB LPDDR5X, 900 GB/s NVLink-C2C, 72 ARM cores)
- Secondary: NVIDIA GB200 (for large MoE models)

---

## What the World Looks Like If This Works

1. **Hardware-specific inference engines become the norm.** Just as compilers optimize for specific CPU architectures, inference engines optimize for specific GPU architectures. Generic runtimes (vLLM) become the "unoptimized" baseline.

2. **GPU utilization jumps dramatically.** Multi-model multiplexing with <100ms swap times means one GPU serves dozens of models, with fractional sharing via MPS. GPU waste drops from ~70% idle time to near-full utilization.

3. **AI inference costs drop to a fraction of current levels.** If hardware-specific optimization delivers 2x throughput at equivalent cost, inference API prices halve — accelerating AI agent adoption.

4. **Scale-to-zero becomes real for GPU workloads.** CRIU-based checkpoint/restore + execution state caching across CDN means cold starts approach zero while idle costs are zero.

5. **The GPU cloud market restructures around optimization layers** rather than raw hardware access. Owning GPUs matters less than optimizing them.

---

## Best Case Scenario / Addressable Opportunity

| Market | Size | Growth |
|---|---|---|
| GPU-as-a-Service | ~$5-6B (2025) | → $26-50B by 2031-2032 (29-36% CAGR) |
| Serverless computing | ~$17-28B (2025) | → $49-92B by 2030-2034 |
| AI inference (vs training) | Growing faster than training | Jensen Huang: "inference inflection point" |

---

## The Science: A Brief History

- **2019-2020**: GPU clouds emerge as a category (CoreWeave, Lambda). Dedicated rental model.
- **2021**: Modal founded — introduces serverless GPU with Python SDK. Cold starts are 30-60 seconds.
- **2022**: ChatGPT (Nov 2022) creates massive inference demand. vLLM and SGLang emerge as open-source inference engines.
- **2023-2024**: Cold start innovations — container caching, GPU memory snapshots, FlashBoot. Sub-second cold starts achieved.
- **2024**: NVIDIA GH200 Grace Hopper ships — first tightly coupled CPU-GPU architecture with 900 GB/s coherent link. New optimization possibilities.
- **2025**: CRIUgpu enables transparent GPU checkpoint/restore. GPU supply increases. Cumulus founded. Voltage Park acquires TensorDock (where Suryaa worked).
- **2026**: Cumulus launches IonRouter with GH200-native inference engine. NVIDIA announces Vera Rubin at GTC.

**Why Now**: The GH200's coherent CPU-GPU memory fabric (900 GB/s NVLink-C2C) enables inference patterns impossible on previous discrete GPU architectures. CRIUgpu made GPU checkpoint/restore production-ready. And the shift from training to inference means optimization matters more than raw hardware access.

---

## Commercial Validation

| Signal | Detail |
|---|---|
| Y Combinator W26 | Accepted into batch |
| NVIDIA Inception | Member of startup program |
| HN Launch | At least one user tested on production Kimi K2.5 workloads — comparable Fireworks speeds at better pricing |
| LinkedIn YC Post | 496 likes, 114 comments |

**No public customers, revenue, or partnership announcements.**

---

## Core Team

### Suryaa Rajinikanth — Co-Founder

| Field | Detail |
|---|---|
| **Education** | BS Computer Science, Georgia Tech |
| **Career** | Google (HW Engineering Intern) → TensorDock (Lead Engineer) → Blackstone (Summer Analyst) → Palantir (Software Engineer) → Cumulus Labs |

**What's notable**: Suryaa saw the GPU problem from the **provider side** at TensorDock — he built the distributed GPU marketplace serving thousands of users before it was acquired by Voltage Park ($125M). He knows how fragmented and underutilized GPU supply is. At Palantir, he learned what production-grade government infrastructure demands. The combination: deep knowledge of GPU supply economics + enterprise reliability requirements.

*"We knew exactly what the industry needed — and no one was building it."*

### Veer Shah — Co-Founder

| Field | Detail |
|---|---|
| **Education** | BS Computer Science, UW-Madison (Dec 2025) |
| **Career** | FIRST Robotics captain (Team 5422, World Championship qualifier) → Aerospace startup (Space Force SBIR, NASA SBIR — 2 programs commercialized, in flight testing) → Cumulus Labs |

**What's notable**: Veer saw the GPU problem from the **customer side** — running mission-critical ML workloads for Space Force and NASA at an aerospace startup where failure wasn't an option. He experienced firsthand the pain of deploying models on expensive, unreliable GPU infrastructure.

### Founder Relationship

Met as **third graders** in Westford, Massachusetts. Both involved in FIRST Robotics from the same area. Complementary perspectives: Suryaa = GPU provider side, Veer = GPU customer side. *"Have been building together their whole lives."*

---

## Investor Depth

**Y Combinator (W26)** — Standard deal. YC Partner: Jon Xu. No additional investors disclosed.

---

## Hiring Signals & Strategic Direction

2 employees. No public job postings. Building a custom C++ inference runtime with 2 people is extremely ambitious. First engineering hires will be critical — likely systems/CUDA engineers who can contribute to IonAttention.

---

## Conference & Media Presence

- Hacker News Launch (March 2026) — active engagement, mixed reception
- Product Hunt launch (IonRouter)
- Technical blog post on IonAttention (cumulus.blog/ionattention) — high-quality technical writing
- No podcast appearances, conference talks, or press coverage found

---

## Why This is a Non-Consensus Bet

**What the consensus thinks:**

1. Inference is a commodity — vLLM/SGLang are good enough, and hardware-specific optimization is a treadmill that resets every GPU generation
2. Modal ($1.1B valuation, $87M) has won serverless GPU — a 2-person pre-seed can't compete
3. Building a custom C++ inference engine from scratch is insane when open-source alternatives are mature and community-maintained
4. Hardware lock-in to GH200 is a liability — when Vera Rubin ships, the entire engine may need rewriting
5. Self-reported benchmarks without independent validation aren't credible

**What Cumulus believes differently:**

1. Generic inference engines are leaving 40-60% of hardware performance on the table — hardware-specific optimization is the next frontier, not a treadmill, because the fundamental architecture shift (coherent CPU-GPU) persists across GPU generations
2. Modal optimizes for developer experience, not hardware utilization — there's room for a provider that's both developer-friendly AND hardware-optimized
3. Building from scratch is the only way to exploit GH200-specific features (coherent CUDA graphs, eager KV writeback) — these are impossible to retrofit into vLLM/SGLang
4. The GH200 coherent architecture is NVIDIA's future direction (GB200 continues it) — optimizations transfer to next-gen, they don't reset
5. The TensorDock + Palantir + Space Force experience gives them unique insight into both GPU economics and mission-critical reliability requirements

---

## Competitive Landscape

| Company | Type | Cold Start | Funding | Key Differentiator |
|---|---|---|---|---|
| **Cumulus Labs** | Serverless + managed inference | ~2s (GH200) | ~$875K (YC) | Hardware-specific IonAttention engine |
| **Modal** | Serverless GPU | Sub-second | $87M ($1.1B val) | Best DX, GPU memory snapshots |
| **RunPod** | Serverless GPU | Sub-200ms | Undisclosed | FlashBoot, flexible |
| **Together AI** | Managed inference | Always-on | $200M+ | Research + inference (FlashAttention) |
| **Fireworks AI** | Managed inference | Always-on | $200M+ | Speed + reliability, ex-PyTorch team |
| **Groq** | Custom silicon | Always-on | ~$20B (NVIDIA acq) | LPU hardware, extreme speed |
| **Replicate** | Managed inference | 4-11s | $80M+ | Pre-hosted models, easy API |
| **CoreWeave** | GPU cloud | N/A (dedicated) | $12B+ | Specialized GPU infra |

---

## Qualitative Assessment

**Conviction Level: MEDIUM**

**Bull case:**

1. **The technical depth is real.** Coherent CUDA Graphs, Eager KV Writeback, and Phantom-Tile Attention are not marketing buzzwords — they're specific, well-described innovations that exploit GH200 architecture. The IonAttention blog post demonstrates genuine systems engineering depth.
2. **Complementary founder perspectives.** Suryaa (TensorDock/provider side) + Veer (Space Force/customer side) saw the same problem from opposite angles. Childhood friends who've built together for years.
3. **The architecture bet is directionally correct.** NVIDIA's coherent CPU-GPU design (GH200 → GB200 → future) is the future. Optimizing for it now builds compounding expertise.
4. **Inference is the growth vector.** Jensen Huang's "inference inflection point" is real — AI agents drive orders of magnitude more inference than chatbots. The market is massive and growing.
5. **2x throughput on multimodal vs Together AI** is a meaningful advantage if validated.

**Key risks:**

1. **2 people vs Modal ($1.1B, $87M).** The competitive gap in resources is enormous. Modal, Together AI, and Fireworks have large engineering teams and established customer bases.
2. **All benchmarks are self-reported.** No independent validation. HN commenters found pricing isn't universally cheapest. P50 latency is 2x worse than Together AI.
3. **Hardware lock-in.** IonAttention is built for GH200/GB200. A new NVIDIA architecture could require significant rewrites. Competitors using generic engines (vLLM) adapt automatically.
4. **30-day data retention policy** flagged on HN as enterprise-disqualifying. Not resolved.
5. **No public customers.** After launching, no announced users, revenue, or partnerships. The product may be technically impressive but commercially unproven.

**Bottom line**: Cumulus Labs has genuine technical depth — the IonAttention innovations are specific, novel, and well-described. The founder complementarity (provider side + customer side) is compelling. But they're 2 people competing against companies with $87M-$200M+ in funding and established customer bases. The bet is that hardware-specific optimization provides enough performance advantage to overcome the resource gap. If IonAttention's throughput claims hold under independent testing and they can land a few anchor customers, this could become a serious infrastructure company. If the benchmarks don't translate to production or NVIDIA architecture shifts break their optimizations, it's a custom engine for yesterday's hardware.

**Verdict: Real technical innovation from founders with relevant operational experience. The question is whether 2x throughput on specific workloads is enough of a moat against incumbents with 100x more resources. Watch for independent benchmarks and first paying customers — those are the inflection signals.**

*Research compiled: March 2026*
