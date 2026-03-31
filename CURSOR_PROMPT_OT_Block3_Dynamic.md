# Cursor Prompt — Physics Block 3 Dynamic OT Stagnation Feed
*Date:* 30 March 2026
*File:* `C:\Users\cglynn\myPython\emea_gov\emea_gov_refresh.py`

---

## Context

Physics_Engine Block 3 (rows 28–39) is the OT Remediation Stagnation Tracker.
It has 6 active EMEA 2026 site rows (rows 30–35) with this column layout:
- A: Site Name (already populated)
- B: Last Activity Date — yellow input cell, currently blank
- C: Days Since Activity — formula, fires when B populated
- D: Funding Confirmed — yellow input cell
- E: Milestone Slips — yellow input cell
- F: Stagnation Flag — formula
- G: Status — formula (PENDING / ON TRAJECTORY / WATCH / BREACHED)

The source file for last activity dates is:
`C:\Users\cglynn\OneDrive - PHINIA\My_Development_Projects\EMEA_GOV\Data\TF_Tracker_-_OT.xlsx`
Sheet: `P3 Export`
Relevant columns: `u_site_name` (col B), `sys_updated_on` (col F)

The P3 Export uses shortened site names. The mapping to Physics Block 3 site names is:
| P3 Export u_site_name | Physics Block 3 row | Physics Block 3 site name |
|---|---|---|
| Amal | 30 | Amal - Sweden |
| Gillingham | 31 | Gillingham - United Kingdom |
| Iasi | 32 | Iasi - Romania |
| Izmir | 33 | Izmir - Turkey / ESBAS 2 (PT Phase 1) |
| Izmir | 34 | Izmir - Turkey / ESBAS 3 (PT Phase 2) |
| Krakow TC | 35 | Technical Center Krakow |

Note: Both Izmir rows (33 and 34) share the same P3 site name "Izmir" — use the same
last activity date for both.

---

## Task

### Step 1 — Add OT_PATH to .env and config

Add to .env:
```
OT_PATH=C:\Users\cglynn\OneDrive - PHINIA\My_Development_Projects\EMEA_GOV\Data\TF_Tracker_-_OT.xlsx
```

Add to script config section (alongside EUC_PATH):
```python
OT_PATH = os.getenv("OT_PATH", "TF_Tracker_-_OT.xlsx")
```

---

### Step 2 — Add function fetch_ot_last_activity(ot_path)

```python
def fetch_ot_last_activity(ot_path: str) -> dict:
    """
    Read TF_Tracker_-_OT.xlsx P3 Export sheet.
    Returns dict of {p3_site_name: last_activity_date} using most recent
    sys_updated_on per site. Returns empty dict if file not found.
    """
```

Implementation requirements:
- Open `P3 Export` sheet using openpyxl, data_only=True
- Read all rows from row 2 onward
- For each row, extract col B (u_site_name) and col F (sys_updated_on)
- Group by site name, keep the most recent sys_updated_on date per site
- Return as dict: `{"Amal": date, "Gillingham": date, ...}`
- If file not found: print warning and return empty dict — do not raise exception
- If sheet `P3 Export` not found: print warning and return empty dict

---

### Step 3 — Add function update_physics_block3(ws_physics, ot_activity)

```python
def update_physics_block3(ws_physics, ot_activity: dict):
    """
    Write Last Activity Date to Physics_Engine Block 3 col B for 6 active sites.
    Col B cells are date-formatted input cells — write date values only.
    Do not overwrite cols C, D, E, F, G (formulas or manual inputs).
    Do not touch rows 36–39 (out of scope rows).
    """
```

Use this fixed mapping (do not search by label):
```python
BLOCK3_SITE_MAP = {
    30: "Amal",
    31: "Gillingham",
    32: "Iasi",
    33: "Izmir",   # ESBAS 2
    34: "Izmir",   # ESBAS 3 — same source as row 33
    35: "Krakow TC",
}
```

For each row in BLOCK3_SITE_MAP:
- Look up the P3 site name in ot_activity dict
- If found: write the date value to col B of that row
  - Apply date number format: `DD-MMM-YYYY`
- If not found: leave col B unchanged, print warning

Do NOT overwrite col D (Funding Confirmed) or col E (Milestone Slips) — these are
separate manual inputs.

---

### Step 4 — Wire into main()

After `update_physics_block1()` is called, add:

```python
# Physics Block 3 — OT stagnation last activity dates
ot_activity = fetch_ot_last_activity(OT_PATH)
if ot_activity:
    ws_physics = wb["Physics_Engine"]
    update_physics_block3(ws_physics, ot_activity)
    print(f"  Physics Block 3: OT activity dates updated for "
          f"{len(ot_activity)} sites")
else:
    print("  Physics Block 3: OT tracker not found — Block 3 unchanged")
```

This must execute before `wb.save()`.

---

## Constraints

- Write to col B only for rows 30–35. No other cells modified.
- Do not touch rows 36–39 (out of scope).
- Do not modify Block 1, Block 2, or Block 4.
- If OT_PATH file is missing: skip silently with print warning, do not fail the run.
- Date values written as Python `datetime.date` objects — let openpyxl handle
  Excel serial conversion.

---

## Validation

After running:
1. Physics_Engine B30:B35 contain dates (not blank, not text strings)
2. C30:C35 show numeric day counts (formulas fire from B values)
3. F30:F35 show STAGNANT / AT RISK / OK based on day counts
4. G30:G35 show BREACHED / WATCH / ON TRAJECTORY / PENDING
5. Rows 36–39 unchanged
6. Run script twice — B30:B35 values update to latest dates on second run (idempotent)
7. If OT_PATH removed from .env: run completes without error, Block 3 unchanged
