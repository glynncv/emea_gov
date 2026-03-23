# EMEA SDM — Operations Panel 2026
*Version:* v2
*Date:* 2026-03-03
*Owner:* EMEA SDM (Colman)
*Framework:* TFEM Consolidated Reference v1 — Section 7.2
*Scope:* All 24 active EMEA physical sites (excludes Azure cloud nodes, Amsterdam DC NEW, and Blonie — closed 08 Mar 2026)
*Domain:* Operations (flow governance — continuous, not programme-bounded)

---

## Panel Design Principles

- Metrics only. No ticket lists. No raw data tables.
- Every metric has a trigger rule. If it cannot trigger an escalation it does not belong on this panel.
- Trend matters as much as level. A metric moving in the wrong direction for two consecutive weeks is a governance signal regardless of whether it has breached a threshold.
- Site-level detail surfaces only when a site triggers a stagnation or breach rule. It is not standing panel content.
- Where multiple sites breach concurrently under the same IT Operations Manager, escalation goes to that manager — not to individual sites separately.

---

## EMEA Sites in Scope — 25 Physical Sites

| Site ID | Site Name | City | Country | IT Ops Manager | BRM |
|---|---|---|---|---|---|
| 10605 | Duesseldorf | Dusseldorf | Germany | S K, Arif | Skrzypczynski, Jacob |
| 10646 | Warwick (Titan) | Warwick | United Kingdom | Proyer, Damon | Skrzypczynski, Jacob |
| 00195 | Madrid | Madrid | Spain | S K, Arif | Skrzypczynski, Jacob |
| 00202 | Blois | Blois | France | Gauthier, Guillaume | Djilli, Azzeddine |
| 00232 | Cinisello | Cinisello Balsamo | Italy | Gauthier, Guillaume | Lenz, Christian |
| 00268 | Izmir ESBAS 3 (PT Phase 2) | Izmir | Turkey | Cazan, Anca | Tosundur, Murat |
| 00269 | Izmir ESBAS 2 (PT Phase 1) | Izmir | Turkey | Cazan, Anca | Tosundur, Murat |
| 00274 | Gillingham | Gillingham | United Kingdom | Proyer, Damon | Marshall, Daren |
| 00282 | Stonehouse | Stonehouse | United Kingdom | Proyer, Damon | Hill, Brian |
| 10304 | Iasi | Iasi | Romania | Cazan, Anca | Serbanuta, Florin-Rafael |
| 10657 | Bucharest | Bucharest | Romania | Cazan, Anca | Serkhoshian, Gary |
| 20030 | Rzeszow | Rzeszow | Poland | Cazan, Anca | Serbanuta, Florin-Rafael |
| 20011 | Dubai | Dubai | United Arab Emirates | S K, Arif | Skrzypczynski, Jacob |
| 20036 | Amal | Amal | Sweden | Proyer, Damon | — |
| 20027 | Istanbul | Istanbul | Turkey | Cazan, Anca | Tosundur, Murat |
| 10590 | Cergy | Cergy | France | Gauthier, Guillaume | Djilli, Azzeddine |
| 20035 | Warsaw (Delphi Academy) | Raszyn | Poland | Glynn, Colman | Skrzypczynski, Jacob |
| 20032 | Warsaw | Warsaw | Poland | S K, Arif | Skrzypczynski, Jacob |
| 20028 | Technical Center Krakow | Krakow | Poland | Glynn, Colman | Jaczynski, Piotr |
| 10682 | Krakow | Krakow | Poland | Glynn, Colman | Jaczynski, Piotr |
| 10415 | Hartridge | Buckingham | United Kingdom | Proyer, Damon | Skrzypczynski, Jacob |
| 20034 | Belval | Belval | Luxembourg | Gauthier, Guillaume | Serkhoshian, Gary |
| 20033 | Wroclaw | Wroclaw | Poland | S K, Arif | Lenz, Christian |
| 10381 | ~~Blonie~~ | Blonie | Poland | — | — | CLOSED 08 Mar 2026 |
| 10610 | Warwick | Warwick | United Kingdom | Proyer, Damon | Skrzypczynski, Jacob |

