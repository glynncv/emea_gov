# TFEM Governance Signal Architecture
## Programme: OT Risk Remediation — Top 10 Sites

*Version:* v1
*Date:* 2026-03-03
*Framework:* TFEM Consolidated Reference v1 (Sections 3 & 4)
*Mode:* Architecture Brain — Signal architecture only. No tools. No dashboards. No OKRs. No actions.

---

## Programme Reference

**Classification:** Exposure Window · Capacity Dependent · Stability Sensitive

**Objective Statement:**
Reduce OT exposure at the 10 highest-risk sites by completing remediation plans for all 10 and conducting inventory assessment for sites 10–20 by 31 December 2026, in preparation for the 2027 budget cycle.

---

## Step 1 — Programme Type Implications

**What failure looks like:**
Year-end arrives with one or more of the 10 highest-risk sites without a completed remediation plan. The OT security exposure at those sites remains unquantified and unmitigated into 2027. Additionally, if sites 10–20 inventory is incomplete, the 2027 budget cycle cannot be correctly sized.

**What drift looks like first:**
Stagnation at individual site level. Sites enter the programme, initial engagement occurs, and then activity stalls — OT system owners are unavailable, funding is unconfirmed, or remediation scope is contested. Stagnation is the dominant failure mode for this programme type, as confirmed by existing EMEA TFEM operational experience.

**Primary failure driver:**
Stagnation-driven. No hard external deadline creates a forcing function. Sites drift through the year with partial engagement and incomplete plans. The exposure window classification means that earlier completion directly reduces live risk — delay has a compounding cost.

**Secondary failure driver:**
Stability-sensitive. Remediation activities at OT sites interact with live production systems. Any instability event linked to remediation work triggers a pause, an investigation, and frequently a change freeze that can extend for weeks at a manufacturing site.

**Important governance distinction:**
"Remediation plans completed" is a documentation milestone, not a risk-closure milestone. Governance must track plan completion without conflating it with actual exposure reduction.

---

## Step 2 — TFEM Layers

### Strategic Layer (Quarterly)

**Posture question:**
Is the OT exposure at the 10 highest-risk sites being systematically closed, and are sites 10–20 on track for inventory completion before the 2027 budget cycle?

**Level artefact:**
- Sites with completed remediation plans (out of 10)
- Sites with active remediation in progress
- Sites with no activity initiated
- Sites 10–20: inventory assessments completed

**Signal artefact:**
- Is the rate of plan completion sufficient to close all 10 before year-end?
- Are any sites showing repeat instability events linked to remediation activity?
- Are funding confirmations in place for sites where remediation requires capital spend?

---

### Steering Layer (Monthly)

**Health signals:**
- Remediation plans completed this month vs required pace
- Sites with no activity in the past 30 days — stagnation flag
- Instability events at any of the 10 sites — are these linked to remediation activity?
- Funding confirmation status per site — any sites blocked by unconfirmed funding?
- Sites 10–20 inventory: assessments completed vs total

**Commitment integrity to validate:**
- Are site OT owners delivering against agreed plan milestones, or are milestone dates slipping without escalation?
- Is funding confirmed for all sites where remediation requires capital spend?
- Are instability events being captured and linked to remediation activity, or treated as unrelated operational events?

---

### Execution Layer (Weekly)

**Drift to detect:**
- Any site with no remediation plan activity for 14 or more days
- Instability event at any of the 10 sites — possible remediation-linked cause
- Funding unconfirmed at any site for more than 30 days
- Sites 10–20: inventory assessment stalling (no progress for 14+ days)

**Early-warning indicator:**
Two or more of the 10 sites showing concurrent stagnation (no activity for 14+ days). Individual site stagnation is a Watch trigger; concurrent multi-site stagnation indicates a systemic capacity or engagement failure requiring programme-level escalation.

---

### Trigger Layer (Immediate)

**Watch — threshold:**
- Any single site: no remediation plan activity for **14 days**
- Funding unconfirmed at any site for **> 30 days**
- Instability event at any of the 10 sites — possible remediation link under review

**Breached — threshold:**
- Any single site: no remediation plan activity for **30 days**
- Two or more sites: concurrent stagnation for **14+ days**
- Funding unconfirmed at any site for **> 60 days** — site at risk of year-end non-completion
- Instability event confirmed as remediation-linked — site paused with no recovery date
- Projected completion of all 10 plans crosses **30 September** — insufficient time to validate and close before year-end

