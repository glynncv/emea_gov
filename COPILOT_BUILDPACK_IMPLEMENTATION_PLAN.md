# EMEA Governance Cockpit 2026 — Copilot Build Pack Implementation Plan

**Source Document:** `EMEA_Governance_Cockpit_2026_CopilotBuildPack_v1.md`
**Date:** 2026-03-09
**Status:** Planning Phase

---

## Executive Summary

The Copilot Build Pack defines a comprehensive **4-sheet Excel governance cockpit** covering:
1. **Enterprise_Panel:** 14 programmes across 3 tiers (Owned Core, Contributory, Monitor)
2. **Operations_Panel:** 9 EMEA site flow metrics
3. **Trigger_Log:** Escalation audit trail
4. **Physics_Engine:** Burn rate calculations and projections

**Current State:**
- Python automation script (`emea_gov_refresh.py`) is production-ready
- Script updates **Operations_Panel metrics** (6 of 9 metrics)
- Excel workbook exists but sheet structure unknown

**Gap Analysis Required:**
- Audit current workbook against build pack specifications
- Identify missing sheets, sections, or formulas
- Determine which metrics require new ServiceNow queries

---

## Implementation Plan Overview

### Phase 1: Audit Current Workbook (IMMEDIATE)
**Objective:** Compare current Excel structure against build pack requirements

**Tasks:**
1. Open `EMEA_Governance_Cockpit_2026.xlsx` and document current sheet structure
2. Check for presence of all 4 required sheets
3. Map existing cell references in Python script to build pack specifications
4. Identify gaps in:
   - Sheet structure
   - Column headers
   - Conditional formatting
   - Formula blocks in Physics_Engine

**Deliverable:** Gap analysis report

---

### Phase 2: Workbook Structure Compliance (QUICK WIN)
**Objective:** Ensure all 4 sheets exist and are correctly formatted

**Build Pack Prompts to Execute:**
- **Prompt 1:** Scaffold Workbook (4 sheets with base formatting)
- **Prompt 4:** Trigger_Log setup
- **Prompt 5:** Physics_Engine blocks
- **Prompt 6:** Conditional formatting

**Tasks:**
1. Create/verify sheet structure:
   - Enterprise_Panel (visible)
   - Operations_Panel (visible)
   - Trigger_Log (visible)
   - Physics_Engine (visible)

