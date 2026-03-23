# TFEM Governance Signal Architecture
## Programme: Acquisition Integration

*Version:* v1
*Date:* 2026-03-03
*Framework:* TFEM Consolidated Reference v1 (Sections 3 & 4)
*Mode:* Architecture Brain — Signal architecture only. No tools. No dashboards. No OKRs. No actions.

---

## Programme Reference

**Classification:** Exposure Window · Capacity Dependent

**Objective Statement:**
Ensure Infrastructure integration readiness for any 2026 board-approved acquisition by maintaining a current playbook covering Day 1, Day 100, and Day 365 activities, and executing against it upon acquisition trigger.

---

## Step 1 — Programme Type Implications

**What failure looks like:**
A board-approved acquisition triggers Day 1 connectivity requirements without a current playbook. Infrastructure responds in reactive mode — improvising based on SEM learnings rather than a documented methodology. Day 1 is delivered inconsistently. Day 365 integration extends beyond 12 months because the integration scope was not defined at Day 1. Each slip extends PHINIA's exposure from an incompletely integrated entity.

**What drift looks like first:**
Playbook currency drift. The playbook update (incorporating SEM learnings) is not completed before an acquisition triggers. The standing governance item — playbook readiness — has no delivery deadline and is therefore perpetually "in progress." When an acquisition triggers, Infrastructure discovers the playbook is incomplete.

**Primary failure driver:**
Two distinct failure modes, sequentially:
1. **Pre-trigger:** Stagnation-driven. The playbook update has no forcing function and drifts without escalation.
2. **Post-trigger:** Throughput-driven. Once an acquisition is active, Day 1 has a hard external deadline (acquisition close date). Day 365 integration has a 12-month exposure window per acquisition. Capacity stacking risk exists if multiple acquisitions are board-approved simultaneously.

**Governance mode:** Trigger-activated. The standing programme exists in two states — **Readiness mode** (pre-acquisition: playbook currency) and **Execution mode** (post-acquisition: Day 1 / Day 365 delivery). Separate governance logic applies to each state.

---

## Step 2 — TFEM Layers

### Strategic Layer (Quarterly) — Readiness Mode

**Posture question:**
Is the acquisition integration playbook current, formally baselined, and ready to activate on board approval?

**Level artefact:**
- Playbook update status: SEM learnings incorporated? Day 1, Day 100, Day 365 sections complete?
- Playbook formally reviewed and approved by Infrastructure leadership?
- Number of board-approved acquisitions in the pipeline (if known)

**Signal artefact:**
- Is the playbook update progressing toward a confirmed completion date, or drifting without a milestone?
- Is Infrastructure capacity for a potential acquisition trigger confirmed — or would activation create a capacity conflict with standing programmes?

### Strategic Layer (Quarterly) — Execution Mode (post-trigger)

**Posture question:**
Is Day 1 connectivity delivered on the acquisition close date, and is Day 365 integration on trajectory within the 12-month window?

**Level artefact:**
- Day 1 milestones: network connectivity, AD, PHINIA email, O365, Connect, CrowdStrike — each confirmed complete?
- Day 365 integration: Tier 1 and Tier 2 application integration completion percentage vs 12-month window

**Signal artefact:**
- Is Day 365 integration throughput sufficient to complete within the 12-month window?
- If multiple acquisitions are active: is capacity stacking creating a throughput shortfall?

---

### Steering Layer (Monthly) — Readiness Mode

**Health signals:**
- Playbook update progress: sections completed vs total
- SEM learnings formally incorporated — confirmation status
- Playbook review and approval: scheduled and confirmed?

**Commitment integrity to validate:**
- Is there a named owner for the playbook update with a confirmed completion date?
- Is the completion date set before any known or probable acquisition trigger?

### Steering Layer (Monthly) — Execution Mode

**Health signals:**
- Day 1 milestone completion status per acquisition
- Day 365 integration: monthly throughput vs required rate per acquisition
- Capacity allocation: is integration capacity confirmed and not in conflict with standing programmes?

---

### Execution Layer (Weekly) — Readiness Mode

**Drift to detect:**
- Playbook update sections with no progress for 14+ days
- SEM learnings incorporation stalled

**Early-warning indicator:**
Playbook update not confirmed complete by **end of Q1**. If an acquisition triggers before the playbook is updated, Infrastructure enters Execution mode without a current methodology.

### Execution Layer (Weekly) — Execution Mode

**Drift to detect:**
- Day 1 milestone not confirmed complete on acquisition close date
- Day 365 integration: weekly completions below required burn rate
- Any Tier 1 or Tier 2 integration item stagnant for 14+ days

---

### Trigger Layer — Readiness Mode

**Watch — threshold:**
- Playbook update not confirmed complete by **end of Q1**
- Any playbook section with no progress for **14 days**

**Breached — threshold:**
- Acquisition trigger occurs with playbook not confirmed current
- Playbook not confirmed complete and approved by **30 June** — second half of year acquisition risk window unprotected

### Trigger Layer — Execution Mode

**Watch — threshold:**
- Any Day 1 milestone not confirmed complete on acquisition close date
- Day 365 integration throughput < required weekly burn for **1 week**
- Second acquisition board-approved while first acquisition integration is active — capacity stacking signal

