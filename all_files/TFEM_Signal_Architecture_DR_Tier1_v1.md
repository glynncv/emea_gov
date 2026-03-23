# TFEM Governance Signal Architecture
## Programme: Disaster Recovery — Tier 1 Apps

*Version:* v1
*Date:* 2026-03-03
*Framework:* TFEM Consolidated Reference v1 (Sections 3 & 4)
*Mode:* Architecture Brain — Signal architecture only. No tools. No dashboards. No OKRs. No actions.

---

## Programme Reference

**Classification:** Exposure Window · Capacity Dependent

**Objective Statement:**
Close the DR exposure for all Tier 1 Infrastructure applications by ensuring full plans exist and annual tests are completed in line with policy by 31 December 2026.

---

## Step 1 — Programme Type Implications

**What failure looks like:**
Year-end arrives with a subset of Tier 1 applications having no tested DR plan. The exposure is not discovered through a governance trigger — it surfaces during an actual incident or audit. No hard external deadline creates a false sense of safety throughout the year.

**What drift looks like first:**
Stagnation drift. Applications are scoped, owners are identified, but plan documentation and test scheduling stall. Progress is assumed because conversations are happening; actual plan completion is not tracked against a throughput rate.

**Primary failure driver:**
Stagnation-driven. Without a hard deadline forcing urgency, individual application owners deprioritise DR planning in favour of operational work. The programme drifts silently across all quarters with no forcing function.

**Secondary failure driver:**
Scope uncertainty. "All Tier 1" is undefined at time of analysis. If the application list is not fixed early, scope additions late in the year inflate remaining work against a fixed deadline.

---

## Step 2 — TFEM Layers

### Strategic Layer (Quarterly)

**Posture question:**
Is the DR exposure being closed at a rate that ensures full Tier 1 coverage before year-end, and is the application scope stable?

**Level artefact:**
- Total Tier 1 applications in scope
- Applications with completed DR plans
- Applications with completed annual DR tests
- Applications with no plan initiated

**Signal artefact:**
- Is the rate of plan completion sufficient to complete all remaining applications before the test scheduling window closes?
- Has scope changed (new Tier 1 applications identified) and has the completion model been updated?

---

### Steering Layer (Monthly)

**Health signals:**
- Plans completed this month vs required monthly rate
- Tests scheduled and completed vs plans completed (lag indicator)
- Applications with no activity in the past 30 days (stagnation flag)
- Scope confirmation: Tier 1 application list reviewed and locked?

**Commitment integrity to validate:**
- Are application owners delivering plans on the committed schedule?
- Is test scheduling progressing in step with plan completion, or is a test backlog accumulating?
- Is the scope list formally owned and change-controlled?

---

### Execution Layer (Weekly)

**Drift to detect:**
- Any application with no plan progress for 14 or more days
- Test scheduling falling behind plan completion rate — backlog forming
- New Tier 1 applications identified but not yet added to the scope register

**Early-warning indicator:**
Two or more applications showing no activity for 14 days simultaneously. Individual stagnation is manageable; concurrent stagnation across multiple applications indicates a systemic capacity or prioritisation failure.

---

### Trigger Layer (Immediate)

**Watch — threshold:**
- Any single application with no DR plan progress for **14 days**
- Test backlog exceeds **3 applications** (plans complete but tests not scheduled)
- Scope list not confirmed by **end of Q1**

**Breached — threshold:**
- Any application with no DR plan progress for **30 days**
- Projected completion of all plans crosses **30 September** — insufficient time to complete testing before year-end
- Scope addition in Q3 or later that cannot be absorbed without pushing completion beyond 31 Dec

---

### Control Layer (Chair)

**Governance drift risk:**
The programme is managed as an administrative tracking exercise — plan documents are chased individually, test dates are negotiated application by application. Governance altitude drops to coordination and chasing rather than throughput monitoring and stagnation escalation.

**Behavioural failure to prevent:**
- Accepting "in progress" status without a plan completion date and test scheduled date
- Allowing the test phase to be deferred until all plans are complete — tests must run concurrently with plan completion, not sequentially after
- Treating scope ambiguity as acceptable — "we'll define Tier 1 as we go" is a stagnation enabler

**Chair self-check:**
- Is the review focused on completion rates and stagnation flags, or on the content of individual plans?
- Is testing being tracked as a parallel workstream, or assumed to follow automatically from plan completion?
- Is the Tier 1 application list formally locked and change-controlled?

---

## SECTION 1 — Layer Map Summary Table

| Layer | Cadence | Posture Question | Level Artefact | Signal Artefact |
|---|---|---|---|---|
| Strategic | Quarterly | Is DR exposure closing at sufficient rate across stable scope? | Plans complete; tests complete; applications with no activity | Completion rate vs required pace; scope stability |
| Steering | Monthly | Are owners delivering and is testing keeping pace? | Plans completed this month; test backlog count | Stagnation flags; scope lock status |
| Execution | Weekly | Are any applications stalling? | Applications with no activity ≥ 14 days | Concurrent stagnation count; test scheduling lag |
| Trigger | Immediate | Has a threshold been breached? | Trigger status: Green / Watch / Breached | Breach type: stagnation / test backlog / scope / trajectory |
| Control | Monthly | Is governance at the right altitude? | Chair self-audit | Coordination substitution; sequential vs parallel test assumption |

---

## SECTION 2 — Trigger Rule Definitions

| Rule ID | Type | Condition | Status |
|---|---|---|---|
| DR-T1 | Stagnation | Single application: no plan progress for ≥ 14 days | Watch |
| DR-T2 | Stagnation | Single application: no plan progress for ≥ 30 days | Breached |
| DR-T3 | Test backlog | Plans complete but tests not scheduled: ≥ 3 applications | Watch |
| DR-T4 | Scope | Tier 1 application list not confirmed by end of Q1 | Watch |
| DR-T5 | Trajectory | Projected plan completion crosses 30 September | Breached — insufficient test window |
| DR-T6 | Scope | New Tier 1 application added Q3 or later; cannot be absorbed by 31 Dec | Breached |

---

## SECTION 3 — Governance Failure Modes

| Failure Mode | Mechanism | Detection Point |
|---|---|---|
| Stagnation across the portfolio | No hard deadline; application owners deprioritise; plans stall mid-draft | Execution layer — 14-day stagnation flag |
| Test phase collapsed | All testing deferred until all plans complete; Q4 test window is insufficient | Steering layer — test backlog count |
| Scope drift | New Tier 1 applications identified late; completion model not updated | Strategic layer — quarterly scope review |
| Completion assumed from activity | Owners report "in progress"; no plan or test completion date confirmed | Steering layer — commitment integrity check |
| Governance as coordination | Chair chases individual owners; throughput rate not monitored | Control layer — chair self-audit |

---

## SECTION 4 — What NOT to Track

- **DR plan content or quality** — this is an ownership matter, not a governance signal
- **Technical test methodology** — execution detail; not relevant at governance altitude
- **Application architecture or recovery time objectives** — input to plan design, not programme governance
- **Individual test results** — pass/fail is an operational outcome; governance tracks completion, not content
- **Narrative progress updates** — status commentary is not a governance artefact

---

*End of TFEM Signal Architecture — Disaster Recovery Tier 1 Apps v1.*
