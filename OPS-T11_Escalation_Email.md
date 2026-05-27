# ESCALATION: Problems Without RCA — OPS-T11 Recovery

**To:** IT Helpdesk / Problem Management  
**From:** IT Ops Managers (Proyer / Cazan / Gauthier / S K / Glynn)  
**Date:** 21 May 2026  
**Severity:** Medium  
**Status:** Open — Recovery Commitment Requested  
**Rule:** OPS-T11 — Threshold — Age Band (60+ days)

---

## IMPACT

| Dimension | Details |
|-----------|---------|
| **Threshold Breach** | 4 open EMEA problems with RCA required but no root cause documented |
| **Age Band Split** | 1 WATCH (30–60 days) · 3 BREACH (60+ days) |
| **Target** | 0 problems aged >30 days without RCA |
| **SLA Status** | **BREACHED** — any problem aged >60 days without RCA triggers breach |
| **Operational Risk** | Repeat incidents likely without documented root cause; governance compliance gap |

---

## ISSUE DESCRIPTION

The EMEA Operations cockpit metric **Problems Without RCA** is in **BREACHED** status. These are open ServiceNow problem records where `u_rca_required = Yes`, the `u_root_cause` field is blank, and the problem has been open for more than 30 days.

Three of the four records have exceeded the 60-day breach threshold. Without a documented root cause, underlying issues may recur and linked incidents cannot be properly closed out.

---

## PROBLEM DETAIL (4 records)

### BREACH band — 60+ days (3)

| Problem | Site | Age | State | Description |
|---------|------|-----|-------|-------------|
| **PRB0051007** | Bucharest - Romania | 199 days | Service Restored | P2 - Issues with ZSCALER and AD |
| **PRB0051017** | Krakow - Poland | 189 days | Root Cause Analysis | P2-Internet issue in Krakow GBS 10682 - urgent |
| **PRB0051057** | Gillingham - United Kingdom | 103 days | Root Cause Analysis | Issue with ClearCase replication that keeps on recurring affecting multiple sites such as Gillingham, TCI TCIz |

### WATCH band — 30–60 days (1)

| Problem | Site | Age | State | Description |
|---------|------|-----|-------|-------------|
| **PRB0051104** | Izmir - Turkey / ESBAS 2 (PT Phase 1) | 42 days | Root Cause Analysis | P2- Getting error while sending e-delivery note to TRA |

---

## SITE BREAKDOWN

| Site | Count | Oldest |
|------|-------|--------|
| Bucharest - Romania | 1 | PRB0051007 (199d) |
| Krakow - Poland | 1 | PRB0051017 (189d) |
| Gillingham - United Kingdom | 1 | PRB0051057 (103d) |
| Izmir - Turkey / ESBAS 2 (PT Phase 1) | 1 | PRB0051104 (42d) |

---

## WHAT'S NEEDED

For each problem record, IT Helpdesk / Problem Management to confirm:

1. **Named accountable owner** for RCA completion
2. **Root cause documentation** — populate `u_root_cause` and `u_root_cause_category` in ServiceNow
3. **Committed completion date** for any remaining remediation
4. **Status update** if problem should be closed (e.g. PRB0051007 already in "Service Restored" but RCA still blank)

**Priority order:** Address the 3 breach-band problems first (PRB0051007, PRB0051017, PRB0051057).

---

## RECOVERY COMMITMENT (OPS-T11 standard)

If unresolved by next weekly governance run (**26 May 2026**), escalation advances to EMEA IT Director with formal recovery plan demand.

Recovery commitment required per problem:
1. Accountable owner (named individual)
2. Committed RCA completion date
3. Remediation / prevention actions
4. Next checkpoint date

---

## SUPPORTING DATA

**Attached:** `problems_no_rca_emea.csv` — full listing with age, site, state, and description.

---

## NEXT STEPS

1. **Acknowledge receipt** — confirm ownership for RCA completion
2. **Triage breach-band problems** — PRB0051007, PRB0051017, PRB0051057 within 2 business days
3. **Update ServiceNow** — populate root cause fields or provide reason for delay
4. **Weekly status** until metric returns to GREEN (0 aged >30 days without RCA)

---

**Contact for questions:**  
IT Ops Managers — Proyer / Cazan / Gauthier / S K / Glynn
