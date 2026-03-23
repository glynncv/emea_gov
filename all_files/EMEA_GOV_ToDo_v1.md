# EMEA Governance Cockpit 2026 — To Do List
*Owner:* EMEA SDM (Colman)
*Updated:* 09 March 2026
*Status:* Active

---

## 🚨 Immediate (This Week)

- [ ] **MSP stable state threshold — confirm in writing by 10 March**
      Owner: EMEA SDM + MSP/Infrastructure owner
      Risk: WATCH active. 3 weeks to 31 Mar deadline. Escalation triggers if missed today.

- [ ] **Repeat MI (Metric 5) — BREACHED — escalate today**
      Warwick: IBM CloudPakforIntegration — no Problem record. OPS-T9 triggered.
      Iasi: 2 CIs in Watch band. OPS-T8 triggered.
      Do not hold for weekly cycle — same-day escalation per trigger rules.

- [ ] **Problems Without RCA (Metric 6) — BREACHED — escalate this week**
      151 open problems without RCA. 144 in breach band (60+ days).
      Escalate to IT Ops Managers per site grouping.

- [ ] **EUC — clear the 20 overdue devices (Oct 2025 target)**
      Owner: EUC owner / site leads (Iasi, Izmir highest burden)
      Risk: Already past target date. Should be in flight or escalated now.

---

## 🏗️ Cockpit — Next Build Actions

- [ ] **Run Build Pack Prompt 12 in Claude Excel Add-In**
      Redesigns Enterprise_Panel with full 14-programme three-tier structure:
      Owned (4 rows + physics sub-rows) · Contributory (4 rows) · Monitor (6 rows)
      Also unhides Physics_Engine sheet permanently
      File: EMEA_Governance_Cockpit_2026_CopilotBuildPack_v1.md

- [ ] **Fix Operations_Panel — Site Scope column says "All 7 EMEA sites"**
      Should read "All 24 active EMEA sites" in all metric rows
      Fix via Claude Excel Add-In

- [ ] **Fix Physics_Engine Block 1 — duplicate zero column**
      Correct values present but zeros written to adjacent column
      Fix via Claude Code — recalibrate update_physics_block1() cell references

---

## ⚙️ Automation — Remaining Steps

- [x] Prompt 1 — Environment setup ✅
- [x] Prompt 2 — Dry-run flag ✅
- [x] Prompt 3 — Cell reference calibration ✅
- [x] Prompt 7 — Error handling and logging ✅
- [x] Prompt 8 — Windows Task Scheduler ✅
- [x] Prompt 11 — EUC / EOSL Physics Block 1 wired ✅
- [ ] **Prompt 6 — First live write to cockpit**
      Run after Prompt 12 (Enterprise_Panel redesign) is complete
      Backup cockpit first. Ensure file is closed.
      Command: python emea_gov_refresh.py
- [ ] **Prompt 11 Step 6 — Enterprise_Panel physics summary write-back**
      Requires Prompt 12 (Add-In) to create physics sub-rows first

      Tool: Claude Code (terminal)
      File: EMEA_Cockpit_ClaudeCode_PromptPack_v1.md

---

## 🔧 SNOW Issues — Require Resolution

- [ ] **Metric 2 (Catalogue Aging) — structural data gap**
      Root cause: sc_task does not populate location.u_site_name in PHINIA SNOW
      Options: (a) alternative field in sc_task, (b) retire Metric 2, (c) different SNOW table
      Action: Raise with SNOW admin. Do not treat "No data" as GREEN.

- [ ] **Incident Aging (Metric 1) — 6.3% — well below 90% target**
      208 of 3,284 incidents aged 10 days or less. OPS-T1 Watch active.
      No Movement (Metric 4): 2,901 stale. Blois (1,008), Iasi (413), Gillingham (392).
      Action: Notify escalation owners per trigger rules.

- [ ] **Dubai, Istanbul, Warsaw (Delphi Academy) — monitor for data**
      Correct SNOW names confirmed. Currently no open incidents.
      Action: Sanity check with site IT Ops Managers if still zero next week.

---

## 📋 Data Gaps to Close

- [ ] **SDWAN — confirm total EMEA site count for deployment**
      Needed for: Physics Block 2 required burn
      Also confirm: SNOW Change module vs project tracker as source

- [ ] **SDWAN — confirm named accountable owner**

- [ ] **OT Risk Remediation — confirm per-site status, funding, and top 10 site list**
      Needed for: Physics Block 3 milestone integrity model

- [ ] **OT Risk Remediation — confirm named accountable owner per site**

- [ ] **EUC — confirm named accountable owner**

- [ ] **MSP — confirm named accountable owner**

- [ ] **Amal (Site 20036) — confirm BRM pairing or alternative coverage**
      Owner: Proyer, Damon
      Needed for: Metric 8 (BRM Cadence)

---

## 📊 Operations Panel — Manual Items (Metrics 7–9)

- [ ] **Metric 7 — Site Health: confirm Q1 2026 update status for all 24 sites**
      Source: Infrastructure Site Health register
      Watch trigger: any site not updated by end of week 8 of quarter

- [ ] **Metric 8 — BRM Cadence: confirm meeting compliance for all active pairings**
      Source: SDM calendar

- [ ] **Metric 9 — Site Visits: confirm Q1 2026 visit status for all 24 sites**
      Source: SDM calendar and visit log
      Watch trigger: any site not visited by end of week 10 of quarter

---

## ✅ Resolved — No Action Needed

- [x] EOSL scope confirmed — 220 devices (EUC_EOSL.xlsx from PBI)
- [x] EUC AR approved
- [x] EUC data source confirmed — PBI Excel, not SNOW CMDB
- [x] Required weekly burn — 4.7/week (Q4 adjusted from 1 Oct)
- [x] SNOW consolidated report spec finalised (v2)
- [x] SNOW field corrected — location.u_site_name (dot-walked, not u_site_name)
- [x] Claude Code environment — Python 3.13.5, all dependencies installed
- [x] Dry-run complete — all 6 metrics returning values
- [x] Cell references calibrated — Operations_Panel D/H/I, Physics rows 44-49, Block 1 B2-B7
- [x] Error handling, logging, Task Scheduler implemented
- [x] SSL bypass configured (SNOW_VERIFY_SSL=false)
- [x] Blonie (10381) closed — scope updated to 24 sites across all artefacts
- [x] Enterprise Register updated to v2 — all 14 programmes, three-tier structure
- [x] Artefact set finalised — 3 obsolete artefacts deleted
- [x] Three-tier governance model designed — Owned / Contributory / Monitor
- [x] Build Pack Prompt 12 written — ready to run in Excel Add-In
- [x] Claude Code Prompt Pack updated — Prompts 5 and 11 corrected

---

*Next actions (in order):*
*1) MSP threshold today*
*2) Repeat MI escalation today*
*3) Build Pack Prompt 12 in Excel Add-In*
*4) Fix Operations_Panel site scope text*
*5) Fix Physics_Engine Block 1 duplicate column*
*6) Claude Code Prompt 6 — first live run*
