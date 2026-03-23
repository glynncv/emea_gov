# TFEM Governance Signal Architecture
## Programme: LTI Mindtree / MSP Maturation

*Version:* v1
*Date:* 2026-03-03
*Framework:* TFEM Consolidated Reference v1 (Sections 3 & 4)
*Mode:* Architecture Brain — Signal architecture only. No tools. No dashboards. No OKRs. No actions.

---

## Programme Reference

**Classification:** Hard Deadline · Capacity Dependent

**Objective Statement:**
Stabilise the managed service provider operating model by maturing LTI Mindtree activities to enable stable state operations by 31 March 2026.

---

## Step 1 — Programme Type Implications

**What failure looks like:**
31 March 2026 arrives without a confirmed stable state declaration. The MSP operating model remains in a transition state. Operational metrics (incident volumes, SLA adherence, escalation frequency) do not reflect stable state. The programme end-date passes without a formal closure — activities continue informally, accountability diffuses, and the transition state persists indefinitely.

**What drift looks like first:**
Threshold drift. "Stable state" is undefined, allowing the programme to report progress without ever declaring completion. Activities continue; the milestone is perpetually "almost there." Without a numeric definition of stable state, the trigger for programme closure cannot be set.

**Critical timing constraint:**
The analysis date is 3 March 2026. The programme deadline is 31 March 2026. **This programme is in its final 4-week window.** If stable state has not been declared, this programme is at immediate breach risk and requires urgent governance attention — not a monthly steering cycle.

**Primary failure driver:**
Stagnation-driven compounded by definition failure. If "stable state" has no numeric threshold, the programme cannot be formally closed. The absence of a definition is the primary governance risk — not delivery capacity.

---

## Step 2 — TFEM Layers

### Strategic Layer (Quarterly)

**Posture question:**
Has stable state been formally declared against a defined numeric threshold, and have follow-on activities (Observability, SysTrack, IaC) been formally separated into their own delivery structure?

**Level artefact:**
- Stable state threshold: defined or undefined (binary)
- Current operational metrics vs stable state threshold
- Follow-on activities: formally separated with own milestones?

**Signal artefact:**
- With 4 weeks to deadline: is stable state achievable by 31 March, or is an immediate breach escalation required?
- Are follow-on activities (PHINfo, Voicing.AI, SysTrack, IaC) being managed as sub-activities of this programme, or have they been correctly separated?

---

### Steering Layer (Monthly)

**Note:** Given the 31 March deadline, the monthly steering cycle is not the primary governance mechanism for this programme. Weekly executive review is required for the remainder of the delivery window.

**Health signals:**
- Operational metrics: SLA adherence rate, incident volume, escalation frequency — current vs stable state threshold
- Stable state threshold: formally defined and agreed with LTI Mindtree?
- Follow-on activities: separated from this programme's closure milestone?

**Commitment integrity to validate:**
- Has LTI Mindtree formally committed to stable state delivery by 31 March?
- Is there a named owner accountable for the stable state declaration?
- Are the operational metrics being measured against a defined baseline, or assessed subjectively?

---

### Execution Layer (Weekly)

**Given the 4-week window, this is the primary governance layer for the remainder of this programme.**

**Drift to detect:**
- Weekly operational metrics vs stable state threshold — closing or static?
- Any week where metrics move away from stable state threshold — regression signal
- Stable state threshold: confirmed in writing with LTI Mindtree this week or not?

**Early-warning indicator:**
Stable state threshold not defined and agreed in writing by **10 March** (1 week from analysis date). Without a confirmed threshold, stable state cannot be declared on 31 March regardless of operational performance.

---

### Trigger Layer (Immediate)

**Watch — threshold:**
- Stable state threshold not confirmed in writing by **10 March**
- Any operational metric moving away from (not toward) stable state in any week

**Breached — threshold:**
- Stable state threshold not confirmed in writing by **31 March**
- Operational metrics do not meet the agreed stable state threshold by **31 March**
- Programme deadline passes without formal stable state declaration — immediate escalation to programme sponsor

