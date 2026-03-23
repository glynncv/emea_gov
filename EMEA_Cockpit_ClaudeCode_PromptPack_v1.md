# EMEA Governance Cockpit — Claude Code Prompt Pack
*Version:* v1
*Date:* 2026-03-06
*Owner:* EMEA SDM (Colman)
*Purpose:* Ready-to-paste Claude Code prompts for building, calibrating, and maintaining emea_gov_refresh.py
*Run from:* The folder containing emea_gov_refresh.py

---

## How to Use

Open Claude Code in your project folder:
```
cd C:\EMEA_GOV\Scripts
claude
```
Paste each prompt at the `>` prompt as needed. Prompts are sequenced — run them in order on first setup.

---

## PROMPT 1 — Environment Setup and Dependency Check

Run first. Verifies Python environment, installs dependencies, creates .env template.

```
Read emea_gov_refresh.py and do the following:

1. Check whether Python 3.10 or higher is available on this machine
2. Install all required dependencies: requests openpyxl pandas python-dotenv
3. Confirm each installed successfully and print the version
4. Create a .env file in the current directory with these placeholder keys:
   SNOW_INSTANCE=your-instance.service-now.com
   SNOW_USER=your_username
   SNOW_PASS=your_password
   COCKPIT_PATH=C:\EMEA_GOV\Cockpit\EMEA_Governance_Cockpit_2026.xlsx
5. Confirm the .env file was created
6. Add .env to .gitignore — create .gitignore if it does not exist
7. Print a setup complete summary
```

---

## PROMPT 2 — Add Dry Run Flag

Run before any live test. Adds --dry-run mode so the script can be tested without writing to the cockpit.

```
Read emea_gov_refresh.py and add a --dry-run flag as follows:

1. Add argparse to the script — import argparse at the top
2. In main(), parse --dry-run as a boolean flag
3. When --dry-run is active:
   - Fetch data from SNOW as normal
   - Calculate all 6 metrics as normal
   - Print the full refresh summary to the terminal
   - Do NOT open or write to the cockpit Excel file
   - Print a clear message: "DRY RUN — cockpit not updated"
4. When --dry-run is not set: behaviour is unchanged from current version
5. Update the module docstring to document the --dry-run flag

Test by running: python emea_gov_refresh.py --dry-run
and confirm it completes without touching the Excel file.
```

---

## PROMPT 3 — Calibrate Cell References from Live Cockpit

Run after the cockpit is built in Excel. Updates ROW_MAP to match actual cell positions.

```
I need to calibrate the cell references in emea_gov_refresh.py to match my 
actual cockpit Excel file.

The cockpit is at: C:\EMEA_GOV\Cockpit\EMEA_Governance_Cockpit_2026.xlsx

Open the file and read the Operations_Panel sheet. Find the row number for each 
of these metric labels (they appear in column A or the first text column):

- "Open Incident Aging — 10 Days or Less"
- "Open Catalogue Request Aging — 30 Days or Less"
- "Aged Incidents Greater Than SLA x2"
- "Tickets With No Movement 14 or More Days"
- "Repeat Major Incidents — Same CI or Site Within 30 Days"
- "Open Problems Without RCA — Over 30 Days"

For each row found, also identify:
- Which column holds "Current Value" (the column after the Target column)
- Which column holds "Trigger Status"
- Which column holds "Escalation Required"

Then update the ROW_MAP dictionary in emea_gov_refresh.py with the correct 
cell references for each metric.

Also read Physics_Engine sheet Block 4. Find the rows for these metrics 
and update the phys_row values in ROW_MAP:
- Incident Aging %
- Catalogue Aging %
- SLA x2 Count
- No Movement Count
- Repeat MI Count
- Problems Without RCA Count

Print a before/after comparison of ROW_MAP showing old and new values.
```

---

## PROMPT 4 — Verify SNOW Field Names Against Live Export

Run after your first SNOW CSV export. Checks actual field names and fixes any mismatches in the script.

```
I have a SNOW CSV export at C:\EMEA_GOV\SNOW_Exports\Current\EMEA_GOV_Weekly_Consolidated.csv

Read the file and do the following:

1. List every column header exactly as it appears in the CSV
2. Compare against the field names used in emea_gov_refresh.py 
   (check all snow_query calls and metric calculation functions)
3. Identify any mismatches between actual CSV headers and field names in the script
4. For each mismatch: update the script to use the correct field name
5. Specifically check:
   - Whether "sla_target" exists — if absent, confirm SLA_DEFAULTS fallback is active
   - Whether root cause field is "root_cause" or "u_root_cause"
   - Whether "cmdb_ci" is a flat string or a nested dict with value/display_value
   - Whether "problem_id" is a flat string or nested
   - Whether "u_site_name" matches exactly or has a different format
6. Check the date format in opened_at and sys_updated_on columns — 
   confirm pd.to_datetime parsing will handle it correctly
7. Print a summary: fields verified / fields corrected / no action needed
```

