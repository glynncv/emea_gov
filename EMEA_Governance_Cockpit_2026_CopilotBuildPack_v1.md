# EMEA Governance Cockpit 2026 — Copilot Build Pack
*Version:* v1 | *Date:* 2026-03-03 | *Owner:* EMEA SDM
*Framework:* TFEM Consolidated Reference v1 — Sections 7, 9, 10
*Workbook:* EMEA_Governance_Cockpit_2026.xlsx
*Sequence:* Run Prompts 1 through 6 in order to build. Prompts 7 and 8 are operational.

---

## Workbook Structure

| Sheet | Visibility | Purpose |
|---|---|---|
| Enterprise_Panel | Visible | Programme governance — Owned Core + Contributory Edge |
| Operations_Panel | Visible | Flow governance — EMEA site metrics |
| Trigger_Log | Visible | Escalation record |
| Physics_Engine | Visible | Burn rate formulas and projections — SDM working sheet |

**Anti-inflation rules:** No raw ticket tables. No charts unless trigger-linked. Maximum 4 sheets at all times.

---

## PROMPT 1 — Scaffold Workbook

```
Create a workbook called EMEA_Governance_Cockpit_2026 with exactly four sheets:
Enterprise_Panel (visible), Operations_Panel (visible), Trigger_Log (visible), Physics_Engine (visible).

Formatting for all visible sheets:
- Header row: dark navy fill (#1F3864), white bold text, 11pt Calibri, row height 20
- Alternating data rows: white and light grey (#F2F2F2)
- All columns: auto-fit width, left-aligned, 10pt Calibri
- Freeze top row on all visible sheets
- No gridlines — use cell borders only

Do not populate data. Create column headers only as specified in subsequent prompts.
```

---

## PROMPT 2 — Enterprise_Panel

