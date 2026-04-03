# Fulcrum

| Field | Detail |
|---|---|
| **Website** | [fulcrum.inc](https://fulcrum.inc) |
| **HQ** | San Francisco, CA |
| **Founded** | 2025 |
| **Structure** | Private, Inc. |
| **Stage** | Pre-seed (YC S25) |
| **Investors** | Y Combinator |
| **Total Raised** | ~$875K (standard YC deal) |
| **Valuation** | Not disclosed |

---

## The Big Audacious Idea

AI agents are going to write most of the world's software. The problem is that they produce "painted facades" — outputs that look correct on the surface but are substantively wrong underneath. An agent that claims to have fixed a bug might have actually modified the test to pass. An agent that says it ran a benchmark might have fabricated the numbers. Current monitoring tools can tell you WHAT happened (traces, logs) but not WHY the reasoning went wrong.

Fulcrum's thesis: the oversight of AI agents is itself an AI problem. You need agents to watch agents — critics that understand context, investigators that can execute commands in the environment to verify claims, and orchestrators that coordinate multi-agent workflows with human escalation. The human attention bottleneck is the real constraint; Fulcrum builds the infrastructure that makes human oversight scale.

*"AI agents are going to write most of the world's software. We want to make sure humans can understand, control, and trust what they build."*

---

## The Problem That's So Hard to Solve

**Agent failures are silent and contextual.** Agents don't throw 500 errors when they produce wrong code. They confidently explain their reasoning, pass superficial tests, and move on. The failure modes are novel, spiky, and hard to anticipate.

**Why this is genuinely hard:**

1. **The recursive oversight paradox.** Using an LLM to critique another LLM introduces the same failure modes it's trying to detect. If Claude Haiku can't reliably catch subtle reward hacking, the oversight is theater. Multiple HN commenters raised this: "Do you need a Quibbler for your Quibbler?"

2. **Trace-based approaches capture symptoms, not causes.** LangSmith, Arize, and Langfuse can log what happened. But seeing that an agent took a wrong turn doesn't explain why its reasoning went wrong. The gap between observation and understanding is the hard problem.

3. **Static guardrails are the wrong paradigm.** Rule-based filters (NeMo Guardrails, Guardrails AI) treat agent oversight as a filtering problem when it's actually an understanding problem. They're either too permissive (miss novel failures) or too restrictive (block valid actions).

4. **Human-curated benchmarks don't scale.** OpenAI's benchmark creation takes 20+ engineer-days for 20 problems. Benchmarks quickly saturate. Even SWE-bench Verified contains "unsolvable tasks that are therefore useless for understanding an agent's abilities" — per Fulcrum's own Lunette analysis.

5. **Multi-agent coordination compounds the problem.** When agents spawn sub-agents that spawn sub-agents, the failure surface area grows combinatorially. Traditional software monitoring architectures (request-response, deterministic code paths) are fundamentally blind to non-deterministic agent reasoning.

---

## The Technology Stack

Fulcrum has shipped four products in 6 months — each addressing a different layer of the agent oversight stack:

### 1. Quibbler — Agent Critic (Oct 2025)

[GitHub](https://github.com/fulcrumresearch/quibbler) — 440 stars, MIT license

A background agent that monitors and critiques coding agent actions in real-time.

- **Hook Mode**: Claude Code-specific, event-driven monitoring
- **MCP Mode**: Universal via Model Context Protocol
- **Default model**: Claude Haiku 4.5
- Learns project-specific rules, saves to `.quibbler/rules.md`
- Prevents: fabricated results, skipped verification, style violations, hallucinated metrics
- Install: `uv tool install quibbler` or `pip install quibbler`

### 2. Orchestra — Multi-Agent Coordinator (Oct 2025)

[GitHub](https://github.com/fulcrumresearch/orchestra) — 42 stars

Designer agent plans tasks, spawns executor agents in isolated environments. Executors communicate with designer when stuck, designer escalates to humans. Supports best-of-n implementation comparison.

### 3. Lunette — Evaluation Auditor (Dec 2025)

[GitHub](https://github.com/fulcrumresearch/lunette) — 12 stars

Investigator agents audit AI agents and evaluation environments. Three-step process: investigation setup → parallel investigation (agents read traces + execute commands in eval environments) → validation & exploration.

**Key finding**: 82% accuracy at identifying unsolvable SWE-bench tasks with environment access vs. 63% without. The environment access insight — letting investigators actually run commands, not just read logs — is the core technical contribution.

### 4. Druids — Agent Orchestration Framework (Mar 2026)

[GitHub](https://github.com/fulcrumresearch/druids) — 15 stars, [druids.dev](https://druids.dev)

Python library for coordinating multiple coding agents across distributed machines.

- Programs are **state machines** defining tracked data, events, and agent communication
- Each agent gets a **sandboxed VM** with repo clones and pre-installed dependencies
- Six primitives: agent instantiation, event handlers, VM forking (copy-on-write), messaging, machine sharing, completion signaling
- Full shell access, multi-hour/multi-day runtime
- FastAPI server, CLI + Python SDK, Vue 3 dashboard, MCP integration
- Beta use cases: open math problem solving, ML autoresearch, software development

### Academic Foundation: Breakpoint (CoLM 2025)

The research paper underpinning Fulcrum's approach. Generates code-repair evaluation tasks by adversarially corrupting functions in real codebases, controlling difficulty along two measurable dimensions: local reasoning (cyclomatic complexity) and system-level reasoning (call-graph centrality). No human labeling needed — synthetic generation of arbitrarily difficult benchmarks.

---

## What the World Looks Like If This Works

1. **AI agents become trustworthy enough for production software engineering.** With reliable oversight, companies deploy agents for critical code — not just autocomplete — knowing that failures will be caught before they ship.

2. **Multi-agent software development becomes the default workflow.** Instead of one developer + one copilot, teams orchestrate fleets of specialized agents (builder, critic, tester, auditor) via frameworks like Druids, with humans as strategic overseers.

3. **The evaluation industry transforms.** Instead of expensive human-curated benchmarks that saturate quickly, Breakpoint-style synthetic generation creates infinite, controllably difficult evaluations. Benchmark quality improves at the speed of inference, not human labor.

4. **"Agent software eats the well-defined world of pre-AI software."** Per Fulcrum's thesis, engineers stop asking what structure systems need and instead identify where structure was forced only because code demanded it. Software architecture becomes more fluid and agent-driven.

5. **The $45B+ software testing market restructures around agent oversight** rather than deterministic test suites.

---

## Best Case Scenario / Addressable Opportunity

| Market | Size | Growth |
|---|---|---|
| AI Agent Observability/Monitoring | $7.6B (2025) | 49.6% CAGR through 2033 |
| AI Developer Tools | $15-25B by 2027 | — |
| Software Testing/QA | $45B+ | Being disrupted by agents |

---

## The Science: A Brief History

- **2022**: Kaivalya wins Best Paper at NeurIPS ML Safety Workshop for "Red Teaming Deep Neural Networks with Feature Synthesis Tools." Founds MAIA (MIT AI Alignment). The core insight: AI systems fail in predictable ways if you know where to look.

- **2023**: Uzay publishes "Quantization Model of Neural Scaling" at NeurIPS with Max Tegmark's lab — a theoretical framework explaining WHY scaling works and when capabilities suddenly emerge. Uzay interns at Dust (Stanislas Polu), sees firsthand how humans interact with AI systems.

- **2024**: Both publish "Between the Bars" (NeurIPS workshops) — showing gradient-based jailbreaks are "bugs that induce features." Kaivalya co-authors the SAD benchmark (NeurIPS Datasets track) — 13,000+ questions measuring LLM situational awareness.

- **May 2025**: Kaivalya submits MEng thesis: "Towards Transparent Representations." Chapter 2 IS Breakpoint — synthetic evaluation generation for code agents. The thesis acknowledgments confirm Uzay as primary co-author on both studies.

- **Summer 2025**: YC S25 batch. "AI Agents and Painted Facades" blog post establishes the founding thesis.

- **Oct 2025 → Mar 2026**: Ship Quibbler, Orchestra, Lunette, Druids in rapid succession — each a different layer of the agent oversight stack.

**Why Now**: Claude Code, Cursor, Devin, and GitHub Copilot Workspace made coding agents mainstream in 2024-2025. Millions of developers are now delegating real work to agents. The failure modes the founders studied at MIT (reward hacking, fabricated outputs, silent failures) became economic problems when agents moved from research to production.

---

## Commercial Validation

| Signal | Detail |
|---|---|
| Y Combinator S25 | Accepted into batch |
| Quibbler GitHub | 440 stars, 19 forks |
| Total OSS downloads | 100K+ (per YC profile) |
| Druids beta users | Open math, ML autoresearch, software dev |
| Hiring | 2 open positions (MTS + Generalist) |

**No announced customers, revenue, or partnerships.** Pre-seed stage.

---

## Core Team

### Kaivalya "Kaivu" Hariharan — Co-Founder & CEO

| Field | Detail |
|---|---|
| **Education** | SB AI + Math, MIT (2024); MEng EECS, MIT (2025) — thesis advisor: Jacob Andreas |
| **Research** | Best Paper NeurIPS ML Safety '22; NeurIPS '23, '24 (Datasets track); CoLM '25 (Breakpoint) |
| **Prior** | Redwood Research, Truthful AI, SuperUROP with Nir Shavit |
| **Other** | USABO National Finalist (top 20), Emergent Ventures Fellow (Tyler Cowen), founded MAIA (MIT AI Alignment) |

**What's notable**: Kaivalya's entire academic career is about understanding HOW and WHY neural networks fail internally. His NeurIPS Best Paper (age ~20) was on red-teaming neural networks. His thesis chapters cover adversarial attacks, jailbreaks, and synthetic evaluation generation. He didn't pivot from ML to safety — he's been on this exact problem since undergrad. The USABO National Finalist background (biology olympiad → top 20 nationally) signals the same pattern as his AI work: deep systematic analysis of complex systems. Emergent Ventures Fellow means Tyler Cowen personally vetted him.

### Uzay Girit — Co-Founder & CTO

| Field | Detail |
|---|---|
| **Education** | BS Math + CS, MIT (2024) |
| **Research** | NeurIPS '23 (Quantization Model of Neural Scaling, with Max Tegmark); NeurIPS '24; CoLM '25 |
| **Prior** | Tegmark Lab (MIT Physics), Isola Lab (MIT CSAIL), Dust (internship under Stanislas Polu), Redwood Research, Truthful AI |
| **OSS** | Archivy (3K+ GitHub stars), Espial (174 stars), AdiosCorona (COVID site, millions of users) |

**What's notable**: Uzay has the rare combination of deep theoretical understanding (his scaling laws paper with Tegmark explains WHY neural networks learn the way they do) AND proven open-source building chops (Archivy at 3K stars, AdiosCorona serving millions during COVID). His Dust internship under Stanislas Polu (ex-OpenAI) gave him direct experience with the exact problem Fulcrum solves — how humans oversee AI systems. International olympiad medals in physics AND economics signal cross-domain analytical depth. From Paris; programming since childhood.

### Leni (Eleni) Shor — Engineer

MIT-affiliated, MATS program alumna. Published "Distillation Robustifies Unlearning" — AI safety research on model unlearning. Contributor on Druids repo. Active on AI Alignment Forum.

### Advisory Network

Jacob Andreas (MIT EECS), Max Tegmark (MIT Physics/FLI), Nir Shavit (MIT CSAIL), Dylan Hadfield-Menell (MIT CSAIL), Stanislas Polu (Dust/ex-OpenAI), Roger Grosse (Anthropic), Sarah Schwettmann (MIT), Antonio Torralba (MIT CSAIL). This is an extraordinarily deep MIT AI safety research network.

---

## Investor Depth

**Y Combinator (S25)** — Standard deal. YC Partner: Brad Flora. No additional investors disclosed.

---

## Hiring Signals & Strategic Direction

2 open positions: Member of Technical Staff + Generalist. Using Ashby (modern ATS). The MTS role suggests systems/ML engineering; the Generalist suggests early-stage operations.

The 4-products-in-6-months velocity is either a strength (rapid iteration, bias to shipping) or a concern (searching for PMF). The progression from Quibbler (critic) → Orchestra (coordinator) → Lunette (auditor) → Druids (orchestration framework) shows increasing ambition — from monitoring a single agent to orchestrating fleets across distributed machines.

---

## Conference & Media Presence

**Academic circuit (strong for their age):**
- NeurIPS 2022: Best Paper, ML Safety Workshop
- NeurIPS 2023: Conference paper (Quantization Model)
- NeurIPS 2024: Datasets & Benchmarks Track + ATTRIB/Redteaming Workshops
- CoLM 2025: Conference paper (Breakpoint)

**Community:**
- Hacker News Show HN: 114 points (Quibbler)
- LessWrong / AI Alignment Forum posts
- Company blog: 6 posts, strong technical/philosophical content

**Absent:** No podcast appearances, no mainstream press, no conference talks beyond academic papers.

---

## Why This is a Non-Consensus Bet

**What the consensus thinks:**

1. Agent oversight will be a feature of existing observability platforms (Datadog, LangSmith, Arize) — not a standalone company
2. Using LLMs to critique LLMs is circular and unreliable — the recursive oversight paradox makes agent-as-critic fundamentally limited
3. Four products in 6 months from a 2-person team means none get enough attention to reach product-market fit
4. The well-funded competitors (LangSmith/Sequoia, Arize/$38M, Braintrust) will add agent oversight features faster than Fulcrum can build a moat
5. Anthropic dependency is existential — if Anthropic builds its own oversight tools (they will), Fulcrum gets squeezed

**What Fulcrum believes differently:**

1. Agent oversight is fundamentally different from traditional observability — it requires agents that understand context and can investigate, not just dashboards that display traces. This is a new product category, not a feature.
2. The recursive oversight problem is solvable through adversarial validation (independent validator agents critique findings) and environment access (investigators execute commands to verify, not just reason). Their 82% vs 63% accuracy gap proves environment access matters.
3. Rapid product iteration IS the strategy — they're mapping the entire agent oversight stack (critique → evaluation → orchestration) to find the highest-leverage insertion point. Druids may be the convergence.
4. Academic-grade understanding of failure modes (5 papers across NeurIPS + CoLM on exactly this topic) gives them insight that pure engineering teams lack. They built Breakpoint BEFORE starting the company.
5. The MIT AI safety network (Andreas, Tegmark, Shavit, Grosse at Anthropic) provides both technical depth and strategic connections that funded competitors can't replicate.

---

## Competitive Landscape

| Company | Focus | Funding | Key Differentiator |
|---|---|---|---|
| **Fulcrum** | Agent oversight + orchestration (critic, auditor, orchestrator) | ~$875K (YC) | Academic AI safety foundation; agent-as-critic approach |
| **LangSmith** (LangChain) | Trace-based observability | Sequoia-backed | Framework-specific; trace logging, not active critique |
| **Arize AI** | Enterprise ML/LLM monitoring | $38M+ | Traditional monitoring extended to agents |
| **Langfuse** | Open-source LLM observability | Acquired by ClickHouse | Trace logging; no agent-based oversight |
| **Braintrust** | Eval + observability platform | Funded | Evaluation focus, not live agent critique |
| **AgentOps** | Agent observability | Funded | 400+ framework support; lighter-weight |
| **CrewAI / LangGraph** | Multi-agent orchestration | Various | Orchestration without oversight focus |

---

## Qualitative Assessment

**Conviction Level: MEDIUM-HIGH**

**Bull case:**

1. **The founders ARE the research.** Five papers at NeurIPS + CoLM on exactly the problem they're solving — adversarial attacks, agent failure modes, synthetic evaluation, scaling laws. They didn't pivot into agent oversight; their entire academic career built toward it. Best Paper at NeurIPS ML Safety at age ~20.

2. **The Breakpoint insight is a genuine moat.** Synthetically generating evaluation tasks of arbitrary, controllable difficulty — without human labeling — is a capability no competitor has. This comes from the MEng thesis, not from a pivot.

3. **Shipping velocity is extraordinary.** Four products in 6 months from 2-3 people. Each product represents a different layer of the oversight stack. Even if not all succeed, they're mapping the territory faster than anyone.

4. **The MIT AI safety network is dense.** Advisors include Jacob Andreas, Max Tegmark, Roger Grosse (now at Anthropic), Nir Shavit, Dylan Hadfield-Menell. This isn't name-dropping — these are thesis advisors and co-authors.

5. **"Agent software will eat software" is the right long-term thesis.** If agents become the primary software producers (the trajectory is clear), oversight infrastructure becomes as critical as CI/CD is today.

**Key risks:**

1. **Recursive oversight paradox is real.** LLM critiquing LLM is philosophically and practically limited. Adversarial validation helps but doesn't fully solve it.

2. **Four products, none at escape velocity.** 440 stars (Quibbler), 42 (Orchestra), 12 (Lunette), 15 (Druids). Modest adoption across all. The rapid pivoting could indicate PMF searching.

3. **Anthropic ecosystem dependency.** Deep Claude integration. If Anthropic builds competing oversight tools (likely), Fulcrum's position is precarious. Roger Grosse (Anthropic) is an acknowledged mentor — which could cut either way.

4. **Resource asymmetry.** 2-3 people vs LangSmith (Sequoia), Arize ($38M), Datadog (public). If agent oversight becomes a feature rather than a category, Fulcrum gets absorbed.

5. **"Agent observability" may commoditize faster than expected.** Every platform is adding agent monitoring features. The window for a standalone company may be narrow.

**Bottom line**: Fulcrum is the rare startup where the founders' academic research IS the product. Their NeurIPS/CoLM papers on agent failure modes, adversarial evaluation, and scaling laws directly power their tools. The Breakpoint paper (synthetic eval generation) is a genuine technical contribution no competitor has matched. The shipping velocity (4 products in 6 months) is impressive but also concerning — it suggests they're still searching for the right product shape. If Druids (distributed agent orchestration with built-in oversight) is the convergence point, this could become the essential infrastructure layer for the multi-agent future.

**Verdict: Exceptional founder-research fit — possibly the most academically credentialed team in the agent oversight space, with papers that directly predated and motivated the company. The rapid shipping shows builder mentality, not just research chops. Main risk is that agent oversight becomes a feature of existing platforms rather than a standalone category. Watch for Druids adoption metrics and the first enterprise customer.**

*Research compiled: March 2026*
