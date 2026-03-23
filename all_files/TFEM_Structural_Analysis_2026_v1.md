# TFEM Structural Analysis — 2026 Infrastructure Objectives
*Version:* v1  
*Date:* 2026-03-03  
*Source:* Infrastructure_Objectives_2026__CG_.pptx  
*Framework:* TFEM Consolidated Reference v1 (Sections 3 & 4)  
*Mode:* Architecture Brain — Decomposition + Classification only. No OKRs. No dashboards.

---

## Programme Register — Name, Classification & Objective Statements

---

### 1. IT Enterprise Risk / EUC Refresh

**Classification:** Hard Deadline · Exposure Window · Seasonal Risk Sensitive · Capacity Dependent

**Objective Statement:**
Close all outstanding EUC exposure by completing deployment of all 2025-purchased assets by Q1 2026 and remediating 100% of EOSL-identified equipment by 31 December 2026.

**Constraints:**
- Q4 capacity squeeze is unmodelled — seasonal stress trigger rule must be defined at charter stage (see Flag 6).
- "2026 AR Approval by 28th February" implies a funding gate; if missed, deployment capacity assumption breaks. Confirm approval status.
- EOSL scope is not quantified in the deck. Remaining unit count needed before burn rate physics can be applied.

---

### 2. Disaster Recovery — Tier 1 Apps

**Classification:** Exposure Window · Capacity Dependent

**Objective Statement:**
Close the DR exposure for all Tier 1 Infrastructure applications by ensuring full plans exist and annual tests are completed in line with policy by 31 December 2026.

**Constraints:**
- No hard external deadline; classified Exposure Window — governance must set an internal completion threshold to avoid indefinite drift.
- "All Tier 1" scope is undefined in the deck. Application count and ownership map needed before throughput can be modelled.
- Annual test completion implies a sequenced dependency on plan completion; these are two distinct milestones and should be tracked separately.

---

### 3. SDWAN / Legacy Network Remediation

**Classification:** Hard Deadline · Capacity Dependent · Stability Sensitive

**Objective Statement:**
Close 100% of the legacy network backbone by completing SDWAN deployment across all sites, Azure and DelphiDrive landing zone connectivity, Amsterdam network transition, and PHINIA-Guest rollout by 30 September 2026, with the critical path deadline of 30 June 2026 for SDWAN and Amsterdam.

**Constraints:**
- Multiple sub-deadlines (30 Apr, 30 Jun, 30 Sep) with interdependencies — sequencing failure at 30 Apr cascades into 30 Jun exits. Each sub-deadline should carry its own trigger rule.
- Site count for SDWAN deployment not stated in deck. Required weekly burn rate cannot be calculated without it.
- Amsterdam network connectivity is a dependency of the Amsterdam Data Center exit programme — cross-programme constraint, shared capacity risk.

---

### 4. OT Layer 2 Network Segmentation

**Classification:** Hard Deadline · Capacity Dependent · Stability Sensitive

**Objective Statement:**
Close Layer 2 network segmentation exposure across all relevant sites by completing implementation at 100% of in-scope sites by 31 October 2026.

**Constraints:**
- "All relevant sites" is not a defined count in the deck. Scope must be fixed before throughput physics can be applied.
- Stability Sensitive — segmentation work interacts with production OT environments; implementation sequencing must account for change window availability at each site.
- 31 Oct deadline leaves no Q4 buffer for sites not completed on time. Late completions carry no recovery window before year-end.

---

### 5. OT Risk Remediation — Top 10 Sites

**Classification:** Exposure Window · Capacity Dependent · Stability Sensitive

**Objective Statement:**
Reduce OT exposure at the 10 highest-risk sites by completing remediation plans for all 10 and conducting inventory assessment for sites 10–20 by 31 December 2026, in preparation for the 2027 budget cycle.

**Constraints:**
- "Remediation plans completed" is a documentation milestone, not a remediation completion milestone. Governance must not conflate plan delivery with risk closure.
- Sites 10–20 inventory is a 2027 budget-preparation activity, not a risk-reduction deliverable — should be tracked separately to avoid milestone dilution.
- Site-level capacity is the primary constraint (as established in existing EMEA TFEM work). Stagnation trigger rules from current SDM framework apply directly here.

