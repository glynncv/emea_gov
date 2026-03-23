# TFEM Governance Signal Architecture
## Programme: Vulnerability Remediation

*Version:* v1
*Date:* 2026-03-03
*Framework:* TFEM Consolidated Reference v1 (Sections 3 & 4)
*Mode:* Architecture Brain — Signal architecture only. No tools. No dashboards. No OKRs. No actions.

---

## Programme Reference

**Classification:** Hard Deadline · Exposure Window · Capacity Dependent

**Objective Statement:**
Reduce PHINIA's exploitable vulnerability exposure by remediating 65% of the 1,692 identified vulnerabilities applicable to automotive by 31 December 2026, with net-new vulnerabilities assessed within 90 days of identification.

---

## Step 1 — Programme Type Implications

**What failure looks like:**
Year-end arrives with fewer than 1,100 vulnerabilities remediated (65% of 1,692). The shortfall is not a surprise — it was visible in Q3 through throughput data — but without a trigger-based governance model, it was managed narratively rather than physically.

**What drift looks like first:**
Denominator drift. Net-new vulnerabilities are identified and added to the scope, increasing the total count without a corresponding increase in remediation capacity. The 65% target becomes harder to reach as the denominator grows, even if remediation throughput holds steady.

**Primary failure driver:**
Throughput-driven against a growing denominator. The 65% target is not a fixed unit count — it is a ratio. Governance must track both the numerator (remediations completed) and the denominator (total identified) to maintain an accurate physics model.

**Secondary failure driver:**
Ownership boundary. Infrastructure owns remediation execution but not vulnerability identification. Scope additions arrive from outside the programme. Without a formal scope control mechanism, the required burn rate silently increases without Infrastructure's capacity model being adjusted.

---

## Step 2 — TFEM Layers

### Strategic Layer (Quarterly)

**Posture question:**
Is the remediation rate sufficient to reach 65% of the current (not original) vulnerability count by 31 December, accounting for net-new discovery?

**Level artefact:**
- Total vulnerabilities identified (current denominator)
- Vulnerabilities remediated to date
- Vulnerabilities remaining to reach 65%
- Net-new vulnerabilities identified this quarter
- Projected completion at current weekly burn rate

**Signal artefact:**
- Is the required weekly remediation rate still achievable given the current denominator?
- Is the net-new discovery rate accelerating, stable, or declining?
- Has the 90-day assessment rule for net-new been met consistently, or is an assessment backlog forming?

---

### Steering Layer (Monthly)

**Health signals:**
- Remediations completed this month vs required monthly rate
- Net-new vulnerabilities identified this month — denominator impact
- 90-day assessment compliance: any net-new items exceeding the assessment window?
- Vulnerability category distribution — are high-severity items being prioritised or deferred?

**Commitment integrity to validate:**
- Is Infrastructure's remediation capacity being applied at the rate assumed in the burn model?
- Is the vulnerability identification function (not Infrastructure-owned) operating at a rate that the remediation function can absorb?
- Is the 65% target understood as a ratio against the live denominator, not the original 1,692 figure?

---

### Execution Layer (Weekly)

**Drift to detect:**
- Remediations completed this week vs required weekly burn
- Net-new vulnerabilities added this week — denominator update required
- Any net-new items approaching the 90-day assessment deadline without assessment completed
- Remediation throughput by category — are easier items being completed at the expense of higher-severity items?

**Early-warning indicator:**
Weekly remediation count falls below required burn rate while net-new discovery rate is stable or increasing. Both signals together indicate that the gap between required and actual remediation rate is widening, not narrowing.

---

### Trigger Layer (Immediate)

**Watch — threshold:**
- Weekly remediations < required weekly burn for **1 week**
- Net-new vulnerabilities added in any single month exceed **50** — denominator impact requires burn rate recalculation
- Any net-new vulnerability approaching **75 days** without assessment (approaching 90-day breach)

**Breached — threshold:**
- Weekly remediations < required weekly burn for **2 consecutive weeks**
- Net-new additions cause required burn rate to exceed current Infrastructure remediation capacity
- Any net-new vulnerability exceeds **90 days** without assessment completed
- Projected completion of 65% target crosses **30 September** — no meaningful Q4 recovery window available given complexity of remaining items

