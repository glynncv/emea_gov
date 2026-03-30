# Cursor Handover — `emea_gov_refresh.py`
*Project:* EMEA Governance Cockpit 2026
*Owner:* Colman Glynn, EMEA SDM, PHINIA
*Last updated:* 25 March 2026
*Script version:* v5

---

## What this script does

Weekly Python automation that:
1. Queries the PHINIA ServiceNow REST API for 6 operational metrics
2. Calculates metric values and trigger status (GREEN / WATCH / BREACHED)
3. Writes results into `EMEA_Governance_Cockpit_2026.xlsx` — Operations_Panel and Physics_Engine sheets
4. Logs each run and shifts trend data in Physics_Engine Block 4

Runs automatically via Windows Task Scheduler every Monday at 08:00.

---

## Environment

**Python version:** 3.13.5

**Dependencies:**
```
pip install requests openpyxl pandas python-dotenv
```

**Local paths:**
| Item | Path |
|---|---|
| Script | `C:\Users\cglynn\myPython\emea_gov\emea_gov_refresh.py` |
| Cockpit | `C:\Users\cglynn\OneDrive - PHINIA\My_Development_Projects\EMEA_GOV\Cockpit\EMEA_Governance_Cockpit_2026.xlsx` |
| EUC source | `C:\Users\cglynn\OneDrive - PHINIA\My_Development_Projects\EMEA_GOV\Data\EUC_EOSL.xlsx` |
| Logs | `C:\Users\cglynn\myPython\emea_gov\logs\refresh.log` |
| Config | `.env` in script directory |

**`.env` file keys:**
```
SNOW_INSTANCE=phinia.service-now.com
SNOW_USER=your_username
SNOW_PASS=your_password
SNOW_VERIFY_SSL=false
COCKPIT_PATH=C:\Users\cglynn\OneDrive - PHINIA\Data\EMEA_GOV\Cockpit\EMEA_Governance_Cockpit_2026.xlsx
EUC_PATH=C:\Users\cglynn\OneDrive - PHINIA\Data\EMEA_GOV\Data\EUC_EOSL.xlsx
```

**Run the script:**
```bash
# Live run
python emea_gov_refresh.py

# Dry run (no file write — safe for testing)
python emea_gov_refresh.py --dry-run
```

---

## Script structure map

| Function | Purpose |
|---|---|
| `snow_query()` | Core SNOW REST API fetch — handles pagination, flattens dot-walked fields, parses dates |
| `fetch_incidents()` | Open incidents, all 24 EMEA sites — **batch-by-site** (one query per site). SNOW incident table ignores server-side location filters — batch approach is the only reliable method. |
| `fetch_major_incident_history()` | P1/P2 incidents (open + closed) in past 60 days — **batch-by-site**, same pattern as `fetch_incidents()`. |
| `fetch_catalogue_tasks()` | Open `sc_task` records for all 24 EMEA sites |
| `fetch_problems()` | Open problems without RCA, all 24 EMEA sites |
| `fetch_euc_assets()` | Reads `EUC_EOSL.xlsx` (Power BI export — **not SNOW**). Primary sheet: `ESOL Replacement Tracker`; fallback: `Export` |
| `calc_m1_incident_aging()` | % open incidents aged ≤10 days |
| `calc_m2_catalogue_aging()` | % open catalogue tasks aged ≤30 days |
| `calc_m3_sla_x2()` | Count of open incidents exceeding 2× SLA target, split P1/P2 vs P3/P4 |
| `calc_m4_no_movement()` | Count of open incidents with no update ≥14 days (incidents only — not catalogue tasks) |
| `calc_m5_repeat_mi()` | Site+CI combos with 2+ MIs in any 30-day window without a linked Problem record |
| `calc_m6_problems_no_rca()` | Open problems with no RCA aged >30 days |
| `evaluate_trigger()` | Returns GREEN / WATCH / BREACHED per metric — see trigger rules below |
| `update_cockpit()` | Writes all metric values, trigger statuses, escalation flags to `Operations_Panel` and shifts `Physics_Engine` Block 4 trends |
| `read_prev_values()` | Reads current cockpit values before overwriting — provides `prev_week` for consecutive-week trigger rules |
| `validate_site_coverage()` | Warns if any of the 24 expected EMEA sites are absent from returned data |
| `shift_physics_trends()` | Shifts Wk1→Wk2→Wk3→Wk4 in Physics_Engine Block 4, writes new value to Wk1 |
| `set_trigger_cell()` | Writes GREEN/WATCH/BREACHED with RAG colour fill to a given cell reference |
| `main()` | Orchestrates the full run — fetch → validate → calculate → write → summarise |

---

## Trigger rules (evaluate_trigger)

