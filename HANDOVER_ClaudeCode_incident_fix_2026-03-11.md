# ClaudeCode Handover — Incident Fetch Changes (11 March 2026)

*Project:* EMEA Governance Cockpit 2026  
*Script:* `emea_gov_refresh.py`  
*Context for:* Future Claude Code sessions picking up this codebase

---

## What Was Done

### 1. Problem: Too Much Incident Data

The incident query was fetching ~50,000 records globally, filtering to ~3,000 EMEA in Python. This was:
- Wasteful (47k records discarded)
- At risk of hitting the 50k safety limit and truncating data
- Adding ~2+ minutes per run

### 2. Incident Exclusion Rule (Implemented)

**Requirement:** Exclude LogicMonitor/Integration tickets (monitoring/event tickets) from governance metrics.

**Source:** PHINIA SNOW list returning 1,861 EMEA tickets uses `caller_id!=24f555b8c387f6d41edf787dc00131a6`. These match `contact_type=Event` AND `incident_state=8`.

**Implementation:** Added `^caller_id!=24f555b8c387f6d41edf787dc00131a6` to incident and MI history queries. Constant: `CALLER_EXCLUDE_SYS_ID` in [emea_gov_refresh.py](emea_gov_refresh.py) line ~133.

**Result:** Working. Dry run 11 Mar 22:43: 50k → 3,659 EMEA (excl. LogicMonitor). Incident aging 6.9%, no_movement 3,292.

### 3. Batch-by-Site Attempt (Reverted)

**Idea:** Query each EMEA site separately: `location.u_site_name=<site>^stateNOT IN6,7^caller_id!=...` to avoid 50k global fetch.

**Result:** FAILED. The `location.u_site_name` filter is **ignored** on the incident table (same as `location.nameIN`). Each per-site query returned global data. Concatenating 25 results yielded 56,906 records (massive duplication). Metrics wrong: incident_aging 0.5%, no_movement 56,460.

**Reverted to:** Single-query + Python EMEA_SITES filter.

### 4. Test Function Added

`test_incident_fetch()` — run with `python emea_gov_refresh.py --test-fetch`. Compares fetch strategies (location filters, caller exclude, batch-by-site). Use `--test-limit 500` for quicker run. Note: May hit ConnectionResetError intermittently; dry-run works.

---

## Current State

| Component | Status |
|-----------|--------|
| **fetch_incidents()** | Single query `stateNOT IN6,7^caller_id!=24f555b8c387f6d41edf787dc00131a6`; Python EMEA_SITES filter. 50k cap remains. |
| **fetch_major_incident_history()** | Same caller exclusion; Python EMEA filter. |
| **Catalogue tasks** | EMEA_LOCATION_FILTER works; 4,969 records. |
| **Problems** | EMEA_LOCATION_FILTER works; 8 records. |

**Incident table limitation:** Does not respond to `location.nameIN` or `location.u_site_name` in PHINIA SNOW. No script-side fix without SNOW admin creating a filtered view.

---

## Reference — Parsed SNOW URLs

**EMEA list (excl. LogicMonitor):** 1,861 tickets opened this year
```
opened_at>=2026-01-01^opened_at<=2026-12-31^location.u_region=EMEA^caller_id!=24f555b8c387f6d41edf787dc00131a6
```

**Event tickets to exclude:** `contact_type=Event` AND `incident_state=8`
```
location.u_region=EMEA^contact_type=Event^incident_state=8
```

---

## Key Code Locations

| Item | Location |
|------|----------|
| `CALLER_EXCLUDE_SYS_ID` | Line ~133 |
| `fetch_incidents()` | Line ~270 |
| `fetch_major_incident_history()` | Line ~298 |
| `test_incident_fetch()` | Line ~391 |
| `snow_query()` safety limit | Line ~186 |

---

## Do Not Revisit

- **Batch-by-site for incidents:** Tested; `location.u_site_name` ignored. Returns overlapping global data.
- **EUC data source:** Power BI export, not SNOW CMDB.
- **no_movement scope:** Incidents only; catalogue health is `catalogue_aging`.

---

## Future: Reduce Incident Volume

**Only path:** SNOW admin creates a view/list with `location.nameIN00202,00232,...^stateNOT IN6,7^caller_id!=...` and exposes it. Script would query that view instead of raw `incident` table. Document in `CURSOR_HANDOVER_emea_gov_refresh.md` when requested.
