# Case Study 47 — Understanding the Case
### Agentic CAP Subsidy Claims and Satellite Verification for a Hungarian Paying Agency

---

## Slide 1 — Who & Where
- **Industry**: Public Sector — Agriculture Administration
- **Organisation**: Hungary's national CAP paying agency (Magyar Államkincstár)
- **Headquarters**: Hungary (national), with EU Commission audit interfaces
- **Operating Region**: Hungary
- **Regulatory Context**: CAP Strategic Plan Regulation · Area Monitoring System requirements · GDPR · EU AI Act · Copernicus data policy

---

## Slide 2 — The Business Challenge
- The agency pays **€2 billion/year** in CAP subsidies to **160,000 farmers**.
- Claims are checked via **sample on-the-spot inspections** + a **partially implemented Area Monitoring System**.
- Consequences of the current state:
  - Error rates draw **Commission financial corrections**.
  - Farmers **wait months** for payments.
  - Staff **cannot review every parcel every season** — coverage gap.
  - Complex eco-scheme rules are hard for farmers to navigate unaided.

---

## Slide 3 — Transformation Objective
Deploy agents that:
1. Verify **every** claimed parcel using satellite time-series (not just a sample).
2. Guide farmers through eligibility and eco-schemes.
3. Resolve discrepancies with farmers **before** payment.
4. Prioritise physical inspections using risk-targeting.
5. Produce audit evidence — with **inspectors and legal officers retaining sanction decisions**.

---

## Slide 4 — Agentic Architecture Brief

| Agent | Owns end-to-end | Autonomy level |
|---|---|---|
| Parcel Monitoring Agent | Classifies crop and activity per parcel from Sentinel imagery | L4 – autonomous |
| Farmer Guidance Agent | Explains rules, pre-checks claims, requests geo-tagged photos | L3 – acts |
| Discrepancy Resolution Agent | Contacts farmers on flags; accepts evidence within rules | L3 – acts, escalates disputes |
| Inspection Prioritisation Agent | Risk-targets physical inspections | L2 – recommend |
| Audit Evidence Agent | Compiles Commission audit packs | L4 – autonomous drafts |

**Orchestration**: Seasonal monitoring pipeline → farmer-facing agent in the national portal → discrepancy loop before payment → inspectors/legal staff hold sanction decisions.

---

## Slide 5 — Governance, Safety & Evaluation
- **Administrative-law rights of farmers**: right to be heard (EU Charter Art. 41) before any adverse measure.
- **Explainability**: classifications made by AI (crop/activity) must be explainable to farmers and auditors.
- **Commission-auditable models**: models/decisions must be traceable for EU Commission audit.
- **GDPR**: personal/farm data protection across the whole pipeline.
- **Data sovereignty**: national data must remain under Hungarian/EU jurisdiction and control.

---

## Slide 6 — Expected Outcomes
| Metric | Target Direction |
|---|---|
| Error rate & financial corrections | ↓ Reduced |
| Payment timeliness | 2 months earlier |
| Inspection cost | ↓ 40% |
| Farmer satisfaction | ↑ Increased |

---

## Slide 7 — Why Now (2026–2028)
- CAP Area Monitoring System (AMS) is **mandatory**.
- Since **1 January 2025**, any eligibility condition monitorable via Sentinel data or geo-tagged photos must be treated as "monitorable" under CAP rules — no more excuses for sample-based checking.
- Commission financial corrections continue to hit the national budget every year the system isn't fully compliant.

---

## Slide 8 — The Business Case
> "Commission financial corrections come straight out of the national budget; full-coverage verification is cheaper than the penalties."

- **Value at stake**: Commission financial corrections cost the national budget **€60 million over three years**. Full-coverage verification eliminates most of that.
- **Farmer liquidity benefit**: payments 2 months earlier improve farm cash flow.
- **Cost of inaction**: sample-based inspection can't meet monitoring requirements; delayed payments and complaints are politically visible.
- **Executive sponsor**: President of the paying agency, with the Ministry of Agriculture.
- **Success measures**: error rate & corrections, payment timeliness, inspection cost, farmer satisfaction.

---

## Slide 9 — Key Takeaways for Solution Design
- This is a **regulatory-compliance-driven, not discretionary, transformation** — AMS is mandatory law, not a nice-to-have.
- The system must balance **autonomy for efficiency** (L4 on classification/audit drafting) with **human control on anything adverse to a farmer** (sanctions stay with people).
- Multiple overlapping legal regimes apply simultaneously (CAP regulations, GDPR, EU AI Act, Copernicus data policy, and — per further compliance research — NIS2, INSPIRE, eIDAS, Web Accessibility Directive, right to good administration).
- Success is measured in **money (corrections avoided), time (payment speed), cost (inspections), and trust (farmer satisfaction)** — not just technical accuracy.

---

*Source: Case Study 47 (`case-study-47.md`, `case-study-47.jpg`); supporting research in `docs/research/` and `docs/copernicus/`.*
