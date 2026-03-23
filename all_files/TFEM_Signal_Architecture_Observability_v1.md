# TFEM Governance Signal Architecture
## Programme: Observability

*Version:* v1
*Date:* 2026-03-03
*Framework:* TFEM Consolidated Reference v1 (Sections 3 & 4)
*Mode:* Architecture Brain — Signal architecture only. No tools. No dashboards. No OKRs. No actions.

---

## Programme Reference

**Classification:** Hard Deadline · Capacity Dependent

**Objective Statement:**
Close the infrastructure visibility gap by completing full monitoring coverage of the entire infrastructure environment and delivering the DynaTrace proof of concept by 30 April 2026.

---

## Step 1 — Programme Type Implications

**What failure looks like:**
30 April arrives with monitoring coverage incomplete — gaps exist in the infrastructure environment. The DynaTrace POC has not been delivered, or has been delivered without a decision gate outcome. The "full monitoring coverage" milestone cannot be declared because scope was never defined, making completion undeclatable.

**What drift looks like first:**
Scope definition failure. "Full monitoring coverage of the entire infrastructure environment" is an undefined scope statement. Without a confirmed coverage baseline — systems in scope, coverage metric, completion criteria — the programme cannot track throughput or declare completion. Drift is invisible because progress is reported against an undefined target.

**Primary failure driver:**
Stagnation-driven by scope ambiguity. The hard 30 April deadline is real, but the absence of a scope definition means the programme cannot be governed with burn rate physics. The scope definition is the first-order dependency — without it, no other governance layer can function.

**Secondary consideration:**
The DynaTrace POC is a decision-gate artefact, not an end-state milestone. Governance must define what decision the POC informs, who makes it, and by when. A POC delivered without a defined decision point is an activity, not a milestone.

**Critical timing constraint:**
The analysis date is 3 March 2026. The deadline is 30 April 2026. **This programme has 8 weeks remaining.** Scope definition, if not already complete, must be treated as an immediate action — not a steering cycle item.

---

## Step 2 — TFEM Layers

### Strategic Layer (Quarterly)

**Posture question:**
Is monitoring coverage complete against a formally defined scope baseline, and has the DynaTrace POC produced a confirmed decision outcome?

**Level artefact:**
- Coverage scope baseline: defined (system/component count) or undefined (binary)
- Systems/components with monitoring confirmed live vs total in scope
- DynaTrace POC: delivered and decision outcome confirmed?

**Signal artefact:**
- Is the coverage completion rate sufficient to reach 100% of confirmed scope by 30 April?
- Has the DynaTrace POC decision been formally made and communicated?

---

### Steering Layer (Monthly)

**Note:** With 8 weeks to deadline, monthly steering is insufficient as the primary cadence. Bi-weekly review is the minimum appropriate cadence for this programme.

**Health signals:**
- Coverage scope: formally defined and locked?
- Systems/components confirmed live vs scope count
- DynaTrace POC: on track for delivery and decision gate by 30 April?
- IaC top-10 use cases (30 Jun sub-activity): formally separated from this programme's 30 April milestone?

**Commitment integrity to validate:**
- Is the coverage scope formally confirmed with a named owner per infrastructure domain?
- Is the DynaTrace POC decision gate formally defined — who makes it, what criteria, by when?
- Are "AI capabilities for proactive incident resolution" out-of-scope for this programme's 30 April milestone?

---

### Execution Layer (Weekly)

**Given the 8-week window, this is the primary governance cadence.**

**Drift to detect:**
- Systems/components confirmed with monitoring live this week vs required weekly burn
- Any infrastructure domain with no coverage progress for 7 days
- DynaTrace POC: delivery milestones on track for 30 April completion?

**Early-warning indicator:**
Coverage scope not confirmed in writing by **17 March** (2 weeks from analysis date). Without confirmed scope, burn rate physics cannot be applied and the 30 April deadline cannot be governed. This is an immediate watch condition.

---

### Trigger Layer (Immediate)

**Watch — threshold:**
- Coverage scope not confirmed in writing by **17 March**
- Any infrastructure domain: no coverage progress for **7 days**
- DynaTrace POC delivery milestone missed in any week