**Breached — threshold:**
- Day 1 connectivity not fully delivered within **5 days** of acquisition close
- Day 365 integration throughput < required weekly burn for **2 consecutive weeks**
- Projected Day 365 completion crosses **month 15** — integration extending beyond exposure window
- Capacity stacking: combined integration demand exceeds confirmed Infrastructure capacity

---

### Control Layer (Chair)

**Governance drift risk:**
The programme exists in Readiness mode indefinitely without a forcing function. The playbook update is acknowledged as "ongoing" but has no trigger-managed completion date. When an acquisition triggers, the governance switch from Readiness to Execution mode is not formally executed — the programme continues to be reported in Readiness mode terms while Execution has already begun.

**Behavioural failure to prevent:**
- Treating the playbook update as a standing housekeeping item rather than a trigger-managed milestone
- Failing to formally switch governance mode on acquisition trigger — both states must be explicitly managed
- Accepting capacity stacking risk as a known issue without a formal escalation plan when a second acquisition triggers

**Chair self-check:**
- Is the playbook update governed with a completion milestone and named owner, or reported as "ongoing"?
- Is there a confirmed governance mode switch protocol — what formally triggers the move from Readiness to Execution?
- Is the capacity stacking risk formally modelled — what is Infrastructure's maximum concurrent acquisition integration capacity?

---

## SECTION 1 — Layer Map Summary Table

| Mode | Layer | Cadence | Posture Question | Level Artefact | Signal Artefact |
|---|---|---|---|---|---|
| Readiness | Strategic | Quarterly | Is playbook current and activation-ready? | Playbook completion status; approval status | Update pace; capacity for trigger |
| Readiness | Steering | Monthly | Is update progressing? Is there a named owner? | Sections complete; owner confirmed | Progress stagnation; completion date confirmed |
| Readiness | Execution | Weekly | Any sections stalling? | Sections with no progress ≥ 14 days | Q1 completion risk |
| Execution | Strategic | Quarterly | Day 1 delivered? Day 365 on trajectory? | Day 1 milestones; Day 365 throughput | Capacity stacking; integration window compliance |
| Execution | Steering | Monthly | Is integration throughput on rate? | Monthly completions; capacity allocation | Stagnation flags; second acquisition trigger |
| Execution | Execution | Weekly | Is Day 365 integration on rate? Any stalls? | Completions vs required burn | Tier 1/2 stagnation; Day 1 overdue |

---

## SECTION 2 — Trigger Rule Definitions

| Rule ID | Mode | Type | Condition | Status |
|---|---|---|---|---|
| ACQ-T1 | Readiness | Stagnation | Playbook section: no progress for ≥ 14 days | Watch |
| ACQ-T2 | Readiness | Milestone | Playbook not confirmed complete and approved by end of Q1 | Watch |
| ACQ-T3 | Readiness | Milestone | Playbook not confirmed complete and approved by 30 June | Breached |
| ACQ-T4 | Readiness | Trigger | Acquisition trigger occurs with playbook not current | Breached — immediate mode switch and escalation |
| ACQ-T5 | Execution | Day 1 | Any Day 1 milestone not confirmed on acquisition close date | Watch |
| ACQ-T6 | Execution | Day 1 | Day 1 connectivity not fully delivered within 5 days of close | Breached |
| ACQ-T7 | Execution | Throughput | Day 365 integration < required weekly burn for 1 week | Watch |
| ACQ-T8 | Execution | Throughput | Day 365 integration < required weekly burn for 2 consecutive weeks | Breached |
| ACQ-T9 | Execution | Capacity | Second acquisition board-approved while first active | Watch — capacity stacking assessment required |
| ACQ-T10 | Execution | Trajectory | Projected Day 365 completion crosses month 15 | Breached |

---

## SECTION 3 — Governance Failure Modes

| Failure Mode | Mode | Mechanism | Detection Point |
|---|---|---|---|
| Playbook currency drift | Readiness | No forcing function; update reported as ongoing; never formally completed | Steering layer — completion milestone |
| Mode switch failure | Transition | Acquisition triggers; governance does not formally switch; Readiness reporting continues | Control layer — chair self-audit |
| Day 1 improvisation | Execution | Playbook not current; Day 1 delivered from memory/SEM experience; inconsistent outcomes | Trigger layer — ACQ-T4 |
| Capacity stacking invisible | Execution | Second acquisition active; no formal capacity model; both integrations degrade | Trigger layer — ACQ-T9 |
| Day 365 drift | Execution | No weekly burn rate applied; integration "in progress" accepted; window expires | Execution layer — weekly throughput check |

---

## SECTION 4 — What NOT to Track

- **Acquisition commercial or legal terms** — M&A domain; not Infrastructure governance
- **Due diligence findings** — M&A domain; Infrastructure governance begins at board approval
- **Acquired entity's existing IT environment detail** — input to integration planning; not standing programme governance
- **Day 1 technical configuration detail** — execution domain; governance tracks milestone confirmation only
- **Integration project management detail** — delivery team accountability; governance tracks throughput and stagnation signals only

---

*End of TFEM Signal Architecture — Acquisition Integration v1.*
