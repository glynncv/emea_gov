# Cursor Prompt — Batch-by-Site Incident Fetch Fix
*File:* `emea_gov_refresh.py`
*Version bump:* v2 → v3
*Reason:* SNOW incident table ignores all server-side location filters (nameIN, u_region, u_site_name).
Every strategy in --test-fetch returned Raw: 50,000 (HIT LIMIT). Batch-by-site is the only
viable approach — query one EMEA site at a time, concatenate results.

---

## Background

`fetch_incidents()` currently queries the full incident table with a single API call and filters
to EMEA in Python. SNOW returns 50,000+ records on every query regardless of location filter.
This is not a script bug — SNOW does not support location filtering on the incident table in
this instance.

The fix is to query one site at a time using `location.u_site_name=<site>` as a SNOW-side filter,
run 24 queries (one per EMEA site), and concatenate the results. Each per-site query returns a
small manageable count. `fetch_major_incident_history()` has the same problem and needs the
same fix.

`test_incident_fetch()` also has a bug: it runs before `fetch_emea_sites()` is called in
`main()`, so `EMEA_SITES` is empty when the test runs. Fix this by calling `fetch_emea_sites()`
at the start of `test_incident_fetch()`.

---

## Changes Required

### 1. Rewrite `fetch_incidents()`

Replace the current single-query implementation with a batch-by-site loop.

**Current implementation (lines ~389–412):**
```python
def fetch_incidents() -> pd.DataFrame:
    query = f"stateNOT IN6,7^caller_id!={CALLER_EXCLUDE_SYS_ID}"
    fields = [
        "number", "location.u_site_name", "priority",
        "opened_at", "sys_updated_on",
        "sla_target", "cmdb_ci", "problem_id",
        "state", "short_description"
    ]
    print("  Fetching open incidents...")
    df = snow_query("incident", query, fields)

    if "location.u_site_name" in df.columns:
        df = df.rename(columns={"location.u_site_name": "location"})

    if not df.empty and "location" in df.columns:
        pre = len(df)
        df = df[df["location"].isin(EMEA_SITES)]
        print(f"    Filtered {pre} -> {len(df)} incidents (EMEA sites only, excl. LogicMonitor)")

    return df
```

**Replace with:**
```python
def fetch_incidents() -> pd.DataFrame:
    """Open incidents for all EMEA sites — batch-by-site.

    SNOW incident table ignores server-side location filters (nameIN, u_region).
    Querying one site at a time using location.u_site_name=<site> is the only
    reliable approach. Runs one query per EMEA site and concatenates results.
    Excludes LogicMonitor/Integration caller (monitoring/event tickets).
    """
    fields = [
        "number", "location.u_site_name", "priority",
        "opened_at", "sys_updated_on",
        "sla_target", "cmdb_ci", "problem_id",
        "state", "short_description"
    ]
    print(f"  Fetching open incidents (batch-by-site, {len(EMEA_SITES)} sites)...")
    dfs = []
    for i, site in enumerate(EMEA_SITES, 1):
        query = (
            f"location.u_site_name={site}"
            f"^stateNOT IN6,7"
            f"^caller_id!={CALLER_EXCLUDE_SYS_ID}"
        )
        print(f"    [{i:>2}/{len(EMEA_SITES)}] {site[:45]}", end=" ", flush=True)
        df_site = snow_query("incident", query, fields)
        print(f"— {len(df_site)} records", flush=True)
        dfs.append(df_site)

    if not dfs or all(d.empty for d in dfs):
        logger.warning("fetch_incidents: no records returned for any EMEA site")
        return pd.DataFrame()

    df = pd.concat(dfs, ignore_index=True)

    if "location.u_site_name" in df.columns:
        df = df.rename(columns={"location.u_site_name": "location"})

    # Belt-and-braces: drop any non-EMEA rows that slipped through
    if "location" in df.columns:
        df = df[df["location"].isin(EMEA_SITES)]

    print(f"    Total open incidents: {len(df)}")
    logger.info(f"fetch_incidents complete — {len(df)} records across {len(EMEA_SITES)} sites")
    return df
```

---

### 2. Rewrite `fetch_major_incident_history()`

Same batch-by-site pattern. MI history also needs P1 global scope (all sites, not just EMEA)
for the repeat MI check — but the current function already filters to EMEA. Keep EMEA-only
for now (consistent with existing behaviour); P1 global scope is handled in calc_m5.