---

### Control Layer (Chair)

**Governance drift risk:**
The SDM begins directly engaging site OT owners, mediating funding conversations, and chasing individual plan documents. This is operational coordination substituting for programme governance — the pattern identified in existing EMEA TFEM framework experience as the primary hero-mode failure.

**Behavioural failure to prevent:**
- Treating plan completion as equivalent to exposure reduction — governance must maintain the distinction
- Accepting "ongoing engagement" as a programme status without a confirmed plan completion date
- Allowing funding delays to drift without escalation — funding is a programme-level blocker, not a site-level administrative matter

**Chair self-check:**
- Is the review tracking plan completion rates and stagnation flags, or is it managing individual site relationships?
- Is the distinction between plan completion and actual exposure reduction being maintained in governance reporting?
- Are funding blockers being escalated to the appropriate decision-maker, not managed at SDM level?

---

## SECTION 1 — Layer Map Summary Table

| Layer | Cadence | Posture Question | Level Artefact | Signal Artefact |
|---|---|---|---|---|
| Strategic | Quarterly | Is exposure being closed at pace? Are sites 10–20 on track? | Plans complete; sites stagnant; inventory assessments done | Completion rate; instability events; funding status |
| Steering | Monthly | Are site owners delivering? Is funding confirmed? | Plans completed this month; stagnation flags; funding status | Concurrent stagnation; instability link; budget cycle readiness |
| Execution | Weekly | Any sites stalling? Any instability events? | Sites with no activity ≥ 14 days | Multi-site concurrent stagnation; funding overage |
| Trigger | Immediate | Has a threshold been breached? | Trigger status: Green / Watch / Breached | Breach type: stagnation / funding / stability / trajectory |
| Control | Monthly | Is governance at the right altitude? | Chair self-audit | Hero-mode coordination; plan/exposure conflation |

---

## SECTION 2 — Trigger Rule Definitions

| Rule ID | Type | Condition | Status |
|---|---|---|---|
| OT-REM-T1 | Stagnation | Single site: no remediation plan activity for ≥ 14 days | Watch |
| OT-REM-T2 | Stagnation | Single site: no remediation plan activity for ≥ 30 days | Breached |
| OT-REM-T3 | Stagnation | Two or more sites: concurrent stagnation ≥ 14 days | Breached |
| OT-REM-T4 | Funding | Funding unconfirmed at any site for > 30 days | Watch |
| OT-REM-T5 | Funding | Funding unconfirmed at any site for > 60 days | Breached |
| OT-REM-T6 | Stability | Instability event at remediation site — remediation link suspected | Watch |
| OT-REM-T7 | Stability | Instability event confirmed remediation-linked; site paused with no recovery date | Breached |
| OT-REM-T8 | Trajectory | Projected completion of all 10 plans crosses 30 September | Breached |

---

## SECTION 3 — Governance Failure Modes

| Failure Mode | Mechanism | Detection Point |
|---|---|---|
| Stagnation as default state | No hard deadline; site OT owners deprioritise engagement; plans stall at initiation | Execution layer — 14-day stagnation flag |
| Funding drift | Capital spend requires approval; approval deferred; site blocked but not escalated | Steering layer — funding status |
| Plan completion conflated with exposure reduction | Governance reports plans complete; actual remediation not tracked | Control layer — chair self-audit |
| Instability event unlinked | Production incident at OT site not connected to remediation activity; root cause missed | Steering layer — instability event review |
| Hero-mode coordination | SDM mediates site relationships directly; throughput accountability not enforced on site owners | Control layer — chair self-audit |

---

## SECTION 4 — What NOT to Track

- **OT system inventory detail** — execution data; surface only at programme boundary milestones
- **Remediation technical methodology per site** — site owner accountability; not governance content
- **Individual risk item status within a site plan** — site-level execution tracking; not programme governance
- **Sites 10–20 inventory detail** — track completion count only; detail belongs to the 2027 budget preparation cycle
- **Instability event technical root cause** — problem management domain; governance tracks linkage and pause duration only

---

*End of TFEM Signal Architecture — OT Risk Remediation Top 10 Sites v1.*
