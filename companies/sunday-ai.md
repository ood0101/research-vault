# Sunday Robotics

| Field | Detail |
|---|---|
| **Website** | [sunday.ai](https://www.sunday.ai) |
| **HQ** | Redwood City, CA (engineering) / Mountain View, CA (manufacturing) |
| **Founded** | April 2024 |
| **Structure** | Private C-Corp |
| **Stage** | Series B (unicorn) |
| **Lead Investors** | Coatue (Series B), Benchmark (Seed) |
| **Other Investors** | Bain Capital Ventures, Fidelity, Tiger Global, Conviction, Xtal Ventures |
| **Total Raised** | $200M |
| **Valuation** | $1.15B |

---

## The Big Audacious Idea

Put a robot in every home — not as a novelty, but as a household member that handles the drudgery: dishes, laundry, table clearing, tidying, espresso. Sunday's robot Memo is a wheeled humanoid trained on 10 million episodes of real household manipulation data, collected not by PhD students in labs but by 2,000+ "Memory Developers" using $200 wearable gloves in their actual homes.

The core insight: every prior home robot failed because it couldn't manipulate objects in messy, unstructured environments. Industrial robots work in controlled factories. Research robots work in pristine labs. Homes are none of these things — they're chaos. The only way to train a robot for domestic chaos is to collect data IN domestic chaos, at massive scale, with hardware that exactly matches the robot's own hands.

Tony Zhao (CEO): *"If the robot is cheap, safe, and capable, everyone will want our robot... more than one billion robots in people's homes within the decade."*

*"Data has always been the biggest bottleneck in robotics. We built the only pipeline that turns the complexity of real-world homes into autonomous intelligence at scale."*

---

## The Problem That's So Hard to Solve

**Every multipurpose home robot has failed.** Jibo ($73M, shut down). Kuri (Mayfield Robotics, shut down). Anki (bankrupt). Amazon Astro (effectively shelved). The only commercially successful home robot is the Roomba — and it does exactly one thing. The category has a 100% failure rate for general-purpose devices.

**Why this is genuinely hard:**

1. **Homes are maximally unstructured.** Every home is different — different layouts, furniture, objects, lighting, surfaces. A robot trained in one kitchen encounters thousands of variations in others. Out-of-distribution failures arise "abruptly and without clear warning."

2. **Manipulation requires precision in chaos.** Picking up a wine glass without breaking it, folding socks of different sizes, loading a dishwasher with plates at various angles — these tasks require millimeter-level precision with objects that deform, slip, and break. Industrial robots solve this with rigid fixtures; home robots have no such luxury.

3. **The data problem is 1,000,000x worse than language.** Eric Vishria (Benchmark): *"We have about one-millionth of the data we need."* There's no internet-scale corpus of robot manipulation data. Every episode must be captured in the physical world.

4. **Teleoperation doesn't scale.** Traditional robot data collection requires PhD operators using expensive rigs ($50K+) in labs. VR teleoperation (Tesla's approach) causes operator fatigue — hands go numb, movements are unnatural. Neither produces the diversity of data needed for home deployment.

5. **Humans are unpredictable.** A robot tested with engineers behaves differently around untrained families, children, pets. Safety around 77kg of moving metal in a home with toddlers is a non-trivial liability challenge.

6. **Speed matters for consumer tolerance.** Memo operates at ~50% of human pace. A 10-minute human task takes 20 minutes. Will consumers pay $10K for a robot that's half as fast as they are?

---

## The Technology Stack

### Memo — The Robot

