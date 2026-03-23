# EMEA SDM — Enterprise Programme Register 2026
*Version:* v2
*Date:* 2026-03-09
*Owner:* EMEA SDM (Colman)
*Framework:* TFEM Consolidated Reference v1 — Section 7.1
*Scope:* All 14 TFEM programmes — three governance tiers
*Remit Filter:* Applied — Owned (4) · Contributory (4) · Monitor (6)

---

## Register Key

| Symbol | Meaning |
|---|---|
| ✅ | Confirmed / Available |
| ⚠️ | Data gap — must be resolved before physics can be applied |
| 🚨 | Immediate breach risk — action required within days |
| [DEP] | Contributory — EMEA SDM owns a specific dependency input |
| [MON] | Monitor — signal awareness only, no ownership |

---

## Owned Core — Active Trigger Management

---

### Programme 1: MSP Maturation

| Field | Value |
|---|---|
| **Classification** | Hard Deadline · Capacity Dependent |
| **Physics Type** | Stability Thresholds |
| **Accountable Owner** | ⚠️ To confirm — named Infrastructure/MSP owner required |
| **EMEA SDM Role** | Governance owner — stability threshold enforcement |
| **Operational Target** | 31 March 2026 |
| **Exposure Deadline** | 31 March 2026 |
| **Remaining Work** | ⚠️ Stable state threshold not yet defined in writing — **this is the primary blocker** |
| **Required Weekly Burn** | ⚠️ Cannot be set until stable state threshold is defined |
| **Rolling 4W Burn** | ⚠️ Not available |
| **Projected Completion** | 🚨 4 weeks to deadline — immediate breach risk if threshold undefined |
| **Capacity Assumption** | LTI Mindtree operational delivery capacity |
| **Funding Status** | ✅ Assumed confirmed (MSP contract in place) |
| **Stagnation Flag** | 🚨 Threshold definition: no confirmed date — standing stagnation risk |
| **Trigger Status** | 🚨 WATCH — stable state threshold must be confirmed in writing by 10 March |
| **Escalation Required** | Yes — if threshold not confirmed by 10 March |

**Active Trigger Rules:** MSP-T1 · MSP-T2 · MSP-T3 · MSP-T4 · MSP-T5
**Constraints:** Follow-on activities (Observability, SysTrack, IaC, PHINfo, Voicing.AI) must be formally separated from this programme's 31 March closure milestone.

---

### Programme 2: Legacy Network / SDWAN

| Field | Value |
|---|---|
| **Classification** | Hard Deadline · Capacity Dependent · Stability Sensitive |
| **Physics Type** | Required Burn (throughput) |
| **Accountable Owner** | ⚠️ To confirm — named Infrastructure/Network owner required |
| **EMEA SDM Role** | Governance owner — site delivery accountability |
| **Operational Target** | 30 June 2026 (SDWAN + Amsterdam) · 30 Sept 2026 (PHINIA-Guest) |
| **Exposure Deadline** | 30 June 2026 |
| **Remaining Work** | ⚠️ Total EMEA site count for SDWAN deployment not confirmed |
| **Required Weekly Burn** | ⚠️ Cannot be set until site count confirmed |
| **Rolling 4W Burn** | ⚠️ Not available — requires SNOW export |
| **Projected Completion** | ⚠️ Cannot be calculated without site count and current burn data |
| **Capacity Assumption** | Site IT + vendor deployment capacity per EMEA site |
| **Funding Status** | ⚠️ To confirm |
| **Stagnation Flag** | ⚠️ No site-level activity data available yet |
| **Trigger Status** | ⚠️ PENDING — scope confirmation required before trigger rules activate |
| **Escalation Required** | No — pending data |

**Active Trigger Rules:** SDWAN-T1 · SDWAN-T2 · SDWAN-T3 · SDWAN-T4 · SDWAN-T5 · SDWAN-T6 · SDWAN-T7
**Constraints:** Amsterdam network connectivity (31 May) is a hard dependency for DC Consolidation Amsterdam exit. Azure/DD connectivity (30 Apr) is a hard dependency for Azure Consolidation Phase 1. Sub-deadline sequencing failure cascades into cross-programme breaches.

