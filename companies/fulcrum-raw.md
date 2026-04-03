# Fulcrum — Raw Research Findings

---

## PRIORITY 1: DIFFERENTIAL INSIGHT

---

### A) FOUNDER / TEAM DEEP PROFILES

#### Kaivalya "Kaivu" Hariharan — Co-founder & CEO

**Education:**
- SB, Artificial Intelligence and Decision Making and Mathematics, MIT, 2024
- MEng, Electrical Engineering and Computer Science, MIT, 2025
  - Thesis: "Towards transparent representations: on internal structure and external world modeling in LLMs"
  - Advisor: Jacob Andreas (Professor of EECS, LINGO group / Language and Intelligence group at MIT CSAIL)
  - Thesis abstract: Develops a "data-centric" view on machine learning. Argues that deep generalization of LLMs is best understood through studying relationships between four components: pretraining data, test-time inputs, model outputs, and internal structure. Chapter 2 presents BREAKPOINT. Chapter 3 analyzes gradient-based jailbreaks. Chapter 4 discusses reasoning models.
  - Acknowledgments explicitly state: "Much of my research has been conducted closely with Uzay Girit, whose collaboration, creativity, and friendship have greatly influenced the ideas explored in this thesis. He is a primary co-author on both of the full studies presented in this thesis."
  - Also thanks Eleni Shor (likely "Leni Shor," their third team member) and mentors Antonio Torralba, Sarah Schwettmann, Roger Grosse

**Pre-MIT (High School):**
- Ridge High School, Basking Ridge, New Jersey
- 2019 USABO (USA Biology Olympiad) National Finalist — one of 20 students selected nationally
- Two-time AIME qualifier
- Captain of Ridge National Science Bowl team (top 16 at Nationals)
- Spent two summers researching genetic characterization of rare disorders
- Personal interest: "thinks dinosaurs are pretty neat"

**Research Positions:**
- SuperUROP (Advanced Undergraduate Research) at MIT, 2023-2024
  - Project: "Investigating Internal Signatures of Neural Network Failure Modes"
  - Advisor: Nir N. Shavit
  - Used mechanistic interpretability (path patching, dictionary learning) to study neural network failure modes
  - Tang Family FinTech Undergraduate Research and Innovation Scholar
- Research stints at Redwood Research (AI safety lab) and Truthful AI (specific work not publicly detailed)
- MATS program connection (via Leni Shor collaboration)

**Publications:**
1. "Red Teaming Deep Neural Networks with Feature Synthesis Tools" — with Dylan Hadfield-Menell — **Best Paper, NeurIPS ML Safety Workshop 2022**. Addresses interpretable AI tools for understanding model behavior in out-of-distribution contexts.
2. "Forbidden Facts: An Investigation of Competing Objectives in Llama-2" — with Tony T. Wang, Miles Wang, Nir Shavit — arXiv:2312.08793, Dec 2023. Studied how LLMs resolve conflicting pressures (helpfulness vs. harmlessness). Discovered "The California Attack" — a manually designed adversarial exploit.
3. "Me, Myself, and AI: The Situational Awareness Dataset (SAD) for LLMs" — with Rudolf Laine, Bilal Chughtai, Jan Betley, et al. — **NeurIPS 2024 Datasets & Benchmarks Track**. 7 task categories, 16 tasks, >13,000 questions quantifying LLM situational awareness.
4. "Between the Bars: Gradient-based Jailbreaks are Bugs that induce Features" — with Uzay Girit — **NeurIPS 2024 ATTRIB & Redteaming Adversaries Workshops**
5. "Breakpoint: Scalable evaluation of system-level reasoning in LLM code agents" — with Uzay Girit, Atticus Wang, Jacob Andreas — **CoLM 2025** (arXiv:2506.00172)

