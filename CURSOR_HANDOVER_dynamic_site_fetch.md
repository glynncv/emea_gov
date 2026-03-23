# Cursor Handover — Dynamic EMEA Site Fetch
*Project:* EMEA Governance Cockpit 2026  
*Owner:* Colman Glynn, EMEA SDM, PHINIA  
*Date:* 19 March 2026  
*Related script:* `emea_gov_refresh.py` (v1 → v2)  
*Supplements:* `CURSOR_HANDOVER_emea_gov_refresh.md` and `CURSOR_HANDOVER_csv_mode_changes.md`

---

## Overview

Replaced the hardcoded 29-entry `EMEA_SITES` list and hardcoded `EMEA_LOCATION_FILTER` string with a
dynamic fetch from the SNOW `cmn_location` table at the start of each run. The site list now always
reflects the live SNOW location record — no manual list maintenance required.

Primary source: SNOW REST API (`cmn_location`, filtered by `u_region=EMEA` and `u_active=true`).  
Fallback: `PYTHON_EMEA_Locations.csv` (same CSV exported during the original site validation exercise).

Both `EMEA_SITES` and `EMEA_LOCATION_FILTER` are still used throughout the script unchanged —
they are now populated at runtime in `main()` rather than at module load time.

---

## What changed

### 1. Removed — hardcoded site lists

The following module-level constants were removed:

```python
# REMOVED — 29-entry hardcoded list
EMEA_SITES = [
    "Blois - France",
    "Azure Europe West",
    ...
]

# REMOVED — hardcoded numeric ID string
EMEA_LOCATION_FILTER = (
    "location.nameIN"
    "00202,00232,10590,..."
)
```

Both are now empty placeholders at module level and populated at the start of `main()`.

---

### 2. Added — `LOCATION_EXCLUSIONS` constant

```python
LOCATION_EXCLUSIONS = [
    "Azure Europe West",
    "PHINIA Azure West Europe",
    "PHINIA Azure North Europe",
    "DXC Service Desk Budapest",
    "Abingdon - Cannon External Company",
    "Amsterdam Data Center NEW",
]
```

These entries appear in the SNOW `cmn_location` EMEA region but are not physical governance sites.
They are stripped from the site list regardless of whether data came from the API or the CSV fallback.

**To add or remove an exclusion:** edit this constant only. No other code changes needed.

---

### 3. Added — `SNOW_LOCATIONS_PATH` config variable

Added to the CONFIG section and `.env` comment block:

```
SNOW_LOCATIONS_PATH=C:\Users\cglynn\OneDrive - PHINIA\Data\EMEA_GOV\SNOW_Exports\Current\PYTHON_EMEA_Locations.csv
```

This is optional. If not set in `.env`, defaults to:
```
<script_dir>\SNOW_Exports\Current\PYTHON_EMEA_Locations.csv
```

The CSV must be in `PYTHON_EMEA_Locations.csv` format (columns: `name`, `u_site_name`, `u_region`, `u_active`).

---

### 4. Added — `fetch_emea_sites()` function

**Location:** New section between CONFIG and DATA RETRIEVAL.

**Returns:** `dict` with four keys:

| Key | Type | Content |
|---|---|---|
| `site_names` | `list[str]` | Display names — used for Python-side filtering (replaces `EMEA_SITES`) |
| `location_ids` | `str` | Comma-separated numeric IDs — used in `location.nameIN` filter (replaces hardcoded string in `EMEA_LOCATION_FILTER`) |
| `source` | `str` | `'api'` or `'csv'` — logged at each run |
| `count` | `int` | Number of physical sites after exclusions |

**Behaviour:**

1. Queries `cmn_location` via REST API: `u_region=EMEA^u_active=true`, fields: `name`, `u_site_name`, `city`, `country`.
2. Flattens any dot-walked dict fields in the response.
3. Applies `LOCATION_EXCLUSIONS` filter.
4. On any failure (connection error, 403, empty result, zero sites after exclusions): logs a warning and falls back to CSV.
5. CSV fallback reads `SNOW_LOCATIONS_PATH`, filters to `u_region=EMEA` and `u_active=TRUE` if columns present, applies exclusions.
6. If both API and CSV fail: `sys.exit(1)` with a clear error message — the run does not proceed with an empty site list.

**Console output examples:**
```
[SITES] 24 physical sites loaded from cmn_location (API)
[SITES] API fetch failed: ConnectionError — Falling back to: ...\PYTHON_EMEA_Locations.csv
[SITES] 24 physical sites loaded from fallback CSV
```

---

### 5. Updated — `main()` step 0

Added before step 1 (read previous cockpit values):