**IT Operations Manager groupings:**
- Glynn, Colman: Warsaw (Delphi Academy) · Technical Center Krakow · Krakow — 3 sites (Blonie closed 08 Mar 2026)
- Proyer, Damon: Warwick (Titan) · Gillingham · Stonehouse · Hartridge · Amal · Warwick — 6 sites
- Cazan, Anca: Izmir ESBAS 3 · Izmir ESBAS 2 · Iasi · Bucharest · Rzeszow · Istanbul — 6 sites
- Gauthier, Guillaume: Blois · Cinisello · Cergy · Belval — 4 sites
- S K, Arif: Duesseldorf · Madrid · Dubai · Warsaw · Wroclaw — 5 sites

---

## Operations Metrics — Full Panel

---

### Metric 1: Open Incident Aging — No Incident Older Than 10 Days

| Field | Value |
|---|---|
| **Metric** | % of open incidents at all 25 EMEA sites that are 10 days old or fewer |
| **Target** | 90% adherence |
| **Source** | SNOW — filtered to EMEA site assignment groups (all 24 active site IDs) |
| **Current Value** | [Refresh] |
| **Previous 4W Average** | [Refresh] |
| **4W Trend** | [Refresh] |
| **Trigger Rule** | OPS-T1: adherence below 90% for 1 week → Watch / OPS-T2: below 90% for 2 consecutive weeks → Breached |
| **Trigger Status** | PENDING — data required |

**Governance note:** Declared 2026 objective (90% by 31 Dec). Tracked as flow metric weekly and as year-end commitment. On breach, identify the specific site and escalate to its IT Operations Manager — not to individuals. Concurrent breach across multiple sites under one manager triggers a single escalation to that manager.

---

### Metric 2: Open Catalogue Request Aging — No Request Older Than 30 Days

| Field | Value |
|---|---|
| **Metric** | % of open catalogue requests at all 25 EMEA sites that are 30 days old or fewer |
| **Target** | 90% adherence |
| **Source** | SNOW — filtered to all 25 EMEA site assignment groups |
| **Current Value** | [Refresh] |
| **Previous 4W Average** | [Refresh] |
| **4W Trend** | [Refresh] |
| **Trigger Rule** | OPS-T3: adherence below 90% for 2 consecutive weeks → Breached |
| **Trigger Status** | PENDING — data required |

**Governance note:** A single week breach is a Watch. Distinguish between requests with no activity and requests awaiting a dependency — different escalation owners. Breach escalation goes to the IT Operations Manager for the breaching site(s).

---

### Metric 3: Aged Incidents > SLA × 2

| Field | Value |
|---|---|
| **Metric** | Count of open incidents at all 25 EMEA sites that have exceeded twice their SLA target |
| **Target** | Trend declining week-on-week. Zero tolerance for P1/P2 in this band |
| **Source** | SNOW — all 25 EMEA sites, segmented by priority |
| **Current Value** | [Refresh] |
| **Previous 4W Average** | [Refresh] |
| **4W Trend** | [Refresh] |
| **Trigger Rule** | OPS-T4: any P1/P2 in SLA×2 band → immediate escalation / OPS-T5: P3/P4 count increases 2 consecutive weeks → Breached |
| **Trigger Status** | PENDING — data required |

**Governance note:** SLA×2 is the governance visibility threshold — not the SLA breach point. Governance tracks whether the tail is shrinking or growing across the 25-site estate. Site and IT Operations Manager identified at breach.

---

### Metric 4: Tickets With No Movement — 14+ Days

| Field | Value |
|---|---|
| **Metric** | Count of open tickets (incidents and requests) at all 25 EMEA sites with no update or activity for 14 or more days |
| **Target** | Zero |
| **Source** | SNOW — last updated date filter, all 25 EMEA site IDs |
| **Current Value** | [Refresh] |
| **Previous 4W Average** | [Refresh] |
| **4W Trend** | [Refresh] |
| **Trigger Rule** | OPS-T6: count above zero → Watch / OPS-T7: count increasing for 2 consecutive weeks → Breached |
| **Trigger Status** | PENDING — data required |