**Current implementation (lines ~415–435):**
```python
def fetch_major_incident_history() -> pd.DataFrame:
    since = (TODAY - timedelta(days=60)).strftime("%Y-%m-%d %H:%M:%S")
    query = f"priorityIN1,2^opened_at>={since}^caller_id!={CALLER_EXCLUDE_SYS_ID}"
    fields = [
        "number", "location.u_site_name", "priority",
        "opened_at", "resolved_at", "closed_at",
        "cmdb_ci", "problem_id", "state", "short_description"
    ]
    print("  Fetching MI history (60 days)...")
    df = snow_query("incident", query, fields)

    if "location.u_site_name" in df.columns:
        df = df.rename(columns={"location.u_site_name": "location"})

    if not df.empty and "location" in df.columns:
        df = df[df["location"].isin(EMEA_SITES)]

    return df
```

**Replace with:**
```python
def fetch_major_incident_history() -> pd.DataFrame:
    """P1/P2 incidents (open or closed) in the past 60 days — batch-by-site.

    Used for repeat MI check (calc_m5). Same batch-by-site approach as
    fetch_incidents() — SNOW location filters are ignored on incident table.
    Excludes LogicMonitor/Integration caller.
    """
    since = (TODAY - timedelta(days=60)).strftime("%Y-%m-%d %H:%M:%S")
    fields = [
        "number", "location.u_site_name", "priority",
        "opened_at", "resolved_at", "closed_at",
        "cmdb_ci", "problem_id", "state", "short_description"
    ]
    print(f"  Fetching MI history — 60 days (batch-by-site, {len(EMEA_SITES)} sites)...")
    dfs = []
    for i, site in enumerate(EMEA_SITES, 1):
        query = (
            f"location.u_site_name={site}"
            f"^priorityIN1,2"
            f"^opened_at>={since}"
            f"^caller_id!={CALLER_EXCLUDE_SYS_ID}"
        )
        print(f"    [{i:>2}/{len(EMEA_SITES)}] {site[:45]}", end=" ", flush=True)
        df_site = snow_query("incident", query, fields)
        print(f"— {len(df_site)} records", flush=True)
        dfs.append(df_site)

    if not dfs or all(d.empty for d in dfs):
        logger.warning("fetch_major_incident_history: no records returned for any EMEA site")
        return pd.DataFrame()

    df = pd.concat(dfs, ignore_index=True)

    if "location.u_site_name" in df.columns:
        df = df.rename(columns={"location.u_site_name": "location"})

    if "location" in df.columns:
        df = df[df["location"].isin(EMEA_SITES)]

    print(f"    Total MI history records: {len(df)}")
    logger.info(f"fetch_major_incident_history complete — {len(df)} records")
    return df
```

---

### 3. Fix `test_incident_fetch()` — initialise EMEA_SITES before running

Add site list initialisation at the top of the function so the batch-by-site test
and Python-side filter both work correctly.

**At the top of `test_incident_fetch()`, before the `incident_fields` definition, add:**
```python
    # Initialise EMEA site list — required for Python-side filter and batch-by-site test
    global EMEA_SITES, EMEA_LOCATION_FILTER
    if not EMEA_SITES:
        print("  Initialising EMEA site list for test...")
        sites = fetch_emea_sites()
        EMEA_SITES = sites["site_names"]
        EMEA_LOCATION_FILTER = "location.nameIN" + sites["location_ids"]
        print(f"  {sites['count']} EMEA sites loaded (source: {sites['source']})\n")
```

---

### 4. Update docstring at top of script

Update the version number and add a note about batch-by-site:

```python
"""
EMEA Governance Cockpit 2026 — SNOW REST API Refresh Script
Version: v3
```

---

## Test Commands

After making changes, run in this order:

```bash
# Test 1 — dry run, confirms batch fetch runs without error and prints per-site counts
python emea_gov_refresh.py --dry-run

# Test 2 — re-run test-fetch to confirm batch-by-site now works with EMEA_SITES populated
python emea_gov_refresh.py --test-fetch

# Test 3 — live run once dry run is clean
python emea_gov_refresh.py
```

**Expected dry-run output (incidents section):**
```
  Fetching open incidents (batch-by-site, 24 sites)...
    [ 1/24] Duesseldorf - Germany — N records
    [ 2/24] Warwick (Titan) - United Kingdom — N records
    ...
    [24/24] Warwick - United Kingdom — N records
    Total open incidents: NNN
```

---

## What NOT to change

- `fetch_catalogue_tasks()` — uses `EMEA_LOCATION_FILTER` (location.nameIN) which works on sc_task
- `fetch_problems()` — uses `EMEA_LOCATION_FILTER` which works on problem table
- `fetch_emea_sites()` — no change needed
- `load_from_csv()` — no change needed
- All metric calculation functions — no change needed
- All cockpit write functions — no change needed