```
On Enterprise_Panel, build three distinct sections with different column sets 
for each tier. Each section has its own header row and column headers.
Use a merged row for section dividers — full width of that section's columns.

═══════════════════════════════════════════
SECTION 1 — OWNED CORE
═══════════════════════════════════════════

Section header row — dark green (#375623), white bold, merged across all columns:
"OWNED CORE — Active Trigger Management | EMEA SDM is accountable owner"

Column headers for Section 1:
Programme | Physics Type | Accountable Owner | Operational Target | Remaining Work | Required Weekly Burn | Rolling 4W Burn | Physics Status | Trigger Status | Escalation Required | Notes

ROW 1 — MSP Maturation
Programme: MSP Maturation
Physics Type: Stability Thresholds
Accountable Owner: [To confirm]
Operational Target: 31-Mar-2026
Remaining Work: Stable state threshold — confirm in writing by 10 Mar 2026
Required Weekly Burn: PENDING — threshold required first
Rolling 4W Burn: [Refresh]
Physics Status: [Refresh]
Trigger Status: WATCH
Escalation Required: YES
Notes: Active rules MSP-T1 to T5. Threshold must be defined before 31 Mar closure.

ROW 2 — Legacy Network / SDWAN
Programme: Legacy Network / SDWAN
Physics Type: Required Burn
Accountable Owner: [To confirm]
Operational Target: 30-Jun-2026 (SDWAN + Amsterdam) / 30-Sep-2026 (PHINIA-Guest)
Remaining Work: EMEA site count required
Required Weekly Burn: Pending scope confirmation
Rolling 4W Burn: [Refresh]
Physics Status: [Refresh]
Trigger Status: PENDING
Escalation Required: NO — pending data
Notes: SDWAN-T1 to T7. Amsterdam 31 May blocks DC Consolidation exit.

Insert physics sub-row below ROW 2 — light grey (#D9D9D9), italic, indented:
"  ↳ Physics: SDWAN Burn | Sites Remaining: [=Physics_Engine!C4] | Burn/Wk: [=Physics_Engine!C6] | Status: [=Physics_Engine!C8]"
Status cell: green if "On Trajectory" / amber if "At Risk" / red if "Breached"

ROW 3 — EUC / Tech Refresh
Programme: EUC / Tech Refresh
Physics Type: Required Burn
Accountable Owner: [To confirm]
Operational Target: Q1-2026 (2025 purchases) / 31-Dec-2026 (EOSL)
Remaining Work: 200 devices (220 total, 20 overdue — source: EUC_EOSL.xlsx)
Required Weekly Burn: 4.7 devices/week (Q4 adjusted from 1 Oct)
Rolling 4W Burn: [Refresh]
Physics Status: [Refresh]
Trigger Status: WATCH — 20 devices overdue
Escalation Required: YES — overdue devices require clearance
Notes: EUC-T1 to T7. AR approved. Seasonal stress test at August Steering review.

Insert physics sub-row below ROW 3 — light grey (#D9D9D9), italic, indented:
"  ↳ Physics: EUC Burn | Units Remaining: [=Physics_Engine!B4] | Burn/Wk: [=Physics_Engine!B6] | Status: [=Physics_Engine!B8]"
Status cell: green if "On Trajectory" / amber if "At Risk" / red if "Breached"

ROW 4 — OT Risk Remediation
Programme: OT Risk Remediation
Physics Type: Milestone Integrity
Accountable Owner: Per site — to confirm
Operational Target: 31-Dec-2026
Remaining Work: Per-site status required from SNOW
Required Weekly Burn: N/A — milestone model
Rolling 4W Burn: N/A
Physics Status: [Refresh]
Trigger Status: PENDING
Escalation Required: [Refresh]
Notes: OT-REM-T1 to T8. Plan completion does not equal exposure reduction.

Insert physics sub-row below ROW 4 — light grey (#D9D9D9), italic, indented:
"  ↳ Physics: OT Milestone Integrity | Sites Active: [=Physics_Engine!D4] | Stagnation Flag: [=Physics_Engine!D6] | Status: [=Physics_Engine!D8]"
Status cell: green if "On Trajectory" / amber if "At Risk" / red if "Breached"

═══════════════════════════════════════════
SECTION 2 — CONTRIBUTORY
═══════════════════════════════════════════

Section header row — dark blue (#1F3864), white bold, merged across all columns:
"CONTRIBUTORY — Dependency Governance | EMEA SDM owns a specific input into each programme"

Column headers for Section 2:
Programme | Programme Owner | Our Dependency | Dependency Deadline | Dependency Status | Impact if Missed | Trigger Status | Escalation Required

ROW 5 — SAP Infrastructure
Programme: SAP Infrastructure
Programme Owner: SAP Tower / Global
Our Dependency: EMEA site infrastructure readiness for SAP PN1 go-live
Dependency Deadline: 30-Apr-2026
Dependency Status: [Refresh]
Impact if Missed: SAP PN1 delayed — cascades to DXC exit (30 Jun)
Trigger Status: WATCH — Azure landing zone dependency unconfirmed
Escalation Required: Flag if 30 Apr at risk

ROW 6 — DC Consolidation Amsterdam
Programme: DC Consolidation Amsterdam
Programme Owner: Hosting / Global
Our Dependency: SDWAN Amsterdam network connectivity
Dependency Deadline: 31-May-2026
Dependency Status: [Refresh]
Impact if Missed: Amsterdam DC exit (30 Jun) blocked
Trigger Status: WATCH
Escalation Required: Flag if SDWAN Amsterdam at risk

ROW 7 — OT Layer 2 Segmentation
Programme: OT Layer 2 Segmentation
Programme Owner: Infrastructure Tower
Our Dependency: EMEA site change window coordination
Dependency Deadline: 31-Oct-2026
Dependency Status: [Refresh]
Impact if Missed: EMEA site segmentation delayed — OT exposure window extends
Trigger Status: PENDING — EMEA site list required
Escalation Required: NO — pending data

ROW 8 — Acquisition Integration
Programme: Acquisition Integration
Programme Owner: Integration Team
Our Dependency: EMEA site Day 1 connectivity and site engagement capacity
Dependency Deadline: Acquisition close date — not yet triggered
Dependency Status: DORMANT — not triggered
Impact if Missed: Day 1 site connectivity failure
Trigger Status: GREEN — not triggered
Escalation Required: NO

═══════════════════════════════════════════
SECTION 3 — MONITOR
═══════════════════════════════════════════

Section header row — mid-grey (#595959), white bold, merged across all columns:
"MONITOR — Signal Awareness | No EMEA SDM ownership. Tracked for cross-programme impact only."

Column headers for Section 3:
Programme | Programme Owner | Why EMEA SDM Monitors | Status | Cross-Programme Risk

ROW 9 — DR Tier 1
Programme: DR Tier 1
Programme Owner: Infrastructure Tower
Why EMEA SDM Monitors: Stagnation risk affects EMEA site resilience baseline
Status: [Refresh]
Cross-Programme Risk: Low — no hard deadline forcing function

ROW 10 — Azure Cloud Consolidation
Programme: Azure Cloud Consolidation
Programme Owner: Azure / Global
Why EMEA SDM Monitors: Phase 1 (30 Apr) cascades into SDWAN and SAP PN1 — Owned programmes at risk if delayed
Status: [Refresh]
Cross-Programme Risk: HIGH — 30 Apr miss triggers cascade across 3 Owned programmes

ROW 11 — Vulnerability Remediation
Programme: Vulnerability Remediation
Programme Owner: Security Tower
Why EMEA SDM Monitors: Denominator drift affects EMEA site exposure metrics
Status: [Refresh]
Cross-Programme Risk: Medium — scope growth increases EMEA site remediation burden

ROW 12 — One PHINIA ID
Programme: One PHINIA ID
Programme Owner: Identity / Global
Why EMEA SDM Monitors: Scope ambiguity risk — critical app list undefined, EMEA sites affected
Status: [Refresh]
Cross-Programme Risk: Low — no confirmed EMEA SDM dependency

ROW 13 — Observability
Programme: Observability
Programme Owner: Infrastructure Tower
Why EMEA SDM Monitors: Full monitoring coverage definition gap affects EMEA site visibility
Status: [Refresh]
Cross-Programme Risk: Low — definition risk only

ROW 14 — CMDB North Star
Programme: CMDB North Star
Programme Owner: CMDB / Global
Why EMEA SDM Monitors: Data quality affects EMEA governance metrics accuracy
Status: [Refresh]
Cross-Programme Risk: Medium — CMDB accuracy underpins Operations Panel metrics

Apply these formatting rules across all three sections:
- Owned rows: white fill, standard weight
- Physics sub-rows: light grey (#D9D9D9), italic
- Contributory rows: light blue (#DDEEFF), standard weight
- Monitor rows: light grey (#F2F2F2), standard weight
- All Trigger Status cells: conditional format — green fill if GREEN, amber if WATCH, red if BREACHED
- All Escalation Required cells: conditional format — red fill if YES, white if NO
- Freeze row 1 (workbook header) and row 2 (first section header)
```

