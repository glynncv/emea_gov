# TFEM Governance Signal Architecture
## Programme: IT Enterprise Risk / EUC Refresh

*Version:* v1
*Date:* 2026-03-03
*Framework:* TFEM Consolidated Reference v1 (Sections 3 & 4)
*Mode:* Architecture Brain — Signal architecture only. No tools. No dashboards. No OKRs. No actions.

---

## Programme Reference

**Classification:** Hard Deadline · Exposure Window · Seasonal Risk Sensitive · Capacity Dependent

**Objective Statement:**
Close all outstanding EUC exposure by completing deployment of all 2025-purchased assets by Q1 2026 and remediating 100% of EOSL-identified equipment by 31 December 2026.

---

## Step 1 — Programme Type Implications

**What failure looks like:**
The programme completes the year with a residual tail of undeployed or unremediated assets — not because no work was done, but because throughput was insufficient to clear the full scope before Q4 capacity degraded. Failure is discovered late, by which point recovery is impossible within the calendar year.

**What drift looks like first:**
Throughput drift. Weekly deployment completions fall below the required burn rate. This is invisible if the programme is only tracked by cumulative percentage complete — the number continues to move while the physics silently break.

**Primary failure driver:**
Throughput-driven, compounded by a seasonal capacity cliff. The hard deadline (31 Dec) is the outer constraint, but the real governance risk is that Q4 compression (resource freeze, site availability, change windows) creates a fatal delivery gap in Oct–Dec that was entirely predictable and undetected in Q2–Q3.

**Secondary failure driver:**
Funding-gate dependent. The AR approval by 28 February is a capacity-enabling event. If missed, the deployment throughput assumption for Q1 breaks, and the required burn rate for the remainder of the year increases — without any corresponding increase in actual capacity.

---

## Step 2 — TFEM Layers

### Strategic Layer (Quarterly)

**Posture question:**
Is the remaining EUC/EOSL exposure closable within the available delivery quarters, accounting for Q4 seasonal capacity degradation?

**Level artefact:**
- Total EOSL units identified
- Units remediated to date
- Units remaining
- Projected completion date at current burn rate

**Signal artefact:**
- Is the required weekly burn rate still physically achievable within remaining non-Q4 quarters?
- Has the Q4 capacity assumption been stress-tested and is the programme still on trajectory after applying the seasonal reduction?

---

### Steering Layer (Monthly)

**Health signals:**
- Rolling 4-week burn rate vs required weekly burn rate
- Q1 2026 deployment completion status (2025 purchases) — this milestone should already be closed or in breach
- AR approval confirmed (28 Feb gate) — if unconfirmed, throughput assumption is invalid
- Remaining unit count by site/region — are any sites showing zero movement?

**Commitment integrity to validate:**
- Are site-level deployment commitments being met at the rate assumed in the burn model?
- Has scope changed (net-new EOSL identified) and has the required burn rate been recalculated?
- Is Q4 seasonal capacity reduction (modelled as -30% from 1 Oct) still the right assumption, or has it worsened?

---

### Execution Layer (Weekly)

**Drift to detect:**
- Actual deployments/remediations completed this week vs required weekly burn
- Sites with zero completions for two or more consecutive weeks (stagnation)
- Any scope additions that have not yet been reflected in the burn rate recalculation

**Early-warning indicator:**
Rolling 4-week average drops below required weekly burn for a single week. This is the Watch trigger — not yet a breach, but the signal that throughput is softening before it becomes unrecoverable.

---

### Trigger Layer (Immediate)

**Watch — threshold:**
- Rolling 4-week burn rate falls below required weekly burn for **1 consecutive week**
- Any single site shows **zero completions for 14 days**
- AR approval not confirmed by **28 February** (funding gate miss)

**Breached — threshold:**
- Rolling 4-week burn rate below required weekly burn for **2 consecutive weeks**
- Projected completion date crosses **1 October** without a confirmed recovery plan — seasonal capacity reduction makes post-October recovery physically marginal
- Scope increase (net-new EOSL) causes required burn rate to exceed current delivery capacity with no identified additional resource

**Seasonal trigger (non-negotiable):**
At the **August Steering review**, apply the Q4 seasonal capacity reduction (-30% from 1 Oct) to the projected completion model. If the resulting projection crosses 31 Dec → immediate escalation, regardless of current trajectory.

---

