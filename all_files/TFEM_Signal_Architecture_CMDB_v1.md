# TFEM Governance Signal Architecture
## Programme: CMDB North Star

*Version:* v1
*Date:* 2026-03-03
*Framework:* TFEM Consolidated Reference v1 (Sections 3 & 4)
*Mode:* Architecture Brain — Signal architecture only. No tools. No dashboards. No OKRs. No actions.

---

## Programme Reference

**Classification:** Hard Deadline · Capacity Dependent

**Objective Statement:**
Close the CMDB maturity gap by completing Discovery, Service Mapping, and Event Management implementation to achieve the defined CMDB maturity plan by 31 January 2027.

---

## Step 1 — Programme Type Implications

**What failure looks like:**
31 January 2027 arrives with one or more of the three workstreams (Discovery, Service Mapping, Event Management) incomplete. The CMDB Maturity Plan milestone cannot be declared. The programme has drifted through 2026 without being detected because there are no intermediate milestones — the single outer deadline provided no early-warning signal.

**What drift looks like first:**
Stagnation in the absence of urgency. The 31 January 2027 deadline is 11 months away. Without intermediate milestones and a burn rate model, all three workstreams are reported as "in progress" for the majority of the year. Stagnation is invisible until Q4 — by which point recovery is impossible.

**Primary failure driver:**
Stagnation-driven in the early and mid phases; throughput-driven in Q4 as the deadline approaches. The 11-month delivery window without intermediate trigger points is the primary governance design failure — it must be corrected at charter stage.

**Structural prerequisite:**
The CMDB Maturity Plan is referenced but not defined in the source deck. If the plan does not exist as a formal document with defined maturity levels, milestone criteria, and workstream sequencing, this programme is in a pre-programme state and cannot be governed until the plan is produced. The plan itself must be treated as the first milestone.

---

## Step 2 — TFEM Layers

### Strategic Layer (Quarterly)

**Posture question:**
Is the CMDB Maturity Plan formally defined and are all three workstreams progressing at a rate consistent with 31 January 2027 completion?

**Level artefact:**
- CMDB Maturity Plan: formally defined and baselined? (binary prerequisite)
- Discovery workstream: completion percentage vs plan
- Service Mapping workstream: completion percentage vs plan
- Event Management workstream: completion percentage vs plan

**Signal artefact:**
- Is the rate of progress in each workstream consistent with the intermediate milestone schedule?
- Are all three workstreams progressing in parallel, or is one workstream blocking another?
- Are any workstream sequencing dependencies (e.g., Discovery must precede Service Mapping) being managed?

---

### Steering Layer (Monthly)

**Health signals:**
- Progress per workstream vs defined intermediate milestones
- Any workstream with no confirmed progress in the past 30 days — stagnation flag
- CMDB Maturity Plan: confirmed and baselined? If not, this is the standing breach condition
- Resource allocation: is there a named owner and confirmed capacity per workstream?

**Commitment integrity to validate:**
- Is a named owner confirmed per workstream with explicit milestone commitments?
- Are intermediate milestones formally defined — or is "31 January 2027" the only declared milestone?
- Is workstream sequencing confirmed (dependencies between Discovery, Service Mapping, Event Management)?

---

### Execution Layer (Weekly)

**Drift to detect:**
- Any workstream with no progress for 14 consecutive days
- Intermediate milestone slippage in any workstream — missed dates without a confirmed recovery plan
- CMDB Maturity Plan document: not yet produced — this is a standing weekly escalation item until resolved

**Early-warning indicator:**
Any workstream with no confirmed progress by the end of Q1. An 11-month programme must demonstrate active throughput in Q1 to be on governance trajectory. A Q1 with no measurable progress is a stagnation pattern, not a slow start.

---

### Trigger Layer (Immediate)

**Watch — threshold:**
- CMDB Maturity Plan not confirmed and baselined by **end of Q1** — pre-programme state
- Any workstream: no confirmed progress for **14 days**
- Any intermediate milestone slipped without a confirmed recovery date within **5 days**

**Breached — threshold:**
- CMDB Maturity Plan not confirmed and baselined by **30 June** — programme ungovernable; escalate to sponsor
- Any workstream: no confirmed progress for **30 days**
- Any workstream projected to miss the 31 January 2027 deadline based on current progress rate, identified at any quarterly review
- Two or more workstreams showing concurrent stagnation

