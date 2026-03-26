# Cursor Handover — Post-Refactor Status
*Project:* EMEA Governance Cockpit 2026
*Owner:* Colman Glynn, EMEA SDM, PHINIA
*Last updated:* 25 March 2026

---

## What changed on 25 March 2026

Two parallel changes were made today:

1. **Claude Excel Add-In** — full TFEM stream-based refactor of the cockpit workbook (Turn 21/22 in Claude Log)
2. **Python script** — `ROW_MAP` and `read_prev_values()` remapped to match the new workbook layout

Both changes were validated by a live run immediately after. The run completed successfully.

---

## Current cockpit structure (post-refactor)

**Sheets:**
| Sheet | Purpose | Status |
|---|---|---|
| Enterprise_Panel | 5-stream physics view | Rebuilt — 5 streams, 22 rows |
| Operations_Panel | Signal-based metric view | Rebuilt — 15 data rows, new column layout |
| Trigger_Log | Breach log (manual + auto) | Active — 13 rows logged, 4 auto-trigger formula rows |
| Physics_Engine | Calculation engine | Active — Blocks 1–4 intact |
| Escalation_Emails | Email drafts | Stale — data from 10 Mar snapshot, not yet regenerated |
| Awareness_Register | Monitor-tier programmes | New — 6 programmes moved out of Enterprise_Panel |
| Claude Log | Add-In session history | 22 turns logged |
| Prompt_Archive | Reusable prompt archive | 11 turns, Turns 7/9/10 still DEFERRED |
| Refactor Info | Stream/trigger reference | New — summary of 5-stream model and auto-trigger logic |

**Enterprise_Panel — 5 streams:**
| Stream | Type | Physics Model |
|---|---|---|
| 1: User Lifecycle (EUC) | Owned | Weekly burn rate (target 5.2/wk) |
| 2: OT Remediation + OT Layer 2 | Owned | Site stagnation pulse (>30 days) |
| 3: Network Evolution (SDWAN/DC Amsterdam) | Contributory | Blocker identification |
| 4: Platform & App (MSP/SAP) | Contributory | Stability signals |
| 5: Integration (Acquisition) | Contributory | Milestone integrity |

**Operations_Panel — new column layout:**
| Column | Content |
|---|---|
| A | Metric name |
| B | Signal Value (was Current Value in col D) |
| C | Δ vs Last Week (new — replaces Previous 4W Avg) |
| D | Trigger Threshold |
| E | Trigger Rule |
| F | Trigger Status (was col H) |
| G | Escalation Required (was col I) |
| H | Auto-Log Entry |
| I | Notes |

---

## Updated cell reference map

**Sheet: `Operations_Panel`**

| Metric | Signal Value | Trigger Status | Escalation Required |
|---|---|---|---|
| incident_aging | B4 | F4 | G4 |
| catalogue_aging | B5 | F5 | G5 |
| sla_x2 | B6 | F6 | G6 |
| no_movement | B8 | F8 | G8 |
| repeat_mi | B10 | F10 | G10 |
| problems_no_rca | B11 | F11 | G11 |

**Sheet: `Enterprise_Panel` — Stream 1 (EUC) key cells**

| Cell | Content |
|---|---|
| C4 | Remaining Work (units) |
| E4 | Weeks Remaining (auto-calc) |
| F4 | Required Weekly Burn |
| G4 | Actual 4W Rolling Burn — **manual input, do not overwrite** |
| H4 | Physics Status |
| I4 | Trigger Status |
| J4 | Escalation Required |

**Sheet: `Physics_Engine` — Block 4 trend rows (unchanged)**

| Metric | Row |
|---|---|
| incident_aging | 44 |
| catalogue_aging | 45 |
| sla_x2 | 46 |
| no_movement | 47 |
| repeat_mi | 48 |
| problems_no_rca | 49 |

---

## Live run results — 25 March 2026

Two runs executed today (17:23 and 17:34) to validate cell mapping and duplicate guard.

| Metric | Value | Status |
|---|---|---|
| incident_aging | 10.1% (258/2557 ≤10 days) | BREACHED |
| catalogue_aging | 0.0% (0/4969 ≤30 days) | BREACHED |
| sla_x2 | 0 | GREEN |
| no_movement | 2,130 stale | WATCH |
| repeat_mi | 1 (Iasi / SAP Console) | WATCH |
| problems_no_rca | 7 (3 breach 60d+) | BREACHED |