| Spec | Detail |
|---|---|
| **Height** | 1.7m (5'7") |
| **Weight** | 77 kg |
| **Form factor** | Torso-style humanoid on wheeled base (deliberate: cheaper, safer, more reliable than legs) |
| **Arms** | Two multi-DoF arms |
| **Hands** | Three-pronged gripper (simplified from five fingers — fingers typically work together) |
| **Reach** | Floor level to ~2.1m (7 ft) via raising/lowering central column |
| **Cameras** | 360-degree head camera + two end-effector cameras |
| **Speed** | ~50% of human pace |
| **Safety** | Soft silicone shell, no sharp corners, compliant control, passive stability (won't fall if powered down) |
| **Target price** | Under $10,000 retail |

### ACT-1 — Foundation Model

The first foundation model combining long-horizon manipulation + map-conditioned navigation in a single end-to-end model.

- **Training data**: ~10M episodes from 500+ real homes via Skill Capture Gloves
- **3D map conditioning**: Model learns to interpret home maps rather than memorize specific environments — enables zero-shot deployment in new homes
- **Physics-aware simulations**: Fabric/liquid prediction for deformable object handling
- **Skill Transform**: 90% success rate converting human glove data to robot-executable actions
- **Cycle time**: Data capture to deployed capability in less than a week
- **Daily model evaluations** against real-world conditions

The lineage is direct: Tony Zhao's Action Chunking with Transformers (ACT, RSS 2023) + Cheng Chi's Diffusion Policy (RSS 2023, 900+ citations) → commercial ACT-1.

### Skill Capture Glove (Patented)

The secret weapon — the "data hands" that make Sunday's approach unique:

- **Cost**: ~$200-400 per unit
- **Deployed**: 2,000+ units to "Memory Developers" working remotely in their own homes
- **Key design**: Identical geometry and sensor layout as Memo's hands — eliminates the embodiment gap
- **Captures**: Hand position, force, tactile information during natural movements
- **No teleoperation**: Memory Developers wear gloves and do tasks naturally — no robot in the loop during data collection
- **Generated**: 10M+ episodes across 500+ unique homes

This is the direct commercialization of Cheng Chi's Universal Manipulation Interface (UMI, RSS 2024 Best Systems Paper Finalist) and Tony Zhao's RoboCrowd crowdsourcing paradigm.

### Demonstrated Tasks (from demo videos with full completion)

- Table-to-dishwasher cycle: 33 unique + 68 total dexterous interactions with 21 objects, navigating 130+ ft
- Wine glass handling without breakage
- Sock folding
- Espresso machine operation
- Collecting utensils, plates, cups
- Loading and running dishwasher

Tony Zhao on demo integrity: *"Make zero assumptions when watching viral robot videos. If they didn't show it giving a slightly different color cup to the same person, it means a robot can literally only pick up that single cup."*

---

## What the World Looks Like If This Works

1. **The home becomes the largest untapped labor market.** Bain Capital Ventures: *"The home represents one of the largest untapped labor markets in the world."* If Memo handles dishes, laundry, and tidying, every household effectively gains 10-20 hours/week of labor.

2. **Household robotics becomes a consumer electronics category.** At sub-$10K, Memo is priced like a high-end appliance — not a luxury. If it reliably handles 3-5 daily chores, the ROI calculation favors adoption at scale.

3. **The data flywheel compounds.** Every deployed Memo generates new training data from new environments. More robots → more data → better models → more capable robots → more sales. The 10M episodes from 500 homes becomes 100M from 50,000 homes.

4. **Sunday's data pipeline becomes the moat.** The Skill Capture Glove + Memory Developer network is a data collection infrastructure no competitor has replicated. Collecting 10M real-home episodes would take competitors years and hundreds of millions of dollars.

5. **One billion home robots within a decade** (Tony's stated vision). If even 5% of the ~500M upper-middle-class global households adopt, that's 25M robots at $10K each — a $250B market.

---

## Best Case Scenario / Addressable Opportunity

| Market | Size | Growth |
|---|---|---|
| Global household robots | ~$14.7B (2025) | → $34.1B by 2030 (19.1% CAGR) |
| North America segment | — | → $10B by 2030 (20.3% CAGR) |
| Long-term projection | — | → $85B by 2035 |

Currently dominated by robot vacuums (47.8% share). Multipurpose manipulation robots represent a greenfield segment — the entire category is being created.

---

## The Science: A Brief History

**How the founders created the field they're now commercializing:**

- **2020**: Tony Zhao publishes MELD (meta-RL, CoRL). Cheng Chi begins PhD at Columbia under Shuran Song.
- **2022**: Cheng Chi publishes Iterative Residual Policy (RSS **Best Paper Award**) — robots whipping ropes with sub-inch accuracy. Proves learning-based manipulation can achieve extreme precision.
- **2023**: Tony Zhao publishes **ALOHA + ACT** (RSS) — low-cost bimanual teleoperation with Action Chunking Transformers. 80-90% success on 6 difficult tasks from 10 minutes of demos. The ALOHA shrimp-cooking video goes viral. Cheng Chi publishes **Diffusion Policy** (RSS, 900+ citations) — introduces denoising diffusion for robot control, outperforming SOTA by 46.9%. **These two papers together define the modern era of robot learning from demonstration.**
- **2024**: Chi publishes **UMI** (RSS Best Systems Paper Finalist) — proves you can collect robot data without robots using handheld devices. Zhao publishes **Mobile ALOHA**, **ALOHA Unleashed**, **RoboCrowd**. Both co-author **Open X-Embodiment** (ICRA **Best Paper**). Tony leaves Stanford PhD, Cheng completes Columbia PhD. **Sunday founded April 2024.**
- **Nov 2025**: Sunday emerges from stealth with $35M seed from Benchmark + Conviction. Memo and ACT-1 announced. 10+ Tesla FSD engineers poached.
- **Mar 2026**: $165M Series B at $1.15B from Coatue, Bain Capital Ventures, Fidelity, Tiger Global. 70+ team. 10M episodes from 500+ homes. Founding Family Beta announced for late 2026.

**Why Now**: Diffusion Policy (2023) and ACT (2023) — the founders' own inventions — solved the fundamental learning problem. UMI (2024) solved the data collection problem. Together they enable: cheap hardware + embodiment-matched data collection + scalable crowdsourcing + diffusion-based control = the full stack for home robotics. None of these pieces existed before 2023.

---

## Commercial Validation

| Signal | Detail |
|---|---|
| **Waitlist** | 1,000+ people |
| **Beta applications** | "Thousands" |
| **Memory Developers** | 2,000+ actively generating training data |
| **Founding Family Beta** | ~50 households, individually numbered units, late 2026 |
| **Tesla talent migration** | 10+ FSD engineers, including 5-7 year veterans |

No revenue yet — pre-commercial. Nishant Desai (5-year Tesla FSD veteran): *"This place reminds me so much of the early days of FSD: working with some of the smartest people in the world on some of humanity's hardest problems."*

---

## Core Team

### Tony Zhao — Co-Founder & CEO

| Field | Detail |
|---|---|
| **Education** | BS EECS, UC Berkeley (2021, advisors: Sergey Levine, Dan Klein); PhD CS, Stanford (dropped out ~2024, advisor: Chelsea Finn) |
| **Citations** | ~8,400 |
| **Key Papers** | ALOHA + ACT (RSS 2023), Mobile ALOHA (CoRL 2024), Open X-Embodiment (ICRA 2024 Best Paper), RoboCrowd |
| **Prior** | Tesla Autopilot (intern), Google X Intrinsic (intern), Google DeepMind (student researcher) |

**What's notable**: Tony built ALOHA — the system that went viral for cooking shrimp and proved low-cost hardware + imitation learning could achieve fine manipulation. His RoboCrowd paper explored crowdsourcing data collection — the exact model Sunday commercialized. The progression ALOHA → RoboCrowd → Sunday is a direct intellectual throughline from research to product. Dropped out of Chelsea Finn's Stanford lab (one of the most prestigious robotics groups in the world) because he saw the commercial opportunity was NOW. His advisor lineage (Sergey Levine at Berkeley, Chelsea Finn at Stanford) is the strongest possible in robot learning.

### Cheng Chi — Co-Founder & CTO

| Field | Detail |
|---|---|
| **Education** | BS CS, University of Michigan; PhD CS, Columbia University (2024, advisor: Shuran Song) |
| **Citations** | ~6,829 |
| **Key Papers** | Diffusion Policy (RSS 2023, 900+ citations), UMI (RSS 2024 Best Systems Paper Finalist), Iterative Residual Policy (RSS 2022 **Best Paper**) |
| **Prior** | Uber, Apple, Nuro (Mapping & Localization) |

**What's notable**: Cheng Chi invented Diffusion Policy — arguably the most influential robot learning paper of the past 3 years (900+ citations, outperforms SOTA by 46.9%). He also invented UMI — which proved you can collect robot data without robots, using handheld grippers with matched embodiment. Sunday's entire technical stack is the commercial synthesis of his PhD research. His RSS Best Paper Award for making robots whip ropes with sub-inch accuracy demonstrates the extreme precision his methods can achieve. Industry experience at Uber, Apple, and Nuro gives him real-world systems engineering depth.

Cheng Chi: *"mm level precision beyond actuator limits, so much torque that you need to manage thermals. Owning the whole stack from HW to AI is the only way."*

### Key Hires (Tesla FSD Alumni)

- **Nadeesha Amarasinghe** — Former Engineering Lead, AI Infrastructure at Tesla (7+ years). Built the backend that trains FSD and Optimus.
- **Perry Jia** — 6-year Tesla veteran, led Data Engine programs for Optimus and Autopilot. Now Head of Data Operations at Sunday.
- **Nishant Desai** — 5-year Tesla ML engineer (Autopilot/FSD).
- **Jason Peterson** — Former talent recruiter for Tesla Optimus and Robotaxi programs.

Team: 70+ engineers and researchers from Stanford, Tesla, DeepMind, Waymo, Meta, Neuralink, Apple, OpenAI. 3x engineering team, 4x research team since Series A.

---

## Investor Depth

### Capital Stack

| Round | Amount | Date | Lead | Valuation |
|---|---|---|---|---|
| Seed | $35M | Nov 2025 | Benchmark (Eric Vishria) | Undisclosed |
| Series B | $165M | Mar 2026 | Coatue (Thomas Laffont) | $1.15B |
| **Total** | **$200M** | | | |

**Other investors**: Bain Capital Ventures (Aaref Hilaly), Fidelity Management & Research, Tiger Global, Conviction (Sarah Guo), Xtal Ventures.

**Benchmark** — Eric Vishria: *"The promise of AI robotics isn't back-flipping or dancing demos, but robots that work in messy, real-world situations."* Benchmark led Uber, eBay, Snap — they bet on category-defining marketplaces and platforms.

**Coatue** — Thomas Laffont: *"His work at Stanford established him as one of the robotics industry's leading researchers. His work at Sunday shows a rare ability to translate that research into a shipping product. Sunday's velocity is the best signal we have."* Coatue's willingness to lead at $1.15B after just ~18 months signals extraordinary conviction.

**Bain Capital Ventures** — Published dedicated thesis piece: *"Robots, Finally at Home."* Aaref Hilaly: *"Sunday's integrated approach moves past one-time, teleoperated demos and into a world where robots reliably serve humans every day."*

**Conviction** — Sarah Guo's fund. She hosted Tony on the No Priors podcast (Ep. 141) — a 39-minute deep dive that serves as the most detailed public interview with the founders.

---

## Hiring Signals & Strategic Direction

**31+ open positions** spanning hardware (mechanical, electrical, firmware, reliability), software (fleet management, data ops tooling, ML evaluation, Unity HRI), ML research, data operations (Memory Developer expansion), manufacturing (assembly, production), marketing (social, creative, video, community), and product (beta program PMs).

**Key signals:**
- **Fleet Operations Lead + Robot Fleet Management** = building infrastructure to manage deployed robots remotely
- **Manufacturing roles** (Assembly Associate, Production Support) = transitioning from hand-built to production
- **Marketing roles** (Creative Director, Video Producer, Community Lead) = consumer launch preparation
- **Memory Developer expansion** (remote + in-house) = continuing to scale data collection pipeline

---

## Conference & Media Presence

**Podcast**: No Priors (Sarah Guo, Conviction) Ep. 141 — 39-minute interview with both founders (Nov 2025).

**Press**: TechCrunch, Bloomberg, Yahoo Finance (Series B), Electrek (Tesla talent exodus), SiliconAngle, AI Business, Euronews, Interesting Engineering, Humanoids Daily (multiple deep features).

**Academic lineage**: ALOHA went viral in 2023-2024. Mobile ALOHA got Stanford Report coverage. Diffusion Policy is the #1 cited robot learning paper of the era. The founders' research fame precedes the company.

**Investor content**: Bain Capital Ventures published "Robots, Finally at Home" — a dedicated thesis piece.

---

## Why This is a Non-Consensus Bet

**What the consensus thinks:**

1. Every multipurpose home robot has failed — Jibo, Kuri, Anki, Astro. The category has a 100% commercial failure rate.
2. 10M episodes from 500 homes isn't nearly enough — Eric Vishria himself said "one-millionth of the data we need"
3. Operating at 50% of human speed for $10K is a hard consumer sell — people won't wait 20 minutes for a robot to clear a 10-minute dinner table
4. Wheeled robots can't navigate stairs, uneven terrain, or reach tight spaces — fundamental limitation
5. 77kg of moving metal around children and pets is a liability nightmare
6. Manufacturing a complex humanoid at consumer scale and sub-$10K pricing is unproven

**What Sunday believes differently:**

1. Prior home robots failed because they couldn't manipulate objects — Sunday solves this with Diffusion Policy + ACT-1 + 10M real-home episodes. The failure pattern was capability, not demand.
2. The Skill Capture Glove + Memory Developer network is a data collection flywheel that compounds — 2,000 people generating data in their actual homes, growing every week. No competitor has this pipeline.
3. 50% speed is the starting point, not the ceiling — models improve with data, and every deployed robot generates more data. Speed will approach human pace as the dataset scales.
4. Wheels are a feature, not a bug — cheaper, safer, more reliable, no fall risk. 95%+ of household tasks don't require stairs. The wheeled form factor enables sub-$10K pricing that legs cannot.
5. Passive stability (won't fall if powered down), soft silicone shell, compliant control, and no sharp corners address safety. The Founding Family Beta with 50 real households is the validation gauntlet.
6. The founders' key advantage is full-stack ownership — hardware, AI, data collection, manufacturing. Tony: *"Owning the whole stack from HW to AI is the only way."*

---

## Competitive Landscape

| Company | Robot | Form | Price Target | Funding | Key Differentiator |
|---|---|---|---|---|---|
| **Sunday** | Memo | Wheeled humanoid | <$10K | $200M ($1.15B val) | 10M real-home episodes, Skill Capture Gloves, Diffusion Policy |
| **Tesla** | Optimus | Bipedal | ~$20-30K | Corporate | Manufacturing scale, FSD tech transfer |
| **Figure AI** | Figure 03 | Bipedal | ~$20K | $1B+ ($39B val) | Helix VLA, tactile fingertips, BMW partnership |
| **1X** | NEO | Bipedal | ~$20K | — | Tendon muscles, consumer-first |
| **Generalist AI** | (arms) | Industrial arms | N/A | $140M | 500K hrs via data hands, PaLM-E team |
| **Physical Intelligence** | (various) | Multi-embodiment | N/A | $1.1B ($5.6B val) | pi-0, hybrid imitation+RL |
| **Boston Dynamics** | Atlas | Bipedal | N/A | Corporate | Best hardware, industrial focus |

**Sunday's unique position**: Deliberately chose wheeled form (cheaper, safer) + household-specific focus. Price target ($10K) undercuts bipedal competitors ($20-30K). Data moat (10M real-home episodes via 2,000+ Memory Developers) is unique and unmatched. The founders invented the methods the entire field now uses (ALOHA, Diffusion Policy, UMI).

---

## Qualitative Assessment

**Conviction Level: HIGH**

**Bull case:**

1. **The founders invented the field.** ALOHA, Diffusion Policy, UMI — these aren't just influential papers, they're the methods every robot learning lab in the world now uses. Tony and Cheng didn't apply someone else's research; they created the paradigm and are now commercializing it.

2. **The data moat is real and compounding.** 10M episodes from 500+ real homes, collected via 2,000+ Memory Developers with embodiment-matched gloves. No competitor has this pipeline. Replicating it would take years and hundreds of millions of dollars. And every deployed Memo adds to the dataset.

3. **The Tesla talent migration is the strongest external signal.** When 10+ engineers with 5-7 years of FSD experience voluntarily leave Tesla for a 70-person startup, they're betting their careers that Sunday's approach is better. Nishant Desai: *"This place reminds me so much of the early days of FSD."*

4. **The investor syndicate is elite.** Benchmark, Coatue, Bain Capital Ventures, Fidelity, Tiger Global — and $1.15B valuation after just 18 months. Coatue's Thomas Laffont: *"Sunday's velocity is the best signal we have."*

5. **Wheeled + sub-$10K is the right consumer play.** Bipedal humanoids at $20-30K are industrial tools marketed as consumer products. Memo at sub-$10K is priced like a high-end appliance and designed for safety first. If it reliably handles 3-5 daily chores, adoption follows.

**Key risks:**

1. **100% category failure rate.** Every prior multipurpose home robot failed commercially. Sunday must overcome deep consumer skepticism and the graveyard of Jibo, Kuri, Anki, and Astro.

2. **50% speed = 50% utility.** If consumers feel they're watching a slow robot do what they could do faster, adoption stalls regardless of price. Speed must improve significantly.

3. **Edge cases in real homes are infinite.** 10M episodes from 500 homes is impressive but may not cover the long tail: unusual objects, unexpected layouts, children's toys, pet interference, wet surfaces, breakable items in unexpected places.

4. **Manufacturing a complex humanoid at $10K consumer pricing is unproven.** Current hand-built cost is $6-20K. Injection molding at scale should reduce costs ~50%, but the gap to $10K retail with margin is significant.

5. **No revenue, no deployed product.** $1.15B valuation on a Founding Family Beta of ~50 units in late 2026. The gap between demo videos and sustained daily operation in 50 real households is where every prior home robot died.

**Bottom line**: Sunday Robotics has the strongest founder-research pedigree in the field — Tony Zhao and Cheng Chi literally invented the methods (ALOHA, Diffusion Policy, UMI) that define modern robot learning from demonstration. The Skill Capture Glove + Memory Developer pipeline is a genuine data moat that no competitor has replicated. The wheeled form factor + sub-$10K pricing is a pragmatic consumer play that sidesteps the bipedal humanoid hype. The 10+ Tesla FSD engineers who voluntarily joined are betting this is the next FSD-scale opportunity. The risk is that home robotics has a 100% commercial failure rate and the gap between impressive demos and daily household operation is where every prior attempt died. The Founding Family Beta in late 2026 is the make-or-break moment.

**Verdict: The inventors of ALOHA and Diffusion Policy are commercializing their own research with a unique data pipeline (10M real-home episodes via 2,000+ glove-wearing Memory Developers) that no competitor can replicate. The $1.15B valuation after 18 months, $200M raised, and Tesla FSD talent migration are extraordinary signals. If the Founding Family Beta proves Memo works reliably in real homes, this becomes the company that finally cracks household robotics. Watch for beta deployment results and first consumer reviews.**

*Research compiled: April 2026*