---

## PROMPT 3 — Operations_Panel

```
On Operations_Panel create these columns in order:
Metric | Site Scope | Target | Current Value | Previous 4W Avg | 4W Trend | Trigger Rule | Trigger Status | Escalation Required

Add a merged top header — dark green (#375623), white bold:
"EMEA SITES — 24 Physical Sites: Duesseldorf · Warwick (Titan) · Madrid · Blois · Cinisello · Izmir ESBAS 3 · Izmir ESBAS 2 · Gillingham · Stonehouse · Iasi · Bucharest · Rzeszow · Dubai · Amal · Istanbul · Cergy · Warsaw (Delphi Academy) · Warsaw · Technical Center Krakow · Krakow · Hartridge · Belval · Wroclaw · Warwick"

Section header — mid-grey (#808080), white bold: "Incident and Request Aging"

ROW 1 — Incident Aging
Metric: Open Incident Aging — 10 Days or Less
Site Scope: All 7 EMEA sites
Target: 90% adherence
Current Value: [Refresh]
Previous 4W Avg: [Refresh]
4W Trend: [Refresh]
Trigger Rule: OPS-T1 below 90% one week equals Watch / OPS-T2 below 90% two consecutive weeks equals Breached
Trigger Status: PENDING
Escalation Required: [Refresh]

ROW 2 — Catalogue Aging
Metric: Open Catalogue Request Aging — 30 Days or Less
Site Scope: All 7 EMEA sites
Target: 90% adherence
Current Value: [Refresh]
Previous 4W Avg: [Refresh]
4W Trend: [Refresh]
Trigger Rule: OPS-T3 below 90% two consecutive weeks equals Breached
Trigger Status: PENDING
Escalation Required: [Refresh]

ROW 3 — SLA x2
Metric: Aged Incidents Greater Than SLA x2
Site Scope: All 7 EMEA sites
Target: Declining trend / Zero P1 and P2 tolerance
Current Value: [Refresh]
Previous 4W Avg: [Refresh]
4W Trend: [Refresh]
Trigger Rule: OPS-T4 any P1 or P2 in band equals Immediate / OPS-T5 P3 and P4 count up two weeks equals Breached
Trigger Status: PENDING
Escalation Required: [Refresh]

Section header — mid-grey, white bold: "Stagnation Signals"

ROW 4 — No Movement
Metric: Tickets With No Movement 14 or More Days
Site Scope: All 7 EMEA sites
Target: Zero
Current Value: [Refresh]
Previous 4W Avg: [Refresh]
4W Trend: [Refresh]
Trigger Rule: OPS-T6 count above zero equals Watch / OPS-T7 count increasing two consecutive weeks equals Breached
Trigger Status: PENDING
Escalation Required: [Refresh]

Section header — mid-grey, white bold: "Stability Signals"

ROW 5 — Repeat MIs
Metric: Repeat Major Incidents — Same CI or Site Within 30 Days
Site Scope: All 7 EMEA sites
Target: Zero without linked Problem record
Current Value: [Refresh]
Previous 4W Avg: [Refresh]
4W Trend: [Refresh]
Trigger Rule: OPS-T8 repeat MI without Problem equals Watch same day / OPS-T9 second repeat without RCA equals Breached same day
Trigger Status: PENDING
Escalation Required: [Refresh]

ROW 6 — Problems Without RCA
Metric: Open Problems Without RCA — Over 30 Days
Site Scope: All 7 EMEA sites
Target: Zero
Current Value: [Refresh]
Previous 4W Avg: [Refresh]
4W Trend: [Refresh]
Trigger Rule: OPS-T10 over 30 days equals Watch / OPS-T11 over 60 days equals Breached
Trigger Status: PENDING
Escalation Required: [Refresh]

Section header — mid-grey, white bold: "SDM Accountability Cadence"

ROW 7 — Site Health
Metric: Site Health — Quarterly Update Compliance
Site Scope: All 7 EMEA sites
Target: 7 of 7 per quarter
Current Value: [Q1 confirm]
Previous 4W Avg: N/A
4W Trend: N/A
Trigger Rule: OPS-T12 any site not updated by week 8 equals Watch / OPS-T13 any site not updated by end of quarter equals Breached
Trigger Status: PENDING
Escalation Required: [Q1 confirm]

ROW 8 — BRM Cadence
Metric: SDM-BRM Meeting Cadence
Site Scope: All 7 EMEA sites
Target: 100% — no gap over 2 weeks per pairing
Current Value: [Confirm]
Previous 4W Avg: N/A
4W Trend: N/A
Trigger Rule: OPS-T14 gap over 2 weeks equals Watch / OPS-T15 gap over 4 weeks equals Breached
Trigger Status: PENDING
Escalation Required: [Confirm]

ROW 9 — Site Visits
Metric: SDM Site Visit — Quarterly Compliance
Site Scope: All 7 EMEA sites
Target: 7 of 7 per quarter
Current Value: [Q1 confirm]
Previous 4W Avg: N/A
4W Trend: N/A
Trigger Rule: OPS-T16 any site not visited by week 10 equals Watch / OPS-T17 any site not visited by end of quarter equals Breached
Trigger Status: PENDING
Escalation Required: [Q1 confirm]
```

