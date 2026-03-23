# TFEM Governance Signal Architecture
## Programme: One PHINIA ID

*Version:* v1
*Date:* 2026-03-03
*Framework:* TFEM Consolidated Reference v1 (Sections 3 & 4)
*Mode:* Architecture Brain — Signal architecture only. No tools. No dashboards. No OKRs. No actions.

---

## Programme Reference

**Classification:** Hard Deadline · Stability Sensitive

**Objective Statement:**
Close the fragmented identity exposure for critical applications by delivering a single PHINIA ID across all in-scope critical applications by 31 July 2026.

---

## Step 1 — Programme Type Implications

**What failure looks like:**
31 July arrives with a subset of critical applications still operating on fragmented identity. The programme is declared partially complete. Remaining applications carry both security exposure and operational complexity into H2 2026, with no forcing function for completion.

**What drift looks like first:**
Scope drift and stagnation. The critical application list is not confirmed at time of analysis. Without a locked scope, the programme cannot build a delivery model. Applications are onboarded to the identity platform gradually with no throughput target — progress is assumed because activity is happening, not because physics confirm it.

**Primary failure driver:**
Stagnation-driven, compounded by scope ambiguity. Without a confirmed application count, a required burn rate cannot be set. Without a burn rate, drift is undetectable until it is too late to recover before 31 July.

**Secondary failure driver:**
Stability-sensitive. Identity changes on production critical applications carry direct operational risk. A failed identity migration on a Tier 1 application creates an incident, a rollback, and a potential change freeze — removing that application from the delivery window for weeks.

**Structural constraint:**
This programme appears on both the headline outcomes slide and the goals table with different owners potentially implied (cross-tower scope noted in analysis). Infrastructure ownership boundary must be confirmed before delivery physics can be applied.

---

## Step 2 — TFEM Layers

### Strategic Layer (Quarterly)

**Posture question:**
Is the critical application list confirmed and is the onboarding rate sufficient to complete all in-scope applications by 31 July?

**Level artefact:**
- Total critical applications in scope (must be formally locked)
- Applications onboarded to PHINIA ID
- Applications remaining
- Projected completion date at current onboarding rate

**Signal artefact:**
- Is the required weekly onboarding rate achievable in the weeks remaining before 31 July?
- Is scope stable — no new critical applications added without corresponding capacity adjustment?
- Has any stability incident paused an application onboarding and removed it from the delivery window?

---

### Steering Layer (Monthly)

**Health signals:**
- Applications onboarded this month vs required monthly rate
- Applications with no onboarding activity in the past 30 days — stagnation flag
- Stability incidents following identity changes — any rollbacks?
- Scope lock status: is the critical application list formally confirmed and change-controlled?

**Commitment integrity to validate:**
- Are application owners engaging with the onboarding process on schedule?
- Is rollback planning confirmed for each application before onboarding proceeds?
- Is Infrastructure's ownership boundary formally defined relative to other towers involved in this programme?

---

### Execution Layer (Weekly)

**Drift to detect:**
- Applications onboarded this week vs required weekly burn
- Any application where onboarding was scheduled but did not proceed — stagnation signal
- Stability incident following any identity change — rollback triggered?
- Applications approaching scheduled onboarding date without owner confirmation

**Early-warning indicator:**
Any application where a scheduled onboarding is deferred without a confirmed replacement date within 48 hours. Given the 31 July hard deadline, deferred onboardings without immediate rescheduling compress the delivery window.

---

### Trigger Layer (Immediate)

**Watch — threshold:**
- Applications onboarded < required weekly burn for **1 week**
- Any application: scheduled onboarding deferred without confirmed replacement date within **48 hours**
- Scope list not formally confirmed by **end of Q1**

**Breached — threshold:**
- Applications onboarded < required weekly burn for **2 consecutive weeks**
- Any application with no onboarding activity for **30 days**
- Stability incident (rollback) on a critical application — application removed from delivery window
- Projected completion crosses **15 June** — insufficient time to resolve stability incidents and complete remaining applications before 31 July
- Infrastructure ownership boundary unconfirmed by **end of Q1** — programme cannot be governed without this