| Metric | GREEN | WATCH | BREACHED |
|---|---|---|---|
| `incident_aging` | ≥90% | <90% this week | <90% two consecutive weeks (`prev_week` also <90%) |
| `catalogue_aging` | ≥90% | <90% this week | <90% two consecutive weeks (`prev_week` also <90%) |
| `sla_x2` | 0 | >0 and not worsening | >0 and P1/P2 present, or count rising week-on-week |
| `no_movement` | 0 | >0 | >0 and rising week-on-week |
| `repeat_mi` | 0 | Repeat with Problem record | Repeat without Problem record |
| `problems_no_rca` | 0 | Any aged 30–60 days | Any aged >60 days |

The `incident_aging` and `catalogue_aging` consecutive-week rule reads `prev_week` from `read_prev_values()` — the Wk2 column in `Physics_Engine Block 4` before the current run overwrites it.

---

## Cockpit cell reference map

**Sheet: `Operations_Panel`**

| Metric | Current Value | Trigger Status | Escalation Required |
|---|---|---|---|
| incident_aging | D3 | H3 | I3 |
| catalogue_aging | D4 | H4 | I4 |
| sla_x2 | D5 | H5 | I5 |
| no_movement | D7 | H7 | I7 |
| repeat_mi | D9 | H9 | I9 |
| problems_no_rca | D10 | H10 | I10 |

**Sheet: `Physics_Engine` — Block 4 trend rows**

| Metric | Row (`phys_row` in `ROW_MAP` / Physics_Engine Block 4) |
|---|---|
| incident_aging | 2 |
| catalogue_aging | 3 |
| sla_x2 | 4 |
| no_movement | 5 |
| repeat_mi | 6 |
| problems_no_rca | 7 |

Columns B/C/D/E = Wk1/Wk2/Wk3/Wk4. Each run shifts right and writes new value to Wk1 (col B).

**Note:** Percentage metrics (incident_aging, catalogue_aging) are written as decimals (e.g. `6.6` → `0.066`) to match Excel percentage cell format.

---

## SNOW technical notes

- **Instance:** `phinia.service-now.com`
- **SSL:** `SNOW_VERIFY_SSL=false` — corporate instance with self-signed cert
- **Site filter field:** `location.u_site_name` (dot-walked — NOT `u_site_name` directly on the record)
- **Catalogue task site field:** `request_item.u_opened_on_behalf_of.location` with numeric prefix strip  
  e.g. `10610 - Warwick - United Kingdom` → `Warwick - United Kingdom`
- **`sc_task` limitation:** Does not populate `location.u_site_name` directly in PHINIA SNOW — resolved via the above field path
- **Incident table — CRITICAL:** Server-side location filters (`location.nameIN`, `location.u_region`, `location.u_site_name`) are ignored on the incident table in this PHINIA SNOW instance. All strategies tested (24 Mar 2026) returned Raw: 50,000 (HIT LIMIT). Root cause unknown — may be ACL, business rule, or missing index. SNOW admin request raised. **Workaround: batch-by-site — `location.u_site_name={site}` per query, 24 queries per run, ~3–4 min.** This works reliably. `sc_task` and `problem` tables are not affected.

**24 EMEA sites in scope** (Blonie 10381 removed 08 Mar — site closed):

```
Duesseldorf - Germany, Warwick (Titan) - United Kingdom, Madrid - Spain,
Blois - France, Cinisello - Italy, Izmir - Turkey / ESBAS 3 (PT Phase 2),
Izmir - Turkey / ESBAS 2 (PT Phase 1), Gillingham - United Kingdom,
Stonehouse - United Kingdom, Iasi - Romania, Bucharest - Romania,
Rzeszow - Poland, Dubai - United Arab Emirates, Amal - Sweden,
Istanbul - Turkey, Cergy - France, Warsaw (Delphi Academy) - Poland,
Warsaw - Poland, Technical Center Krakow, Krakow - Poland,
Hartridge - United Kingdom, Belval - Luxembourg, Wroclaw - Poland,
Warwick - United Kingdom
```

**3 sites currently returning zero SNOW records** (correct — not a script issue):
Dubai, Istanbul, Warsaw (Delphi Academy). Monitor — sanity check with site IT Ops Managers if still zero on 16 Mar run.

---

## Open code tasks

### 1. Fix Physics_Engine Block 1 — duplicate zero column
`update_physics_block1()` is writing correct values but also writing zeros to an adjacent column. Cell references need recalibrating. Correct target cells are B2–B7 on the Physics_Engine sheet.

### 2. Build Physics_Engine Blocks 2 and 3 — manual input cells
- Block 2: SDWAN — yellow manual input cells. P2 pipeline now complete (18 sites, 10 Complete / 7 Pending / 1 Ready to Schedule). Enter confirmed count manually.
- Block 3: OT Remediation — yellow manual input cells. P3 pipeline complete (28 EMEA rows). 2 null states resolved 24 Mar.