---

### 6. Vulnerability Remediation

**Classification:** Hard Deadline · Exposure Window · Capacity Dependent

**Objective Statement:**
Reduce PHINIA's exploitable vulnerability exposure by remediating 65% of the 1,692 identified vulnerabilities applicable to automotive by 31 December 2026, with net-new vulnerabilities assessed within 90 days of identification.

**Constraints:**
- 1,692 is a point-in-time figure — net-new discovery will affect the denominator. Burn rate physics must account for scope growth, not just fixed throughput against a static list.
- 90-day assessment rule for net-new is an Operations flow trigger, not a programme milestone — should sit in Operations_Panel, not Enterprise_Panel.
- Infrastructure owns remediation execution but does not own vulnerability identification. Owner/dependency boundary must be explicit.

---

### 7. One PHINIA ID

**Classification:** Hard Deadline · Stability Sensitive

**Objective Statement:**
Close the fragmented identity exposure for critical applications by delivering a single PHINIA ID across all in-scope critical applications by 31 July 2026.

**Constraints:**
- "Critical applications" scope is not defined in the deck. Application list and ownership must be confirmed before delivery physics can be modelled.
- Stability Sensitive — identity changes on production critical applications carry change-induced instability risk. Sequencing and rollback planning are prerequisites.
- This objective appears on both the headline slide (Slide 1) and the goals table (Slide 4), suggesting it may be cross-tower in scope. Confirm Infrastructure ownership boundary.

---

### 8. SAP PN1 / S/4HANA Infrastructure

**Classification:** Hard Deadline · Capacity Dependent · Stability Sensitive

**Objective Statement:**
Enable the SAP PN1 to Azure migration by delivering all required infrastructure foundations by 30 April 2026, and maintain infrastructure readiness to support the One ERP consolidation programme through to the 2028 target.

**Constraints:**
- Infrastructure is an enabler, not the primary programme owner. Delivery physics are governed by the SAP tower schedule — a hard external dependency.
- Two distinct horizons (30 Apr 2026 and 2028) require separate milestone structures; they should not share a single trigger rule.
- PN1 Cutover and PN1 Retirement are flagged on the roadmap (Slide 10) as discrete events with different dates — confirm which milestone Infrastructure owns.
- Azure Reservations Expire is flagged on the roadmap as a financial forcing function — if infrastructure migration is not complete before expiry, cost exposure increases. This is an unmodelled financial trigger.

---

### 9. Data Center Consolidation

**Classification:** Hard Deadline · Capacity Dependent · Stability Sensitive

**Objective Statement:**
Reduce data center footprint from 5 physical data centers to 1 by completing the exit of Miami (30 Apr), Streetsville, Tulsa, old Amsterdam, and DXC/PN1 (30 Jun) data centers and standing up the new Amsterdam facility with all workloads migrated by 30 June 2026.

**Constraints:**
- Five exits with overlapping deadlines (Apr and Jun) — shared infrastructure and migration team capacity is the critical constraint. Sequencing failure at one exit delays others.
- Amsterdam standup is both a dependency for the Amsterdam exit and a parallel workstream — these must be tracked as linked milestones, not a single programme row.
- Amsterdam workload optimisation runs to 31 Mar 2027 — a separate post-exit horizon that should not be conflated with the 2026 exit programme.
- DXC exit is directly coupled to the SAP PN1 migration (Programme 8) — cross-programme dependency, shared capacity risk.
- GES Retirement appears on the roadmap (Slide 10) as a distinct milestone — not referenced in the goals table. Confirm whether this is within scope.

---

### 10. Azure Cloud Consolidation

**Classification:** Hard Deadline · Capacity Dependent · Stability Sensitive

**Objective Statement:**
Consolidate PHINIA's cloud estate from two environments to a single Azure tenant by standing up 8 regional landing zones by 30 April 2026 and completing full migration of all DelphiDrive workloads by 31 March 2027.