---

### Control Layer (Chair)

**Governance drift risk:**
The programme review is consumed by discussions about individual application complexity, rollback risk, and application owner engagement. The chair begins managing application-owner relationships directly. Scope ambiguity is tolerated as a known issue rather than escalated as a programme-level blocker.

**Behavioural failure to prevent:**
- Allowing the application list to remain unconfirmed past Q1 — no scope means no physics, no physics means no governance
- Treating stability incidents as one-off events rather than as signals that the onboarding sequencing model needs adjustment
- Accepting cross-tower ambiguity on ownership as an ongoing open question

**Chair self-check:**
- Is the critical application list formally locked, or is it still evolving?
- Is the review focused on onboarding rate and stagnation flags, or on individual application complexity?
- Is the Infrastructure ownership boundary confirmed in writing?

---

## SECTION 1 — Layer Map Summary Table

| Layer | Cadence | Posture Question | Level Artefact | Signal Artefact |
|---|---|---|---|---|
| Strategic | Quarterly | Is scope confirmed and onboarding rate sufficient for 31 Jul? | Applications onboarded; remaining; projected completion | Required burn achievable; scope lock status |
| Steering | Monthly | Are applications onboarding on rate? Is scope stable? | Onboarded this month; stagnation flags; stability incidents | Ownership boundary; deferred onboardings; rollback count |
| Execution | Weekly | Is this week on rate? Any deferred onboardings? | Completions vs required burn | Deferred without rescheduled date; stability incidents |
| Trigger | Immediate | Has a threshold been breached? | Trigger status: Green / Watch / Breached | Breach type: throughput / stagnation / stability / scope / trajectory |
| Control | Monthly | Is governance at the right altitude? | Chair self-audit | Application-level mediation; ownership ambiguity tolerance |

---

## SECTION 2 — Trigger Rule Definitions

| Rule ID | Type | Condition | Status |
|---|---|---|---|
| ID-T1 | Throughput | Applications onboarded < required weekly burn for 1 week | Watch |
| ID-T2 | Throughput | Applications onboarded < required weekly burn for 2 consecutive weeks | Breached |
| ID-T3 | Stagnation | Scheduled onboarding deferred; no replacement date within 48 hours | Watch |
| ID-T4 | Stagnation | Any application: no onboarding activity for ≥ 30 days | Breached |
| ID-T5 | Stability | Stability incident / rollback on any critical application | Watch → Breached if application removed from window for > 10 days |
| ID-T6 | Scope | Critical application list not confirmed by end of Q1 | Breached — physics cannot be applied |
| ID-T7 | Ownership | Infrastructure ownership boundary not confirmed by end of Q1 | Watch |
| ID-T8 | Trajectory | Projected completion crosses 15 June | Breached |

---

## SECTION 3 — Governance Failure Modes

| Failure Mode | Mechanism | Detection Point |
|---|---|---|
| Scope never locked | Application list evolves throughout the year; burn rate cannot be set; drift is invisible | Strategic layer — Q1 scope confirmation |
| Ownership ambiguity paralysis | Cross-tower ownership undefined; Infrastructure defers escalation; programme stalls | Control layer — chair self-audit |
| Stability incident treated as isolated | Rollback on one application not reflected in delivery model; remaining burn rate unchanged | Steering layer — stability incident review |
| Deferred onboarding accumulation | Individual deferrals treated as scheduling flexibility; aggregate deferral compresses delivery window | Execution layer — weekly deferred count |
| Confidence accepted without physics | Application owners confirm "on track"; onboarding rate not validated against required burn | Steering layer — commitment integrity |

---

## SECTION 4 — What NOT to Track

- **Application architecture or technical integration detail** — execution domain; not governance signal
- **Identity platform configuration** — technical ownership; not governance altitude
- **User access or permission structures** — operational detail; not programme governance
- **Individual application owner engagement history** — relevant only when stagnation trigger is breached
- **IT NPS or end-user satisfaction** — outcome metric for a different domain

---

*End of TFEM Signal Architecture — One PHINIA ID v1.*