### 3. Trigger_Log sheet — verify auto-population
Confirm duplicate guard is working correctly across runs.

### 4. SNOW admin request pending
Request raised 24 Mar for investigation of incident table location filter issue and Scripted REST endpoints. If resolved, `fetch_incidents()` and `fetch_major_incident_history()` can revert to single-query — remove batch-by-site loop and restore original query string.

---

## Architecture decisions — do not revisit

| Decision | Resolution |
|---|---|
| EUC data source | Power BI export (`EUC_EOSL.xlsx`) — **not** SNOW CMDB |
| SDWAN data source | Manual input — yellow cell in Physics Block 2. Automate later if SNOW table confirmed |
| OT Remediation data source | Manual input — yellow cells in Physics Block 3. SDM confirms with OT site owners quarterly |
| Metrics 7–9 (Site Health, BRM Cadence, Site Visits) | Manual entry permanently. Trigger rule evaluation only (GREEN/WATCH/BREACHED from entered values) |
| `no_movement` scope | Incidents only — catalogue backlog health is captured separately by `catalogue_aging` |
| Incident/Catalogue aging measurement | Open backlog age snapshot (not resolution time) — correct as implemented |
| `incident_aging` threshold | ≥90% GREEN. Consecutive-week BREACHED rule using `prev_week` — now matches `catalogue_aging` exactly |

---

## Last run results

**Run 3 — 25 March 2026 09:30 (first successful live write — v5)**

| Metric | Value | Status |
|---|---|---|
| incident_aging | 9% (228/2,532) | BREACHED |
| catalogue_aging | 0% (0/4,969) | BREACHED |
| sla_x2 | 0 | GREEN |
| no_movement | 2,130 | WATCH — Gillingham, Blois, Iasi top sites |
| repeat_mi | 2 | WATCH — Iasi / SAP Console |
| problems_no_rca | 7 | BREACHED — 3 over 60 days, 4 in watch band |

2 BREACHED / 2 WATCH / 1 GREEN. Cockpit saved to `EMEA_Governance_Cockpit_2026.xlsx`.
Istanbul and Warsaw (Delphi Academy) returned 0 incident records — confirmed data gap, not script issue.
Task Scheduler next run: Monday 30 March 08:00.

**Dry-run — 24 March 2026 15:26 (CSV mode — test data)**

| Metric | Value | Status |
|---|---|---|
| incident_aging | 0.0% | WATCH (test data artifact) |
| catalogue_aging | None | GREEN (no data in test CSV) |
| sla_x2 | 0 | GREEN |
| no_movement | 10 | WATCH |
| repeat_mi | 0 | GREEN (no MI history in test CSV) |
| problems_no_rca | 9 | BREACHED |

**Run 2 — 10 March 2026 16:10 (last pre-v5 live run)**

| Metric | Value | Status |
|---|---|---|
| incident_aging | ~6.6% | BREACHED |
| catalogue_aging | ~2.1% | BREACHED |
| sla_x2 | 0 | GREEN |
| no_movement | ~2,749 | WATCH |
| repeat_mi | 3 | BREACHED |
| problems_no_rca | 152 | BREACHED |

4 BREACHED / 1 WATCH / 1 GREEN. Escalation emails sent 10 Mar.

---

## Quick debug checklist

- **No data returned for a metric?** — Check SNOW site filter string. Confirm `EMEA_SITES` list values match exact `u_site_name` strings in PHINIA SNOW.
- **Incident fetch slow (~3-4 min)?** — Expected. Batch-by-site runs 24 queries. Normal until SNOW admin resolves incident table filter issue.
- **Trigger status wrong?** — Check `evaluate_trigger()` for the metric. Confirm `prev_week` is being read correctly from `read_prev_values()` before the current run overwrites Wk1.
- **Cell written to wrong row?** — Check `ROW_MAP` in `update_cockpit()` against actual workbook row numbers. Row numbers were calibrated in Claude Code Prompt 3 — re-run calibration if the workbook structure changes.
- **Physics_Engine trend not shifting?** — Check `shift_physics_trends()` column letters (B/C/D/E) and the `phys_row` value in `ROW_MAP`.
- **EUC data not loading?** — Confirm `EUC_EOSL.xlsx` exists at path from `.env`. Sheet name must be `ESOL Replacement Tracker` (or fallback `Export`).
- **SSL error on SNOW call?** — Confirm `SNOW_VERIFY_SSL=false` is in `.env` and `requests.get()` is passing `verify=False`.
- **Site count wrong?** — Check `LOCATION_EXCLUSIONS` in CONFIG. Expected count is 24. If higher, a non-physical location (cloud node, DC, external) needs adding to the exclusion list.
