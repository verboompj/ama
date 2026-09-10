# Solution Design — Open Questions to Answer

Questions to answer before/while designing the agentic solution for Case Study 47 (Hungarian CAP Paying Agency). Organized by theme.

## 1. Business & Stakeholders
- Who is the executive sponsor's day-to-day counterpart (programme owner) and what is their decision authority vs. the Ministry of Agriculture?
- Who are all the affected stakeholder groups (farmers, inspectors, legal/sanctions staff, IT/security team, EU Commission auditors, farmer associations/unions)?
- What is the current organisational structure of inspection and legal teams, and how would their workflows change day-to-day?
- What is the appetite/budget for this transformation, and over what timeframe (pilot vs. full rollout)?
- Are there political sensitivities (e.g., farmer protest history, prior payment delay scandals) that constrain rollout pace or communication?

## 2. Current State & Data
- What does the "partially implemented" Area Monitoring System currently cover (which schemes, which regions, what % of parcels)?
- What is the current error rate and root-cause breakdown of the €60M in Commission financial corrections over 3 years?
- What existing systems must be integrated with (LPIS, IACS, national farmer portal, payment/treasury systems, GIS platforms)?
- What is the quality/completeness of the current Land Parcel Identification System (LPIS) data?
- How is farmer/claim data currently stored, and what data quality issues exist (duplicates, outdated parcel boundaries, etc.)?
- What historical inspection and sanction decision data exists to train/validate the new agents?

## 3. Agent Scope & Behaviour
- **Parcel Monitoring Agent**: What crop/activity taxonomy must it classify against? What accuracy/precision thresholds are acceptable before triggering escalation vs. autonomous action?
- **Farmer Guidance Agent**: What languages, channels (web, mobile, phone) must it support? How does it handle farmers with low digital literacy or no internet access?
- **Discrepancy Resolution Agent**: What is the exact evidence-acceptance policy (which photo/document types, timestamps, geolocation tolerance)? What triggers escalation to a human vs. autonomous resolution?
- **Inspection Prioritisation Agent**: What risk factors feed the prioritisation model, and how is fairness/non-discrimination across farmer demographics or regions ensured?
- **Audit Evidence Agent**: What exact format/content does the EU Commission require in audit packs? Who signs off before submission?
- How do the five agents hand off to each other — what is the exact orchestration/state machine, and where are the human checkpoints?
- What happens on agent failure/uncertainty (fallback to manual process, confidence thresholds, timeouts)?

## 4. Autonomy, Governance & Explainability
- What justifies L4 ("autonomous") for Parcel Monitoring and Audit Evidence, vs. L2 ("recommend") for Inspection Prioritisation — is this consistent with EU AI Act risk classification?
- Is this system a "high-risk AI system" under the EU AI Act (Annex III — access to public services/benefits)? What conformity assessment, documentation, and logging obligations follow?
- What explainability method will be used for crop/activity classification (e.g., feature attribution, confidence scores, human-readable rationale) to satisfy farmers' right to be heard and right to reasons for decisions (Charter Art. 41)?
- What is the appeal/dispute escalation path, and what SLA applies to human review?
- Who is accountable when an autonomous classification is wrong and causes a farmer financial harm?
- How will model drift, seasonal variation, and edge cases (e.g., unusual weather, cloud cover gaps in Sentinel data) be monitored and handled?

## 5. Data Protection & Privacy (GDPR)
- What is the lawful basis for processing farmer personal data (public task, legal obligation)?
- Has a Data Protection Impact Assessment (DPIA) been conducted for the automated/discrepancy-resolution decision-making?
- How are farmer geo-tagged photos and location data stored, retained, and eventually deleted?
- Does any part of the pipeline involve automated decision-making with legal effect under GDPR Art. 22, and if so what safeguards (human review, right to contest) are in place?
- How is data shared with the EU Commission for audit purposes governed (data minimisation, access controls)?

## 6. Security & Resilience
- Given the real-world ransomware incident affecting the agency, what is the disaster recovery / business continuity plan for the new agentic system during a payment-critical period?
- Does the system meet NIS2 obligations for essential/important entities (risk management, incident reporting, supply chain security)?
- How are the AI agents themselves secured against prompt injection, data poisoning (e.g., manipulated geo-tagged photos), or model manipulation?
- What are the access control and audit-logging requirements for staff (inspectors, legal officers) interacting with agent outputs?

## 7. Data Sovereignty & Sourcing
- Where is national farmer/parcel data hosted, and does it comply with data sovereignty requirements?
- How is Copernicus Sentinel data ingested, licensed/attributed, and kept within the agency's control (per Copernicus data policy)?
- Are there dependencies on third-party DIAS platforms (WEkEO, CREODIAS) or is data processed on sovereign/national infrastructure?
- What is the INSPIRE-directive compliance status of the LPIS/spatial data used by the Parcel Monitoring Agent?

## 8. Farmer Experience & Accessibility
- How will farmers with disabilities access the national portal (Web Accessibility Directive compliance)?
- How is electronic identification/authentication handled for farmers submitting claims and evidence (eIDAS-compliant eID)?
- What is the plan for farmer communication/change management as agents replace/augment human contact points?
- How will farmer trust be built and measured, beyond the stated "farmer satisfaction" KPI?

## 9. Technical Architecture
- What is the modeling approach for crop/activity classification (custom ML model, foundation model + fine-tuning, third-party service like Sen4CAP)?
- What data pipeline handles Sentinel-1/2 ingestion, pre-processing (e.g., Sen2Cor atmospheric correction), and feature extraction?
- What is the system's approach to orchestration between agents (workflow engine, agent framework, human-in-the-loop tooling)?
- What are the latency/throughput requirements (seasonal monitoring cadence — every 3-5 days per Sentinel revisit)?
- How will the system scale to 160,000 farmers and their associated parcels, and what is the compute/cost model?
- What monitoring/observability is planned for agent performance, drift, and error rates in production?

## 10. Evaluation & Success Metrics
- How will "error rate and financial corrections reduced" be measured and attributed to the new system vs. other factors?
- What is the baseline and target for the 40% inspection cost reduction, and how is it tracked?
- How is farmer satisfaction measured (survey, complaint volume, payment-timeliness perception)?
- What is the plan for a pilot/phased rollout (which region, crop types, or scheme first) before national scale-up?
- What is the rollback plan if the new system underperforms or causes farmer harm during the 2026–2028 window?

## 11. Legal & Compliance Sign-off
- Which compliance standards (see `docs/regulatory-compliance/`) require formal sign-off before go-live, and from whom (DPO, legal, security, EU Commission liaison)?
- Is a conformity assessment required under the EU AI Act before deployment, and what is the timeline given phased applicability (2025–2026)?
- What ongoing compliance monitoring/reporting cadence is required post-launch (annual AMS quality assessment, NIS2 incident reporting, GDPR audits)?

---

*Related reading: `Investigate/case-understanding-presentation.md`, `docs/research/`, `docs/copernicus/`.*