2. Apply base formatting rules:
   - Header row: dark navy (#1F3864), white bold, 11pt Calibri
   - Alternating rows: white and light grey (#F2F2F2)
   - Freeze top row on all sheets
   - Auto-fit columns

**Deliverable:** Compliant 4-sheet workbook structure

---

### Phase 3: Enterprise_Panel Setup (COMPLEX - MANUAL/COPILOT)
**Objective:** Build 3-tier programme governance view

**Build Pack Prompts:**
- **Prompt 2:** Enterprise_Panel initial structure
- **Prompt 12:** Full 14-programme redesign (use this if panel already exists)

**Structure:**

#### SECTION 1: OWNED CORE (4 programmes)
1. **MSP Maturation** (Stability Thresholds)
   - Target: 31-Mar-2026
   - Trigger: WATCH - threshold definition pending
   - Physics: None yet defined

2. **Legacy Network / SDWAN** (Required Burn)
   - Target: 30-Jun-2026 (SDWAN) / 30-Sep-2026 (Guest)
   - Physics Block: Block 2 in Physics_Engine
   - Requires: EMEA site count from SNOW

3. **EUC / Tech Refresh** (Required Burn)
   - Target: 31-Dec-2026
   - Physics Block: Block 1 in Physics_Engine (ALREADY BUILT!)
   - Current: 220 devices, 200 remaining, 4.7/week burn
   - Status: WATCH - 20 overdue

4. **OT Risk Remediation** (Milestone Integrity)
   - Target: 31-Dec-2026
   - Physics Block: Block 3 in Physics_Engine
   - Requires: Per-site milestone data from SNOW

#### SECTION 2: CONTRIBUTORY (4 programmes)
5. SAP Infrastructure (dependency: EMEA site readiness by 30-Apr-2026)
6. DC Consolidation Amsterdam (dependency: SDWAN Amsterdam by 31-May-2026)
7. OT Layer 2 Segmentation (dependency: Change window coordination by 31-Oct-2026)
8. Acquisition Integration (dormant - not triggered)

#### SECTION 3: MONITOR (6 programmes)
9. DR Tier 1
10. Azure Cloud Consolidation (HIGH risk - cascades to 3 Owned programmes)
11. Vulnerability Remediation
12. One PHINIA ID
13. Observability
14. CMDB North Star

**Tasks:**
1. Use Prompt 12 to build full 14-programme panel
2. Create physics sub-rows with formula links to Physics_Engine
3. Apply conditional formatting (Trigger Status, Escalation Required)
4. Manually populate initial values for programmes 1, 2, 4-14
5. Link programme 3 (EUC) to existing Python automation

**Deliverable:** Complete Enterprise_Panel with all 14 programmes

---

### Phase 4: Operations_Panel Compliance (EXTEND CURRENT)
**Objective:** Expand from 6 metrics to 9 metrics

**Build Pack Prompt:**
- **Prompt 3:** Operations_Panel full specification

**Current Python Script Coverage:**
1. ✓ Incident Aging (10 days or less)
2. ✓ Catalogue Aging (30 days or less)
3. ✓ SLA x2 (aged incidents > SLA x2)
4. ✓ No Movement (14+ days)
5. ✓ Repeat MIs (same CI/site within 30 days)
6. ✓ Problems Without RCA (30+ days)

**Missing from Python Script:**
7. **Site Health** - Quarterly Update Compliance (7 of 7 sites)
   - Data source: Manual tracking or SNOW custom field
   - Trigger: OPS-T12/T13 (not updated by week 8 = WATCH / by quarter end = BREACH)

8. **BRM Cadence** - SDM-BRM Meeting Cadence (no gap over 2 weeks)
   - Data source: Manual calendar tracking or Outlook integration
   - Trigger: OPS-T14/T15 (gap over 2 weeks = WATCH / over 4 weeks = BREACH)

9. **Site Visits** - Quarterly Compliance (7 of 7 sites)
   - Data source: Manual tracking or travel records
   - Trigger: OPS-T16/T17 (not visited by week 10 = WATCH / by quarter end = BREACH)

**Site Scope Update:**
- Build pack specifies **24 physical sites** (current script uses 25)
- **Blonie (10381) removed** - site closed 08 Mar 2026
- Update `EMEA_SITES` list in Python script

**Tasks:**
1. Update EMEA_SITES list in `emea_gov_refresh.py` (remove Blonie)
2. Add Site Health tracking (manual or SNOW integration)
3. Add BRM Cadence tracking (manual or calendar integration)
4. Add Site Visits tracking (manual or travel system integration)
5. Update Operations_Panel with all 9 metrics
6. Add section headers: "Incident and Request Aging", "Stagnation Signals", "Stability Signals", "SDM Accountability Cadence"

**Deliverable:** Complete Operations_Panel with 9 metrics

---

### Phase 5: Physics_Engine Blocks (PARTIALLY COMPLETE)
**Objective:** Build 4 calculation blocks for burn rate physics

**Build Pack Prompt:**
- **Prompt 5:** Physics_Engine specification

**Block Status:**

#### BLOCK 1: EUC Tech Refresh Burn Physics ✓ COMPLETE
- Already built and integrated with Python script
- Inputs: Total units (220), Remediated to date (manual), Rolling 4W avg
- Calculates: Remaining, weeks to 31-Dec-2026, required burn, seasonal stress
- **Action:** Verify formulas match build pack specification

#### BLOCK 2: SDWAN Legacy Network Burn Physics ⏳ TO BUILD
- Inputs: Total EMEA sites, Sites completed, Rolling 4W avg
- Calculates: Sites remaining, weeks to 30-Jun-2026, required burn, projected completion
- **Data source:** SNOW query for SDWAN site deployment status
- **Action:** Create formulas + Python integration

#### BLOCK 3: OT Remediation Stagnation Tracker ⏳ TO BUILD
- Structure: One row per site
- Columns: Site Name, Last Activity Date, Days Since Activity, Funding Confirmed, Milestone Slips, Stagnation Flag, Status
- Calculates: Days since activity, stagnation flag (30d = STAGNANT, 14d = WATCH)
- **Data source:** SNOW query for OT remediation project updates
- **Action:** Create formulas + Python integration

#### BLOCK 4: Operations Trend Calculations ✓ LIKELY COMPLETE
- Structure: One row per metric
- Columns: Metric | Wk1 | Wk2 | Wk3 | Wk4 | 4W Average | Trend
- Metrics: Incident Aging %, Catalogue Aging %, SLA x2 Count, No Movement Count, Repeat MI Count, Problems Without RCA Count
- **Action:** Verify current Python script populates weekly trend data

**Tasks:**
1. Audit Block 1 formulas against build pack spec
2. Build Block 2 structure and formulas
3. Build Block 3 structure and formulas
4. Verify Block 4 structure and formulas
5. Apply yellow fill (#FFFF00) to all manual input cells
6. Test all formula calculations

**Deliverable:** Complete Physics_Engine with 4 working blocks

---

### Phase 6: Python Script Enhancements (EXTEND AUTOMATION)
**Objective:** Automate updates to all cockpit sections

**Current Script Capabilities:**
- ✓ Fetches 6 Operations_Panel metrics from SNOW
- ✓ Updates Physics_Engine Block 1 (EUC)
- ✓ Updates Operations_Panel current values
- ✓ Updates weekly trend data

**Required Enhancements:**

#### Enhancement 1: SDWAN Site Data (for Block 2)
**New Function:** `fetch_sdwan_sites()`
- Query: SNOW table for SDWAN deployment status per site
- Fields: site name, deployment status, completion date
- Filter: EMEA sites only
- Return: DataFrame with sites_completed count and rolling 4W average

**Integration Point:** Physics_Engine Block 2 (cells C3, C5)

#### Enhancement 2: OT Remediation Data (for Block 3)
**New Function:** `fetch_ot_remediation()`
- Query: SNOW table for OT remediation project updates
- Fields: site name, last_activity_date, funding_status, milestone_count
- Filter: EMEA sites only
- Return: DataFrame with per-site activity tracking

**Integration Point:** Physics_Engine Block 3 (rows per site)

#### Enhancement 3: Site List Update
**Task:** Update `EMEA_SITES` constant
- Remove: "Blonie - Poland" (site 10381, closed 08 Mar 2026)
- Verify: 24 sites remain active
- Update: Site filter logic in all fetch functions

#### Enhancement 4: Trigger Status Automation
**New Function:** `evaluate_trigger_rules()`
- Input: Current metric values, previous 4W averages
- Logic: Apply trigger rules OPS-T1 through OPS-T17
- Output: Trigger Status (GREEN/WATCH/BREACHED) and Escalation Required (YES/NO)

**Integration Point:** Operations_Panel columns H and I

#### Enhancement 5: Trigger Log Automation
**New Function:** `update_trigger_log()`
- Input: List of metrics at WATCH or BREACHED
- Action: Append new row to Trigger_Log sheet
- Columns: Trigger Date, Domain, Metric, Trigger Type, Threshold Breached, Status=Open
- Logic: Only create entry if not already logged as Open

**Integration Point:** Trigger_Log sheet (append new rows)

**Tasks:**
1. Add `fetch_sdwan_sites()` function
2. Add `fetch_ot_remediation()` function
3. Update `EMEA_SITES` constant (remove Blonie)
4. Create `evaluate_trigger_rules()` function
5. Create `update_trigger_log()` function
6. Update `main()` to call new functions
7. Test end-to-end automation

**Deliverable:** Enhanced Python script with full cockpit automation

---

### Phase 7: Trigger Log Implementation (NEW FEATURE)
**Objective:** Automated escalation audit trail

**Build Pack Prompt:**
- **Prompt 4:** Trigger_Log structure

**Structure:**
- Columns: Trigger Date | Domain | Programme/Metric | Trigger Type | Threshold Breached | Escalated To | Escalation Action | Status | Closure Date
- Conditional formatting: Open=red, Monitoring=amber, Closed=green
- Logic: Only create entries at point of breach (no pre-population)

**Automation Logic:**
1. Each refresh, evaluate all trigger rules
2. If metric transitions to WATCH or BREACHED:
   - Check if already logged as Open for this metric
   - If not, append new row with Status=Open
   - Populate: Trigger Date (TODAY), Domain, Metric, Trigger Type, Threshold
3. Manual fields: Escalated To, Escalation Action, Closure Date (SDM updates)

**Tasks:**
1. Create Trigger_Log sheet with correct structure
2. Apply conditional formatting (Status column)
3. Add italic text in A2: "Log entries created at point of trigger breach only"
4. Integrate with Python script `update_trigger_log()` function
5. Test breach detection and logging

**Deliverable:** Working Trigger_Log with automated entries

---

### Phase 8: Operational Prompts Integration (WORKFLOW)
**Objective:** Integrate Prompt 7 (weekly refresh) and Prompt 8 (breach escalation)

#### Prompt 7: Weekly Refresh Workflow
**Current State:** Python script handles most of this
**Manual Steps Required:**
- Update Physics_Engine Block 1: Units Remediated to Date (manual input)
- Update Physics_Engine Block 2: Sites Completed (from SDWAN query)
- Update Physics_Engine Block 3: Last Activity Date per site (from OT query)
- Seasonal stress test: Run within 4 weeks of 1 August

**Automation Enhancement:**
- Script can auto-populate SDWAN and OT data if queries are available
- Seasonal stress test: Add function to check if within 4 weeks of Aug 1, run EUC stress calculation
- Manual oversight: SDM reviews and confirms before saving

#### Prompt 8: Breach Escalation Draft
**Use Case:** When metric hits BREACHED status
**Action:** Generate escalation statement

**Template:**
```
Programme/Metric: [name]
Trigger Rule Breached: [rule ID and condition]
Current Value: [value]
Required Value: [value]
Projected Risk: [consequence]
Ask: [owner] to commit [completion date] with [throughput] and checkpoint [date]
```

**Integration Options:**
1. Python script generates draft text in console output when breach detected
2. Store breach statements in Trigger_Log Notes column
3. Email notification with draft text (future enhancement)

**Tasks:**
1. Create `generate_breach_escalation()` function
2. Add breach detection logic to weekly refresh
3. Output escalation draft to console or Trigger_Log
4. Test with current BREACHED metrics (Repeat MI, Problems Without RCA)

**Deliverable:** Automated breach escalation workflow

---

## Implementation Sequence

### IMMEDIATE (Week 1)
1. **Audit current workbook** - Phase 1
2. **Update EMEA_SITES list** (remove Blonie) - Phase 6
3. **Verify Operations_Panel structure** - Phase 4

### SHORT TERM (Weeks 2-3)
4. **Build/verify 4-sheet structure** - Phase 2
5. **Complete Physics_Engine Blocks 1 and 4** - Phase 5
6. **Create Trigger_Log sheet** - Phase 7

### MEDIUM TERM (Weeks 4-6)
7. **Build Enterprise_Panel** (Prompt 12) - Phase 3
8. **Add SDWAN and OT queries** - Phase 6
9. **Build Physics_Engine Blocks 2 and 3** - Phase 5
10. **Expand Operations_Panel to 9 metrics** - Phase 4

### LONG TERM (Weeks 7-8)
11. **Automate trigger rule evaluation** - Phase 6
12. **Automate Trigger_Log entries** - Phase 7
13. **Implement breach escalation workflow** - Phase 8
14. **End-to-end testing and validation**

---

## Data Source Requirements

### ServiceNow Queries Needed:

#### Currently Implemented:
1. ✓ Open Incidents (incident table)
2. ✓ Major Incident History (incident table, priority=1)
3. ✓ Catalogue Tasks (sc_task table)
4. ✓ Open Problems (problem table)

#### New Queries Required:
5. **SDWAN Site Deployment** - for Physics Block 2
   - Table: `cmdb_ci_network_adapter` or custom SDWAN deployment table
   - Fields: site, deployment_status, completion_date
   - Purpose: Track SDWAN rollout burn rate

6. **OT Remediation Projects** - for Physics Block 3
   - Table: `project` or `pm_project` (or custom OT table)
   - Fields: site, last_update_date, funding_status, milestone_count
   - Purpose: Track OT remediation stagnation

#### Manual Data Sources:
7. Site Health Updates - quarterly tracking (manual)
8. BRM Meeting Cadence - calendar tracking (manual)
9. Site Visits - travel records (manual)

---

## Critical Dependencies

### ServiceNow Access:
- ✓ REST API credentials (already configured)
- ✓ incident table read access (confirmed)
- ✓ problem table read access (confirmed)
- ⏳ SDWAN deployment table access (TBD)
- ⏳ OT remediation project table access (TBD)

### Excel Workbook Access:
- ✓ File path updated to OneDrive location
- ✓ Python script can read/write Excel (openpyxl)
- ⏳ Workbook structure compliance (audit required)

### Manual Processes:
- Physics_Engine Block 1: Units Remediated to Date (manual input weekly)
- Physics_Engine Block 2: Sites Completed (manual if SNOW query unavailable)
- Physics_Engine Block 3: Site activity dates (manual if SNOW query unavailable)
- Trigger_Log: Escalated To, Escalation Action, Closure Date (SDM manual updates)
- Operations_Panel metrics 7-9: Site Health, BRM Cadence, Site Visits (manual)

---

## Risk Assessment

### HIGH RISK:
1. **SDWAN and OT data source availability**
   - Mitigation: Confirm SNOW tables exist, fallback to manual entry if needed

2. **Enterprise_Panel complexity**
   - 14 programmes, 3 tiers, physics sub-rows with formulas
   - Mitigation: Use Prompt 12, test incrementally, validate all formula links

3. **Trigger rule automation accuracy**
   - 17 trigger rules (OPS-T1 through OPS-T17) with complex logic
   - Mitigation: Build unit tests, validate against known breach scenarios

### MEDIUM RISK:
4. **Manual data entry compliance**
   - Metrics 7-9 require manual weekly updates
   - Mitigation: Clear documentation, weekly checklist for SDM

5. **Workbook performance**
   - 4 sheets, 14 programmes, 9 metrics, weekly trend data
   - Mitigation: Test with full data load, optimize formulas, consider calculation mode

### LOW RISK:
6. **Backward compatibility**
   - Current Python script works, enhancements are additive
   - Mitigation: Maintain backward compatibility, test dry-run mode

---

## Success Criteria

### Phase Completion:
- ✓ All 4 sheets present and correctly formatted
- ✓ All 14 programmes visible on Enterprise_Panel
- ✓ All 9 metrics tracked on Operations_Panel
- ✓ All 4 Physics_Engine blocks functional
- ✓ Trigger_Log automatically captures breaches
- ✓ Python script updates all automatable sections
- ✓ Weekly refresh workflow documented

### Operational Validation:
- ✓ Run weekly refresh without errors
- ✓ All conditional formatting triggers correctly
- ✓ Physics formulas calculate accurately
- ✓ Trigger rules fire on correct thresholds
- ✓ Escalation Required flags set appropriately
- ✓ Breach escalation drafts generate correctly

---

## Next Steps

### Immediate Actions:
1. **Audit current workbook structure** (read Excel file and document sheets)
2. **Create gap analysis report** (current vs. build pack requirements)
3. **Update EMEA_SITES list** (remove Blonie site)
4. **Present findings and confirm implementation approach**

### Decision Points:
- Manual vs. automated approach for Enterprise_Panel setup (Prompt 12)?
- SDWAN and OT data sources - SNOW available or manual entry?
- Metrics 7-9 (Site Health, BRM, Visits) - automate or manual tracking?
- Trigger_Log - automated entries only or allow manual override?

---

**Document Version:** 1.0
**Last Updated:** 2026-03-09
**Next Review:** After workbook audit complete
**Owner:** EMEA SDM / Python Automation Team