**Constraints:**
- Two distinct phases with an 11-month gap between phase 1 (landing zone standup, 30 Apr 2026) and phase 2 (full migration, 31 Mar 2027) — each phase requires its own trigger rules and burn physics.
- Azure Reservations Expire is flagged on the roadmap as a financial forcing function — migration timeline must land before expiry to avoid stranded cost. Reservation expiry date not stated in deck; must be confirmed.
- DelphiDrive exit is the closure milestone for this programme — until all workloads are migrated, dual-cloud operational cost runs. Stagnation in migration velocity has direct financial consequence.
- Landing zone standup (30 Apr) is a dependency for SDWAN Azure connectivity and the SAP PN1 migration — three programmes share this milestone.

---

### 11. LTI Mindtree / MSP Maturation

**Classification:** Hard Deadline · Capacity Dependent

**Objective Statement:**
Stabilise the managed service provider operating model by maturing LTI Mindtree activities to enable stable state operations by 31 March 2026.

**Constraints:**
- 31 March 2026 is 4 weeks from the analysis date — this programme is in its final window. If not already at stable state, this is an immediate breach candidate.
- "Stable state" is not defined in the deck. A measurable threshold (e.g. SLA adherence rate, incident volumes, escalation frequency) must be defined for the trigger rule to function.
- Sub-activities (PHINfo, Voicing.AI, SysTrack, IaC) have later deadlines (Apr, Jun) and should not be closed with the 31 Mar milestone — they are follow-on activities within the MSP programme or candidates for the Operations domain.

---

### 12. Observability

**Classification:** Hard Deadline · Capacity Dependent

**Objective Statement:**
Close the infrastructure visibility gap by completing full monitoring coverage of the entire infrastructure environment and delivering the DynaTrace proof of concept by 30 April 2026.

**Constraints:**
- "Full monitoring coverage" requires a defined scope baseline — without it, completion cannot be declared and the milestone cannot be triggered.
- DynaTrace POC is a decision-gate deliverable, not an end-state — governance should define what decision the POC informs and by when that decision must be made.
- "Leverage AI capabilities for proactive incident resolution" is a follow-on aspiration, not part of this programme's delivery scope. Should not be included in Observability milestone tracking.

---

### 13. CMDB North Star

**Classification:** Hard Deadline · Capacity Dependent

**Objective Statement:**
Close the CMDB maturity gap by completing Discovery, Service Mapping, and Event Management implementation to achieve the defined CMDB maturity plan by 31 January 2027.

**Constraints:**
- "CMDB Maturity Plan" is referenced but not defined in the deck. The plan itself is a prerequisite for governing this programme — if it does not exist, this is a pre-programme activity.
- Three workstreams (Discovery, Service Mapping, Event Management) are bundled under one milestone. Each has its own capacity and sequencing requirements and should carry separate milestone tracking.
- 31 Jan 2027 is the outer deadline — without intermediate milestones, stagnation will not be detectable until late in the delivery window.

---

### 14. Acquisition Integration

**Classification:** Exposure Window · Capacity Dependent

**Objective Statement:**
Ensure Infrastructure integration readiness for any 2026 board-approved acquisition by maintaining a current playbook covering Day 1, Day 100, and Day 365 activities, and executing against it upon acquisition trigger.

**Constraints:**
- Scope and throughput are undefined until an acquisition is triggered — this programme cannot be governed with burn rate physics in standing mode.
- Governance mode is trigger-activated: playbook currency is the standing deliverable; full programme instantiation occurs on acquisition approval.
- "Day 365 full integration" creates a rolling 12-month exposure window per acquisition — if multiple acquisitions are approved, capacity stacking becomes a risk.
- SEM learnings are referenced as inputs to the playbook update — confirm whether this update is complete or is itself a pending deliverable.

---

## Step 1A: Structural Decomposition

The deck presents **5 CIO-level Strategic Directions**. Each contains a mixture of Programmes, Flows, and Activities. These are separated below before any governance model is applied.

---

### Strategic Direction 1: Complete PHINIA IT's Critical Foundations

#### Programmes (bounded, deadline-driven)