---

## PROMPT 4 — Trigger_Log

```
On Trigger_Log create these columns in order:
Trigger Date | Domain | Programme / Metric | Trigger Type | Threshold Breached | Escalated To | Escalation Action | Status | Closure Date

Apply conditional formatting to Status column:
Open = red fill (#FF0000), white bold
Monitoring = amber fill (#FFC000), black bold
Closed = green fill (#00B050), white bold

Add italic grey text in cell A2:
"Log entries created at point of trigger breach only. No pre-population."

Leave all data rows empty.
```

---

## PROMPT 5 — Physics_Engine

```
On Physics_Engine (keep hidden) create four labelled calculation blocks.
All manual input cells: yellow fill (#FFFF00).

BLOCK 1 — EUC TECH REFRESH BURN PHYSICS
Manual inputs: Total EOSL Units in Scope / Units Remediated to Date / Rolling 4W Average
Calculated cells:
Units Remaining = Total minus Remediated
Weeks to 31 Dec 2026 = (DATE(2026,12,31) - TODAY()) / 7
Required Weekly Burn = Remaining divided by Weeks
Physics Status = IF Rolling4W is above or equal to Required then "On Trajectory", IF above 80% of Required then "Watch", else "BREACHED"
Seasonal Stress sub-block:
Weeks before 1 Oct = MAX(0, (DATE(2026,10,1) - TODAY()) / 7)
Weeks 1 Oct to 31 Dec = MAX(0, (DATE(2026,12,31) - DATE(2026,10,1)) / 7)
Effective Capacity = (Weeks before 1 Oct times Rolling4W) + (Weeks after 1 Oct times Rolling4W times 0.7)
Seasonal Status = IF Effective Capacity above or equal to Remaining then "On Trajectory" else "BREACHED — escalate immediately"

BLOCK 2 — SDWAN LEGACY NETWORK BURN PHYSICS
Manual inputs: Total EMEA Sites in Scope / Sites Completed / Rolling 4W Average
Calculated cells:
Sites Remaining = Total minus Completed
Weeks to 30 Jun 2026 = (DATE(2026,6,30) - TODAY()) / 7
Required Weekly Burn = Remaining divided by Weeks
Projected Completion Date = TODAY() + (Remaining divided by Rolling4W times 7)
Physics Status = same logic as Block 1

BLOCK 3 — OT REMEDIATION STAGNATION TRACKER
One row per site. Columns:
Site Name | Last Activity Date | Days Since Activity | Funding Confirmed | Milestone Slips | Stagnation Flag | Status
Days Since Activity = TODAY() minus Last Activity Date
Stagnation Flag = IF Days above 30 then "STAGNANT", IF above 14 then "WATCH", else "Active"
Status = IF Milestone Slips above or equal to 2 then "Breached", IF Days above 30 then "Breached", IF Days above 14 then "Watch", else "Active"

BLOCK 4 — OPERATIONS TREND CALCULATIONS
One row per metric. Columns:
Metric | Wk1 | Wk2 | Wk3 | Wk4 | 4W Average | Trend
4W Average = AVERAGE(Wk1:Wk4)
Trend = IF Wk4 above Wk3 then up arrow, IF below then down arrow, else "Stable"
Metrics to include: Incident Aging % / Catalogue Aging % / SLA x2 Count / No Movement Count / Repeat MI Count / Problems Without RCA Count
```

