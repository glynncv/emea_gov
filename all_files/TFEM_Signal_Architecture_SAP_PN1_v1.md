# TFEM Governance Signal Architecture
## Programme: SAP PN1 / S/4HANA Infrastructure

*Version:* v1
*Date:* 2026-03-03
*Framework:* TFEM Consolidated Reference v1 (Sections 3 & 4)
*Mode:* Architecture Brain — Signal architecture only. No tools. No dashboards. No OKRs. No actions.

---

## Programme Reference

**Classification:** Hard Deadline · Capacity Dependent · Stability Sensitive

**Objective Statement:**
Enable the SAP PN1 to Azure migration by delivering all required infrastructure foundations by 30 April 2026, and maintain infrastructure readiness to support the One ERP consolidation programme through to the 2028 target.

---

## Step 1 — Programme Type Implications

**What failure looks like:**
Infrastructure foundations are not ready by 30 April. The SAP tower's PN1 migration to Azure cannot proceed. This has a direct financial consequence — Azure Reservations Expire is flagged on the roadmap as a forcing function. A delayed migration extends the period of dual-cost exposure and risks stranding reserved capacity spend.

**What drift looks like first:**
Dependency drift. Infrastructure readiness is gated by the Azure tenant and landing zone programme (Programme 10). If Azure Consolidation slips its 30 April landing zone milestone, SAP PN1 Infrastructure readiness cannot be declared regardless of Infrastructure's own delivery pace. Infrastructure's failure may be inherited, not self-generated.

**Primary failure driver:**
Hard deadline driven with a critical inherited dependency. Infrastructure does not own the full delivery chain — it is an enabler programme. The SAP tower owns the migration; Infrastructure owns the foundation. A breach may be caused by Infrastructure, by the SAP tower schedule, or by the Azure programme failing to deliver the landing zones.

**Secondary failure driver:**
Stability-sensitive. Infrastructure changes supporting a production SAP environment carry the highest change-induced instability risk in the portfolio. Any incident in the migration window — network, compute, storage — pauses the SAP migration and potentially triggers a rollback.

**Structural constraint:**
Two distinct delivery horizons exist: 30 April 2026 (PN1 migration foundation) and 2028 (One ERP consolidation). These cannot share a single governance trigger model. Each horizon requires its own milestone set and trigger rules.

---

## Step 2 — TFEM Layers

### Strategic Layer (Quarterly)

**Posture question:**
Is Infrastructure on track to deliver all foundations required for the 30 April PN1 migration window, and is the 2028 ERP consolidation infrastructure roadmap sequenced correctly?

**Level artefact (2026 horizon):**
- Infrastructure readiness checklist: items confirmed complete vs total required for 30 April
- Azure landing zone dependency status (Programme 10 — 30 Apr milestone)
- DXC Data Center exit status — PN1 migration cannot proceed if DXC exit is delayed (Programme 9 dependency)

**Level artefact (2028 horizon):**
- Infrastructure consolidation milestones defined and scheduled
- Site migration sequencing plan confirmed

**Signal artefact:**
- Is the Azure landing zone dependency on track to be confirmed by 30 April?
- Are there any Infrastructure-owned readiness items at risk of slipping past 30 April?
- Is the Azure Reservation expiry date confirmed and is the migration window timed to avoid stranded cost?

---

### Steering Layer (Monthly)

**Health signals:**
- Infrastructure readiness items completed vs required for 30 April
- Azure landing zone confirmation (Programme 10 milestone dependency)
- DXC exit progress (Programme 9 milestone dependency)
- PN1 Cutover date — confirmed and aligned with Infrastructure readiness completion
- Azure Reservation expiry date — confirmed and migration window compliant?

**Commitment integrity to validate:**
- Is the SAP tower's migration schedule aligned to Infrastructure's confirmed readiness date?
- Is the Azure Consolidation programme confirmed to deliver landing zones by 30 April?
- Are financial forcing functions (reservation expiry, DXC contract terms) formally in the governance model?

---

### Execution Layer (Weekly)

**Drift to detect:**
- Infrastructure readiness items: any item with no progress for 14+ days in the 30 Apr delivery window
- Azure landing zone programme: weekly progress confirmation from Programme 10
- DXC exit: weekly progress confirmation from Programme 9
- Any stability incident in production SAP infrastructure — change freeze risk

**Early-warning indicator:**
Any Infrastructure readiness item not confirmed complete by **31 March** — one month before the 30 April deadline. Given the integration complexity of production SAP environments, a 4-week buffer is the minimum viable recovery window.

---

### Trigger Layer (Immediate)

**Watch — threshold:**
- Any Infrastructure readiness item not complete by **31 March**
- Azure landing zone programme (Programme 10) not confirmed on track for 30 April — inherited dependency at risk
- Stability incident in production SAP infrastructure environment

