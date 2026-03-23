# TFEM Governance Signal Architecture
## Programme: Data Center Consolidation

*Version:* v1
*Date:* 2026-03-03
*Framework:* TFEM Consolidated Reference v1 (Sections 3 & 4)
*Mode:* Architecture Brain — Signal architecture only. No tools. No dashboards. No OKRs. No actions.

---

## Programme Reference

**Classification:** Hard Deadline · Capacity Dependent · Stability Sensitive

**Objective Statement:**
Reduce data center footprint from 5 physical data centers to 1 by completing the exit of Miami (30 Apr), Streetsville, Tulsa, old Amsterdam, and DXC/PN1 (30 Jun) data centers and standing up the new Amsterdam facility with all workloads migrated by 30 June 2026.

---

## Step 1 — Programme Type Implications

**What failure looks like:**
One or more data center exits are incomplete by their respective hard deadlines. Lease obligations continue on exited facilities. Costs are not eliminated. The $10M+ savings target cannot be achieved on the 2028 timeline if exits slip into H2 2026. Cross-programme dependencies (SAP PN1 migration, Amsterdam network connectivity, Azure Consolidation) are disrupted.

**What drift looks like first:**
Workload migration throughput drift. Individual workloads or systems are not migrated on schedule, creating a tail of unmitigated dependencies that prevents facility exit declaration. Each unmigrated workload is a blocker — the exit cannot be declared until the last workload is moved.

**Primary failure driver:**
Throughput-driven with hard sequential exit deadlines. The programme has overlapping hard deadlines (30 Apr, 30 Jun) with shared migration team capacity. A capacity conflict between the Miami exit (30 Apr) and the Streetsville/Tulsa/Amsterdam exits (30 Jun) is the primary physical constraint.

**Secondary failure driver:**
Stability-sensitive. Data center migrations touch production workloads. A migration-induced incident on a production system triggers a rollback, an investigation, and a freeze on further migrations from that facility — removing that facility's workload from the delivery window for an unpredictable period.

**Critical cross-programme dependencies:**
- DXC exit is coupled to SAP PN1 migration (Programme 8) — if SAP PN1 infrastructure is not ready by 30 Apr, DXC exit is blocked
- Amsterdam exit requires Amsterdam network connectivity (Programme 3 — SDWAN) to be in place by 31 May
- Amsterdam new facility standup is both a dependency for the Amsterdam exit and a parallel workstream
- GES Retirement (flagged on roadmap, not in goals table) — scope confirmation required

---

## Step 2 — TFEM Layers

### Strategic Layer (Quarterly)

**Posture question:**
Is the workload migration rate sufficient to clear all blockers for each facility exit by its hard deadline, and are cross-programme dependencies confirmed on sequence?

**Level artefact:**
- Workloads migrated per facility vs total workloads in scope
- Exit declarations achieved (Miami, Streetsville, Tulsa, DXC, Amsterdam old)
- New Amsterdam facility: standup status; workloads migrated in
- Cross-programme dependency status (SAP PN1, SDWAN Amsterdam, Azure tenant)

**Signal artefact:**
- Is the migration throughput per facility sufficient to clear all workloads before the exit deadline?
- Are cross-programme dependencies (SAP PN1 30 Apr, SDWAN Amsterdam 31 May) confirmed on track?
- Is shared migration team capacity sufficient to run concurrent April and June exit workstreams?

---

### Steering Layer (Monthly)

**Health signals:**
- Workloads migrated this month per facility vs required monthly rate
- Blockers preventing migration: dependency systems, owner confirmation, change window availability
- Stability incidents following migrations — any rollbacks?
- Cross-programme dependency status: SAP PN1 (30 Apr), SDWAN Amsterdam connectivity (31 May)
- New Amsterdam facility: construction/readiness milestones on track?

**Commitment integrity to validate:**
- Is migration team capacity formally allocated to each facility exit workstream, or is there capacity competition?
- Are facility landlords/lease terms formally notified of exit dates — creating a hard commitment that cannot slip?
- Is GES Retirement scope confirmed in or out of this programme?

---

### Execution Layer (Weekly)

**Drift to detect:**
- Workload migrations completed this week per facility vs required weekly burn
- Any workload where migration was scheduled but did not proceed — blocker identification
- Stability incident following any migration — rollback or freeze triggered?
- Miami exit path: all workloads on track for clearance before 30 Apr
- Amsterdam new facility: standup milestones — weekly progress check

**Early-warning indicator:**
Any facility where, at the 4-week-to-deadline mark, more than 20% of workloads remain unmigrated. A 20% tail at T-minus-4 weeks is a breach-risk signal — migration of the last 20% of workloads in any facility is consistently the most complex and time-consuming phase.

---

### Trigger Layer (Immediate)

**Watch — threshold:**
- Any facility: workload migration rate < required weekly burn for **1 week**
- Miami exit: more than 20% of workloads unmigrated by **31 March** (4 weeks to deadline)
- Streetsville/Tulsa/Amsterdam: more than 20% of workloads unmigrated by **31 May** (4 weeks to deadline)
- Any migration-related stability incident

