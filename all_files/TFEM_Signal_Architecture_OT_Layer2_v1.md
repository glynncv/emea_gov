# TFEM Governance Signal Architecture
## Programme: OT Layer 2 Network Segmentation

*Version:* v1
*Date:* 2026-03-03
*Framework:* TFEM Consolidated Reference v1 (Sections 3 & 4)
*Mode:* Architecture Brain — Signal architecture only. No tools. No dashboards. No OKRs. No actions.

---

## Programme Reference

**Classification:** Hard Deadline · Capacity Dependent · Stability Sensitive

**Objective Statement:**
Close Layer 2 network segmentation exposure across all relevant sites by completing implementation at 100% of in-scope sites by 31 October 2026.

---

## Step 1 — Programme Type Implications

**What failure looks like:**
One or more sites remain unsegmented past 31 October. Each unsegmented site represents a live OT security exposure. The 31 Oct deadline leaves no Q4 recovery window — any site not complete by that date carries the exposure into 2027.

**What drift looks like first:**
Stagnation at site level. Individual sites are scoped and scheduled but implementation stalls — change window availability, site IT capacity, or OT system owner reluctance creates inactivity that is not escalated. Cumulative stagnation across multiple sites compresses the delivery tail into an undeliverable sprint.

**Primary failure driver:**
Throughput-driven with a hard non-negotiable outer deadline. The 31 Oct deadline is absolute — unlike a year-end deadline, there is no Q4 capacity degradation argument to hide behind. Failure to complete by October is unambiguous.

**Secondary failure driver:**
Stability-sensitive. OT segmentation changes interact directly with production manufacturing environments. A change-induced incident triggers a rollback, a site investigation, and a change freeze — removing that site's capacity from the model for weeks.

---

## Step 2 — TFEM Layers

### Strategic Layer (Quarterly)

**Posture question:**
Is the segmentation implementation rate sufficient to clear all in-scope sites by 31 October, and has scope been formally fixed?

**Level artefact:**
- Total sites in scope (must be formally defined and locked)
- Sites with segmentation complete
- Sites in active implementation
- Sites not yet started

**Signal artefact:**
- Is the required weekly site burn rate achievable across the weeks remaining before 31 Oct?
- Has any stability incident paused a site and reduced effective delivery capacity?
- Is scope stable — no new sites added without a corresponding capacity increase?

---

### Steering Layer (Monthly)

**Health signals:**
- Sites completed this month vs required monthly rate
- Sites with no activity in the past 30 days (stagnation flag)
- Stability incidents following segmentation changes — any rollbacks or paused sites?
- Change window availability: are sites confirming upcoming implementation windows?

**Commitment integrity to validate:**
- Are site IT owners confirming change windows as scheduled, or are windows being deferred?
- Is OT system owner engagement secured for each upcoming site — or are implementations being scheduled without OT owner confirmation?
- Is scope formally locked? Any new sites proposed for inclusion?

---

### Execution Layer (Weekly)

**Drift to detect:**
- Sites completed this week vs required weekly burn
- Any site where implementation was scheduled this week but did not execute
- Stability incidents following any segmentation change
- Sites with confirmed implementation windows in the next two weeks — pipeline visibility

**Early-warning indicator:**
Any site where a scheduled implementation window is deferred without a confirmed replacement date within 48 hours. Given the 31 Oct hard deadline, deferred windows compress the available delivery schedule without any compensating capacity increase.

---

### Trigger Layer (Immediate)

**Watch — threshold:**
- Site completions < required weekly burn for **1 week**
- Any site: scheduled implementation deferred without confirmed replacement date within **48 hours**
- Any stability incident following a segmentation change — site placed on pause

**Breached — threshold:**
- Site completions < required weekly burn for **2 consecutive weeks**
- Any site with no implementation activity for **30 days**
- Projected completion of all sites crosses **15 October** — no buffer before hard deadline
- Stability-related pause at any site extends beyond **10 days** without recovery plan

---

### Control Layer (Chair)