---

## PROMPT 5 — First Live Dry Run Against Real SNOW Data

Run after Prompts 3 and 4 are complete. Full end-to-end test against live SNOW.

```
Run emea_gov_refresh.py --dry-run against the live SNOW instance.

Credentials are in .env — do not print them.

After the run completes, review the terminal output and do the following:

1. Confirm all 6 metrics returned a value (not None)
2. Confirm the record counts look reasonable for a 25-site estate:
   - Flag if any metric returned 0 records
   - Flag if total incident count exceeds 2000 (may indicate filter issue)
3. Check site coverage in the output — confirm all 25 EMEA sites are present
   If any sites are missing, identify which SNOW table they are absent from
4. Review the trigger status for each metric — confirm GREEN/WATCH/BREACHED 
   logic is firing correctly based on the values returned
5. If any errors occurred during the run, diagnose and fix them
6. Print a verdict: READY FOR LIVE RUN or ISSUES TO RESOLVE (list them)
```

---

## PROMPT 6 — First Live Run

Run only after Prompt 5 passes. Writes to the cockpit for the first time.

```
Run emea_gov_refresh.py against the live SNOW instance and live cockpit.

After the run:
1. Open C:\EMEA_GOV\Cockpit\EMEA_Governance_Cockpit_2026.xlsx
2. Read Operations_Panel and confirm:
   - All 6 Current Value cells contain numeric values (not None or empty)
   - All 6 Trigger Status cells contain GREEN, WATCH, or BREACHED
   - All 6 Escalation Required cells contain YES or NO
   - Conditional formatting colours match the trigger status values
3. Read Physics_Engine Block 4 and confirm Wk1 column contains this week's values
4. Report any cells that were not updated correctly and fix them
```

---

## PROMPT 7 — Add Error Handling and Logging

Run after the first successful live run. Makes the script production-ready.

```
Read emea_gov_refresh.py and add production-grade error handling and logging:

1. Add Python logging module — write logs to C:\EMEA_GOV\Scripts\logs\refresh.log
   Log level: INFO for normal operations, WARNING for data anomalies, 
   ERROR for failures
   Log format: timestamp | level | message
   Rotate logs weekly — keep 8 weeks of history

2. Wrap each SNOW API call in a try/except:
   - On connection error: log ERROR, print clear message, exit gracefully
   - On 401 Unauthorized: log ERROR with message "Check SNOW credentials in .env"
   - On 403 Forbidden: log ERROR with message "Check SNOW API access permissions"
   - On timeout (add 30s timeout to all requests): log WARNING, retry once, 
     then exit gracefully
   - On any other HTTP error: log the status code and response body

3. Wrap the Excel write in a try/except:
   - If cockpit file is open in Excel (PermissionError): 
     log WARNING and print "Close the cockpit Excel file and re-run"
   - If cockpit file not found: log ERROR with full path

4. Add a data quality check after fetching — if any dataset returns 0 records, 
   log WARNING and skip that metric rather than writing None to the cockpit

5. At end of successful run: log INFO with count of metrics updated, 
   BREACHED count, WATCH count

Do not change any metric calculation or Excel write logic — error handling only.
```

---

## PROMPT 8 — Add Windows Task Scheduler Setup

Run when ready to automate. Creates the scheduled task for Monday AM refresh.

```
Create a Windows Task Scheduler setup for emea_gov_refresh.py:

1. Create a batch file at C:\EMEA_GOV\Scripts\run_refresh.bat that:
   - Activates the correct Python environment
   - Runs emea_gov_refresh.py
   - Appends stdout and stderr to C:\EMEA_GOV\Scripts\logs\scheduler.log
     with a timestamp prefix on each run

2. Create a PowerShell script at C:\EMEA_GOV\Scripts\create_scheduled_task.ps1 that:
   - Creates a Windows Task Scheduler task named "EMEA_GOV_Weekly_Refresh"
   - Trigger: Weekly, Monday at 08:00
   - Action: run run_refresh.bat
   - Run only if the machine is on AC power
   - Do not run on battery
   - If the machine is off at 08:00, run as soon as it wakes on Monday
   - Run whether or not user is logged in (requires password prompt — note this)

3. Print instructions for running the PowerShell script with the correct 
   permissions and any prerequisites needed

Note: Do not execute the PowerShell script — create it only.
```

---

## PROMPT 9 — Ongoing: Fix a Metric Calculation

Use when a metric needs adjusting based on real data behaviour. Replace [METRIC] and [DESCRIPTION] with specifics.