**Breached — threshold:**
- Any Infrastructure readiness item not complete by **30 April**
- Azure landing zone milestone missed — PN1 migration window cannot open
- DXC exit delayed past 30 April — PN1 migration foundation incomplete
- Azure Reservation expiry date confirmed to precede migration completion — financial exposure triggered
- PN1 Cutover date moved without confirmed Infrastructure readiness re-baseline

---

### Control Layer (Chair)

**Governance drift risk:**
Because Infrastructure is an enabler programme, the governance review gravitates toward the SAP tower's migration schedule rather than Infrastructure's own readiness delivery. Infrastructure's programme gets consumed into the SAP programme review and loses independent governance accountability.

**Behavioural failure to prevent:**
- Treating inherited dependency failures (Azure, DXC) as outside Infrastructure's governance responsibility — inherited dependencies must be escalated, not accepted
- Conflating the 30 April 2026 horizon and the 2028 horizon under a single programme review — each requires separate milestone tracking and trigger rules
- Allowing the Azure Reservation expiry date to remain unconfirmed in the governance model

**Chair self-check:**
- Does Infrastructure have a confirmed readiness checklist with owner and completion date for each item?
- Are the Azure and DXC programme dependencies formally tracked as inherited risks, with escalation owners named?
- Are the two delivery horizons (2026 and 2028) governed separately?

---

## SECTION 1 — Layer Map Summary Table

| Layer | Cadence | Posture Question | Level Artefact | Signal Artefact |
|---|---|---|---|---|
| Strategic | Quarterly | Is Infrastructure readiness on track for 30 Apr? Is 2028 roadmap sequenced? | Readiness items complete; dependency status | Inherited dependency risk; reservation expiry alignment |
| Steering | Monthly | Are readiness items progressing and dependencies confirmed? | Items completed; Azure/DXC milestone status | SAP tower alignment; financial forcing function status |
| Execution | Weekly | Any readiness items stalling? Dependencies drifting? | Items with no progress ≥ 14 days; dependency weekly check | 31 Mar early warning; stability incidents |
| Trigger | Immediate | Has a threshold been breached? | Trigger status: Green / Watch / Breached | Breach type: readiness / dependency / financial / stability |
| Control | Monthly | Is Infrastructure governed independently from SAP tower? | Chair self-audit | SAP absorption; horizon conflation; reservation expiry gap |

---

## SECTION 2 — Trigger Rule Definitions

| Rule ID | Type | Condition | Status |
|---|---|---|---|
| SAP-T1 | Readiness | Any Infrastructure readiness item not complete by 31 March | Watch |
| SAP-T2 | Readiness | Any Infrastructure readiness item not complete by 30 April | Breached |
| SAP-T3 | Dependency | Azure landing zone programme (P10) not confirmed on track for 30 April | Watch |
| SAP-T4 | Dependency | Azure landing zone milestone missed | Breached — PN1 migration window blocked |
| SAP-T5 | Dependency | DXC exit delayed past 30 April | Breached |
| SAP-T6 | Financial | Azure Reservation expiry confirmed to precede migration completion | Breached — immediate escalation |
| SAP-T7 | Stability | Stability incident in production SAP infrastructure | Watch → Breached if change freeze imposed |
| SAP-T8 | Milestone | PN1 Cutover date moved without confirmed Infrastructure re-baseline | Breached |

---

## SECTION 3 — Governance Failure Modes

| Failure Mode | Mechanism | Detection Point |
|---|---|---|
| Inherited dependency accepted passively | Azure or DXC programme slips; Infrastructure treats it as outside its accountability; no escalation | Steering layer — dependency status |
| Horizon conflation | 2026 and 2028 objectives tracked together; 30 Apr urgency diluted by 2028 long-horizon narrative | Control layer — chair self-audit |
| SAP tower absorption | Infrastructure programme review merged into SAP migration governance; Infrastructure loses independent accountability | Control layer — chair self-audit |
| Financial forcing function invisible | Azure Reservation expiry not in the governance model; migration timing not validated against cost exposure | Steering layer — financial forcing function check |
| Stability freeze not reflected | Change freeze following incident not reflected in delivery model; readiness timeline unchanged | Execution layer — stability incident tracking |

---

## SECTION 4 — What NOT to Track

- **SAP migration technical detail** — SAP tower ownership; not Infrastructure governance
- **Azure configuration or architecture** — Azure Consolidation programme (P10) ownership
- **DXC contract commercial terms** — commercial domain; track exit milestone completion only
- **ERP business process standardisation** — business programme domain; irrelevant to Infrastructure governance
- **2028 ERP consolidation detail** — 2028 horizon requires a separate governance cycle; not part of 2026 programme governance

---

*End of TFEM Signal Architecture — SAP PN1 / S/4HANA Infrastructure v1.*
