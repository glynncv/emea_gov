# EMEA Governance Cockpit — Weekly Refresh Prompt
# Last verified: 2026-03-23
# Status: PARTIAL — O4, P1, P2 source files not yet located (see MISSING SOURCES below)

================================================================================
INSTRUCTIONS
================================================================================
This file defines the source files, field mappings, and join logic required to
populate the EMEA Governance Cockpit on each weekly refresh.

Read each source file from:
  C:\Users\cglynn\OneDrive - PHINIA\Data\SNOW\

Do not rename, move, or modify source files. Apply all mappings in the Cockpit
logic only.

================================================================================
O1 — INCIDENT AGING
================================================================================
Source files (use all three, union rows):
  IM Backlog Reports\PYTHON EMEA IM Backlog  (2025).csv
  IM Backlog Reports\PYTHON EMEA IM Backlog  (2026).csv
  IM Backlog Reports\PYTHON EMEA IM Backlog OPEN.csv

Field mappings (actual CSV column → expected Cockpit column):
  location.u_site_name  →  u_site_name
  incident_state        →  state
  number                →  number          [no mapping needed]
  priority              →  priority        [no mapping needed]
  opened_at             →  opened_at       [no mapping needed]

SLA join (to populate sla_target):
  Join file:  YTD 2025 Reports\PYTHON EMEA IM SLA Response (2026).csv
  Join key:   inc_number  =  number
  Fields:
    taskslatable_sla.target      →  sla_target
    taskslatable_stage           →  sla_stage        [breach status: Breached / In Progress]
    taskslatable_business_percentage  →  sla_pct     [% of SLA time consumed]

Note: One incident may have multiple SLA rows. Use the Resolution SLA row where
taskslatable_sla.target = 'Resolution'. If multiple rows exist, take the latest.

================================================================================
O2 — CATALOGUE REQUEST AGING (SCT)
================================================================================
Source files (use both, union rows):
  YTD 2025 Reports\PYTHON EMEA SCT (2025).csv
  YTD 2025 Reports\PYTHON EMEA SCT (2026).csv

Field mappings (actual CSV column → expected Cockpit column):
  request_item.u_opened_on_behalf_of.location  →  u_site_name
  request_item.cat_item                         →  short_description
  request_item.state                            →  state
  number                                        →  number       [no mapping needed]
  opened_at                                     →  opened_at    [no mapping needed]

================================================================================
O3 — NO MOVEMENT
================================================================================
Expected columns: number, u_site_name, short_description, sys_updated_on,
                  assigned_to, type

Source file:
  YTD 2025 Reports\Python EMEA IM Movement (7 days).csv

SNOW filter used to generate this export:
  Location Region = EMEA
  Incident State not in (Resolved, Closed, Autoclosed)
  sys_updated_on < javascript:gs.daysAgo(7)

Field mappings (actual CSV column → expected Cockpit column):
  location.u_site_name  →  u_site_name
  incident_state        →  state
  number                →  number           [no mapping needed]
  short_description     →  short_description [no mapping needed]
  sys_updated_on        →  sys_updated_on   [no mapping needed]
  assigned_to           →  assigned_to      [no mapping needed]

  u_ci_class            →  type             [confirmed — CI category e.g. "ADM Application", "Computers"]

================================================================================
O4 — REPEAT MAJOR INCIDENTS
================================================================================
Expected columns: number, u_site_name, priority, cmdb_ci, short_description,
                  opened_at, problem_id

Pipeline file:
  Data\TF Repeat MI.xlsx  (sheet: O4 Export — 12 rows)

  Role: Transformation pipeline — identifies CIs with repeat P1/P2 occurrences
  within a 90-day window. Source is SNOW P1/P2 Problem export.
  Scope: Global — repeat CIs are cross-regional applications with EMEA impact.

Source sheet:
  PYTHON EMEA PM P1P2 (90 days) — 54 rows, 90-day rolling SNOW export

Field mappings (actual column → expected Cockpit column):
  number        →  number           [PRB number]
  location      →  u_site_name      [strip leading site code e.g. "10304 - Iasi - Romania" → "Iasi - Romania"]
  priority      →  priority
  cmdb_ci       →  cmdb_ci
  short_description → short_description
  opened_at     →  opened_at
  number        →  problem_id       [PRB number = problem record]

Repeat MI logic:
  Include only rows where cmdb_ci appears > 1 time in the 90-day window.
  repeat_count column shows number of occurrences per CI.
  Rows with null cmdb_ci are excluded.

Current repeat CIs (12 rows):
  SAP Console               — 5 occurrences
  Fusion PLM                — 3 occurrences
  AHCLTOFF3085              — 2 occurrences
  IBM CloudPakforIntegration — 2 occurrences

================================================================================
O5 — PROBLEMS WITH NO RCA
================================================================================
Expected columns: number, u_site_name, short_description, opened_at, root_cause

