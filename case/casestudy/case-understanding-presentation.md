# Case Study 47 — Understanding the Case
### Agentic CAP Subsidy Claims and Satellite Verification for a Hungarian Paying Agency

*Participant interpretation of the fictional case brief. Scenario figures and
targets are not independently verified Hungarian statistics; public institutions
are referenced separately as research context.*

---

## Slide 1 — Who & Where
- **Industry**: Public Sector — Agriculture Administration
- **Organisation**: Fictional Hungarian CAP paying agency; Magyar Államkincstár is real-world research context, not the fictional organisation's identity
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
4. Prioritise physical inspections using risk-targeting, alongside a separately locked random/stratified quality sample.
5. Produce audit evidence — with **inspectors and legal officers retaining sanction decisions**.

---

## Slide 4 — Agentic Architecture Brief

| Agent | Owns end-to-end | Autonomy level |
|---|---|---|
| Parcel Monitoring Agent | Classifies crop and activity per parcel from Sentinel imagery | L4 – autonomous analytical output, not a payment decision |
| Farmer Guidance Agent | Explains rules, pre-checks claims, requests geo-tagged photos | L3 – acts |
| Discrepancy Resolution Agent | Contacts farmers on flags; accepts evidence within rules | L3 – acts, escalates disputes |
| Inspection Prioritisation Agent | Risk-targets physical inspections | L2 – recommend |
| Audit Evidence Agent | Compiles Commission audit packs | L4 – autonomous drafts |

**Orchestration**: Seasonal monitoring pipeline → farmer-facing agent in the national portal → discrepancy loop before payment → inspectors/legal staff hold sanction decisions.

---

## Slide 5 — Governance, Safety & Evaluation
- **Administrative-law rights of farmers**: right to be heard before an adverse measure under applicable EU general principles and Hungarian procedures; Article 41 is the Union-level reference, not the sole direct national basis.
- **Explainability**: classifications made by AI (crop/activity) must be explainable to farmers and auditors.
- **Commission-auditable models**: models/decisions must be traceable for EU Commission audit.
- **GDPR**: personal/farm data protection across the whole pipeline.
- **Data sovereignty**: national data must remain under Hungarian/EU jurisdiction and control.

---

## Slide 6 — Expected Outcomes
| Metric | Target Direction |
|---|---|
| Error rate & financial corrections | ↓ Reduced |
| Payment timeliness | Case target: 2 months earlier for delayed cohorts/balances, within statutory windows; distinguish first payment from substantial completion |
| Inspection cost | ↓ 40% |
| Farmer satisfaction | ↑ Increased |

---

## Slide 7 — Why Now (2026–2028)
- CAP Area Monitoring System (AMS) is **mandatory**.
- The original Article 10 of Regulation (EU) 2022/1173 extends monitorability to geotagged photos from **1 January 2025**, with gradual inclusion of photo-only conditions. Confirm the current consolidated rules and Hungarian rollout; not every farmer must routinely submit photos.
- Population-wide monitoring does not remove independent sample-based quality validation or controls for non-monitorable conditions.
- Financial corrections are a case risk; the actual causes and avoidable share require baseline discovery.

---

## Slide 8 — The Business Case
> "Commission financial corrections come straight out of the national budget; full-coverage verification is cheaper than the penalties."

- **Value at stake**: the brief assumes **€60 million over three years** in financial corrections. The recoverable benefit depends on which causes monitoring and workflow improvements can address; coverage alone does not guarantee eliminating most corrections.
- **Farmer liquidity benefit**: earlier delayed advances or outstanding balances improve cash flow; an advance already received at the 16 October opening cannot move two months earlier. Ordinary/balance payments normally begin from 1 December, with the normal deadline on 30 June next year.
- **Cost of inaction**: sample-based inspection can't meet monitoring requirements; delayed payments and complaints are politically visible.
- **Executive sponsor**: President of the paying agency, with the Ministry of Agriculture.
- **Success measures**: error rate & corrections, payment timeliness, inspection cost, farmer satisfaction.

---

## Slide 9 — Key Takeaways for Solution Design
- This is a **regulatory-compliance-driven, not discretionary, transformation** — AMS is mandatory law, not a nice-to-have.
- The system must balance **autonomy for efficiency** (L4 on classification/audit drafting) with **human control on anything adverse to a farmer** (sanctions stay with people).
- Multiple legal frameworks require assessment (CAP, GDPR, EU AI Act, Copernicus terms, NIS2, INSPIRE, eIDAS, accessibility, and administrative law). Confirm AI Act intended-use classification and NIS2 entity status rather than assuming them from public payments.
- Evaluate crop models at supported as-of cutoffs; full-season accuracy does not prove early advance readiness.
- Success is measured in **money (corrections avoided), time (payment speed), cost (inspections), and trust (farmer satisfaction)** — not just technical accuracy.

---

*Source: [Case Study 47](../case-study-47.md) and [source scan](../case-study-47.jpg).
Detailed payment interpretation: [CAP claim and payment calendar](../../docs/research/cap-claim-and-payment-calendar.md).*