---

### Programme 3: EUC / Tech Refresh

| Field | Value |
|---|---|
| **Classification** | Hard Deadline · Exposure Window · Seasonal Risk Sensitive · Capacity Dependent |
| **Physics Type** | Required Burn (throughput) |
| **Accountable Owner** | ⚠️ To confirm — named Infrastructure/EUC owner required |
| **EMEA SDM Role** | Governance owner — site deployment coordination and EOSL remediation |
| **Operational Target** | Q1 2026 (2025 purchases) · 31 December 2026 (EOSL) |
| **Exposure Deadline** | 31 December 2026 |
| **Remaining Work** | 220 devices to replace (source: EUC_EOSL.xlsx from PBI). 20 overdue (Oct 2025 target). 200 remaining by Nov 2026. Highest burden: Iasi (76), Izmir (64). |
| **Required Weekly Burn** | 200 devices ÷ 38 remaining weeks (Mar–Nov 2026) ≈ 6 devices/week minimum. Q4 seasonal adjustment applies from 1 Oct (capacity -30% = ~4/week Oct–Nov). |
| **Rolling 4W Burn** | ⚠️ Not available — requires SNOW export |
| **Projected Completion** | ⚠️ Cannot be calculated |
| **Capacity Assumption** | Site IT deployment capacity — Q4 seasonal reduction -30% from 1 Oct |
| **Funding Status** | ⚠️ AR approval (28 Feb gate) — status to confirm; if missed, throughput assumption breaks |
| **Stagnation Flag** | ⚠️ No site-level activity data available yet |
| **Trigger Status** | ⚠️ PENDING — scope and AR approval status required |
| **Escalation Required** | ⚠️ AR approval status must be confirmed immediately |

**Active Trigger Rules:** EUC-T1 · EUC-T2 · EUC-T3 · EUC-T4 · EUC-T5 · EUC-T6 · EUC-T7
**Constraints:** AR approval (28 Feb) is a funding gate — if unconfirmed, this is an immediate breach condition. Seasonal stress test must be run at August Steering review. Q1 2025-purchase deployment milestone should already be complete or in breach.

---

### Programme 4: OT Risk Remediation — Top 10 Sites

| Field | Value |
|---|---|
| **Classification** | Exposure Window · Capacity Dependent · Stability Sensitive |
| **Physics Type** | Milestone Integrity (stagnation-governed) |
| **Accountable Owner** | ⚠️ To confirm — named owner per site required |
| **EMEA SDM Role** | Governance owner — site stagnation and milestone integrity enforcement |
| **Operational Target** | 31 December 2026 |
| **Exposure Deadline** | 31 December 2026 |
| **Remaining Work** | Plans outstanding for sites not yet completed (count to confirm against 10-site list) |
| **Required Weekly Burn** | Not applicable — milestone integrity model, not throughput burn |
| **Rolling 4W Burn** | Not applicable |
| **Projected Completion** | ⚠️ Dependent on per-site activity status — requires current SNOW/site data |
| **Capacity Assumption** | Site OT owner availability + funding confirmation per site |
| **Funding Status** | ⚠️ Per-site funding confirmation required — unconfirmed funding >30 days = Watch trigger |
| **Stagnation Flag** | ⚠️ Site-level activity data required to assess |
| **Trigger Status** | ⚠️ PENDING — per-site status data required |
| **Escalation Required** | ⚠️ To be assessed on first data refresh |

**Active Trigger Rules:** OT-REM-T1 · OT-REM-T2 · OT-REM-T3 · OT-REM-T4 · OT-REM-T5 · OT-REM-T6 · OT-REM-T7 · OT-REM-T8
**Constraints:** Plan completion ≠ exposure reduction — governance must maintain this distinction. Sites 10–20 inventory is a separate 2027 budget-preparation activity and must not be conflated with remediation plan milestone tracking.

---

## Contributory Edge — Dependency Tracking

*These programmes are not EMEA SDM-owned. Rows track dependency status only. Trigger rules are not EMEA SDM's to set or enforce — flag inherited risk only.*

---

### [DEP] SAP Infrastructure