### Control Layer (Chair)

**Governance drift risk:**
The SDM role begins compensating for site inaction by tracking individual assets, chasing site contacts directly, and producing device-level exception lists. This is hero-mode substitution for programme ownership and burns governance capacity on execution detail.

**Behavioural failure to prevent:**
- Accepting "we're on track" confidence statements in place of burn physics evidence
- Allowing Q4 compression risk to be deferred ("we'll address it in Q3") without a standing seasonal trigger rule
- Treating the AR approval miss as an administrative delay rather than a throughput-assumption breach

**Chair self-check:**
- Is the review consuming time on individual devices or sites rather than burn physics and trigger status?
- Has the seasonal stress test been run at least once before the August steering cycle?
- Is scope formally controlled, or are net-new EOSL items being absorbed without recalculating the required burn rate?

---

## SECTION 1 — Layer Map Summary Table

| Layer | Cadence | Posture Question | Level Artefact | Signal Artefact |
|---|---|---|---|---|
| Strategic | Quarterly | Is remaining exposure closable before Q4 capacity degrades? | Remaining units; projected completion | Required burn achievable across non-Q4 quarters? |
| Steering | Monthly | Is throughput holding and are commitments intact? | Rolling 4W burn vs required burn; site stagnation flags | Burn rate trend; AR gate status; scope change |
| Execution | Weekly | Is this week's delivery on rate? | Completions this week vs required burn | 4W rolling average direction; site zero-movement |
| Trigger | Immediate | Has a threshold been breached? | Trigger status: Green / Watch / Breached | Breach type: throughput / stagnation / funding / seasonal |
| Control | Monthly | Is governance staying at the right altitude? | Chair self-audit | Hero-mode indicators; narrative vs physics substitution |

---

## SECTION 2 — Trigger Rule Definitions

| Rule ID | Type | Condition | Status |
|---|---|---|---|
| EUC-T1 | Throughput | Rolling 4W burn < required weekly burn for 1 week | Watch |
| EUC-T2 | Throughput | Rolling 4W burn < required weekly burn for 2 consecutive weeks | Breached |
| EUC-T3 | Stagnation | Any site: zero completions for ≥ 14 days | Watch |
| EUC-T4 | Funding gate | AR approval not confirmed by 28 February | Breached |
| EUC-T5 | Scope | Net-new EOSL additions cause required burn to exceed current capacity | Watch → Breached if unresolved within 2 weeks |
| EUC-T6 | Seasonal | August stress test: Q4 -30% capacity applied → projected completion > 31 Dec | Breached — immediate escalation |
| EUC-T7 | Trajectory | Projected completion crosses 1 October at any point in-year | Watch — recovery plan required within 1 week |

---

## SECTION 3 — Governance Failure Modes

| Failure Mode | Mechanism | Detection Point |
|---|---|---|
| Silent throughput decay | Weekly burn falls below required rate; cumulative % still looks acceptable | Execution layer — weeks 2–3 of deficit |
| Funding assumption not reset | AR approval missed; deployment plan unchanged; physics broken but not recalculated | Steering layer — February review |
| Seasonal cliff undetected | Q4 compression never stress-tested; programme appears on track until October | Strategic layer — August quarterly review |
| Scope creep without physics reset | Net-new EOSL items absorbed into scope without recalculating required burn | Execution layer — any week scope is added |
| Hero-mode substitution | SDM begins chasing individual assets; governance altitude drops to execution | Control layer — chair self-audit |
| Confidence narrative accepted | Owner reports "on track" verbally; burn physics not validated | Steering layer — monthly commitment integrity check |

---

## SECTION 4 — What NOT to Track

The following must be explicitly excluded from governance panels for this programme:

- **Individual device lists or asset registers** — execution system (SNOW) data; not governance signal
- **Site-by-site completion tables** — relevant only if a site triggers the stagnation rule; not standing governance content
- **Vendor or ticket-level detail** — execution noise; escalate only on breach
- **Raw deployment counts without physics context** — a count without comparison to required burn rate is meaningless at governance altitude
- **Progress narratives or status commentary** — governance is signal and trigger driven; narrative is not a governance artefact
- **IT NPS or user satisfaction metrics** — outcome metric for a different domain; not relevant to EUC programme governance

---

*End of TFEM Signal Architecture — IT Enterprise Risk / EUC Refresh v1.*
