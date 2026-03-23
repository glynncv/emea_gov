# TFEM Governance Signal Architecture
## Programme: SDWAN / Legacy Network Remediation

*Version:* v1
*Date:* 2026-03-03
*Framework:* TFEM Consolidated Reference v1 (Sections 3 & 4)
*Mode:* Architecture Brain — Signal architecture only. No tools. No dashboards. No OKRs. No actions.

---

## Programme Reference

**Classification:** Hard Deadline · Capacity Dependent · Stability Sensitive

**Objective Statement:**
Close 100% of the legacy network backbone by completing SDWAN deployment across all sites, Azure and DelphiDrive landing zone connectivity, Amsterdam network transition, and PHINIA-Guest rollout by 30 September 2026, with the critical path deadline of 30 June 2026 for SDWAN and Amsterdam.

---

## Step 1 — Programme Type Implications

**What failure looks like:**
One or more sites remain on legacy network infrastructure past 30 June. The Amsterdam exit is blocked because network connectivity is incomplete. The cascade effect delays the Data Center Consolidation programme, which shares the Amsterdam dependency.

**What drift looks like first:**
Throughput drift at site level. Individual site deployments slip their scheduled dates — each slip appears minor in isolation but the aggregate effect compresses the delivery window for remaining sites. The 30 June hard deadline has no elasticity.

**Primary failure driver:**
Throughput-driven with hard sequencing constraints. The programme has four distinct sub-deadlines (30 Apr, 30 Jun × 2, 30 Sep) — each feeds the next. A miss at 30 Apr (Azure/DD connectivity) removes the technical foundation for subsequent phases.

**Secondary failure driver:**
Stability-sensitive. Network changes on production environments carry change-induced instability risk. If an incident follows a site deployment, the rollback or investigation pause removes that site's capacity from the burn model for an unpredictable period.

---

## Step 2 — TFEM Layers

### Strategic Layer (Quarterly)

**Posture question:**
Is the site deployment rate sufficient to clear all remaining sites before 30 June, and are cross-programme dependencies (Amsterdam DC exit, Azure consolidation) still on sequence?

**Level artefact:**
- Total sites in scope
- Sites completed (SDWAN live)
- Sites remaining
- Projected completion date at current weekly burn rate

**Signal artefact:**
- Is the required weekly site burn rate achievable across the weeks remaining before 30 June?
- Are the 30 Apr dependency milestones (Azure/DD connectivity) confirmed as on track?
- Has any stability incident paused site deployment and reduced effective capacity?

---

### Steering Layer (Monthly)

**Health signals:**
- Sites completed this month vs required monthly rate
- 30 Apr milestone status: Azure and DelphiDrive landing zone connectivity
- Amsterdam network connectivity status vs Amsterdam DC exit dependency
- Stability incidents caused by network changes — any deployment pauses?

**Commitment integrity to validate:**
- Are site-level deployment commitments (dates, sequencing) held by infrastructure and site IT owners?
- Is vendor throughput (where applicable) meeting contracted delivery rates?
- Are cross-programme dependencies (DC Consolidation, Azure Consolidation) actively tracking against shared milestones?

---

### Execution Layer (Weekly)

**Drift to detect:**
- Sites completed this week vs required weekly burn
- Any site where deployment was scheduled but did not execute (slippage without notice)
- Stability incidents following deployments — any rollbacks or paused sites?
- 30 Apr sub-milestone: Azure/DD connectivity — is this on daily track?

**Early-warning indicator:**
Any week where actual site completions fall below the required weekly burn rate. Given the hard 30 June deadline and the number of sites remaining, a single week's deficit materially increases required throughput in subsequent weeks.

---

### Trigger Layer (Immediate)

**Watch — threshold:**
- Actual site completions < required weekly burn for **1 week**
- Any site deployment scheduled but not executed — **no rescheduled date confirmed within 48 hours**
- Stability incident causing deployment pause at **any site**

**Breached — threshold:**
- Actual site completions < required weekly burn for **2 consecutive weeks**
- 30 Apr milestone (Azure/DD connectivity) not confirmed complete by **30 April**
- Projected completion of all sites crosses **15 June** — insufficient buffer before 30 June hard deadline
- Amsterdam network connectivity not confirmed by **31 May** — Amsterdam DC exit at risk