---

## PROMPT 6 — Conditional Formatting

```
Apply to Trigger Status column on both Enterprise_Panel and Operations_Panel:
"GREEN" = fill #00B050, white bold text
"WATCH" = fill #FFC000, black bold text
"BREACHED" = fill #FF0000, white bold text
"PENDING" = fill #D9D9D9, black text
Contains "DEP" = fill #DAE8FC, black text

Apply to Escalation Required column on both panels:
"YES" = fill #FF0000, white bold text
"NO" = fill #00B050, white bold text
Contains "Refresh" or "Confirm" = fill #D9D9D9, black text
```

---

## PROMPT 7 — Weekly Refresh (operational)

```
Using the latest SNOW export for all 24 active EMEA physical sites (site IDs: 10605, 10646, 00195, 00202, 00232, 00268, 00269, 00274, 00282, 10304, 10657, 20030, 20011, 20036, 20027, 10590, 20035, 20032, 20028, 10682, 10415, 20034, 20033, 10610 — Blonie 10381 removed, site closed 08 Mar 2026):

1. Physics_Engine Block 1: update Units Remediated to Date and Rolling 4W Average
2. Physics_Engine Block 2: update Sites Completed and Rolling 4W Average
3. Physics_Engine Block 3: update Last Activity Date and Milestone Slips per site
4. Operations_Panel: update Current Value for all 9 metrics and recalculate 4W averages and trends
5. Re-evaluate all Trigger Status cells against trigger rules
6. Any metric at WATCH or BREACHED: set Escalation Required to YES and flag for Trigger_Log entry
7. If today is within 4 weeks of 1 August: run EUC seasonal stress test and report result
```