| Field | Value |
|---|---|
| **Classification** | Hard Deadline · Capacity Dependent · Stability Sensitive |
| **Owner** | SAP Tower / Global |
| **EMEA SDM Dependency** | Infrastructure readiness for EMEA-relevant PN1 sites |
| **Key Milestone** | 30 April 2026 — all infrastructure foundations confirmed |
| **Dependency Risk** | Azure Consolidation Phase 1 (30 Apr) must land for this to proceed |
| **EMEA SDM Action** | Monitor milestone status monthly; flag if 30 Apr at risk — inherited breach impacts SDWAN and DC Consolidation |
| **Trigger Status** | ⚠️ WATCH — Azure landing zone dependency unconfirmed |

---

### [DEP] DC Consolidation — Amsterdam

| Field | Value |
|---|---|
| **Classification** | Hard Deadline · Capacity Dependent · Stability Sensitive |
| **Owner** | Hosting / Global |
| **EMEA SDM Dependency** | Amsterdam new facility standup and old DC exit by 30 June 2026 |
| **Key Milestone** | 30 June 2026 — Amsterdam old DC exit declared |
| **Dependency Risk** | SDWAN Amsterdam network connectivity (EMEA SDM-owned) must be confirmed by 31 May — failure blocks this exit |
| **EMEA SDM Action** | Confirm Amsterdam SDWAN connectivity milestone (31 May) is on track; flag to DC Consolidation owner if at risk |
| **Trigger Status** | ⚠️ WATCH — SDWAN Amsterdam connectivity is EMEA SDM's owned dependency into this programme |

---

### [DEP] OT Layer 2 Segmentation

| Field | Value |
|---|---|
| **Classification** | Hard Deadline · Capacity Dependent · Stability Sensitive |
| **Owner** | Infrastructure Tower |
| **EMEA SDM Dependency** | EMEA site engagement — change window coordination and site IT availability |
| **Key Milestone** | 31 October 2026 — all relevant EMEA sites segmented |
| **Dependency Risk** | Site change window deferral and OT owner reluctance are the primary risks — EMEA SDM is the site engagement escalation route |
| **EMEA SDM Action** | Monitor EMEA site stagnation flags; escalate deferred change windows to Infrastructure owner; do not own the trigger rules |
| **Trigger Status** | ⚠️ PENDING — EMEA site list and current activity status required |

---

### [DEP] Acquisition Day 1

| Field | Value |
|---|---|
| **Classification** | Exposure Window · Capacity Dependent |
| **Owner** | Integration Team |
| **EMEA SDM Dependency** | EMEA-based acquisition sites — Day 1 network connectivity and site engagement |
| **Key Milestone** | Acquisition close date (trigger-activated — no standing date) |
| **Dependency Risk** | No acquisition triggered yet — standing readiness posture only |
| **EMEA SDM Action** | Confirm EMEA-relevant scope when acquisition triggers; ensure site engagement capacity is not in conflict with Owned Core programmes |
| **Trigger Status** | GREEN — no acquisition triggered |

---

## Monitor — Signal Awareness Only

No EMEA SDM ownership. Tracked for cross-programme impact only. Single row per programme — status read from programme owner reporting.

---

### [MON] DR Tier 1

| Field | Value |
|---|---|
| **Programme Owner** | Infrastructure Tower |
| **Why EMEA SDM Monitors** | Stagnation risk affects EMEA site resilience baseline |
| **Status** | [Refresh] |
| **Cross-Programme Risk** | Low — no hard deadline forcing function |

---

### [MON] Azure Cloud Consolidation

| Field | Value |
|---|---|
| **Programme Owner** | Azure / Global |
| **Why EMEA SDM Monitors** | Phase 1 (30 Apr) cascades into SDWAN and SAP PN1 — 3 Owned programmes at risk if delayed |
| **Status** | [Refresh] |
| **Cross-Programme Risk** | HIGH — 30 Apr miss triggers cascade across SDWAN, SAP Infrastructure, DC Consolidation |

---

### [MON] Vulnerability Remediation

