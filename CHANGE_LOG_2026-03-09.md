# EMEA Governance Cockpit — Change Log
**Date:** 2026-03-09
**Session:** Script fixes + live cockpit refresh

---

## Changes Made

### 1. File Path References Updated
**File:** `emea_gov_refresh.py` (comment lines 72–73)

Old paths (stale comments):
```
C:\EMEA_GOV\Cockpit\EMEA_Governance_Cockpit_2026.xlsx
C:\EMEA_GOV\Data\EUC_EOSL.xlsx
```
Updated to match `.env` (already correct):
```
C:\Users\cglynn\OneDrive - PHINIA\Data\EMEA_GOV\Cockpit\EMEA_Governance_Cockpit_2026.xlsx
C:\Users\cglynn\OneDrive - PHINIA\Data\EMEA_GOV\Data\EUC_EOSL.xlsx
```

---

### 2. Catalogue Aging Fix — Field Change
**Function:** `fetch_catalogue_tasks()`

**Problem:** `sc_task` table in SNOW does not populate `location.u_site_name`. The script was filtering on that field, returning 0 records, and writing `None` to the cockpit for catalogue_aging.

**Root cause identified via:** Export of `sc_task` records from SNOW (`sc_task.csv`) — 73 records, all EMEA, showing that location is stored in `request_item.u_opened_on_behalf_of.location` with a numeric site code prefix (e.g. `10610 - Warwick - United Kingdom`).

**Fix:**
- Changed field from `location.u_site_name` → `request_item.u_opened_on_behalf_of.location`
- Added regex strip of numeric prefix (`^\d+ - `) before matching against `EMEA_SITES`

**Result:** 7,159 catalogue tasks now correctly fetched and filtered to EMEA sites.

---

### 3. No Movement — Incidents Only
**Function:** `calc_m4_no_movement()`

**Problem:** After the catalogue fix, `no_movement` jumped from 2,751 → 9,790 because the function was combining both incidents and catalogue tasks (both fed into the stale ticket count).

**Decision:** Catalogue task health is already fully captured by `catalogue_aging` (lag indicator — backlog age). `no_movement` should be incidents-only as a lead indicator — it predicts future SLA breaches by flagging incidents with no activity in 14+ days.

**Fix:** Removed catalogue tasks from `calc_m4_no_movement()`. Function now operates on incidents DataFrame only.

**Result:** `no_movement` returned to 2,751 (incidents only), correctly isolated from catalogue backlog noise.

---

## Metric Definitions (for reference)

| Metric | What it measures | Pass threshold |
|---|---|---|
| incident_aging | % open incidents still within 10-day age band | GREEN >20% / WATCH 10–20% / BREACH <10% |
| catalogue_aging | % open catalogue tasks aged ≤30 days | Thresholds per governance framework |
| sla_x2 | Count of incidents aged >2× their SLA target | 0 = GREEN |
| no_movement | Count of open incidents with no update in ≥14 days (lead indicator) | Lower = better |
| repeat_mi | Site+CI combinations with 2+ MIs within any 30-day window | 0 = GREEN; BREACH if no Problem raised |
| problems_no_rca | Open problems with no RCA, aged >30 days | WATCH 30–60d / BREACH >60d |

---

## Live Run Results — 2026-03-09 13:53

**Data fetched:**
- Incidents (open): 3,157 records (22/25 EMEA sites)
- MI history (60d): 20 records
- Catalogue tasks: 7,159 records
- Problems: 927 records
- EUC/EOSL devices: 220 across 13 sites

**Metrics written to cockpit:**

| Metric | Value | Status | Escalation |
|---|---|---|---|
| incident_aging | 6.6% | WATCH | YES |
| catalogue_aging | 2.1% | **BREACHED** | YES |
| sla_x2 | 0 | GREEN | NO |
| no_movement | 2,749 | WATCH | YES |
| repeat_mi | 3 | **BREACHED** | YES |
| problems_no_rca | 152 | **BREACHED** | YES |

**Summary:** 3 BREACHED / 2 WATCH / 1 GREEN

**BREACHED detail:**

- **catalogue_aging:** Only 149/7,159 catalogue tasks (2.1%) are within 30-day SLA. 98% of the open backlog is overdue.
- **repeat_mi:** Warwick/IBM CloudPakforIntegration (BREACH — no Problem raised); Iasi/SAP Console (WATCH); Iasi/CI:0387390c (WATCH)
- **problems_no_rca:** 152 open problems with no RCA — 8 WATCH (30–60 days), 144 BREACH (60+ days)

**Known data gaps (3 sites returning no SNOW records):**
- Dubai - United Arab Emirates
- Istanbul - Turkey
- Warsaw (Delphi Academy) - Poland

---

## Files Modified

| File | Change |
|---|---|
| `emea_gov_refresh.py` | Comment path update; `fetch_catalogue_tasks()` field fix + prefix strip; `calc_m4_no_movement()` incidents-only |

## Files Unchanged
| File | Status |
|---|---|
| `.env` | Correct — OneDrive paths already set |
| `run_refresh.bat` | No changes |
| `create_scheduled_task.ps1` | No changes |
