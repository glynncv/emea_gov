# EMEA Governance Cockpit 2026 — Consolidated SNOW Report & Excel Add-In Prompt
*Version:* v2
*Date:* 2026-03-06
*Owner:* EMEA SDM (Colman)
*Replaces:* SNOW Data Requirements Specification v1 (8 separate reports)
*Approach:* One consolidated SNOW export → one Claude Excel Add-In prompt

---

## Part 1 — Single Consolidated SNOW Report

### Report Name
`EMEA_GOV_Weekly_Consolidated`

### One-Line Description
All open Incidents, Catalogue Tasks, and Problems for the 25 EMEA physical sites, plus Major Incident history for the past 60 days.

---

### How to Configure in SNOW

**Module:** Start from the Incident module. SNOW allows multi-table exports in some instances — if yours does not, see the Two-Table Fallback below.

**Filters — apply all:**

| Field | Condition | Value |
|---|---|---|
| location.u_site_name | is one of | [paste 25 site names — see list below] |
| State | is not | Cancelled |
| State | is not | Closed (except for MI history — see note) |

**MI history exception:** For Major Incidents (Priority 1 and 2) only, include records where Closed date is within the past 60 days, even if State = Closed. This is needed for the repeat MI calculation.

**Practical approach if your SNOW instance cannot mix open + closed in one filter:**
Use a condition group:
- Group A: State is not Closed AND State is not Cancelled (catches all open records)
- Group B: Priority is 1 OR 2 AND Closed date >= [today minus 60 days] (catches recent MI history)
- Combine: Group A OR Group B

---

### Columns to Include

Include all columns below. If a column does not exist in your instance, leave it out — the Add-In prompt handles missing fields gracefully.

| Column | Field Name | Used For |
|---|---|---|
| Record type | sys_class_name | Distinguishes Incident / SC_TASK / Problem |
| Site | location.u_site_name | All metrics — site filter and grouping. Note: dot-walked field, not u_site_name directly. Confirmed in live SNOW instance. |
| Number | number | Reference only |
| Priority | priority | Metrics 1, 3 (SLA x2 P1/P2 split) |
| State | state | Open/closed filtering |
| Opened date | opened_at | Age calculations — all metrics |
| Last updated | sys_updated_on | Metric 4 (no movement) |
| SLA target (hours) | sla_target | Metric 3 (SLA x2) — include if available |
| Resolved date | resolved_at | MI history only |
| Closed date | closed_at | MI history only |
| Configuration item | cmdb_ci | Metric 5 (repeat MI — same CI) |
| Problem ID | problem_id | Metric 5 (linked Problem check) |
| Root cause | u_root_cause or root_cause | Metric 6 (Problems without RCA) |
| Short description | short_description | Context only — not used in calculations |
| Assigned to | assigned_to | Context only |
| Assignment group | assignment_group | Context only |

---

### 25 EMEA Site Names — Paste into SNOW Filter

```
Duesseldorf - Germany
Warwick (Titan) - United Kingdom
Madrid - Spain
Blois - France
Cinisello - Italy
Izmir - Turkey / ESBAS 3 (PT Phase 2)
Izmir - Turkey / ESBAS 2 (PT Phase 1)
Gillingham - United Kingdom
Stonehouse - United Kingdom
Iasi - Romania
Bucharest - Romania
Rzeszow - Poland
Dubai - United Arab Emirates
Amal - Sweden
Istanbul - Turkey
Cergy - France
Warsaw (Delphi Academy) - Poland
Warsaw - Poland
Technical Center Krakow
Krakow - Poland
Hartridge - United Kingdom
Belval - Luxembourg
Wroclaw - Poland
Blonie - Poland
```

---

### Export Settings

| Setting | Value |
|---|---|
| Format | CSV |
| Date range | No date filter on open records. MI history: last 60 days only |
| Filename | `EMEA_GOV_Weekly_Consolidated.csv` |
| Schedule | Friday PM or Monday AM before governance review |

---

### Two-Table Fallback

If your SNOW instance cannot produce a single cross-table export, use two reports only:

**Report 1:** `EMEA_GOV_Incidents.csv` — Incident module, same filters and columns above
**Report 2:** `EMEA_GOV_Problems.csv` — Problem module, same site filter, open records only, columns: number, u_site_name, opened_at, root_cause, assigned_to