---

### Control Layer (Chair)

**Governance drift risk:**
The programme review becomes a vulnerability category discussion — which types of vulnerabilities are hardest to remediate, which systems are most complex. Governance altitude drops to technical remediation detail. The denominator growth problem is acknowledged but not formally trigger-managed.

**Behavioural failure to prevent:**
- Treating the 65% target as a fixed count (1,100 items) rather than a ratio against the live denominator
- Accepting the 90-day assessment rule as an aspiration rather than a trigger-managed commitment
- Allowing ownership boundary ambiguity (Infrastructure vs identification function) to become a reason for delayed escalation

**Chair self-check:**
- Is the review tracking the live denominator, or assuming the original 1,692 figure is stable?
- Is the 90-day assessment rule applied as a trigger, or acknowledged and deferred?
- Is the ownership boundary between identification and remediation formally defined, or a recurring conversation?

---

## SECTION 1 — Layer Map Summary Table

| Layer | Cadence | Posture Question | Level Artefact | Signal Artefact |
|---|---|---|---|---|
| Strategic | Quarterly | Is 65% ratio achievable against live denominator by 31 Dec? | Remediations complete; current denominator; projected completion | Net-new discovery rate; required burn vs capacity |
| Steering | Monthly | Is throughput holding and denominator stable? | Remediations this month; net-new added; 90-day compliance | Denominator growth impact; severity distribution |
| Execution | Weekly | Is this week on rate? Is denominator growing? | Completions vs required burn; net-new count | Burn gap widening; 90-day approaching items |
| Trigger | Immediate | Has a threshold been breached? | Trigger status: Green / Watch / Breached | Breach type: throughput / denominator / assessment / trajectory |
| Control | Monthly | Is governance at the right altitude? | Chair self-audit | Technical detail substitution; denominator assumption |

---

## SECTION 2 — Trigger Rule Definitions

| Rule ID | Type | Condition | Status |
|---|---|---|---|
| VULN-T1 | Throughput | Weekly remediations < required weekly burn for 1 week | Watch |
| VULN-T2 | Throughput | Weekly remediations < required weekly burn for 2 consecutive weeks | Breached |
| VULN-T3 | Denominator | Net-new vulnerabilities added in any month > 50 | Watch — burn rate recalculation required |
| VULN-T4 | Denominator | Net-new additions cause required burn to exceed current capacity | Breached |
| VULN-T5 | Assessment | Any net-new vulnerability at 75 days without assessment | Watch |
| VULN-T6 | Assessment | Any net-new vulnerability exceeds 90 days without assessment | Breached |
| VULN-T7 | Trajectory | Projected 65% completion crosses 30 September | Breached |

---

## SECTION 3 — Governance Failure Modes

| Failure Mode | Mechanism | Detection Point |
|---|---|---|
| Denominator growth untracked | Net-new vulnerabilities added without updating required burn rate; 65% target drifts upward silently | Execution layer — weekly denominator update |
| Fixed count assumption | Governance tracks remediations against original 1,692; actual target ratio is higher | Control layer — chair self-audit |
| Assessment rule applied as aspiration | 90-day window treated as a guideline; items drift past 90 days without escalation | Execution layer — assessment deadline tracking |
| Severity inversion | Easy/low-severity items remediated first; harder high-severity items deferred; portfolio looks healthy but risk exposure remains high | Steering layer — severity distribution review |
| Ownership boundary unresolved | Infrastructure defers escalation because identification function controls scope; required burn rate never formally recalculated | Steering layer — commitment integrity |

---

## SECTION 4 — What NOT to Track

- **Individual vulnerability technical detail** — security/execution domain; not governance signal
- **System or application vulnerability lists** — execution data; surface only at breach
- **Remediation methodology per vulnerability type** — technical ownership; not governance altitude
- **Vendor patch release schedules** — external dependency; track only as a blocker when it causes throughput breach
- **Raw vulnerability scan outputs** — identification function data; governance tracks the denominator count only

---

*End of TFEM Signal Architecture — Vulnerability Remediation v1.*