**Governance drift risk:**
The programme review descends into site-by-site status discussion. Individual site blockers — change window negotiations, OT owner reluctance — are handled at governance altitude rather than escalated to the accountable site programme owner. The chair begins mediating site-level conversations rather than enforcing throughput accountability.

**Behavioural failure to prevent:**
- Accepting deferred change windows as routine scheduling flexibility rather than a throughput signal
- Treating OT owner reluctance as a site-specific issue rather than a programme-level escalation
- Allowing stability incidents to suspend governance scrutiny rather than triggering a formal capacity recalculation

**Chair self-check:**
- Is the review focused on burn rate and stagnation flags, or on the detail of individual site implementations?
- Is scope formally locked, or are new sites being added informally?
- Is the 31 Oct deadline being treated as a hard stop, or is there implicit acceptance that "late October" is acceptable?

---

## SECTION 1 — Layer Map Summary Table

| Layer | Cadence | Posture Question | Level Artefact | Signal Artefact |
|---|---|---|---|---|
| Strategic | Quarterly | Is burn rate sufficient to clear all sites by 31 Oct? | Sites complete; sites remaining; projected completion | Required weekly burn achievable; scope lock status |
| Steering | Monthly | Are completions on rate and change windows confirmed? | Sites completed this month; stagnation flags | Stability incidents; change window pipeline; scope stability |
| Execution | Weekly | Is this week on rate? Any deferred implementations? | Completions this week vs required burn | Deferred windows; stability pauses; pipeline for next 2 weeks |
| Trigger | Immediate | Has a threshold been breached? | Trigger status: Green / Watch / Breached | Breach type: throughput / stagnation / stability / trajectory |
| Control | Monthly | Is governance at the right altitude? | Chair self-audit | Site-level mediation; scope drift; deadline elasticity assumption |

---

## SECTION 2 — Trigger Rule Definitions

| Rule ID | Type | Condition | Status |
|---|---|---|---|
| OT-SEG-T1 | Throughput | Site completions < required weekly burn for 1 week | Watch |
| OT-SEG-T2 | Throughput | Site completions < required weekly burn for 2 consecutive weeks | Breached |
| OT-SEG-T3 | Stagnation | Scheduled implementation deferred; no replacement date within 48 hours | Watch |
| OT-SEG-T4 | Stagnation | Any site: no implementation activity for ≥ 30 days | Breached |
| OT-SEG-T5 | Stability | Change-induced incident causes site implementation pause | Watch → Breached if pause > 10 days |
| OT-SEG-T6 | Trajectory | Projected all-sites completion crosses 15 October | Breached |
| OT-SEG-T7 | Scope | New site added to scope without confirmed additional capacity | Watch |

---

## SECTION 3 — Governance Failure Modes

| Failure Mode | Mechanism | Detection Point |
|---|---|---|
| Deferred window accumulation | Change windows deferred individually; aggregate deferral collapses available delivery schedule | Execution layer — weekly deferred window count |
| OT owner reluctance unescalated | Sites stall because OT system owners have not approved changes; not treated as a programme-level blocker | Steering layer — stagnation flag |
| Stability pause not recalculated | Incident-related pause treated as temporary; burn model not updated | Steering layer — capacity review |
| Scope absorbed informally | New sites added without capacity adjustment; required burn rate silently increases | Strategic layer — quarterly scope review |
| Deadline treated as elastic | "Late October" accepted as effectively equivalent to 31 Oct; no urgency trigger applied | Control layer — chair self-audit |

---

## SECTION 4 — What NOT to Track

- **OT system architecture or network design** — execution domain; not governance signal
- **Change request content** — SNOW execution data; surface only on stagnation breach
- **Technical segmentation methodology** — ownership of the implementation team; not governance altitude
- **Individual site IT capacity detail** — relevant only when a site triggers a stagnation breach
- **Post-segmentation verification testing** — operational validation; not programme governance

---

*End of TFEM Signal Architecture — OT Layer 2 Network Segmentation v1.*