The Excel Add-In prompt below handles both the single-file and two-file scenarios.

---

### Physics Engine Reports (Separate — On-Demand Only)

These are not part of the weekly refresh. Run when scope data changes.

| Report | Source | Trigger |
|---|---|---|
| `EUC_EOSL.xlsx` | Power BI → Excel (NOT SNOW) | When PBI data is manually refreshed |
| `EMEA_GOV_SDWAN_Status.csv` | SNOW — Change module | When SDWAN site completions update |
| `EMEA_GOV_OT_Activity.csv` | SNOW — Change or Incident module | When OT remediation activity updates |

**ℹ️ NOTE — Blonie - Poland (Site 10381) — CLOSED**
Blonie was in the original 25-site scope but has been confirmed closed as of 08 Mar 2026.
Removed from the active site list. Scope is now 24 physical EMEA sites.
No SNOW location record exists or is required.

**Locations to EXCLUDE from filter (EMEA region but out of scope):**
These appear in the SNOW EMEA region but must not be included in the 25-site filter:
- Azure Europe West (20005)
- PHINIA Azure West Europe (20040)
- PHINIA Azure North Europe (20041)
- DXC Service Desk Budapest (10595)
- Abingdon - Cannon External Company (10217)

The Python script handles exclusion via the EMEA_SITES allowlist. The SNOW saved report filter should also explicitly exclude these.
EOSL asset data comes from a Power BI report exported to EUC_EOSL.xlsx — not from SNOW CMDB.
The file contains approximately 4,001 device records across 13 EMEA sites with EOSL devices.
An ESOL Replacement Tracker sheet is pre-built in the file with a site-by-target-date matrix.

Key figures as at last PBI refresh:
- Total devices requiring replacement: 220
- Overdue (target was Oct 2025): 20
- Target Nov 2026: 200
- Highest burden: Iasi (76 devices), Izmir (64 devices)

Physics_Engine Block 1 reads directly from the ESOL Replacement Tracker sheet in EUC_EOSL.xlsx.
No SNOW export needed for EUC. Refresh EUC_EOSL.xlsx from PBI when scope data changes.
For SDWAN and OT: see SNOW Data Requirements Specification v1 Physics reports P2 and P3.

---

## Part 2 — Claude Excel Add-In Prompt

Paste this into the Claude Excel Add-In sidebar each week after dropping the CSV into your chosen folder.
The prompt is self-contained — it tells Claude everything it needs to process the file and update the cockpit.

---

### WEEKLY REFRESH PROMPT