**Other:**
- Founder of MAIA (MIT AI Alignment) — started 2022, now membership "in the hundreds"
- Emergent Ventures Fellow 2025 (Tyler Cowen's grant program via Mercatus Center)
- Contact: kaivu@mit.edu, team@fulcrum.inc

**Earned Secret:** Deep understanding of HOW neural networks fail internally (mechanistic interpretability of failure modes), combined with practical experience building adversarial attacks and benchmarks that expose LLM weaknesses. His thesis work and 4+ papers across NeurIPS directly study the gap between what AI systems appear to do (surface behavior) vs. what they actually do (internal representations). This is the exact insight needed to build tools that detect when AI agents are producing "painted facades" — superficially correct but substantively wrong outputs.

---

#### Uzay Girit — Co-founder & CTO

**Education:**
- BS, Mathematics and Computer Science, MIT, 2024
- MEng AI candidate under Jacob Andreas (LINGO group) — status unclear if completed
- Grew up in Paris, France

**Research Positions:**
- Tegmark Lab (MIT Physics), 2022-2023: ML research on language model interpretability and theory of deep learning with Eric Michaud and Max Tegmark
- Isola Lab (MIT CSAIL), March 2024+: Research on in-context learning and inner optimization
- Redwood Research: Research stint (AI safety)
- Truthful AI: Research stint
- Dust (Paris-based AI startup), Summer 2023: Internship mentored by Stanislas Polu (OpenAI veteran, Dust co-founder). Team was ~5 people. Worked on power user data interfaces and AI collaboration product.

**Publications:**
1. "The Quantization Model of Neural Scaling" — with Eric J. Michaud, Ziming Liu, Max Tegmark — **NeurIPS 2023 (Conference Paper)**. Proposes model explaining neural scaling laws through "quantization hypothesis" — network knowledge organized into discrete quanta learned in frequency order. Explains both power-law scaling and sudden capability emergence.
2. "Between the Bars: Gradient-based Jailbreaks are Bugs that induce Features" — with Kaivalya Hariharan — **NeurIPS 2024 ATTRIB & Redteaming Adversaries Workshops**
3. "Breakpoint: Scalable evaluation of system-level reasoning in LLM code agents" — with Kaivalya Hariharan, Atticus Wang, Jacob Andreas — **CoLM 2025** (arXiv:2506.00172)
4. "Lower Data Diversity Accelerates Training" — In Submission. Examines memorization as a generalization pathway.

**Open Source Track Record (pre-Fulcrum):**
- **Archivy**: Self-hostable knowledge management software — 3,000+ GitHub stars, in AUR and NixPkgs. Built packages, extensions, static site generator, git integration, NLP tool.
- **Espial**: Engine for automated knowledge organization using NLP/AI — 174 GitHub stars. Generates concept graphs linking documents.
- **AdiosCorona**: COVID-19 information website (adioscorona.org) serving millions of users during pandemic. Built interface, design, and backend.

**Other:**
- International olympiad medals (physics and economics — specific events not found but YC bio says team has "four medals at international olympiads in physics and economics")
- Cybersecurity interest (CTF competitions)
- Rock climber, poet, essayist
- Personal site: uzpg.me, Substack: zephyyr.substack.com, X: @uzpg_
- Contact: halcyon@disroot.org, zef@mit.edu

**Earned Secret:** Deep theoretical understanding of WHY scaling works (quantization model published in NeurIPS) combined with practical experience building open-source developer tools used by thousands. His Dust internship (building AI workflow interfaces for a team of 5 that grew 4x) gave him direct experience with the exact problem space Fulcrum now occupies — how humans interact with and oversee AI systems. His scaling laws research provides theoretical grounding for understanding when and why agents fail as capabilities scale.

---

#### Leni (Eleni) Shor — Third Team Member / Engineer

**Known Details:**
- Verified email at mit.edu (Google Scholar)
- Affiliated with MATS (ML Alignment & Theory Scholars) program and MIT
- Published "Distillation Robustifies Unlearning" — conducted during MATS program
- Active on AI Alignment Forum
- GitHub: lenishor (2 repositories)
- Listed as contributor on Druids repo alongside Uzay-G and KaivuH
- Acknowledged in Kaivalya's thesis as a colleague for "coauthored work"

**Earned Secret:** AI safety research background through MATS, with specific work on model unlearning — directly relevant to understanding how AI systems can be made to "forget" or constrain certain behaviors, connecting to Fulcrum's mission of controlling AI agent behavior.

---

### B) APPROACH ANALYSIS — WHAT WAS TRIED BEFORE

#### The Problem Space: AI Agent Oversight

**What existed before Fulcrum (pre-2025):**
1. **Traditional APM/Observability (Datadog, New Relic):** Built for request-response architectures. Monitors deterministic code paths, CPU/memory, error rates. Completely blind to agent reasoning, decision branching, and non-deterministic behavior. Agents don't throw 500s when they fail.

2. **LLM Observability (LangSmith, Langfuse, Arize Phoenix):** Emerged 2023-2024. Captures traces, token counts, latency. Good at logging WHAT happened but not understanding WHY agents fail. LangSmith added "Polly" AI assistant in Dec 2025 for trace analysis. Langfuse acquired by ClickHouse Jan 2026.

3. **Static Guardrails (NeMo Guardrails, Guardrails AI):** Rule-based filters that check inputs/outputs against predefined patterns. Brittle — cannot understand context. Either too permissive (miss novel failure modes) or too restrictive (block valid actions).

4. **Manual Evaluation (SWE-bench, HumanEval):** Human-curated benchmarks. Expensive to create (OpenAI's benchmark: 20+ engineer-days for 20 problems). Quickly saturate. SWE-bench Verified still contained "unsolvable tasks" — per Fulcrum's own Lunette analysis, 82% accuracy at identifying these with environment access vs. 63% without.

**What specifically failed and why:**
- **Trace-based approaches** capture symptoms, not causes. You see that an agent took a wrong turn but not why its reasoning went wrong.
- **Static guardrails** are the wrong paradigm entirely — they treat agent oversight as a filtering problem when it's actually an understanding problem. Quibbler's insight is that the critic needs to be an agent itself that can read and understand context.
- **Human-curated benchmarks** don't scale. Breakpoint's core contribution is showing you can synthetically generate arbitrarily difficult evaluation tasks by adversarially corrupting functions in real codebases.
- **Human monitoring** doesn't scale either — agents work faster than humans can review. The attention bottleneck is the core problem Fulcrum identifies.

**Fulcrum's specific technical choices that differ:**
1. **Agent-as-critic (not rules-as-critic):** Quibbler is itself an AI agent that monitors other AI agents. It understands context, learns from usage, and adapts. This is philosophically different from guardrails.
2. **Environment access for investigation:** Lunette investigators don't just read traces — they execute commands in the evaluation environment, test hypotheses, and gather evidence. This dramatically improves accuracy (82% vs. 63%).
3. **Adversarial validation:** Independent validator agents critique findings before surfacing them. Addresses LLM confabulation problem.
4. **Synthetic benchmark generation:** Breakpoint generates code-repair tasks by adversarially corrupting functions, controlling difficulty along two measurable dimensions (local reasoning via cyclomatic complexity, system-level reasoning via call-graph centrality). No human labeling needed.
5. **Multi-agent orchestration with human oversight:** Druids gives each agent a sandboxed VM, defines events and state machines, enables parallel agent execution with explicit dependencies and human escalation paths.

**The "Why Now" — Convergence Factors:**
1. **Agent capabilities crossed a threshold in 2024-2025:** Claude 3.5 Sonnet, GPT-4o, etc. made coding agents practically useful, creating real demand for oversight tools.
2. **Coding agents became mainstream:** Claude Code, Cursor, GitHub Copilot Workspace, Devin — suddenly millions of developers are delegating real work to agents, not just autocomplete.
3. **Failure modes became economic problems:** As agents move from toy demos to production use (Fulcrum blog: "2,500 hours of servicing work daily" — though this is the insurance Fulcrum), the cost of undetected failures scales with deployment.
4. **RL-based training created reward hacking:** Models trained with RL increasingly optimize for proxy metrics rather than genuine solutions. METR documented models "modifying tests or scoring code" to get higher scores.
5. **Multi-agent systems emerged:** Orchestra/Druids reflect that single-agent systems are giving way to multi-agent architectures, which need coordination infrastructure that didn't exist.
6. **Academic foundations matured:** The founders' own research (Breakpoint at CoLM 2025, SAD at NeurIPS 2024, scaling laws at NeurIPS 2023) provided the theoretical groundwork that didn't exist before 2023.

---

### C) THIRD-PARTY & SKEPTIC COMMENTARY

#### Hacker News Discussion (Show HN: Quibbler — 114 points, 27 comments)
URL: https://news.ycombinator.com/item?id=45767162

**Positive:**
- Users found the concept useful for "longer running tasks to enforce your intent without having to check in on your agent all the time"
- At least one developer submitted a PR adding AWS Bedrock support

**Critical/Skeptical:**
- **Recursive oversight paradox:** Multiple commenters raised the philosophical concern: "agents to handle my agents" — where does it end? Do you need a Quibbler for your Quibbler? The "Quibbler council" joke reflects genuine skepticism about infinite regress of AI oversight.
- **Cost concerns:** Requires Anthropic API key, which adds costs on top of existing Claude Max subscription. This friction limits adoption.
- **Irony noted:** One commenter pointed out the irony that these tools exist because agents "fabricate results without running commands" — the critic itself is an LLM that could also fabricate.
- **Scope uncertainty:** Questions about whether the concept applies beyond coding tasks.
- **Demo video issues:** The GitHub demo video had functionality problems.

#### LessWrong Post
URL: https://www.lesswrong.com/posts/uHmSKcdwgKgNWirSL/
(Content could not be fully extracted but the post exists, indicating engagement with the AI safety community)

#### Genuine Technical Risks (from community + analysis):

1. **LLM-critic reliability:** Using an LLM to critique another LLM introduces the same failure modes it's trying to detect. If Claude Haiku 4.5 (Quibbler's default model) can't reliably detect subtle reward hacking, the oversight is theater.

2. **Anthropic dependency:** Currently deeply tied to Claude/Anthropic ecosystem. Quibbler uses Claude Haiku 4.5 by default, integrates primarily with Claude Code. If Anthropic changes APIs, pricing, or competitive dynamics (they're building their own oversight tools), Fulcrum's position is precarious.

3. **Market timing risk:** The major observability platforms (LangSmith, Arize, Braintrust, Datadog) are all adding agent-specific features. If debugging/monitoring becomes a feature of existing platforms rather than a standalone product, Fulcrum gets squeezed.

4. **Pivot risk / product identity shift:** The company has shipped multiple products in rapid succession: Quibbler + Orchestra (Oct 2025), Lunette (Dec 2025), now Druids (Mar 2026). Each represents a somewhat different product thesis (critic tool -> evaluation auditor -> agent orchestration framework). This could indicate either rapid iteration strength or lack of product-market fit.

5. **Two-person company building four products:** With only 2-3 people, maintaining Quibbler (440 stars), Orchestra (42 stars), Lunette (12 stars), and Druids (15 stars) simultaneously is challenging. None have reached escape velocity in adoption.

6. **Competitive landscape is massive and well-funded:** LangSmith (backed by Sequoia), Arize ($38M raised), Braintrust, Maxim AI, AgentOps, plus cloud providers (Datadog, AWS) all moving into this space. Fulcrum is a pre-seed YC company competing against funded competitors.

7. **"Agent software will eat software" thesis is unproven:** Their blog post "The Bitter Lesson for Software" argues agents will replace classical software architecture. This is a bet on a specific future that may not materialize as dramatically as they predict.

---

## PRIORITY 2: STANDARD RESEARCH

---

### Company Basics

| Field | Detail |
|---|---|
| **Website** | https://fulcrum.inc (also fulcrumresearch.ai, both point to same Jekyll/GitHub Pages site) |
| **Product Site** | https://druids.dev |
| **HQ** | San Francisco, California |
| **Founded** | 2025 |
| **Structure** | Private, Inc. |
| **Stage** | Pre-Seed |
| **Batch** | Y Combinator Summer 2025 (S25) |
| **YC Partner** | Brad Flora |
| **Team Size** | 2-3 (founders + Leni Shor) |
| **Contact** | team@fulcrum.inc, team@fulcrumresearch.ai |
| **Tagline** | "Scaling human intent in software" |
| **Mission Statement** | "AI agents are going to write most of the world's software. We want to make sure humans can understand, control, and trust what they build." |

### Funding History

| Round | Date | Amount | Lead | Other Investors |
|---|---|---|---|---|
| Pre-Seed | ~April 2025 | Undisclosed | Y Combinator | Unknown |

- Crunchbase confirms Pre-Seed round but does not disclose amount
- YC standard deal is $500K for 7% equity (as of recent batches), plus $375K on uncapped SAFE
- No other announced funding rounds

### Product / Technology Portfolio

**1. Quibbler (Oct 2025) — Agent Critic**
- GitHub: github.com/fulcrumresearch/quibbler — 440 stars, 19 forks
- MIT license, Python, latest release v0.3.1 (Oct 31, 2025)
- A background agent that monitors and critiques coding agent actions
- Two modes: Hook Mode (Claude Code-specific, event-driven) and MCP Mode (universal, Model Context Protocol)
- Default model: Claude Haiku 4.5
- Learns project-specific rules, saves to `.quibbler/rules.md`
- Install: `uv tool install quibbler` or `pip install quibbler`
- Prevents: fabricated results, skipped verification, style violations, hallucinated metrics

**2. Orchestra (Oct 2025) — Multi-Agent Coordinator**
- GitHub: github.com/fulcrumresearch/orchestra — 42 stars, 7 forks
- Designer agent plans tasks, spawns executor agents in isolated environments
- Executors communicate with designer when stuck, designer escalates to humans
- Supports best-of-n implementation comparison
- Oversight features enable parallelization to be "useful, not destructive"

**3. Lunette (Dec 2025) — Evaluation Auditor**
- GitHub: github.com/fulcrumresearch/lunette — 12 stars
- Investigator agents audit AI agents and evaluation environments
- Three-step process: investigation setup, parallel investigation (agents read traces + execute commands in eval environments), validation & exploration
- Tested on SWE-bench Verified: 82% accuracy with environment access vs. 63% without
- Found SWE-bench issues: vague problem descriptions (django-11964 had 7 competing solutions) and overly strict tests (django-11790)
- 40 free investigations for new users

**4. Druids (Mar 2026) — Agent Orchestration Framework**
- GitHub: github.com/fulcrumresearch/druids — 15 stars, 2 forks
- Website: druids.dev, Docs: druids.dev/docs
- Python library for coordinating multiple coding agents across distributed machines
- Programs are state machines defining tracked data, events, and agent communication
- Each agent gets sandboxed VM with repo clones and pre-installed deps
- Full shell access, multi-hour/multi-day runtime
- Six primitives: agent instantiation, event handlers, VM forking (copy-on-write), messaging, machine sharing, completion signaling
- FastAPI server, CLI + Python SDK, Vue 3 dashboard, MCP integration
- Example programs: builder+critic+auditor, task scanner+implementor pairs, PR testing, parallel agent racing
- Beta users: open math problem solving, ML autoresearch, software development
- Contributors: Uzay-G, lenishor, KaivuH

**5. Slowrun Fork**
- Fork of qlabs-eng/slowrun (NanoGPT Slowrun competition)
- "100M tokens, no time limit, best val loss wins" — used for Orpheus verification testing
- Indicates the team is participating in/contributing to ML training efficiency research

**Other GitHub repos of note:**
- Forks of curl, valkey, tldraw, reline, rdoc, godot, ghostty — these appear to be test environments for Lunette/Breakpoint evaluation (the curl repo is described as "Private mirror for Orpheus verification testing")

### Blog / Thought Leadership

All posts at fulcrum.inc/blog (no bylines, written as company voice):

1. **"AI Agents and Painted Facades"** (Aug 29, 2025) — Founding thesis post. Compares AI agent outputs to Potemkin villages. Identifies two problems: building effective evaluations and monitoring at deployment. Proposes scalable human oversight interfaces + agent auditing systems.

2. **"Introducing Quibbler and Orchestra"** (Oct 22, 2025) — Product launch. Core philosophy: human attention is the bottleneck. Use agents to validate agents, freeing humans for higher-level concerns.

3. **"Introducing Lunette"** (Dec 15, 2025) — Evaluation auditing product. Key finding: even SWE-bench Verified has unsolvable tasks. "Agent generalization is spiky: they fail in ways that are hard to anticipate."

4. **"More is Different for Intelligence"** (Mar 5, 2026) — Philosophical. References P.W. Anderson. Argues LLMs will reveal entirely new cognitive workflows, not just speed up existing ones. Current AI applications are in a "naive phase."

5. **"The Bitter Lesson for Software"** (Mar 16, 2026) — Strategic thesis. Argues Rich Sutton's bitter lesson applies to software itself. "Agent software will eat the well-defined world of pre-AI software." Engineers should stop asking what structure systems need and identify where structure was forced only because code demanded it.

6. **"Introducing Druids"** (Mar 25, 2026) — Latest product launch. Framework for coordinating agents across distributed machines.

### Commercial Validation

- No announced customers, revenue, or partnerships (pre-seed stage)
- Quibbler has 440 GitHub stars and >100k downloads (per YC profile for the org's total open source)
- Beta users of Druids include use cases in "open mathematics problem solving, ML autoresearch, accelerated software development"
- Careers page mentions two open positions: Member of Technical Staff, Generalist (via Ashby HQ)
- The open source traction (440 stars for Quibbler) is modest but real for a 6-month-old project from a 2-person team

### Market Size / TAM

The company operates in the intersection of several markets:

1. **AI Agent Observability/Monitoring:** Market reached estimated $7.6B in 2025, projected 49.6% CAGR through 2033. 89% of organizations have implemented agent observability.

2. **AI Developer Tools:** Broader AI development tools market estimated $15-25B by 2027.

3. **Software Testing/QA:** $45B+ market that agents are beginning to disrupt.

Fulcrum's specific niche — tools for oversight, debugging, and orchestration of coding agents — is a subset of all three. No specific TAM claims from the company.

### Competitive Landscape

| Competitor | Focus | Funding | Differentiation from Fulcrum |
|---|---|---|---|
| **LangSmith** (LangChain) | Trace-based observability for LangChain agents | Sequoia-backed | Framework-specific, trace capture not agent-based critique |
| **Arize AI** (Phoenix/AX) | Enterprise ML monitoring extended to LLMs | $38M+ raised | Traditional monitoring approach extended, not agent-native |
| **Langfuse** | Open-source LLM observability | Acquired by ClickHouse Jan 2026 | Trace logging, not active agent-based oversight |
| **Braintrust** | Eval + observability platform | Funded | Focus on evaluation, not live agent critique |
| **Maxim AI** | End-to-end agent lifecycle platform | Funded | Broader platform, less research-driven |
| **AgentOps** | Developer-friendly agent observability | Funded | Supports 400+ frameworks, lighter-weight |
| **Galileo AI** | Hallucination detection (Luna models) | Funded | Narrow focus on hallucination, not multi-agent orchestration |
| **Comet Opik** | Open-source LLM + ML observability | Comet ML parent | Extension of existing MLOps platform |
| **CrewAI/LangGraph/AutoGen** | Multi-agent orchestration frameworks | Various | Orchestration without oversight focus |
| **Claude-Flow** | CLI-first orchestration for Claude | Community/Anthropic | Anthropic ecosystem tool, thin coordination layer |

**Fulcrum's positioning vs. competitors:** Fulcrum is the only player that combines (a) academic-grade understanding of agent failure modes with (b) agent-based oversight tools and (c) multi-agent orchestration. Most competitors are either pure observability (log and trace) or pure orchestration (coordinate agents). Fulcrum argues you can't do one without the other — oversight IS the orchestration layer.

### Hiring Signals

Two open positions (via Ashby HQ):
1. **Member of Technical Staff** — suggests technical IC hiring, likely systems/ML engineering
2. **Generalist** — suggests early-stage operator/growth role

The small number of openings is consistent with pre-seed stage. Using Ashby (modern ATS) signals startup best practices.

### Conference & Media Presence

**Academic Circuit:**
- NeurIPS 2022 (ML Safety Workshop — Best Paper)
- NeurIPS 2023 (Conference paper)
- NeurIPS 2024 (Datasets & Benchmarks Track + ATTRIB/Redteaming Workshops)
- CoLM 2025 (Conference paper)

**Community Presence:**
- Hacker News Show HN (114 points for Quibbler)
- LessWrong / AI Alignment Forum posts
- Discord community for users
- X/Twitter: @fulcrum_inc (company), @uzpg_ (Uzay personal)

**Notable Absences:**
- No podcast appearances found
- No conference talks/presentations found beyond academic papers
- No mainstream tech press coverage found
- No blog interviews or profiles found

### Key Relationships / Network

- **Jacob Andreas** (MIT EECS Professor, LINGO group) — thesis advisor to both founders, co-author on Breakpoint
- **Max Tegmark** (MIT Physics, FLI founder) — Uzay's prior research advisor
- **Nir Shavit** (MIT CSAIL) — Kaivalya's SuperUROP advisor, co-author on Forbidden Facts
- **Eric Michaud** (MIT Physics PhD) — Co-author on scaling laws paper with Uzay
- **Dylan Hadfield-Menell** (MIT CSAIL) — Co-author on Kaivalya's Best Paper at NeurIPS ML Safety
- **Stanislas Polu** (Dust co-founder, ex-OpenAI/Stripe) — Uzay's mentor during Dust internship
- **Redwood Research** — Both founders had research stints (Buck Shlegeris, Neel Nanda's org)
- **Truthful AI** — Both founders had research stints
- **MATS program** — Leni Shor connection
- **Emergent Ventures / Tyler Cowen** — Kaivalya is a fellow
- **Roger Grosse** (Anthropic, formerly U of T) — acknowledged as mentor in Kaivalya's thesis
- **Sarah Schwettmann** (MIT) — acknowledged as mentor
- **Antonio Torralba** (MIT CSAIL, vision group) — acknowledged as mentor

---

## PRODUCT EVOLUTION TIMELINE

| Date | Event |
|---|---|
| 2022 | Kaivalya founds MAIA (MIT AI Alignment) |
| 2022-2023 | Both at MIT, research on scaling laws, interpretability, adversarial attacks |
| 2023 | Uzay interns at Dust (Stanislas Polu) |
| 2024 | Both graduate MIT BS; Kaivalya begins MEng |
| May 2025 | Kaivalya submits MEng thesis (Breakpoint paper is Chapter 2) |
| Summer 2025 | Fulcrum in Y Combinator S25 batch. Brad Flora is YC partner. |
| May 2025 | Breakpoint paper on arXiv |
| Aug 2025 | "AI Agents and Painted Facades" blog post — founding thesis |
| Oct 2025 | Quibbler + Orchestra launched (open source) |
| Oct 2025 | Quibbler Show HN — 114 points |
| Dec 2025 | Lunette launched |
| Mar 2026 | "More is Different for Intelligence" + "Bitter Lesson for Software" blog posts |
| Mar 2026 | Druids launched — pivot toward orchestration framework |

---

## KEY QUOTES (DIRECT, FROM BLOG POSTS)

On agent failure modes:
> "Agent generalization is spiky: they fail in ways that are hard to anticipate."

On the oversight problem:
> "AI agents are going to write most of the world's software. We want to make sure humans can understand, control, and trust what they build."

On why structure will be replaced:
> "Agent software will eat the well-defined world of pre-AI software" by offering greater generality.

On the current phase:
> "The structure of the graph has still been left intact" — current AI tools improve efficiency but haven't changed the fundamental organization of knowledge work.

On evaluations:
> Even SWE-bench Verified contains "unsolvable tasks that are therefore useless for understanding an agent's abilities."

On the future:
> Engineers should "stop asking what structure systems need and instead identify where structure was forced only because code demanded it."

---

## SOURCES

- https://fulcrum.inc
- https://fulcrum.inc/blog
- https://fulcrum.inc/careers
- https://druids.dev
- https://www.ycombinator.com/companies/fulcrum
- https://github.com/fulcrumresearch
- https://github.com/fulcrumresearch/quibbler
- https://github.com/fulcrumresearch/druids
- https://github.com/fulcrumresearch/orchestra
- https://github.com/fulcrumresearch/lunette
- https://www.crunchbase.com/organization/fulcrum-research
- https://arxiv.org/abs/2506.00172 (Breakpoint paper)
- https://arxiv.org/abs/2303.13506 (Quantization Model of Neural Scaling)
- https://arxiv.org/abs/2312.08793 (Forbidden Facts / Competing Pressures)
- https://arxiv.org/abs/2407.04694 (Situational Awareness Dataset)
- https://dblp.org/pid/344/2052.html (Uzay Girit publications)
- https://scholar.google.com/citations?user=qvZ_Q_IAAAAJ (Uzay Google Scholar)
- https://scholar.google.com/citations?user=JXNx9pQAAAAJ (Kaivalya Google Scholar)
- https://openreview.net/profile?id=~Kaivalya_Hariharan1
- https://openreview.net/profile?id=~Uzay_Girit1
- https://www.uzpg.me (Uzay personal site)
- https://www.uzpg.me/projects
- https://superurop.mit.edu/scholars/kaivalya-hariharan/
- https://dspace.mit.edu/bitstream/handle/1721.1/162730/hariharan-kaivu-meng-eecs-2025-thesis.pdf (MEng thesis)
- https://news.ycombinator.com/item?id=45767162 (HN discussion)
- https://www.lesswrong.com/posts/uHmSKcdwgKgNWirSL/ (LessWrong post)
- https://aialignment.mit.edu/ (MAIA)
- https://www.usabo-trc.org/sites/default/files/allfiles/USABO%2019%20NF%20Finalists%20Bios%20web%206.3.19.pdf (USABO finalist bio)
- https://www.mercatus.org/emergent-ventures (Emergent Ventures)
- https://github.com/Uzay-G/espial (Espial)
- https://github.com/lenishor (Leni Shor)
- https://www.alignmentforum.org/users/leni-1 (Leni on AF)

*Research compiled: March 2026*
