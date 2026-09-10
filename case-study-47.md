# Case Study 47: Agentic CAP Subsidy Claims and Satellite Verification for a Hungarian Paying Agency

| Field | Value |
|---|---|
| Industry | Public Sector (Agriculture Administration) |
| Headquarters | Hungary (national), with EU Commission audit interfaces |
| Operating Region | Hungary |
| Regulatory Context | Common Agricultural Policy Strategic Plan Regulation · Area Monitoring System requirements · GDPR · EU AI Act · Copernicus data policy |

## Business Challenge
The agency pays €2 billion a year in CAP subsidies to 160,000 farmers. Claims are checked through sample on-the-spot inspections and a partially implemented area-monitoring system; error rates draw Commission financial corrections; farmers wait months for payments and struggle with complex eco-scheme rules. Staff cannot review every parcel every season.

## Transformation Objective
Deploy agents that verify every claimed parcel from satellite time-series, guide farmers through eligibility and eco-schemes, resolve discrepancies with farmers before payment, prioritise physical inspections, and produce audit evidence, with inspectors and legal officers deciding sanctions.

## Agentic Architecture Brief

| Agent | Owns end-to-end | Autonomy level |
|---|---|---|
| Parcel Monitoring Agent | Classifies crop and activity per parcel from Sentinel imagery | L4 – autonomous |
| Farmer Guidance Agent | Explains rules, pre-checks claims, requests geo-tagged photos | L3 – acts |
| Discrepancy Resolution Agent | Contacts farmers on flags; accepts evidence within rules | L3 – acts, escalates disputes |
| Inspection Prioritisation Agent | Risk-targets physical inspections | L2 – recommend |
| Audit Evidence Agent | Compiles Commission audit packs | L4 – autonomous drafts |

**Orchestration:** Seasonal monitoring pipeline; farmer-facing agent in the national portal; discrepancy loop before payment; inspectors and legal staff hold sanction decisions.

**Governance, safety and evaluation:** Administrative-law rights of farmers (right to be heard); explainability of classifications; GDPR; sovereignty of national data; Commission-auditable models.

## Expected Outcomes
Error rate and financial corrections reduced, payments 2 months earlier, inspection cost down 40%, and farmer satisfaction up.

## Why Now (2026–2028)
The CAP Area Monitoring System is mandatory and since 1 January 2025 eligibility conditions must be monitorable via Sentinel data or geo-tagged photos; Commission financial corrections continue to hit national budgets.

## Business Case
**Commission financial corrections come straight out of the national budget; full-coverage verification is cheaper than the penalties.**

Value at stake: Commission financial corrections have cost the national budget EUR 60 million in three years; full-coverage verification eliminates most of that, and payments two months earlier improve farm liquidity. Cost of inaction: sample-based inspection cannot meet monitoring requirements, and farmer complaints about delays are politically visible. Executive sponsor: President of the paying agency, with the Ministry of Agriculture. Success measures: error rate and corrections, payment timeliness, inspection cost, and farmer satisfaction.

## Source
Original scanned image: [`case-study-47.jpg`](./case-study-47.jpg)
