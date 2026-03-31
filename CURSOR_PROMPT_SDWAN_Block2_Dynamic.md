# Cursor Prompt — Physics Block 2 Dynamic SD-WAN Feed
*Date:* 30 March 2026
*File:* `C:\Users\cglynn\myPython\emea_gov\emea_gov_refresh.py`

---

## Context

Physics_Engine Block 2 (rows 17–25) is the SD-WAN Legacy Network Burn Physics block.
It has three yellow manual input cells and four calculated outputs:

- B18: Total EMEA Sites in Scope (input) — confirmed: **19**
- B19: Sites Completed (input) — derived from tracker
- B20: Rolling 4W Average (input) — derived from tracker history
- B21: Sites Remaining (calc: B18 - B19)
- B22: Weeks to 30 Jun 2026 (calc)
- B23: Required Weekly Burn (calc: B21 / B22)
- B24: Projected Completion Date (calc)
- B25: Physics Status (calc)

The source file is:
`C:\Users\cglynn\OneDrive - PHINIA\My_Development_Projects\EMEA_GOV\Data\TF_-_SD_WAN.xlsx`
Sheet: `P2 Export`
Relevant columns: `number` (col A), `u_site_name` (col B), `state` (col D)

State mapping for "completed":
- `Complete` = completed site (counts toward Sites Completed)
- `Pending` = not yet complete
- `Ready to Schedule` = not yet complete
- `Withdrawn` = exclude from scope entirely

Current confirmed values (30 Mar 2026):
- Total in scope: 19 (excluding Withdrawn)
- Sites Completed: 10 (state = "Complete")

---

## Task

### Step 1 — Add SDWAN_PATH to .env and config

Add to .env:
```
SDWAN_PATH=C:\Users\cglynn\OneDrive - PHINIA\My_Development_Projects\EMEA_GOV\Data\TF_-_SD_WAN.xlsx
```

Add to script config section (alongside EUC_PATH and OT_PATH):
```python
SDWAN_PATH = os.getenv("SDWAN_PATH", "TF_-_SD_WAN.xlsx")
```

---

### Step 2 — Add function fetch_sdwan_metrics(sdwan_path)

```python
def fetch_sdwan_metrics(sdwan_path: str) -> dict:
    """
    Read TF_-_SD_WAN.xlsx P2 Export sheet.
    Returns dict with total_sites, completed_sites, remaining_sites.
    Excludes Withdrawn sites from total.
    Returns None if file not found.
    """
```

Implementation:
- Open `P2 Export` sheet using openpyxl, data_only=True
- Read col D (state) for all rows from row 2 onward where col A (number) is not None
- Count: total_sites = rows where state != "Withdrawn"
- Count: completed_sites = rows where state == "Complete"
- remaining_sites = total_sites - completed_sites
- Return: `{"total_sites": int, "completed_sites": int, "remaining_sites": int}`
- If file not found: print warning, return None — do not raise exception
- If sheet `P2 Export` not found: print warning, return None

---

### Step 3 — Add function update_physics_block2(ws_physics, sdwan_metrics)

```python
def update_physics_block2(ws_physics, sdwan_metrics: dict):
    """
    Write SD-WAN metrics to Physics_Engine Block 2.
    Writes B18 (total) and B19 (completed) only.
    B20 (Rolling 4W Average) is manual — do not overwrite.
    B21:B25 are formula-driven — do not overwrite.
    """
```

Fixed cell references:
```python
BLOCK2_CELLS = {
    "total_sites":     "B18",  # Total EMEA Sites in Scope
    "completed_sites": "B19",  # Sites Completed
    # B20 = Rolling 4W Average — manual input, DO NOT WRITE
}
```

Write:
- B18 = sdwan_metrics["total_sites"]
- B19 = sdwan_metrics["completed_sites"]
- Do NOT touch B20 (manual rolling average)
- Do NOT touch B21:B25 (formula cells)

Log: `f"Physics Block 2 updated — Total: {total}, Completed: {completed}, Remaining: {remaining}"`

---

### Step 4 — Wire into main()

After `update_physics_block3()` call, add:

```python
# Physics Block 2 — SD-WAN burn metrics
sdwan_metrics = fetch_sdwan_metrics(SDWAN_PATH)
if sdwan_metrics:
    ws_physics = wb["Physics_Engine"]
    update_physics_block2(ws_physics, sdwan_metrics)
    print(f"  Physics Block 2: SD-WAN — "
          f"{sdwan_metrics['completed_sites']}/{sdwan_metrics['total_sites']} sites complete, "
          f"{sdwan_metrics['remaining_sites']} remaining")
else:
    print("  Physics Block 2: SD-WAN tracker not found — Block 2 unchanged")
```

This must execute before `wb.save()`.

---

## Constraints

- Write to B18 and B19 only. No other Block 2 cells modified.
- B20 is manual — never overwrite.
- B21:B25 are formula-driven — never overwrite.
- Do not modify Block 1, Block 3, or Block 4.
- If SDWAN_PATH file missing: skip silently, do not fail the run.
- Withdrawn sites must be excluded from total_sites count.

---

## Validation

After running:
1. Physics_Engine B18 = 19, B19 = 10
2. B21 (Sites Remaining) formula resolves to 9
3. B22 (Weeks to 30 Jun) shows ~13
4. B23 (Required Weekly Burn) shows ~0.69
5. B25 (Physics Status) shows a signal (On Trajectory / Watch / Breached)
6. B20 unchanged (manual cell)
7. Run script twice — B18/B19 update correctly both times (idempotent)
8. If SDWAN_PATH removed from .env: run completes without error, Block 2 unchanged