| Programme | Delivery Scope |
|---|---|
| IT Enterprise Risk / EUC Refresh | All 2025 purchases deployed Q1 2026; all EOSL remediated by 31 Dec |
| Disaster Recovery — Tier 1 Apps | DR plans + annual test for all Tier 1 Infrastructure apps |
| SDWAN / Legacy Network Remediation | All sites SDWAN by 30 Jun; Azure/DD connectivity by 30 Apr; Amsterdam by 30 Jun; PHINIA-Guest by 30 Sep |
| OT Layer 2 Network Segmentation | All relevant sites segmented by 31 Oct |
| OT Risk Remediation — Top 10 Sites | Remediation plans for 10 sites by 31 Dec; inventory for sites 10–20 |
| Vulnerability Remediation | 65% of 1,692 identified vulnerabilities remediated by 31 Dec |

#### Activities (no delivery physics — flagged)

- **"Prioritize 3rd-party cyber risk on IP-holding and connected vendors"** — no scope, no owner, no deadline. *Activity.*
- **"NIST Assessment support"** — Infrastructure's role is stated as support to Security team. Not an Infrastructure-owned programme. *Dependency / Activity.*

---

### Strategic Direction 2: Standardize and Modernize

#### Programmes (bounded, deadline-driven)

| Programme | Delivery Scope |
|---|---|
| One PHINIA ID | Completed by 31 Jul 2026 |
| SAP PN1 / S/4HANA Infrastructure | Infrastructure in place to support PN1 migration to Azure by 30 Apr; One ERP foundation by 2028 |

#### Activities (no delivery physics — flagged)

- **"Unify Aftermarket toolset"** — cross-functional; no Infrastructure-owned scope.
- **"AI adoption — 2–3 initiatives"** — pre-programme. No capacity model, no deadline, no scoped Infrastructure delivery. *Activity cluster presented as Programme direction.*
- **"Digital thread pilot"** — no Infrastructure-owned deadline or scope defined. *Pre-programme at best.*
- **"Citizen developer network"** — no delivery mechanism, no deadline. *Pure Activity.*

---

### Strategic Direction 3: Drive 24-Month Right-Sizing ($10M+ savings by 2028)

#### Programmes (bounded, deadline-driven)

| Programme | Delivery Scope |
|---|---|
| Data Center Consolidation | Miami exit 30 Apr; Streetsville + Tulsa exit 30 Jun; Amsterdam old DC exit 30 Jun; DXC exit (PN1) 30 Apr; new Amsterdam standup + migration |
| Azure Cloud Consolidation | New PHINIA tenant + 8 regional landing zones by 30 Apr 2026; full DelphiDrive migration by 31 Mar 2027 |

#### Activities (no delivery physics — flagged)

- **"Software task force — $3M spend reduction"** — Infrastructure's stated role is support. No owned delivery physics. No deadline. *Activity / dependency item.*

---

### Strategic Direction 4: Complete IT Operating Model Optimization

#### Programmes (bounded, deadline-driven)

| Programme | Delivery Scope |
|---|---|
| LTI Mindtree / MSP Maturation | Stable state operations by 31 Mar 2026 |
| Observability | Full infrastructure monitoring + DynaTrace POC by 30 Apr 2026 |
| CMDB North Star | Discovery, Service Mapping, Event Management maturity complete by 31 Jan 2027 |

#### Flows (continuous — Operations domain)

- 90% adherence: no open incident older than 10 days — *Operations flow metric*
- 90% adherence: no open catalogue request older than 30 days — *Operations flow metric*
- Site Health updated for every site minimum once per quarter — *Operations flow metric*
- SDM bi-weekly BRM meetings — *Operating cadence, not a programme*
- SDM site visits minimum quarterly — *Operating cadence, not a programme*

#### Activities (no delivery physics — flagged)

- **"Reinforce IT culture"** — bundles flow metrics and aspirational cultural language under one label. *Not governable as a programme. See Structural Risk Flag 3.*
- **"EA CoE — 5 new technology standards by 31 Dec"** — metric target with no delivery mechanism or capacity model. *Activity / metric disguised as Programme.*
- **"IT NPS +5%"** — outcome metric. *Not a programme.*
- **"PHINfo / Voicing.AI adoption targets"** — metric targets within MSP programme. Not standalone programmes.
- **"IaC — top 10 use cases by 30 Jun"** — sub-activity within Observability programme.

