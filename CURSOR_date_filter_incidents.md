# Cursor Prompt — Add 12-Month Date Filter to fetch_incidents()
*File:* `emea_gov_refresh.py`
*Version bump:* v4 → v5
*Reason:* fetch_incidents() is returning all historical incidents with non-closed states,
going back years. Blois returning 17,921 records, total 56,930 across 24 sites. The
governance metric (10-day aging) only requires recent open incidents. Adding a 12-month
opened_at filter reduces the dataset to a meaningful governance window.

---

## Change 1 — `fetch_incidents()`

Find the query line inside the per-site loop:
```python
query = (
    f"location.u_site_name={site}"
    f"^stateNOT IN6,7,8"
    f"^caller_id!={CALLER_EXCLUDE_SYS_ID}"
)
```

Replace with:
```python
since_1yr = (TODAY - timedelta(days=365)).strftime("%Y-%m-%d %H:%M:%S")
query = (
    f"location.u_site_name={site}"
    f"^stateNOT IN6,7,8"
    f"^opened_at>={since_1yr}"
    f"^caller_id!={CALLER_EXCLUDE_SYS_ID}"
)
```

**Important:** `since_1yr` should be calculated once before the loop, not inside it.
Move the `since_1yr =` line to just before the `print(f"  Fetching open incidents...")` 
line, outside the for loop.

Updated function structure should look like:
```python
def fetch_incidents() -> pd.DataFrame:
    """Open incidents for all EMEA sites — batch-by-site.
    ...
    Date filter: last 12 months only (opened_at >= 365 days ago).
    Adjust timedelta(days=365) if a different window is required.
    """
    fields = [...]
    since_1yr = (TODAY - timedelta(days=365)).strftime("%Y-%m-%d %H:%M:%S")
    print(f"  Fetching open incidents (batch-by-site, {len(EMEA_SITES)} sites)...")
    dfs = []
    for i, site in enumerate(EMEA_SITES, 1):
        query = (
            f"location.u_site_name={site}"
            f"^stateNOT IN6,7,8"
            f"^opened_at>={since_1yr}"
            f"^caller_id!={CALLER_EXCLUDE_SYS_ID}"
        )
        ...
```

---

## Change 2 — Update docstring comment in `fetch_incidents()`

Update the function docstring to note the date window:
```
Date filter: last 12 months (opened_at >= 365 days ago). Adjust timedelta if needed.
```

---

## Change 3 — Version bump

Update the module docstring:
```python
Version: v5
```

---

## What NOT to change

- `fetch_major_incident_history()` — already has its own `opened_at>=since` (60-day window). No change.
- `fetch_catalogue_tasks()` — no date filter needed, sc_task scope is already limited.
- `fetch_problems()` — no date filter needed.
- `load_from_csv()` — CSV mode, not affected.
- All metric calculation functions — no change.

---

## Test command

```bash
python emea_gov_refresh.py --dry-run
```

**Expected result:**
- Total open incidents drops from ~57,000 to low thousands or hundreds
- Blois drops from 17,921 to a manageable count
- incident_aging adherence % becomes a meaningful governance signal
- no_movement count drops proportionally
- All other metrics unchanged
