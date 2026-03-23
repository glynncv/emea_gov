# TFEM Governance Signal Architecture
## Programme: Azure Cloud Consolidation

*Version:* v1
*Date:* 2026-03-03
*Framework:* TFEM Consolidated Reference v1 (Sections 3 & 4)
*Mode:* Architecture Brain — Signal architecture only. No tools. No dashboards. No OKRs. No actions.

---

## Programme Reference

**Classification:** Hard Deadline · Capacity Dependent · Stability Sensitive

**Objective Statement:**
Consolidate PHINIA's cloud estate from two environments to a single Azure tenant by standing up 8 regional landing zones by 30 April 2026 and completing full migration of all DelphiDrive workloads by 31 March 2027.

---

## Step 1 — Programme Type Implications

**What failure looks like:**
Phase 1 (landing zone standup) misses 30 April. Three dependent programmes — SDWAN Azure connectivity, SAP PN1 infrastructure, and Data Center Consolidation — lose their shared foundational milestone simultaneously. Phase 2 (DelphiDrive migration) drifts through H2 2026 with no burn rate model; year-end review shows significant workloads still on DelphiDrive, dual-cloud cost running, and Azure Reservation expiry approaching.

**What drift looks like first:**
Phase 1: technical configuration delays in landing zone standup. Individual regions are slower than planned; the 8-region target is partially complete by 30 April with 2–3 regions still outstanding. Phase 2: workload migration throughput falls below the required rate in H2 2026 as project team attention shifts to other year-end programmes.

**Primary failure driver:**
Hard deadline driven for Phase 1 (30 Apr) — this is the most critical milestone in the entire 2026 infrastructure portfolio given its cross-programme dependency count. Phase 2 is throughput-driven against a March 2027 outer deadline with no seasonal forcing function, creating stagnation risk in Q3–Q4.

**Secondary failure driver:**
Financial forcing function. Azure Reservation expiry is flagged on the roadmap but not dated in the deck. If the reservation expires before DelphiDrive migration is complete, PHINIA pays for unused reserved capacity while also paying DelphiDrive operational costs. The expiry date must be confirmed and built into the governance model.

---

## Step 2 — TFEM Layers

### Strategic Layer (Quarterly)

**Posture question (Phase 1):**
Are all 8 regional landing zones on track for confirmation by 30 April, and are dependent programmes (SDWAN, SAP PN1, DC Consolidation) formally notified of Phase 1 status?

**Posture question (Phase 2):**
Is the DelphiDrive workload migration throughput sufficient to complete full exit before Azure Reservation expiry and by 31 March 2027?

**Level artefact:**
- Phase 1: Landing zones confirmed live vs 8 total; projected all-regions completion date
- Phase 2: Workloads migrated from DelphiDrive vs total; projected completion date; Azure Reservation expiry date confirmed

**Signal artefact:**
- Phase 1: Any region behind schedule — cross-programme dependency risk
- Phase 2: Weekly migration throughput vs required burn; dual-cloud cost accumulation rate; reservation expiry proximity

---

### Steering Layer (Monthly)

**Health signals (Phase 1):**
- Regions confirmed live this month vs required pace
- Dependent programme notifications: SDWAN, SAP PN1, DC Consolidation — confirmed Phase 1 on track?
- Any technical blocker delaying a region's standup

**Health signals (Phase 2):**
- Workloads migrated from DelphiDrive this month vs required monthly rate
- Stability incidents following cloud migrations — any rollbacks?
- Azure Reservation expiry date — confirmed and in governance model
- Dual-cloud cost accumulation — is it being tracked as a financial signal?

**Commitment integrity to validate:**
- Is Phase 1 completion formally committed with a named owner per region?
- Is the DelphiDrive total workload count confirmed — are there undiscovered workloads?
- Is Azure Reservation expiry date formally confirmed and is the migration window compliant?

---

### Execution Layer (Weekly)

**Drift to detect (Phase 1):**
- Regions confirmed live this week vs required weekly pace
- Any region with no progress for 7 days — Phase 1 has a hard 30 Apr deadline with no buffer
- Dependent programme leads notified of any Phase 1 delay within 24 hours

**Drift to detect (Phase 2):**
- Workloads migrated this week vs required weekly burn rate
- Any workload category where migration has stalled for 14+ days
- Stability incident following any migration

**Early-warning indicator (Phase 1):**
Any region not confirmed live by **31 March**. With 30 days to the hard deadline, an incomplete region at 31 March is a breach-risk signal — dependency programmes must be notified immediately.

---

### Trigger Layer (Immediate)

**Watch — threshold (Phase 1):**
- Any region not confirmed live by **31 March**
- Any region with no technical progress for **7 days** prior to 31 March

**Breached — threshold (Phase 1):**
- Any region not confirmed live by **30 April**
- Phase 1 milestone missed — all dependent programmes (SDWAN, SAP PN1, DC Consolidation) enter immediate breach assessment

**Watch — threshold (Phase 2):**
- Workload migration rate < required weekly burn for **1 week**
- Azure Reservation expiry date not confirmed in governance model by **end of Q2**

