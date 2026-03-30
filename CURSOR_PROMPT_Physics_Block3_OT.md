# Cursor Prompt — Populate Physics_Engine Block 3 (OT Remediation)
*Date:* 27 March 2026
*File:* `C:\Users\cglynn\OneDrive - PHINIA\Data\EMEA_GOV\Cockpit\EMEA_Governance_Cockpit_2026.xlsx`

---

## Context

Physics_Engine Block 3 (rows 28–39) is the OT Remediation Stagnation Tracker.
Site scope has been confirmed by the programme owner (27 Mar 2026).

Block 3 layout:
- Row 28: Block header
- Row 29: Column headers — Site Name | Last Activity Date | Days Since Activity | Funding Confirmed | Milestone Slips | Stagnation Flag | Status
- Rows 30–39: 10 site data rows (currently "Site 1" through "Site 10" placeholders)

Column mapping (cols A–G):
- A: Site Name
- B: Last Activity Date (yellow input cell — manual entry)
- C: Days Since Activity (formula: =IF(B30="", "", TODAY()-B30))
- D: Funding Confirmed (yellow input cell — manual entry: "Yes" / "No" / "TBC")
- E: Milestone Slips (yellow input cell — manual entry: integer)
- F: Stagnation Flag (formula: =IF(C30="","",IF(C30>30,"STAGNANT",IF(C30>14,"AT RISK","OK"))))
- G: Status (formula: =IF(C30="","PENDING",IF(OR(E30>=2,C30>30),"BREACHED",IF(C30>14,"WATCH","ON TRAJECTORY"))))

---

## Task

### Step 1 — Populate site names in rows 30–39

Write the following values to column A (overwrite "Site 1" through "Site 10"):

| Row | Col A — Site Name | Col D — Funding Confirmed |
|-----|-------------------|--------------------------|
| 30  | Amal - Sweden | TBC |
| 31  | Gillingham - United Kingdom | TBC |
| 32  | Iasi - Romania | TBC |
| 33  | Izmir - Turkey / ESBAS 2 (PT Phase 1) | TBC |
| 34  | Izmir - Turkey / ESBAS 3 (PT Phase 2) | TBC |
| 35  | Technical Center Krakow | TBC |
| 36  | [OUT OF SCOPE 2026] Blois, Hartridge, Warwick, Stonehouse, Krakow Office — 2027 | N/A |
| 37  | [OUT OF SCOPE 2026] Bucharest, Wroclaw, Cergy, Rzeszow, Warwick Titan, Madrid, Duesseldorf, Belval, Dubai — 2028 | N/A |
| 38  | [OUT OF SCOPE] Cinisello, Istanbul, Warsaw (Delphi Academy), Warsaw — no OT devices confirmed | N/A |
| 39  | (spare — leave blank) | |

### Step 2 — Apply formulas to cols C, F, G for rows 30–35 (active sites only)

For each active site row (30–35), write these formulas:
- Col C: `=IF(B{row}="","",TODAY()-B{row})`
- Col F: `=IF(C{row}="","",IF(C{row}>30,"STAGNANT",IF(C{row}>14,"AT RISK","OK")))`
- Col G: `=IF(C{row}="","PENDING",IF(OR(E{row}>=2,C{row}>30),"BREACHED",IF(C{row}>14,"WATCH","ON TRAJECTORY")))`

For out-of-scope rows (36–38):
- Col C: leave blank
- Col F: `N/A`
- Col G: `OUT OF SCOPE`

### Step 3 — Apply formatting

For active site rows (30–35):
- Col B and D and E: yellow fill (#FFFF00) — manual input cells
- Col C, F, G: white fill — calculated cells

For out-of-scope rows (36–38):
- All cells: light grey fill (#D9D9D9), italic font

### Step 4 — Apply conditional formatting to col G (rows 30–35)

- `BREACHED` → red fill (#FF0000), white bold font
- `WATCH` → amber fill (#FFC000), black bold font
- `ON TRAJECTORY` → green fill (#00B050), white bold font
- `PENDING` → grey fill (#D9D9D9), black font
- `OUT OF SCOPE` → light grey fill (#D9D9D9), italic font

---

## Constraints

- Do not modify rows 28–29 (header rows)
- Do not modify any other block (Block 1, 2, or 4)
- Do not overwrite any existing formula in the workbook outside Block 3
- Col B (Last Activity Date) must remain empty after this prompt — it is a manual input cell that the SDM will populate per site when activity is confirmed

---

## Validation

After running:
1. Rows 30–35 show the 6 EMEA 2026 OT site names in col A
2. Col C, F, G for rows 30–35 show formulas (C = blank until B populated, F = blank, G = PENDING)
3. Rows 36–38 show out-of-scope summary labels in grey italic
4. Yellow fill on B30:B35, D30:D35, E30:E35
5. No other Physics_Engine rows affected