**Breached — threshold:**
- Coverage scope not confirmed in writing by **31 March** — insufficient time to complete against undefined scope
- Any infrastructure domain: no coverage progress for **14 days**
- DynaTrace POC not delivered by **30 April**
- Coverage completion rate projects to less than 100% of confirmed scope by 30 April

---

### Control Layer (Chair)

**Governance drift risk:**
The programme is reported as "in progress" without a confirmed scope baseline. Individual monitoring deployments are counted as progress without a denominator. The DynaTrace POC is treated as a technical activity rather than a decision-gate event. The "AI capabilities" aspiration is allowed to expand the programme scope past 30 April.

**Behavioural failure to prevent:**
- Accepting "we're deploying monitoring" as a programme status without a confirmed scope count and completion rate
- Allowing the DynaTrace POC to be delivered without a confirmed decision gate, outcome criteria, and decision owner
- Permitting the IaC use cases (30 Jun) and AI aspirations to be included in the 30 April milestone scope

**Chair self-check:**
- Is the coverage scope defined as a confirmed system/component count with a named owner per domain?
- Is the DynaTrace POC decision gate formally documented — criteria, owner, decision date?
- Are all sub-activities with later deadlines (IaC, AI capabilities) formally excluded from the 30 April milestone?

---

## SECTION 1 — Layer Map Summary Table

| Layer | Cadence | Posture Question | Level Artefact | Signal Artefact |
|---|---|---|---|---|
| Strategic | Quarterly | Is scope confirmed and coverage complete? Is POC decision made? | Systems live vs scope count; POC decision status | Completion rate; scope lock status |
| Steering | Bi-weekly | Are coverage deployments on rate? Is POC on track? | Systems live this period; POC milestone status | Domain gaps; scope definition gap |
| Execution | **Weekly (primary)** | Is this week on rate? Any domains stalling? | Completions vs required burn; POC weekly milestone | 17 Mar scope warning; 7-day domain stagnation |
| Trigger | Immediate | Has a threshold been breached? | Trigger status: Green / Watch / Breached | Breach type: scope / throughput / stagnation / POC |
| Control | Monthly | Is governance maintaining scope discipline? | Chair self-audit | Undefined denominator; AI scope creep; POC decision gap |

---

## SECTION 2 — Trigger Rule Definitions

| Rule ID | Type | Condition | Status |
|---|---|---|---|
| OBS-T1 | Scope | Coverage scope not confirmed in writing by 17 March | Watch — immediate action required |
| OBS-T2 | Scope | Coverage scope not confirmed in writing by 31 March | Breached |
| OBS-T3 | Stagnation | Any infrastructure domain: no coverage progress for 7 days | Watch |
| OBS-T4 | Stagnation | Any infrastructure domain: no coverage progress for 14 days | Breached |
| OBS-T5 | POC | DynaTrace POC delivery milestone missed in any week | Watch |
| OBS-T6 | POC | DynaTrace POC not delivered by 30 April | Breached |
| OBS-T7 | Trajectory | Coverage completion rate projects < 100% of confirmed scope by 30 April | Breached |

---

## SECTION 3 — Governance Failure Modes

| Failure Mode | Mechanism | Detection Point |
|---|---|---|
| Undefined denominator | Scope never confirmed; progress reported without a total; completion undeclatable | Execution layer — 17 March scope check |
| POC delivered without decision | DynaTrace POC completed as a technical exercise; no formal decision gate; outcome undefined | Steering layer — POC decision gate check |
| Scope expansion | AI capabilities and IaC use cases absorbed into 30 April scope; original milestone diluted | Control layer — chair self-audit |
| Domain stagnation invisible | Individual infrastructure domains with no coverage progress not identified; aggregate count masks gaps | Execution layer — weekly domain check |
| "In progress" accepted as status | Monitoring deployments reported without completion count vs confirmed scope | Steering layer — commitment integrity |

---

## SECTION 4 — What NOT to Track

- **Monitoring tool configuration detail** — technical domain; not governance signal
- **Individual alert rules or thresholds** — operational configuration; not programme governance
- **AI-driven incident resolution outcomes** — aspirational future-state; out of scope for 30 April milestone
- **IaC top-10 use cases** — separate sub-activity with a 30 June deadline; must not be included in this programme's milestone tracking
- **DynaTrace commercial/licensing terms** — commercial domain; governance tracks POC delivery and decision only

---

*End of TFEM Signal Architecture — Observability v1.*