```python
# 0. Build EMEA site list dynamically from cmn_location (API primary, CSV fallback)
print("Loading EMEA site list...")
global EMEA_SITES, EMEA_LOCATION_FILTER
sites = fetch_emea_sites()
EMEA_SITES           = sites["site_names"]
EMEA_LOCATION_FILTER = "location.nameIN" + sites["location_ids"]
print(f"  Active EMEA sites: {sites['count']} (source: {sites['source']})")
```

All subsequent fetch functions and the CSV `load_from_csv()` consume `EMEA_SITES` and
`EMEA_LOCATION_FILTER` as globals — no other changes to those functions.

---

### 6. Updated — `.env` comment block

Added `SNOW_LOCATIONS_PATH` as an optional documented key.

---

### 7. Version bump

Script version updated: `v1` → `v2`.

---

## Dependencies

No new Python packages required. All existing dependencies unchanged:
```
pip install requests openpyxl pandas python-dotenv
```

---

## .env changes required

No changes required for the default configuration. The fallback CSV path defaults to
`<script_dir>\SNOW_Exports\Current\PYTHON_EMEA_Locations.csv`.

Add `SNOW_LOCATIONS_PATH` to `.env` only if the CSV is in a non-default location:
```
SNOW_LOCATIONS_PATH=C:\path\to\PYTHON_EMEA_Locations.csv
```

---

## How to run

No change to run commands:

```bash
# Live run — API mode (site list fetched from cmn_location first)
python emea_gov_refresh.py

# Dry run — no cockpit write
python emea_gov_refresh.py --dry-run

# CSV fallback data mode — site list still fetched from cmn_location (or CSV fallback)
python emea_gov_refresh.py --csv

# CSV data mode + dry run
python emea_gov_refresh.py --csv --dry-run
```

---

## Test commands

```bash
# TEST A — Confirm site list loads from API and count is printed
python emea_gov_refresh.py --dry-run
# Expected: "[SITES] N physical sites loaded from cmn_location (API)"

# TEST B — Force CSV fallback by temporarily breaking SNOW credentials in .env
# Set SNOW_PASS=wrong in .env, then:
python emea_gov_refresh.py --dry-run
# Expected: "[SITES] API fetch failed: ... Falling back to: ..."
# Expected: "[SITES] N physical sites loaded from fallback CSV"
# Restore .env after test.

# TEST C — Confirm exclusions are applied (check console output site count)
# Should be lower than the raw cmn_location EMEA count (29 raw → 24 physical after exclusions)

# TEST D — Missing fallback CSV (rename PYTHON_EMEA_Locations.csv temporarily)
python emea_gov_refresh.py --dry-run
# Expected: "FATAL: cmn_location API failed and fallback CSV not found at: ..."
# Expected: script exits with sys.exit(1)
```

---

## Exclusion maintenance

If a new non-physical location is added to SNOW EMEA in future, add its `u_site_name` value to
`LOCATION_EXCLUSIONS` at the top of the CONFIG section. No other changes required.

If a physical site is added to SNOW EMEA (new factory, new office), it will automatically appear
in scope on the next run — no code changes needed.

---

## Impact on existing behaviour

| Area | Impact |
|---|---|
| Metric calculations (M1–M6) | None — consume `EMEA_SITES` unchanged |
| Cockpit write | None |
| CSV mode (`--csv`) | None — `load_from_csv()` still filters using `EMEA_SITES`, now dynamically set |
| Trigger logic | None |
| Physics Engine | None |
| `validate_site_coverage()` | Now validates against the dynamic list — will correctly flag any site present in data but absent from `cmn_location` |
| Log file | Source (`api` or `csv`) now logged per run |

---

## Quick debug

**Site list is empty / script exits at step 0:**
- Check SNOW connectivity and credentials in `.env`
- Confirm `PYTHON_EMEA_Locations.csv` exists at default or configured path
- Check `u_region` field name on the PHINIA SNOW instance — should be `u_region` not `region`

**Wrong number of sites:**
- Check `LOCATION_EXCLUSIONS` — a site may have been incorrectly excluded
- Confirm `u_active=true` filter is correct for the instance (case sensitive)
- Run with `--dry-run` and check `[SITES]` console line for count

**`cmn_location` API returns 0 records despite correct credentials:**
- Confirm the ACL on `cmn_location` permits REST API read for the service account
- Try querying directly: `GET /api/now/table/cmn_location?sysparm_query=u_region=EMEA&sysparm_limit=5`

---

## Files modified

| File | Changes |
|---|---|
| `emea_gov_refresh.py` | +1 constant (`LOCATION_EXCLUSIONS`), +1 config var (`SNOW_LOCATIONS_PATH`), +1 function (`fetch_emea_sites` ~90 lines), main() step 0 (~10 lines), version bump, `.env` comment |

---

*This document supplements `CURSOR_HANDOVER_emea_gov_refresh.md`.*  
*Update the script structure map in that document to include `fetch_emea_sites()`.*