```
I am refreshing my EMEA Governance Cockpit. The CSV export from ServiceNow is attached 
or open in this workbook as a staging sheet.

The CSV is named EMEA_GOV_Weekly_Consolidated.csv and contains open Incidents, 
Catalogue Tasks, and Problems for 25 EMEA sites, plus Major Incident history 
for the past 60 days. All records are for EMEA sites only.

Key field names: location.u_site_name (site — dot-walked field), sys_class_name (record type), priority, 
opened_at (open date), sys_updated_on (last updated), sla_target (SLA hours — 
may be absent), cmdb_ci (configuration item), problem_id (linked problem), 
root_cause (RCA field — empty means no RCA completed), state, resolved_at, closed_at.

KNOWN LIMITATION — Catalogue Tasks (Metric 2):
The sc_task table does not populate location.u_site_name in the PHINIA SNOW instance.
Catalogue task records will return 0 — this is a data gap, not a script error.
Metric 2 will show "No data" until resolved with SNOW admin.
Do not treat "No data" as GREEN — flag it as a data gap in the refresh summary.

If sla_target field is absent, use these defaults: P1 = 4 hours, P2 = 8 hours, 
P3 = 72 hours, P4 = 336 hours.

Today's date is [INSERT TODAY'S DATE].

Please calculate the following and update the Operations_Panel sheet accordingly:

METRIC 1 — Open Incident Aging (row: "Open Incident Aging — 10 Days or Less")
From records where sys_class_name = Incident and state is not Closed or Cancelled:
- Calculate age in days per record = today minus opened_at
- Adherence % = records where age <= 10 divided by all open incident records
- Update Current Value cell with the adherence %

METRIC 2 — Catalogue Request Aging (row: "Open Catalogue Request Aging — 30 Days or Less")
From records where sys_class_name = sc_task or catalogue task and state is not Closed or Cancelled:
- Calculate age in days = today minus opened_at
- Adherence % = records where age <= 30 divided by all open catalogue records
- Update Current Value cell

METRIC 3 — SLA x2 (row: "Aged Incidents Greater Than SLA x2")
From open incident records only:
- SLA target per record = sla_target field value in hours, converted to days (divide by 24)
  If sla_target field absent: P1 = 0.17 days, P2 = 0.33 days, P3 = 3 days, P4 = 14 days
- Flag records where age > SLA target x 2
- Count flagged P1 and P2 records separately from P3 and P4 records
- Update Current Value cell with total count
- Add cell note: "P1/P2: [count] | P3/P4: [count]"
- If any P1 or P2 records are flagged: add "⚠ P1/P2 PRESENT" to the note

METRIC 4 — No Movement (row: "Tickets With No Movement 14 or More Days")
From all open records (Incidents and Catalogue Tasks, state not Closed or Cancelled):
- Calculate days since last update = today minus sys_updated_on
- Count records where days since update >= 14
- Update Current Value cell
- Add cell note listing the top 5 sites by no-movement count

METRIC 5 — Repeat MIs (row: "Repeat Major Incidents — Same CI or Site Within 30 Days")
From records where priority = 1 or 2 (include closed records from past 60 days):
- Group by u_site_name and cmdb_ci
- Identify groups where 2 or more records exist with opened_at dates within any 30-day window
- For each identified repeat: check if problem_id is empty
- Count: total repeat MI occurrences
- Count: repeat MIs with no linked problem_id = Watch candidates
- Update Current Value cell with total repeat MI count
- Add cell note: list affected sites and CIs, flag which have no Problem record

METRIC 6 — Problems Without RCA (row: "Open Problems Without RCA — Over 30 Days")
From records where sys_class_name = Problem and state is not Closed or Cancelled:
- Calculate age = today minus opened_at
- Identify records where root_cause field is empty AND age > 30 days
- Count records age 30-60 days = Watch band
- Count records age > 60 days = Breach band
- Update Current Value cell with total count
- Add cell note: "Watch (30-60 days): [count] | Breach (60+ days): [count]"

After updating all Current Value cells, please:

1. UPDATE TRIGGER STATUS for each metric using these rules:

   Incident Aging:
   - Below 90% this week AND below 90% last week (check Previous 4W Avg) → BREACHED
   - Below 90% this week → WATCH
   - Otherwise → GREEN

   Catalogue Aging:
   - Below 90% for 2 consecutive weeks → BREACHED
   - Below 90% this week → WATCH
   - Otherwise → GREEN

   No Movement:
   - Count > 0 and increasing vs last week → check 4W Trend: if ↑ for 2 weeks → BREACHED
   - Count > 0 → WATCH
   - Zero → GREEN

   Repeat MIs:
   - Any repeat MI with no linked Problem record → WATCH (same day — do not wait for next week)
   - Any site with 2+ repeats same CI and no RCA → BREACHED
   - Otherwise → GREEN

   Problems Without RCA:
   - Breach band count > 0 → BREACHED
   - Watch band count > 0 → WATCH
   - Otherwise → GREEN

   SLA x2:
   - Any P1 or P2 flagged → BREACHED immediately (note in cell)
   - P3/P4 count increasing for 2 consecutive weeks → BREACHED
   - P3/P4 count > 0 → WATCH
   - Otherwise → GREEN

2. SET ESCALATION REQUIRED:
   - WATCH or BREACHED → YES
   - GREEN → NO

3. UPDATE 4W TREND ARROWS:
   - Current Value better than Previous 4W Avg → ↑
   - Current Value worse → ↓
   - Unchanged → Stable

4. UPDATE PHYSICS ENGINE Block 4 trend table (sheet: Physics_Engine):
   - Shift existing week values: current Wk1 → Wk2, Wk2 → Wk3, Wk3 → Wk4
   - Enter this week's calculated values in Wk1
   - 4W Average and Trend formulas will recalculate automatically

5. SUMMARISE your findings in plain text:
   - Date of refresh
   - Record count processed (total, by type)
   - Sites present vs expected 25 — flag any missing sites
   - Any sites present that are NOT in the expected 25 (indicates filter error in SNOW)
   - Trigger status for each metric
   - Count of BREACHED metrics
   - Count of WATCH metrics
   - Any data quality issues found (missing fields, unexpected values, zero counts)
   - Recommendation on whether SNOW export parameters need adjustment

Do not delete the CSV staging sheet — leave it in the workbook for audit reference.
```

