# Cursor Prompt — Exclude Autoclosed Incidents (State 8)
*File:* `emea_gov_refresh.py`
*Version bump:* v3 → v4
*Reason:* Incident query returning ~57,000 records because Autoclosed (state 8) is not
excluded. Current filter `stateNOT IN6,7` misses state 8. Confirmed from PHINIA SNOW
instance: Autoclosed = 62% of incident volume.

---

## Change 1 — `fetch_incidents()`

Find this line:
```python
query = f"stateNOT IN6,7^caller_id!={CALLER_EXCLUDE_SYS_ID}"  # 6=Resolved, 7=Closed
```

Replace with:
```python
query = f"stateNOT IN6,7,8^caller_id!={CALLER_EXCLUDE_SYS_ID}"  # 6=Resolved, 7=Closed, 8=Autoclosed
```

---

## Change 2 — `fetch_major_incident_history()`

Find this line:
```python
query = (
    f"location.u_site_name={site}"
    f"^priorityIN1,2"
    f"^opened_at>={since}"
    f"^caller_id!={CALLER_EXCLUDE_SYS_ID}"
)
```

No change needed here — MI history intentionally includes closed/resolved/autoclosed
records (needed for repeat MI detection over 60 days). Leave unchanged.

---

## Change 3 — `test_incident_fetch()` strategies

Find the strategies list:
```python
strategies = [
    ("Current (state only)", "stateNOT IN6,7"),
    ("+ caller exclude", f"stateNOT IN6,7^caller_id!={CALLER_EXCLUDE_SYS_ID}"),
    ("+ location.nameIN", f"{EMEA_LOCATION_FILTER}^stateNOT IN6,7^caller_id!={CALLER_EXCLUDE_SYS_ID}"),
    ("+ location.u_region=EMEA", f"location.u_region=EMEA^stateNOT IN6,7^caller_id!={CALLER_EXCLUDE_SYS_ID}"),
]
```

Replace with:
```python
strategies = [
    ("Current (state only)", "stateNOT IN6,7,8"),
    ("+ caller exclude", f"stateNOT IN6,7,8^caller_id!={CALLER_EXCLUDE_SYS_ID}"),
    ("+ location.nameIN", f"{EMEA_LOCATION_FILTER}^stateNOT IN6,7,8^caller_id!={CALLER_EXCLUDE_SYS_ID}"),
    ("+ location.u_region=EMEA", f"location.u_region=EMEA^stateNOT IN6,7,8^caller_id!={CALLER_EXCLUDE_SYS_ID}"),
]
```

---

## Change 4 — Version bump

Update the module docstring:
```python
Version: v4
```

---

## What NOT to change

- `fetch_major_incident_history()` query — MI history includes closed/autoclosed by design
- `load_from_csv()` — CSV mode filters by state column in Python, not query string
- All other functions — no change needed

---

## Test command

```bash
python emea_gov_refresh.py --dry-run
```

**Expected result:**
- Total open incidents drops from ~57,000 to hundreds or low thousands
- no_movement count drops proportionally
- incident_aging adherence % becomes meaningful (was 0.4% on 57k records)
- All other metrics unchanged