**Breached — threshold (Phase 2):**
- Workload migration rate < required weekly burn for **2 consecutive weeks**
- Azure Reservation expiry confirmed to precede projected migration completion
- Projected full DelphiDrive exit crosses **31 December 2026** — Phase 2 completion pushed into Q1 2027 without a recovery plan

---

### Control Layer (Chair)

**Governance drift risk:**
Phase 1 and Phase 2 are treated as a single programme with a single governance cycle, obscuring the urgency differential. Phase 1's 30 April hard deadline gets diluted by Phase 2's 2027 horizon. The Azure Reservation expiry date remains unconfirmed in the governance model because it is treated as a commercial matter rather than a financial forcing function.

**Behavioural failure to prevent:**
- Treating Phase 1 and Phase 2 as equal-urgency workstreams — Phase 1 is the most cross-programme-critical milestone in the 2026 portfolio
- Accepting Azure Reservation expiry as "being handled" without a confirmed date and migration compliance check
- Allowing DelphiDrive migration to drift in H2 without a standing weekly burn rate trigger

**Chair self-check:**
- Are Phase 1 and Phase 2 reviewed with separate posture questions and separate trigger rules?
- Is the Azure Reservation expiry date confirmed and formally in the governance model?
- Are dependent programme leads (SDWAN, SAP PN1, DC Consolidation) formally notified of Phase 1 status at each steering cycle?

---

## SECTION 1 — Layer Map Summary Table

| Layer | Cadence | Posture Question | Level Artefact | Signal Artefact |
|---|---|---|---|---|
| Strategic | Quarterly | Phase 1: all 8 regions on track? Phase 2: migration throughput sufficient? | Regions live; workloads migrated; expiry date confirmed | Cross-programme dependency risk; dual-cloud cost; reservation compliance |
| Steering | Monthly | Phase 1: regions progressing? Dependencies notified? Phase 2: throughput holding? | Regions live this month; workloads migrated; stability incidents | Blockers per region; expiry gap; Phase 2 burn rate |
| Execution | Weekly | Phase 1: any region stalling? Phase 2: on rate? | Regions confirmed live; workloads migrated vs burn | 31 Mar warning; stability incidents; dependent programme notification |
| Trigger | Immediate | Has a threshold been breached? | Trigger status: Green / Watch / Breached | Breach type: Phase 1 deadline / Phase 2 throughput / financial / stability |
| Control | Monthly | Are Phase 1 and Phase 2 governed separately? | Chair self-audit | Urgency dilution; expiry date gap; dependency notification discipline |

---

## SECTION 2 — Trigger Rule Definitions

| Rule ID | Type | Condition | Status |
|---|---|---|---|
| AZ-T1 | Phase 1 trajectory | Any region not confirmed live by 31 March | Watch — dependent programmes notified |
| AZ-T2 | Phase 1 deadline | Any region not confirmed live by 30 April | Breached — all dependent programmes enter breach assessment |
| AZ-T3 | Phase 1 stagnation | Any region: no technical progress for 7 days prior to 31 March | Watch |
| AZ-T4 | Phase 2 throughput | Workload migration rate < required weekly burn for 1 week | Watch |
| AZ-T5 | Phase 2 throughput | Workload migration rate < required weekly burn for 2 consecutive weeks | Breached |
| AZ-T6 | Financial | Azure Reservation expiry date not confirmed in governance model by end of Q2 | Watch |
| AZ-T7 | Financial | Azure Reservation expiry confirmed to precede projected migration completion | Breached — immediate escalation |
| AZ-T8 | Phase 2 trajectory | Projected full DelphiDrive exit crosses 31 December 2026 without recovery plan | Breached |
| AZ-T9 | Stability | Migration-related incident causes workload rollback | Watch → Breached if freeze > 10 days |

---

## SECTION 3 — Governance Failure Modes

| Failure Mode | Mechanism | Detection Point |
|---|---|---|
| Phase 1 urgency diluted by Phase 2 horizon | 30 Apr hard deadline treated as less urgent because 31 Mar 2027 is the "outer" deadline | Control layer — chair self-audit |
| Cross-programme dependency cascade | Phase 1 miss not immediately escalated to SDWAN, SAP PN1, DC Consolidation programmes | Execution layer — dependent programme notification |
| Azure Reservation expiry invisible | Expiry date not confirmed; migration timeline not validated against financial forcing function | Steering layer — financial trigger |
| DelphiDrive migration drift | No weekly burn rate applied to Phase 2; migration "in progress" accepted without physics | Execution layer — Phase 2 weekly burn check |
| Undiscovered workloads | DelphiDrive workload count not formally confirmed; late-discovered workloads inflate scope | Strategic layer — quarterly scope review |

---

## SECTION 4 — What NOT to Track

- **Azure architecture or configuration detail** — technical ownership; not governance signal
- **Individual workload technical specifications** — execution domain; not governance altitude
- **Cloud cost optimisation detail** — post-migration operational domain; separate from migration programme governance
- **Region-specific infrastructure design** — technical delivery; surface only on stagnation breach
- **DelphiDrive workload performance pre-migration** — operational metric; not programme governance

---

*End of TFEM Signal Architecture — Azure Cloud Consolidation v1.*