**3 BREACHED / 2 WATCH / 1 GREEN**

Second run confirmed: results identical, Trigger_Log duplicate guard suppressed all 3
BREACHED re-entries correctly.

---

## Open code tasks (in priority order)

### ✅ ~~Fix EUC Burn Enterprise Panel writer~~ — DONE 25 Mar 2026
Hard-coded reference to Enterprise_Panel row 4. Weeks Remaining calculated from
baseline 25 Mar 2026 (40.1 weeks to 31 Dec 2026). No more row-search warning on run.

### ✅ ~~Trigger_Log duplicate guard~~ — DONE 25 Mar 2026
Confirmed working. Second consecutive run (17:34) correctly identified all 3 BREACHED
metrics as already Open and skipped appending new rows.
Guard scans manual rows only — stops at the "AUTO-GENERATED" separator row.

### 1. Escalation_Emails — regenerate after next SNOW refresh
Current emails reflect 10 Mar data snapshot (e.g. Incident Aging at 7.1%).
After next Monday run, regenerate using Turn 9 template for any WATCH/BREACHED metrics
with updated values. Remove emails for any metrics that returned to GREEN.
This is Prompt_Archive Turn 10 (DEFERRED).

### 2. Physics_Engine Block 1 — duplicate zero column
`update_physics_block1()` is writing correct values but also writing zeros to an adjacent column.
Correct target cells are B2–B7. Recalibrate cell references.

### 3. Physics_Engine Blocks 2 and 3 — pending data confirmation
- Block 2 (SDWAN): yellow manual input cells. Total EMEA site count not yet confirmed.
- Block 3 (OT Remediation): yellow manual input cells. Per-site status not yet confirmed.
These are manual-entry blocks — script does not auto-populate them.

---

## Architecture decisions — do not revisit

| Decision | Resolution |
|---|---|
| EUC data source | Power BI export (`EUC_EOSL.xlsx`) — not SNOW CMDB |
| SDWAN data source | Manual input — yellow cell in Physics Block 2 |
| OT Remediation data source | Manual input — yellow cells in Physics Block 3 |
| Metrics Site Health / BRM / Site Visits | Manual entry permanently. Script evaluates trigger only |
| `no_movement` scope | Incidents only — catalogue health captured by `catalogue_aging` |
| Monitor programmes | Moved to Awareness_Register — not in Enterprise_Panel or active trigger logic |
| Trigger_Log auto-rows | Formula-driven in rows 14–17. Manual script rows append above. |
| Operations_Panel signal format | Percentage metrics stored as decimals (e.g. 0.101 = 10.1%) |

---

## Environment (unchanged)

| Item | Path |
|---|---|
| Script | `C:\Users\cglynn\myPython\emea_gov\emea_gov_refresh.py` |
| Cockpit | `C:\Users\cglynn\OneDrive - PHINIA\Data\EMEA_GOV\Cockpit\EMEA_Governance_Cockpit_2026.xlsx` |
| EUC source | `C:\Users\cglynn\OneDrive - PHINIA\Data\EMEA_GOV\Data\EUC_EOSL.xlsx` |
| Logs | `C:\Users\cglynn\myPython\emea_gov\logs\refresh.log` |

Scheduled run: **Monday 08:00 via Windows Task Scheduler.**

---

## Quick debug checklist

- **Cells written to wrong location?** — Verify `ROW_MAP` in `update_cockpit()` matches screenshot above. Columns are now B/F/G (not D/H/I).
- **EUC panel warning?** — Task 1 above. Row-search logic needs replacing with fixed row 4 refs.
- **No data for a metric?** — Check SNOW site filter. Confirm `EMEA_SITES` list matches exact `u_site_name` strings in PHINIA SNOW.
- **Trigger status wrong?** — Check `evaluate_trigger()`. Confirm `prev_week` is being read from `read_prev_values()` before Wk1 is overwritten.
- **Physics_Engine trend not shifting?** — Check `shift_physics_trends()` column letters (B/C/D/E) and `phys_row` in `ROW_MAP`.
- **SSL error?** — Confirm `SNOW_VERIFY_SSL=false` in `.env`.