---

### FIRST RUN VERIFICATION PROMPT

Run this before the first live refresh. Paste into the Claude Excel Add-In with the CSV attached.

```
Before running the weekly refresh, please verify this SNOW export file.

STEP 1 — COLUMN HEADERS
List every column header exactly as it appears in the CSV.
Compare against this expected list:
u_site_name, sys_class_name, number, priority, state, opened_at, sys_updated_on, 
sla_target, resolved_at, closed_at, cmdb_ci, problem_id, root_cause, 
short_description, assigned_to, assignment_group
Flag any expected columns that are missing. Flag any unexpected columns present.
Confirm whether sla_target exists — YES or NO.
Confirm the exact field name used for root cause (may be root_cause or u_root_cause).

STEP 2 — DATE RANGE AND SCOPE
What is the earliest and latest opened_at date in the file?
Does the file appear to contain closed records as well as open records?
For Priority 1 and 2 records only: are there any records with state = Closed 
from the past 60 days? This is correct — confirm it.
Flag if the export appears to be missing recent records or cut off unexpectedly.

STEP 3 — SITE COVERAGE
List every distinct u_site_name value present in the file.
Compare against the expected 25 sites listed below.
Flag any expected sites that are absent — these indicate a SNOW filter gap.
Flag any unexpected site names — these indicate the site filter is too broad.

Expected 25 sites:
Duesseldorf - Germany, Warwick (Titan) - United Kingdom, Madrid - Spain,
Blois - France, Cinisello - Italy, Izmir - Turkey / ESBAS 3 (PT Phase 2),
Izmir - Turkey / ESBAS 2 (PT Phase 1), Gillingham - United Kingdom,
Stonehouse - United Kingdom, Iasi - Romania, Bucharest - Romania,
Rzeszow - Poland, Dubai - United Arab Emirates, Amal - Sweden,
Istanbul - Turkey, Cergy - France, Warsaw (Delphi Academy) - Poland,
Warsaw - Poland, Technical Center Krakow, Krakow - Poland,
Hartridge - United Kingdom, Belval - Luxembourg, Wroclaw - Poland,
Blonie - Poland (CLOSED — removed from scope 08 Mar 2026), Warwick - United Kingdom

STEP 4 — RECORD VOLUME
Total record count.
Record count by sys_class_name (Incident / SC_TASK / Problem / other).
Flag if total count is above 1000 — may indicate date filter too wide or site filter not applied.
Flag if any record type has zero records — may indicate export misconfiguration.

STEP 5 — FILE ORGANISATION SUGGESTIONS
Based on what you have just read, suggest any improvements to:
- Filename and naming convention
- Column ordering or inclusion
- Any fields that appear redundant or low-value for this use case
- Any fields that appear to be missing that would improve metric accuracy
Be specific — state the suggestion, the reason, and what problem it solves.

STEP 6 — EXPORT PARAMETER RECOMMENDATIONS
Based on the date range, record volume, and site coverage you found:
- Are the export parameters correctly configured for weekly governance use?
- Is the open/closed logic correct for each record type?
- Is the 60-day MI history window present and correct?
- What specific changes (if any) should be made to the SNOW saved report 
  before the first live weekly refresh?

Do not update the cockpit. This is a read-only verification pass. 
Produce a clear pass/fail summary at the end.
```

---

## Part 3 — Change Impact Summary

Replacing 8 separate reports with 1 consolidated report changes the following:

| Item | Before (v1) | After (v2) |
|---|---|---|
| SNOW saved reports to maintain | 8 | 1 weekly + 3 on-demand Physics |
| Files to manage per week | 5-8 CSVs | 1 CSV |
| Add-In prompts to maintain | 8 metric prompts | 1 consolidated prompt |
| Cowork workflow | Complex 10-step task | Not needed |
| Power Automate | Not applicable | Not applicable |
| First run verification | Multiple | 1 prompt covers all |
| Impact of SNOW field name change | Update multiple prompts | Update 1 prompt |

---

*End of EMEA Governance Cockpit 2026 — Consolidated SNOW Report and Excel Add-In Prompt v2.*
*Physics Engine reports (EUC, SDWAN, OT) are unchanged and remain on-demand only.*
