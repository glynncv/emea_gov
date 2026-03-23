# Cursor Handover — CSV Fallback Mode Changes
*Project:* EMEA Governance Cockpit 2026  
*Owner:* Colman Glynn, EMEA SDM, PHINIA  
*Date:* 13 March 2026  
*Related script:* `emea_gov_refresh.py`

---

## Overview

Added `--csv` and `--csv-path` flags to enable loading SNOW data from a consolidated CSV file instead of the REST API. Use when SNOW is unreachable (VPN/network issues) or for offline testing.

---

## What changed

### 1. New command-line arguments

| Argument | Type | Purpose |
|----------|------|---------|
| `--csv` | Flag | Load data from CSV instead of SNOW REST API |
| `--csv-path` | String (optional) | Full path to consolidated CSV. Default: `<script_dir>\SNOW_Exports\Current\EMEA_GOV_Weekly_Consolidated.csv` |

### 2. New function: `load_from_csv(path: str)`

**Location:** After `fetch_problems()`, before `test_incident_fetch()`

**Returns:** `tuple[pd.DataFrame, pd.DataFrame, pd.DataFrame, pd.DataFrame]` — `(incidents, mi_history, tasks, problems)`

**Behaviour:**

1. **Read CSV** — `pd.read_csv(path)`; prints total record count and distinct `sys_class_name` values.
2. **Rename columns** — `location.u_site_name` or `u_site_name` or `request_item.u_opened_on_behalf_of.location` → `location` (fills nulls where applicable).
3. **Site name normalisation** — Strip numeric prefix: `re.sub(r"^\d+\s*-\s*", "", site_name).strip()` (e.g. `"10610 - Warwick - United Kingdom"` → `"Warwick - United Kingdom"`).
4. **Parse dates** — `pd.to_datetime(..., utc=True, errors="coerce")` for `opened_at`, `sys_updated_on`, `resolved_at`, `closed_at` (skips absent columns).
5. **Split by `sys_class_name`:**
   - **incidents** — `sys_class_name == "incident"` AND `state NOT IN [6, 7]` (6 = Resolved, 7 = Closed)
   - **mi_history** — `sys_class_name == "incident"` AND `priority IN ["1", "2"]` AND `opened_at >= TODAY - 60 days`
   - **tasks** — `sys_class_name == "sc_task"` AND `state NOT IN [4, 7]` (4 = Closed Complete, 7 = Cancelled)
   - **problems** — `sys_class_name == "problem"` AND `state NOT IN [4, 7]`
6. **Root cause normalisation (problems only)** — Ensures `u_root_cause` exists for `calc_m6_problems_no_rca`. If CSV has `root_cause` but not `u_root_cause`, copies. If both exist, fills `u_root_cause` NaN from `root_cause`. Adds `u_root_cause = pd.NA` if neither exists.
7. **EMEA site filter** — Keeps only rows where `location` is in `EMEA_SITES`.
8. **Print summary** — Path, incident count, MI history count, task count, problem count.

**Data shape:** Output matches `fetch_incidents()`, `fetch_major_incident_history()`, `fetch_catalogue_tasks()`, `fetch_problems()` so all metric logic, site validation, and cockpit writes run unchanged.

### 3. Main() data branch

**Location:** `main()`, replaces the four `fetch_*()` calls.

```python
if args.csv:
    print("CSV MODE — SNOW REST API bypassed")
    csv_path = args.csv_path or os.path.join(
        os.path.dirname(os.path.abspath(__file__)),
        "SNOW_Exports", "Current", "EMEA_GOV_Weekly_Consolidated.csv"
    )
    if not os.path.exists(csv_path):
        print(f"ERROR: CSV file not found: {csv_path}")
        print("Export EMEA_GOV_Weekly_Consolidated.csv from SNOW and place it at the path above.")
        return
    incidents, mi_history, tasks, problems = load_from_csv(csv_path)
    logger.info(f"Data source: CSV ({csv_path}) | Run: {datetime.now().strftime('%Y-%m-%d %H:%M')}")
else:
    print("API MODE — querying SNOW REST API...")
    incidents  = fetch_incidents()
    mi_history = fetch_major_incident_history()
    tasks      = fetch_catalogue_tasks()
    problems   = fetch_problems()
```

All code after this block (site validation, metrics, cockpit write, trigger log) is shared — no mode-specific logic.

### 4. Logging

- **CSV mode:** Adds `logger.info(f"Data source: CSV ({csv_path}) | Run: {timestamp}")` to `logs/refresh.log`.
- **API mode:** No change to log entries.

### 5. Module docstring (Usage section)

Added:

```
python emea_gov_refresh.py                          # normal API mode
python emea_gov_refresh.py --dry-run                # Test run - no cockpit update
python emea_gov_refresh.py --csv                    # CSV fallback, default path
python emea_gov_refresh.py --csv --csv-path "C:/path/to/file.csv"  # explicit path
python emea_gov_refresh.py --csv --dry-run          # CSV load, no cockpit write
```

### 6. Other changes

- Added `import re` for site name regex.
- Docstring path example uses `C:/path/to/file.csv` (forward slashes) to avoid `\p` escape warning.

---

## Consolidated CSV requirements

The CSV must be exported from SNOW with at least these columns (names and casing as listed):

| Column | Required for | Notes |
|--------|--------------|-------|
| `sys_class_name` | All | Values: `incident`, `sc_task`, `problem` |
| `location.u_site_name` or `u_site_name` | incident, problem | Or `request_item.u_opened_on_behalf_of.location` for sc_task rows |
| `opened_at` | All | ISO datetime |
| `sys_updated_on` | incidents, tasks | ISO datetime |
| `state` | All | Numeric (e.g. 2 = In Progress, 6 = Resolved) |
| `priority` | incidents (for mi_history) | "1" or "2" for P1/P2 |
| `resolved_at`, `closed_at` | mi_history (optional) | ISO datetime |
| `cmdb_ci`, `problem_id` | incidents, mi_history | For repeat MI metric |
| `u_root_cause` or `root_cause` | problems | For calc_m6_problems_no_rca |

**Default path:** `<script_dir>\SNOW_Exports\Current\EMEA_GOV_Weekly_Consolidated.csv`

---

## Test commands

```bash
# TEST A — API dry run (no cockpit write)
python emea_gov_refresh.py --dry-run

# TEST B — CSV mode, missing file (expect clean error exit)
python emea_gov_refresh.py --csv --csv-path "C:\does_not_exist.csv"

# TEST C — CSV mode + dry run (no cockpit write)
python emea_gov_refresh.py --csv --dry-run --csv-path "C:\path\to\EMEA_GOV_Weekly_Consolidated.csv"

# TEST D — CSV live (writes cockpit; requires real CSV)
python emea_gov_refresh.py --csv
```

---

## Files modified

| File | Changes |
|------|---------|
| `emea_gov_refresh.py` | +1 import (`re`), +2 argparse args, +1 function (`load_from_csv` ~90 lines), main() branch ~20 lines, docstring update |

---

## Integration with existing handover

This document supplements `CURSOR_HANDOVER_emea_gov_refresh.md`. Add `load_from_csv()` to the Script structure map and include CSV mode in the “Run the script” section.