---

### Control Layer (Chair)

**Governance drift risk:**
The programme review becomes a site-by-site status call. Individual site blockers are discussed at governance altitude rather than escalated to the accountable site owner. Cross-programme dependency tracking (Amsterdam DC, Azure) is absorbed into this programme's review rather than managed through cross-programme constraint governance.

**Behavioural failure to prevent:**
- Treating sub-deadline misses (30 Apr) as recoverable without recalculating the impact on subsequent phases
- Accepting vendor assurances without delivery evidence against committed site schedule
- Allowing stability incidents to pause governance tracking rather than triggering a formal capacity recalculation

**Chair self-check:**
- Is the review consuming time on individual site blockers, or on burn rate and milestone integrity?
- Are cross-programme dependencies (Amsterdam DC, Azure) being tracked at the cross-programme constraint level, not inside this programme's review?
- Is each sub-deadline treated as its own trigger event, not as a soft waypoint?

---

## SECTION 1 — Layer Map Summary Table

| Layer | Cadence | Posture Question | Level Artefact | Signal Artefact |
|---|---|---|---|---|
| Strategic | Quarterly | Is site burn rate sufficient to clear all sites before 30 Jun? | Sites remaining; projected completion | Weekly burn achievable; 30 Apr dependency status |
| Steering | Monthly | Are monthly completions on rate and dependencies intact? | Sites completed this month; sub-milestone status | Stability incidents; vendor throughput; cross-programme flags |
| Execution | Weekly | Is this week on rate? Any deployment pauses? | Completions this week vs required burn | Missed scheduled deployments; rollback events |
| Trigger | Immediate | Has a threshold been breached? | Trigger status: Green / Watch / Breached | Breach type: throughput / sub-deadline / stability / trajectory |
| Control | Monthly | Is governance at the right altitude? | Chair self-audit | Site-level discussion; cross-programme dependency absorption |

---

## SECTION 2 — Trigger Rule Definitions

| Rule ID | Type | Condition | Status |
|---|---|---|---|
| SDWAN-T1 | Throughput | Site completions < required weekly burn for 1 week | Watch |
| SDWAN-T2 | Throughput | Site completions < required weekly burn for 2 consecutive weeks | Breached |
| SDWAN-T3 | Stagnation | Scheduled deployment not executed; no rescheduled date within 48 hours | Watch |
| SDWAN-T4 | Stability | Deployment-related incident causes site pause | Watch → Breached if pause > 5 days |
| SDWAN-T5 | Sub-deadline | Azure/DD connectivity not confirmed by 30 April | Breached |
| SDWAN-T6 | Trajectory | Projected all-sites completion crosses 15 June | Breached |
| SDWAN-T7 | Dependency | Amsterdam network connectivity not confirmed by 31 May | Breached — DC exit at risk |

---

## SECTION 3 — Governance Failure Modes

| Failure Mode | Mechanism | Detection Point |
|---|---|---|
| Sub-deadline cascade | 30 Apr miss not treated as a breach; subsequent phases lose their technical foundation | Execution layer — 30 Apr milestone |
| Throughput compression | Weekly slippage accumulates; remaining sites require undeliverable burst rate | Execution layer — weekly burn check |
| Stability pause not recalculated | Deployment pause treated as temporary; burn model not updated to reflect lost capacity | Steering layer — monthly capacity review |
| Vendor assurance substituted for evidence | Vendor confirms schedule verbally; no delivery evidence against site plan | Steering layer — commitment integrity |
| Cross-programme dependency invisible | Amsterdam DC exit team assumes network connectivity; no confirmed handshake at governance level | Control layer — cross-programme constraint forum |

---

## SECTION 4 — What NOT to Track

- **Technical network configuration detail** — execution system content; not governance signal
- **Individual site infrastructure specifications** — irrelevant at governance altitude
- **Vendor contract terms** — legal/commercial domain; governance tracks delivery evidence only
- **Ticket-level deployment activity** — SNOW execution data; surface only on stagnation breach
- **Post-deployment optimisation activity** — out of scope for this programme's governance window

---

*End of TFEM Signal Architecture — SDWAN / Legacy Network Remediation v1.*