Candidate file (requires verification):
  Current\EMEA_GOV_Problems.csv
  Columns present: sys_class_name, location.u_site_name, number, state,
                   opened_at, sys_updated_on, root_cause, u_root_cause,
                   assigned_to, short_description

  Field mappings (actual CSV column → expected Cockpit column):
    location.u_site_name  →  u_site_name
    root_cause            →  root_cause     [confirmed — not u_root_cause]
    number                →  number         [no mapping needed]
    state                 →  state          [no mapping needed]
    opened_at             →  opened_at      [no mapping needed]
    short_description     →  short_description [no mapping needed]

================================================================================
P1 — EUC ASSETS
================================================================================
Expected columns: asset_tag, u_site_name, model, eosl_date, install_status

Source file:
  Data\EUC_EOSL.xlsx  (sheet: Export — 3,974 rows)

Field mappings (actual column → expected Cockpit column):
  Device Serial Number  →  asset_tag
  Site Location         →  u_site_name
  Device Model          →  model
  Action to take        →  install_status   [raw value: Redeploy / Replace by [date] / Urgent Replacement / N/A]
  Action to take        →  eosl_date        [parse date from "Replace by DD/MM/YYYY" pattern — 208 rows]

Action to take value distribution:
  Redeploy              — 3,710
  Replace by 11/11/2026 —   193
  Replace by 14/10/2025 —    12
  Urgent Replacement    —     3
  N/A                   —    43
  Null                  —    13

================================================================================
P2 — SDWAN STATUS
================================================================================
Expected columns: number, u_site_name, short_description, state, closed_at

SOURCE FILE NOT YET LOCATED — export from SNOW before first run.

================================================================================
P3 — OT ACTIVITY
================================================================================
Expected columns: number, u_site_name, short_description, state,
                  sys_updated_on, assigned_to

Pipeline file:
  TF Tracker - OT.xlsx

  Role: Transformation pipeline — converts raw W3i OT action item data into
  P3-structured format for Cockpit ingestion. Not a SNOW export.

  Sheets:
    P3 Export    — Cockpit-ready data table (A1:L28, 28 EMEA rows). READ THIS SHEET ONLY.
    P3 Reference — Column mapping legend and state mapping lookup (reference only, do not ingest). ✅ Split complete.

  Numbers are prefixed OT-XXXX (not SNOW incident numbers).
  Scope: EMEA sites only — Amal (7), Gillingham (7), Iasi (3), Izmir (3), Krakow TC (8). ✅ Non-EMEA rows removed.

Field mappings (source column → expected Cockpit column):
  #                →  number           [prefixed as OT-XXXX]
  Site             →  u_site_name
  Issue            →  short_description
  Status (0-4)     →  state            [derived: 0=Open, 1-3=WIP, 4+=Closed Complete]
  assigned_to      →  SDM per site     [sourced from PYTHON EMEA Locations.csv, u_it_operations_manager]
  sys_created_on   →  sys_updated_on   [⚠️ PROXY — no true last-updated field in source]

SDM per site (from Locations file):
  Amal        →  Proyer, Damon
  Gillingham  →  Proyer, Damon
  Iasi        →  Cazan, Anca
  Izmir       →  Cazan, Anca
  Krakow TC   →  Glynn, Colman

Known data quality gaps:
  sys_updated_on   — proxy only (copies sys_created_on), no true last-updated field in W3i source
  planned_end_date — 21% populated
  state            — 93% populated (2 null rows to resolve)

Note: assignment_group is not applicable — P3 is W3i project tracker data, not a SNOW
  ticket export. Accountability is at SDM level via assigned_to.

================================================================================
MISSING SOURCES — ACTION REQUIRED BEFORE FIRST RUN
================================================================================
The following SNOW exports must be created and placed in the Data\SNOW\ folder
before the Cockpit can run end-to-end:

  [x] O4 Repeat Major Incident — source confirmed (TF Repeat MI.xlsx), 12 rows, global scope for P1 / EMEA-only for P2
  [x] P1 EUC Assets — source confirmed (Data\EUC_EOSL.xlsx), mapped
  [ ] P2 SDWAN Status — export from SNOW before first run
  [ ] P3 OT Activity — resolve 2 null state rows before first run; assigned_to now SDM per site (all populated)
  [ ] PYTHON EMEA IM SLA Response — confirm 2026 file covers full date range

================================================================================
VERIFIED & READY
================================================================================
  [x] O1 Incident Aging — mapped, SLA join defined
  [x] O2 SCT Catalogue Request Aging — mapped
  [x] O3 No Movement — source file confirmed, mapped, SNOW filter documented
  [x] O5 Problems No RCA — source file confirmed, root_cause field confirmed
  [x] P1 EUC Assets — source confirmed (Data\EUC_EOSL.xlsx), eosl_date parsed from Action to take
  [⚠] P3 OT Activity — EMEA filtered (28 rows), P3 Reference split done, assigned_to = SDM per site ✅ — 2 null state rows to resolve