**Breached — threshold:**
- Any facility: workload migration rate < required weekly burn for **2 consecutive weeks**
- SAP PN1 infrastructure not confirmed ready by 30 April — DXC exit blocked
- Amsterdam SDWAN connectivity not confirmed by 31 May — Amsterdam exit blocked
- Migration-related incident causes freeze extending beyond **10 days**
- Any facility exit declaration missed at hard deadline

---

### Control Layer (Chair)

**Governance drift risk:**
The programme review becomes a workload-by-workload migration status discussion. Shared team capacity conflict between April and June workstreams is acknowledged but not formally escalated as a programme-level constraint. Cross-programme dependencies are discussed but not trigger-managed.

**Behavioural failure to prevent:**
- Treating each facility exit as an independent programme — capacity competition between concurrent workstreams is a single programme-level constraint
- Accepting "final workloads are complex" as a reason for timeline flexibility — the last 20% is always complex; it must be planned for, not responded to
- Allowing GES Retirement scope ambiguity to remain unresolved

**Chair self-check:**
- Is shared migration team capacity formally allocated across concurrent workstreams?
- Are cross-programme dependencies (SAP PN1, SDWAN Amsterdam) tracked with named owners and confirmed milestone dates?
- Is the lease/landlord commitment for each exit formally in place — creating an external forcing function?

---

## SECTION 1 — Layer Map Summary Table

| Layer | Cadence | Posture Question | Level Artefact | Signal Artefact |
|---|---|---|---|---|
| Strategic | Quarterly | Is migration throughput sufficient per facility? Dependencies on sequence? | Workloads migrated per facility; exits declared; dependency status | Required burn achievable; capacity competition; cross-programme risk |
| Steering | Monthly | Are facility workstreams on rate and dependencies confirmed? | Workloads migrated this month; stability incidents; dependency status | Blockers; shared capacity allocation; Amsterdam standup milestones |
| Execution | Weekly | Is each facility on rate? Any blockers? | Completions vs required burn per facility | 20% tail warning; stability incidents; cross-programme weekly check |
| Trigger | Immediate | Has a threshold been breached? | Trigger status: Green / Watch / Breached | Breach type: throughput / dependency / stability / missed exit |
| Control | Monthly | Is governance at right altitude? | Chair self-audit | Workload-level detail; capacity competition unmanaged; dependency tracking absorbed |

---

## SECTION 2 — Trigger Rule Definitions

| Rule ID | Type | Condition | Status |
|---|---|---|---|
| DC-T1 | Throughput | Any facility: migration rate < required weekly burn for 1 week | Watch |
| DC-T2 | Throughput | Any facility: migration rate < required weekly burn for 2 consecutive weeks | Breached |
| DC-T3 | Trajectory | Miami: > 20% workloads unmigrated by 31 March | Watch |
| DC-T4 | Trajectory | Streetsville/Tulsa/Amsterdam: > 20% workloads unmigrated by 31 May | Watch |
| DC-T5 | Dependency | SAP PN1 infrastructure not confirmed ready by 30 April | Breached — DXC exit blocked |
| DC-T6 | Dependency | SDWAN Amsterdam connectivity not confirmed by 31 May | Breached — Amsterdam exit blocked |
| DC-T7 | Stability | Migration-related incident causes freeze > 10 days | Breached |
| DC-T8 | Milestone | Any facility exit declaration missed at hard deadline | Breached — immediate escalation |
| DC-T9 | Scope | GES Retirement scope not confirmed by end of Q1 | Watch |

---

## SECTION 3 — Governance Failure Modes

| Failure Mode | Mechanism | Detection Point |
|---|---|---|
| Last 20% compression | Final workloads deferred as "complex"; no plan for them; tail becomes undeliverable | Execution layer — 20% tail warning at T-4 weeks |
| Capacity competition invisible | April and June workstreams share migration team; competition not formally managed; one workstream starved | Steering layer — capacity allocation check |
| Inherited dependency miss | SAP PN1 or SDWAN Amsterdam slip; DXC or Amsterdam exits blocked; not treated as Infrastructure escalation | Steering layer — dependency status |
| Stability freeze ignored | Migration incident triggers freeze; workload migration model not updated; required burn rate unchanged | Execution layer — stability incident tracking |
| Facility exits declared prematurely | Exit declared before all workloads confirmed migrated; stranded workloads discovered post-declaration | Control layer — chair self-audit |

---

## SECTION 4 — What NOT to Track

- **Individual workload technical specifications** — execution domain; not governance signal
- **Data center facility management detail** — infrastructure/facilities boundary; governance tracks exit milestone only
- **Migration methodology or tooling** — technical ownership; not governance altitude
- **Post-exit workload performance** — operational metric; not programme governance
- **Amsterdam optimisation (to 31 Mar 2027)** — separate post-exit horizon; must not be included in 2026 programme governance

---

*End of TFEM Signal Architecture — Data Center Consolidation v1.*