---

## PROMPT 8 — Breach Escalation Draft (operational)

```
Draft an escalation statement for the following breach.
Programme or Metric: [name]
Trigger Rule Breached: [rule ID and condition]
Current Value: [value]
Required Value: [value]
Projected Risk if unresolved: [consequence]

Format: three sentences maximum.
Must include: what breached / the gap / the ask.
The ask must state: accountable owner / committed completion date / throughput commitment / next checkpoint date.
No narrative. No softening. State the physics only.
```

---

## PROMPT 12 — Redesign Enterprise_Panel for Three-Tier Structure (run once on existing workbook)

Use this prompt to update your existing live cockpit to the full 14-programme three-tier design.
Run in Claude Excel Add-In with EMEA_Governance_Cockpit_2026.xlsx open.
This replaces the original 8-programme single-column layout.

```
I need to redesign the Enterprise_Panel sheet in this workbook to show all 14 
TFEM programmes across three governance tiers. The current panel has 8 rows 
and a single column structure. Replace it entirely with the following.

STEP 1 — Clear Enterprise_Panel
Clear all existing content and formatting on Enterprise_Panel. 
Keep the sheet — do not delete it.

STEP 2 — OWNED CORE section
Section header row — dark green (#375623), white bold, merged full width:
"OWNED CORE — Active Trigger Management | EMEA SDM is accountable owner"

Column headers: Programme | Physics Type | Accountable Owner | Operational Target | Remaining Work | Required Weekly Burn | Rolling 4W Burn | Physics Status | Trigger Status | Escalation Required | Notes

Add these 4 rows with physics sub-rows:

ROW: MSP Maturation | Stability Thresholds | [To confirm] | 31-Mar-2026 | Stable state threshold — confirm in writing | PENDING | [Refresh] | [Refresh] | WATCH | YES | MSP-T1 to T5

ROW: Legacy Network / SDWAN | Required Burn | [To confirm] | 30-Jun-2026 / 30-Sep-2026 | EMEA site count required | Pending scope | [Refresh] | [Refresh] | PENDING | NO | SDWAN-T1 to T7. Amsterdam 31 May blocks DC exit.
Physics sub-row (light grey, italic): "  ↳ Physics: SDWAN Burn" | Sites Remaining: =Physics_Engine!C4 | Burn/Wk: =Physics_Engine!C6 | Status: =Physics_Engine!C8

ROW: EUC / Tech Refresh | Required Burn | [To confirm] | 31-Dec-2026 | 200 devices remaining (20 overdue) | 4.7/week | [Refresh] | [Refresh] | WATCH | YES | EUC-T1 to T7. AR approved. Seasonal stress test Aug.
Physics sub-row (light grey, italic): "  ↳ Physics: EUC Burn" | Units Remaining: =Physics_Engine!B4 | Burn/Wk: =Physics_Engine!B6 | Status: =Physics_Engine!B8

ROW: OT Risk Remediation | Milestone Integrity | Per site | 31-Dec-2026 | Per-site status from SNOW | N/A | N/A | [Refresh] | PENDING | [Refresh] | OT-REM-T1 to T8
Physics sub-row (light grey, italic): "  ↳ Physics: OT Milestone Integrity" | Sites Active: =Physics_Engine!D4 | Stagnation Flag: =Physics_Engine!D6 | Status: =Physics_Engine!D8

STEP 3 — CONTRIBUTORY section
Section header row — dark blue (#1F3864), white bold, merged full width:
"CONTRIBUTORY — Dependency Governance | EMEA SDM owns a specific input into each programme"

Column headers: Programme | Programme Owner | Our Dependency | Dependency Deadline | Dependency Status | Impact if Missed | Trigger Status | Escalation Required

Add these 4 rows (light blue fill #DDEEFF):

ROW: SAP Infrastructure | SAP Tower / Global | EMEA site infrastructure readiness | 30-Apr-2026 | [Refresh] | SAP PN1 delayed — cascades to DXC exit 30 Jun | WATCH | Flag if 30 Apr at risk
ROW: DC Consolidation Amsterdam | Hosting / Global | SDWAN Amsterdam connectivity | 31-May-2026 | [Refresh] | Amsterdam DC exit 30 Jun blocked | WATCH | Flag if SDWAN Amsterdam at risk
ROW: OT Layer 2 Segmentation | Infrastructure Tower | EMEA site change window coordination | 31-Oct-2026 | [Refresh] | EMEA segmentation delayed — OT exposure extends | PENDING | NO
ROW: Acquisition Integration | Integration Team | EMEA site Day 1 connectivity and capacity | Not triggered | DORMANT | Day 1 site connectivity failure | GREEN | NO

STEP 4 — MONITOR section
Section header row — mid-grey (#595959), white bold, merged full width:
"MONITOR — Signal Awareness | No EMEA SDM ownership. Tracked for cross-programme impact only."

Column headers: Programme | Programme Owner | Why EMEA SDM Monitors | Status | Cross-Programme Risk

Add these 6 rows (light grey fill #F2F2F2):

ROW: DR Tier 1 | Infrastructure Tower | Stagnation risk affects EMEA site resilience | [Refresh] | Low
ROW: Azure Cloud Consolidation | Azure / Global | Phase 1 (30 Apr) cascades into SDWAN and SAP PN1 | [Refresh] | HIGH — 30 Apr miss triggers cascade across 3 Owned programmes
ROW: Vulnerability Remediation | Security Tower | Denominator drift affects EMEA site exposure | [Refresh] | Medium
ROW: One PHINIA ID | Identity / Global | Scope ambiguity risk — EMEA sites affected | [Refresh] | Low
ROW: Observability | Infrastructure Tower | Coverage definition gap affects EMEA site visibility | [Refresh] | Low
ROW: CMDB North Star | CMDB / Global | Data quality underpins Operations Panel metrics | [Refresh] | Medium

STEP 5 — Formatting
- All Trigger Status cells: green fill if GREEN / amber fill if WATCH / red fill if BREACHED / grey if PENDING
- All Escalation Required cells: red fill if YES / white fill if NO
- Physics sub-row status cells: green if "On Trajectory" / amber if "At Risk" / red if "Breached"
- Cross-Programme Risk cells in Monitor section: red fill if HIGH / amber if Medium / white if Low
- Freeze top 2 rows
- Auto-fit all column widths
- Unhide Physics_Engine sheet tab if currently hidden

STEP 6 — Confirm
Read back all 14 programme rows and confirm they are present and correctly 
assigned to their tier sections. Confirm Physics sub-row formula links to 
Physics_Engine are resolving. Report any formula errors.
```

---

*End of EMEA Governance Cockpit 2026 — Copilot Build Pack v1.*
*Run Prompts 1 through 6 in sequence to build the workbook.*
*Prompt 12 is a one-time update for existing cockpits — adds physics summary to Enterprise_Panel and unhides Physics_Engine.*
*Prompts 7 and 8 are operational — use weekly and on breach respectively.*