```
Read emea_gov_refresh.py and fix the following metric calculation:

Metric: [METRIC NAME — e.g. calc_m4_no_movement]
Issue: [DESCRIPTION OF PROBLEM — e.g. "returning 0 even though SNOW shows 
        stale tickets — sys_updated_on may be formatted differently"]

Steps:
1. Read the current implementation of the function
2. Diagnose the issue based on my description
3. If you need to inspect the actual data, read the most recent CSV from 
   C:\EMEA_GOV\SNOW_Exports\Archive\ and show me sample values for the 
   relevant field
4. Propose a fix with explanation
5. Apply the fix
6. Run python emea_gov_refresh.py --dry-run and confirm the metric now 
   returns a sensible value
```

---

## PROMPT 10 — Ongoing: Add a New Metric

Use when a new Operations Panel row needs to be tracked. Replace placeholders with specifics.

```
Read emea_gov_refresh.py and add a new metric:

Metric name: [NAME]
SNOW source: [TABLE — incident / sc_task / problem / change]
Logic: [DESCRIBE THE CALCULATION — e.g. "count of change records in EMEA 
        sites where state = Failed, opened in the past 30 days"]
Trigger rules:
  WATCH: [condition]
  BREACHED: [condition]
Cockpit row label: [EXACT TEXT as it appears in Operations_Panel column A]
Current Value cell: [cell ref — or say "determine from cockpit file"]
Trigger Status cell: [cell ref — or say "determine from cockpit file"]

Steps:
1. Add a fetch function if a new SNOW table is needed
2. Add a calc_ function for the metric
3. Add trigger evaluation logic in evaluate_trigger()
4. Add the metric to ROW_MAP with correct cell references
   (read the cockpit file to confirm if cell refs not provided)
5. Add the metric to the main() metrics dict
6. Run --dry-run and confirm the new metric appears in the summary output
```

---

## PROMPT 11 — Wire EUC / EOSL Data into Physics Block 1

Run after Prompt 3 (cell calibration). Connects fetch_euc_assets() to Physics Block 1 in the cockpit.

```
Read emea_gov_refresh.py and wire the fetch_euc_assets() function into the 
main refresh run as follows:

BACKGROUND:
EUC / EOSL data comes from a Power BI export saved as EUC_EOSL.xlsx — not from SNOW.
The file contains ~4,001 device records. A pre-built sheet called 
'ESOL Replacement Tracker' contains a site-by-target-date matrix.
Key figures: 220 total devices to replace, 20 overdue (Oct 2025 target), 
200 remaining by Nov 2026. Highest burden: Iasi (76), Izmir (64).

STEP 1 — Add EUC_PATH to .env and config
Add this key to .env:
  EUC_PATH=C:\EMEA_GOV\Data\EUC_EOSL.xlsx
Load it in the script config section alongside COCKPIT_PATH.

STEP 2 — Call fetch_euc_assets() from main()
In main(), after the SNOW fetches, add:
  euc_df = fetch_euc_assets(EUC_PATH)
If euc_df is empty, log a warning and skip Physics Block 1 — do not abort the run.

STEP 3 — Calculate Physics Block 1 inputs from euc_df
From the returned DataFrame (columns: site, target_date_label, device_count):
- Total devices to replace = sum of all device_count values
- Overdue count = device_count where target_date_label contains "Oct 2025" or 
  similar past-date label
- Remaining by Nov 2026 = device_count where target_date_label contains "Nov 2026"
- Required weekly burn = remaining by Nov 2026 ÷ weeks remaining to 30 Nov 2026 
  from today's date (calculate dynamically)
- Q4 adjusted burn = required weekly burn × 0.7 (seasonal capacity -30% from 1 Oct)

STEP 4 — Read Physics_Engine Block 1 cell references from cockpit
Open EMEA_Governance_Cockpit_2026.xlsx and read the Physics_Engine sheet.
Find the rows in Block 1 for:
  - "Total EOSL Units in Scope"
  - "Units Replaced to Date" (leave this blank — not auto-populated)
  - "Units Remaining"
  - "Required Weekly Burn"
  - "Q4 Adjusted Burn (from 1 Oct)"
  - "Weeks Remaining to 30 Nov 2026"
Note the cell reference for each value column.

STEP 5 — Write Physics Block 1 values to cockpit
Write the calculated values to the identified cells.
Do not overwrite "Units Replaced to Date" — this is manually maintained.

STEP 6 — Add to dry-run output
When --dry-run is active, print the Physics Block 1 calculated values to 
the terminal instead of writing to the cockpit.

STEP 7 — Test
Run python emea_gov_refresh.py --dry-run
Confirm Physics Block 1 values appear in the terminal output.
Confirm total = 220, overdue = 20, remaining = 200 (or current values if 
EUC_EOSL.xlsx has been refreshed since 07 Mar 2026).
```

---

*End of EMEA Governance Cockpit — Claude Code Prompt Pack v1.*
*Sequence for first setup: Prompts 1 → 2 → 3 → 4 → 5 → 6 → 7 → 8 → 11*
*Prompt 11 runs after Prompt 3 — requires cockpit to be built first.*
*Prompts 9 and 10 are ongoing maintenance — use as needed.*