---

### Strategic Direction 5: Lead IT Integration of 2026 Acquisitions

#### Conditional Programme

This is trigger-based (board approval of acquisitions), not a deterministic programme. Correctly structured as a playbook / methodology. No fixed scope or throughput model is possible until activated.

**Governance mode: Trigger-activated. Not a standing programme.**

---

## Step 1B: Programme Classification

Applying the 5 TFEM typologies (Section 3):

| Programme | Hard Deadline | Exposure Window | Seasonal Risk | Capacity Dependent | Stability Sensitive |
|---|:---:|:---:|:---:|:---:|:---:|
| EUC / IT Enterprise Risk Refresh | ✓ (31 Dec) | ✓ | ✓ (Q4 squeeze) | ✓ | |
| DR — Tier 1 Apps | | ✓ | | ✓ | |
| SDWAN / Legacy Network Remediation | ✓ (30 Jun) | | | ✓ | ✓ |
| OT Layer 2 Segmentation | ✓ (31 Oct) | | | ✓ | ✓ |
| OT Risk Remediation — Top 10 | | ✓ | | ✓ | ✓ |
| Vulnerability Remediation | ✓ (31 Dec) | ✓ | | ✓ | |
| One PHINIA ID | ✓ (31 Jul) | | | | ✓ |
| SAP PN1 Infrastructure | ✓ (30 Apr / Q1 2027) | | | ✓ | ✓ |
| Data Center Consolidation | ✓ (multiple) | | | ✓ | ✓ |
| Azure Cloud Consolidation | ✓ (30 Apr / 31 Mar 2027) | | | ✓ | ✓ |
| LTI Mindtree / MSP Maturation | ✓ (31 Mar 2026) | | | ✓ | |
| Observability | ✓ (30 Apr 2026) | | | ✓ | |
| CMDB North Star | ✓ (31 Jan 2027) | | | ✓ | |
| Acquisition Integration | | ✓ | | ✓ | |

---

## Structural Risk Flags

These must be resolved before governance can be applied.

---

**🚩 Flag 1 — "Power PHINIA's AI adoption"**  
Presented as a Strategic Direction. Contains no delivery physics, no capacity model, no exposure deadline scoped to Infrastructure. Functions as an aspiration list. **Activity cluster masquerading as Programme direction.** Needs scoping into discrete funded initiatives before it can be governed.

---

**🚩 Flag 2 — "Software right-sizing / task force support"**  
Infrastructure's role is explicitly stated as *support*. No owned throughput commitment. No deadline. Cannot be governed as an Infrastructure programme. **Dependency item presented as Programme.**

---

**🚩 Flag 3 — "Reinforce IT culture"**  
Contains legitimate Operations flow metrics (incident aging, catalogue aging, site health) bundled with aspirational cultural language and a separate EA CoE target. Three structurally different things under one label. **Cannot be governed as a single programme.** Requires disaggregation:
- Flow metrics → Operations domain
- EA CoE → discrete bounded activity

---

**🚩 Flag 4 — "EA CoE — 5 new standards"**  
A metric target with no delivery mechanism, no capacity model, no accountable programme owner. **Metric disguised as Programme.**

---

**🚩 Flag 5 — "Digital thread pilot"**  
No Infrastructure-owned scope, no deadline, no capacity model. Cross-functional at best. **Pre-programme state — ungovernable until scoped.**

---

**🚩 Flag 6 — Seasonal risk gap: EUC / IT Enterprise Risk Refresh**  
The programme runs to 31 Dec but is classified Seasonal Risk Sensitive (Q4 capacity squeeze). No seasonal stress trigger is defined in the objectives. The programme may appear on trajectory until October, then compress fatally. **A seasonal capacity buffer and Q4 trigger rule must be defined at charter stage.**

---

## Next Steps (Options)

1. Resolve flagged items — assign or descope before programme registration
2. Charter a specific clean programme (e.g. Data Center Consolidation, SDWAN)
3. Proceed to Enterprise_Panel instantiation for classified programmes

*Confirm direction.*

---

*End of TFEM Structural Analysis v1.*