---

### Control Layer (Chair)

**Governance drift risk:**
The programme is extended informally past 31 March because stable state was never defined. Follow-on activities (PHINfo, Voicing.AI, SysTrack, IaC) are used to justify continued programme existence. The MSP maturation narrative replaces the requirement for a formal stable state declaration.

**Behavioural failure to prevent:**
- Accepting "almost at stable state" as a programme status on 31 March
- Allowing follow-on activities to keep the programme open past its deadline
- Treating stable state as a subjective judgment rather than a numeric threshold

**Chair self-check:**
- Is stable state defined numerically and agreed in writing with LTI Mindtree?
- Have follow-on activities (Observability, SysTrack, IaC, PHINfo, Voicing.AI) been formally separated with their own milestone structures?
- Is there a named owner who will formally declare stable state by 31 March?

---

## SECTION 1 — Layer Map Summary Table

| Layer | Cadence | Posture Question | Level Artefact | Signal Artefact |
|---|---|---|---|---|
| Strategic | Quarterly | Has stable state been declared and follow-ons separated? | Stable state: declared / not declared; threshold defined? | Follow-on activity separation status |
| Steering | Monthly | Are metrics meeting threshold? Is closure on track? | Current metrics vs threshold; LTI Mindtree commitment | Regression signals; threshold definition gap |
| Execution | **Weekly (primary)** | Is stable state threshold confirmed? Are metrics closing? | Weekly metrics vs threshold | Regression; threshold not confirmed by 10 Mar |
| Trigger | Immediate | Has a threshold been breached? | Trigger status: Green / Watch / Breached | Breach type: definition / metrics / deadline |
| Control | Monthly | Is programme being kept open past its deadline? | Chair self-audit | Informal extension; follow-on activity absorption |

---

## SECTION 2 — Trigger Rule Definitions

| Rule ID | Type | Condition | Status |
|---|---|---|---|
| MSP-T1 | Definition | Stable state threshold not confirmed in writing by 10 March | Watch — immediate action required |
| MSP-T2 | Definition | Stable state threshold not confirmed in writing by 31 March | Breached |
| MSP-T3 | Metrics | Any operational metric moving away from stable state threshold in any week | Watch |
| MSP-T4 | Deadline | Stable state not formally declared by 31 March | Breached — escalate to programme sponsor same day |
| MSP-T5 | Separation | Follow-on activities (Observability, SysTrack, IaC) not formally separated with own milestones by 31 March | Watch |

---

## SECTION 3 — Governance Failure Modes

| Failure Mode | Mechanism | Detection Point |
|---|---|---|
| Stable state never defined | No numeric threshold; programme reports progress subjectively; closure cannot be declared | Execution layer — 10 March threshold check |
| Informal extension | 31 March passes; programme continues under follow-on activity labels; accountability diffuses | Control layer — chair self-audit |
| Follow-on absorption | PHINfo, Voicing.AI, SysTrack milestones used to justify programme continuation past 31 March | Control layer — chair self-audit |
| Metric regression undetected | Operational metrics regress in final weeks; reported as temporary; stable state declaration still made | Execution layer — weekly metric tracking |
| Commitment without definition | LTI Mindtree confirms "on track" without numeric threshold against which "on track" is assessed | Steering layer — commitment integrity |

---

## SECTION 4 — What NOT to Track

- **MSP contract commercial terms** — commercial domain; governance tracks delivery evidence only
- **LTI Mindtree internal resource allocation** — vendor management; not governance signal
- **Individual service desk ticket volumes** — execution metric; surface only if used as stable state threshold component
- **Follow-on activity detail (Observability, SysTrack, IaC)** — these are separate programmes with separate milestones; must not be included in MSP Maturation governance
- **PHINfo / Voicing.AI adoption rates** — Operations domain metrics; not MSP Maturation programme governance

---

*End of TFEM Signal Architecture — LTI Mindtree / MSP Maturation v1.*