| Field | Value |
|---|---|
| **Programme Owner** | Security Tower |
| **Why EMEA SDM Monitors** | Denominator drift increases EMEA site remediation burden |
| **Status** | [Refresh] |
| **Cross-Programme Risk** | Medium — scope growth affects EMEA site teams |

---

### [MON] One PHINIA ID

| Field | Value |
|---|---|
| **Programme Owner** | Identity / Global |
| **Why EMEA SDM Monitors** | Scope ambiguity risk — critical app list undefined, EMEA sites affected |
| **Status** | [Refresh] |
| **Cross-Programme Risk** | Low — no confirmed EMEA SDM dependency |

---

### [MON] Observability

| Field | Value |
|---|---|
| **Programme Owner** | Infrastructure Tower |
| **Why EMEA SDM Monitors** | Full monitoring coverage definition gap affects EMEA site visibility |
| **Status** | [Refresh] |
| **Cross-Programme Risk** | Low — definition risk only |

---

### [MON] CMDB North Star

| Field | Value |
|---|---|
| **Programme Owner** | CMDB / Global |
| **Why EMEA SDM Monitors** | Data quality underpins Operations Panel metrics accuracy |
| **Status** | [Refresh] |
| **Cross-Programme Risk** | Medium — CMDB accuracy directly affects EMEA governance metric reliability |

---

## Register Summary — Trigger Status Snapshot

| Programme | Tier | Trigger Status | Immediate Action |
|---|---|---|---|
| MSP Maturation | Owned | 🚨 WATCH | Stable state threshold in writing by 10 March |
| Legacy Network / SDWAN | Owned | ⚠️ PENDING | Confirm EMEA site count and current burn data |
| EUC / Tech Refresh | Owned | ⚠️ WATCH | 20 devices overdue. AR approved. Burn: 4.7/week. |
| OT Risk Remediation | Owned | ⚠️ PENDING | Confirm per-site status and funding |
| SAP Infrastructure | [DEP] | ⚠️ WATCH | Monitor 30 Apr Azure dependency |
| DC Consolidation Amsterdam | [DEP] | ⚠️ WATCH | SDWAN Amsterdam (31 May) is EMEA SDM-owned dependency |
| OT Layer 2 Segmentation | [DEP] | ⚠️ PENDING | Confirm EMEA site list and activity status |
| Acquisition Integration | [DEP] | ✅ GREEN | No action — not triggered |
| DR Tier 1 | [MON] | [Refresh] | Awareness only |
| Azure Cloud Consolidation | [MON] | [Refresh] | Watch 30 Apr — HIGH cross-programme risk |
| Vulnerability Remediation | [MON] | [Refresh] | Awareness only |
| One PHINIA ID | [MON] | [Refresh] | Awareness only |
| Observability | [MON] | [Refresh] | Awareness only |
| CMDB North Star | [MON] | [Refresh] | Awareness only |

---

## Data Gaps — First Refresh Requirements

The following must be resolved before the cockpit can be operationalised. These are not optional:

| Gap | Programme(s) | Required By |
|---|---|---|
| Stable state threshold — defined in writing | MSP Maturation | 10 March 2026 |
| AR approval status confirmed | EUC / Tech Refresh | ✅ RESOLVED — AR approved |
| EOSL unit count per EMEA site | EUC_EOSL.xlsx (PBI export) | ✅ RESOLVED — 220 devices confirmed |
| EMEA site count for SDWAN deployment | SDWAN | First SNOW refresh |
| Per-site status and funding confirmation | OT Risk Remediation | First SNOW refresh |
| EMEA site list for OT Layer 2 | OT Layer 2 [DEP] | First SNOW refresh |
| Named accountable owner per Owned programme | All Owned | Before first Steering review |
| Azure Phase 1 status confirmation | Azure [MON] | Monitor weekly — HIGH risk flag |

---

*End of EMEA SDM Enterprise Programme Register 2026 v2.*
*All 14 TFEM programmes tracked. Three tiers: Owned (full governance) · Contributory (dependency) · Monitor (signal awareness).*
*Next step: Run Build Pack Prompt 12 in Claude Excel Add-In to rebuild Enterprise_Panel with three-tier structure.*