---

### Control Layer (Chair)

**Governance drift risk:**
The programme is reviewed at the monthly steering cycle as a standing update with no intermediate milestones to test against. "Work is progressing" is accepted as a status. The absence of a formal CMDB Maturity Plan is acknowledged but deferred. Q4 arrives with significant work outstanding and no recovery window.

**Behavioural failure to prevent:**
- Accepting the absence of the CMDB Maturity Plan as a known gap without a deadline for its production
- Allowing the 31 January 2027 outer deadline to exist as the only governance trigger point — intermediate milestones are mandatory
- Treating three distinct workstreams as a single programme entry without separate progress tracking

**Chair self-check:**
- Does the CMDB Maturity Plan exist as a formal document with defined maturity levels and milestone criteria?
- Are intermediate milestones defined for each of the three workstreams, with specific completion dates?
- Is there a named owner per workstream with explicit accountability for milestone delivery?

---

## SECTION 1 — Layer Map Summary Table

| Layer | Cadence | Posture Question | Level Artefact | Signal Artefact |
|---|---|---|---|---|
| Strategic | Quarterly | Is Maturity Plan baselined? Are workstreams on trajectory? | Plan status; progress per workstream vs intermediate milestones | Stagnation flags; workstream sequencing dependencies |
| Steering | Monthly | Are monthly milestones being met per workstream? | Progress this month per workstream; stagnation flags | Concurrent stagnation; plan definition gap |
| Execution | Weekly | Any workstream stalling? Plan still undefined? | Progress per workstream; plan confirmation status | 14-day stagnation; missed intermediate milestones |
| Trigger | Immediate | Has a threshold been breached? | Trigger status: Green / Watch / Breached | Breach type: plan undefined / stagnation / trajectory / concurrent |
| Control | Monthly | Are intermediate milestones in place? Is plan formally baselined? | Chair self-audit | Single-deadline governance; narrative substitution |

---

## SECTION 2 — Trigger Rule Definitions

| Rule ID | Type | Condition | Status |
|---|---|---|---|
| CMDB-T1 | Prerequisite | CMDB Maturity Plan not confirmed and baselined by end of Q1 | Watch |
| CMDB-T2 | Prerequisite | CMDB Maturity Plan not confirmed and baselined by 30 June | Breached — escalate to sponsor |
| CMDB-T3 | Stagnation | Any workstream: no confirmed progress for ≥ 14 days | Watch |
| CMDB-T4 | Stagnation | Any workstream: no confirmed progress for ≥ 30 days | Breached |
| CMDB-T5 | Stagnation | Two or more workstreams: concurrent stagnation ≥ 14 days | Breached |
| CMDB-T6 | Milestone | Intermediate milestone slipped without confirmed recovery date within 5 days | Watch |
| CMDB-T7 | Trajectory | Any workstream projected to miss 31 January 2027 at any quarterly review | Breached |

---

## SECTION 3 — Governance Failure Modes

| Failure Mode | Mechanism | Detection Point |
|---|---|---|
| Plan never produced | CMDB Maturity Plan remains undefined; no maturity criteria; completion undeclatable | Execution layer — weekly plan check |
| Single-milestone governance | 31 Jan 2027 is the only trigger point; stagnation invisible until Q4 | Steering layer — intermediate milestone check |
| Workstream conflation | Three workstreams reported as a single programme update; individual stagnation masked | Execution layer — per-workstream tracking |
| Slow-start accepted | Q1 shows no measurable progress; accepted as "early stages"; stagnation pattern established | Execution layer — Q1 progress check |
| Plan as aspiration | CMDB Maturity Plan produced but not formally baselined; completion criteria remain subjective | Control layer — chair self-audit |

---

## SECTION 4 — What NOT to Track

- **CMDB record accuracy or data quality** — operational CMDB management; not programme governance
- **Individual CI discovery counts** — execution metric; surface only as workstream completion indicator
- **Service mapping technical methodology** — technical ownership; not governance altitude
- **Event Management alert configuration** — operational configuration; not programme governance
- **SNOW platform configuration detail** — execution domain; not governance signal

---

*End of TFEM Signal Architecture — CMDB North Star v1.*