**Governance note:** No-movement tickets are the clearest stagnation signal in the Operations domain. Each no-movement ticket at breach requires an owner, a date, and a blocker identified — not a chase. Escalation to IT Operations Manager for the site(s) contributing the most no-movement volume.

---

### Metric 5: Repeat Major Incidents — Same CI or Site (30-Day Window)

| Field | Value |
|---|---|
| **Metric** | Count of Major Incidents at any of the 25 EMEA sites where the same CI or site has had a second MI within 30 days |
| **Target** | Zero repeat MIs without a confirmed Problem record |
| **Source** | SNOW — MI records, all 25 EMEA sites, linked Problem record check |
| **Current Value** | [Refresh] |
| **Previous 4W Average** | [Refresh] |
| **4W Trend** | [Refresh] |
| **Trigger Rule** | OPS-T8: repeat MI without linked Problem → Watch same day / OPS-T9: second repeat MI without RCA → Breached same day |
| **Trigger Status** | PENDING — data required |

**Governance note:** Repeat MIs without a Problem record are the primary signal of reactive-only operations. Most likely to surface in high-activity manufacturing sites. Escalate immediately to IT Operations Manager for the affected site — do not hold for weekly cycle.

---

### Metric 6: Problems Without RCA — Open > 30 Days

| Field | Value |
|---|---|
| **Metric** | Count of open Problem records linked to any of the 25 EMEA sites where no RCA has been completed and the Problem is older than 30 days |
| **Target** | Zero |
| **Source** | SNOW — Problem module, all 25 EMEA site IDs, age and RCA status filter |
| **Current Value** | [Refresh] |
| **Previous 4W Average** | [Refresh] |
| **4W Trend** | [Refresh] |
| **Trigger Rule** | OPS-T10: any Problem over 30 days without RCA → Watch / OPS-T11: any Problem over 60 days without RCA → Breached |
| **Trigger Status** | PENDING — data required |

**Governance note:** Review Metrics 5 and 6 together. A site appearing in both is operating in a structurally unstable state — single escalation combining both signals to the IT Operations Manager for that site.

---

### Metric 7: EMEA Site Health — Quarterly Update Compliance

| Field | Value |
|---|---|
| **Metric** | Count of the 25 EMEA sites with Infrastructure Site Health record updated within the current quarter |
| **Target** | 24 of 24 per quarter |
| **Source** | Infrastructure Site Health register |
| **Current Value** | [Q1 confirm] |
| **Previous Quarter** | [Confirm] |
| **Trend** | [Confirm] |
| **Trigger Rule** | OPS-T12: any site not updated by end of week 8 of quarter → Watch / OPS-T13: any site not updated by end of quarter → Breached |
| **Trigger Status** | PENDING — Q1 status required |

**Governance note:** Declared 2026 objective. Track by site name and IT Operations Manager grouping — a manager with multiple sites not updated is a single escalation. 24 sites makes this a materially heavier compliance burden than previously assumed.

---

### Metric 8: SDM–BRM Cadence — Bi-Weekly Meeting Compliance

| Field | Value |
|---|---|
| **Metric** | Confirmation that bi-weekly SDM–BRM meetings have occurred across all active EMEA BRM pairings in the current period |
| **Target** | 100% — no gap over 2 weeks per pairing |
| **Source** | Calendar and meeting records |
| **Current Value** | [Confirm] |
| **Trend** | [Confirm] |
| **Trigger Rule** | OPS-T14: any pairing with gap over 2 weeks → Watch / OPS-T15: any pairing with gap over 4 weeks → Breached |
| **Trigger Status** | PENDING |

**Governance note:** Amal (20036) has no BRM listed — confirm whether an SDM–BRM pairing exists or whether this site is covered under a different mechanism. This is the only site in the 25 without a named BRM.

---

### Metric 9: SDM Site Visit — Quarterly Compliance

| Field | Value |
|---|---|
| **Metric** | Count of the 25 EMEA sites with at least one SDM site visit completed in the current quarter |
| **Target** | 24 of 24 per quarter |
| **Source** | SDM calendar and visit log |
| **Current Value** | [Q1 confirm] |
| **Trend** | [Confirm] |
| **Trigger Rule** | OPS-T16: any site not visited by end of week 10 of quarter → Watch / OPS-T17: any site not visited by end of quarter → Breached |
| **Trigger Status** | PENDING — Q1 visit status required |

**Governance note:** 24 sites across 5 IT Operations Managers and multiple countries. Quarterly visit compliance for the full estate requires forward scheduling. A site not visited in a quarter is a governance blind spot — track by site name and manager grouping.

---

## Operations Trigger Rule Summary

| Rule ID | Metric | Condition | Status |
|---|---|---|---|
| OPS-T1 | Incident Aging | Adherence below 90% for 1 week | Watch |
| OPS-T2 | Incident Aging | Adherence below 90% for 2 consecutive weeks | Breached |
| OPS-T3 | Catalogue Aging | Adherence below 90% for 2 consecutive weeks | Breached |
| OPS-T4 | SLA×2 — P1/P2 | Any P1/P2 in SLA×2 band | Immediate escalation |
| OPS-T5 | SLA×2 — P3/P4 | Count increases 2 consecutive weeks | Breached |
| OPS-T6 | No Movement | Count above zero | Watch |
| OPS-T7 | No Movement | Count increasing 2 consecutive weeks | Breached |
| OPS-T8 | Repeat MI | Repeat MI without linked Problem record | Watch — same day |
| OPS-T9 | Repeat MI | Second repeat MI without RCA | Breached — same day |
| OPS-T10 | Problems without RCA | Open over 30 days | Watch |
| OPS-T11 | Problems without RCA | Open over 60 days | Breached |
| OPS-T12 | Site Health | Any site not updated by end of week 8 of quarter | Watch |
| OPS-T13 | Site Health | Any site not updated by end of quarter | Breached |
| OPS-T14 | BRM Cadence | Any pairing gap over 2 weeks | Watch |
| OPS-T15 | BRM Cadence | Any pairing gap over 4 weeks | Breached |
| OPS-T16 | Site Visit | Any site not visited by end of week 10 of quarter | Watch |
| OPS-T17 | Site Visit | Any site not visited by end of quarter | Breached |

---

## What NOT to Track on This Panel

- **Raw ticket lists or ticket detail** — SNOW execution data; not governance signal
- **Individual resolver group performance** — surface only when SLA×2 or no-movement trigger is breached
- **IT NPS scores** — outcome metric; separate reporting domain
- **Individual user complaints or service requests** — operational noise; not governance altitude
- **Programme delivery metrics** — Enterprise Panel domain; must not bleed into Operations Panel
- **Non-EMEA site metrics** — out of scope

---

## First Refresh Requirements

| Item | Source | Required By |
|---|---|---|
| Open incident count and aging — all 24 active sites | SNOW export filtered to 25 EMEA site IDs | First weekly refresh |
| Open catalogue request aging — all 24 active sites | SNOW export filtered to 25 EMEA site IDs | First weekly refresh |
| SLA×2 count by priority — all 24 active sites | SNOW export filtered to 25 EMEA site IDs | First weekly refresh |
| No-movement ticket count — all 24 active sites | SNOW export filtered to 25 EMEA site IDs | First weekly refresh |
| Repeat MI count with Problem linkage check | SNOW export filtered to 25 EMEA site IDs | First weekly refresh |
| Open Problems without RCA — all 24 active sites | SNOW export filtered to 25 EMEA site IDs | First weekly refresh |
| Site Health update status Q1 2026 — all 24 active sites | Infrastructure Site Health register | Immediate |
| BRM meeting compliance — all active pairings | SDM calendar | Immediate |
| Amal BRM pairing status | Confirm with Proyer, Damon | Immediate |
| Site visit log Q1 2026 — all 24 active sites | SDM calendar | Immediate |

---

*End of EMEA SDM Operations Panel 2026 v2.*
