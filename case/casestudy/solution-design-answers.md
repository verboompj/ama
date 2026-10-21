# Solution Design Answers
## Agentic CAP Subsidy Claims and Satellite Verification

This document provides a defensible proposed answer to the open questions for Case Study 47. It distinguishes:

- **case facts** supplied by the brief;
- **recommended design decisions** for the proposed solution; and
- **assumptions requiring validation** with the Hungarian paying agency.

It is not a substitute for legal, procurement, security, or accreditation sign-off.

---

## 1. Executive Case for Change

The agency administers approximately **EUR 2 billion in annual CAP payments to 160,000 farmers** through a process that is partly manual, labour-intensive, slow, and unable to review every parcel every season. The current control environment has contributed to approximately **EUR 60 million in European Commission financial corrections over three years**, while farmers may wait months for payments.

This is not a discretionary technology programme. The Area Monitoring System is
mandatory; monitorable conditions must be covered under the applicable EU rules and
Hungarian rollout, including the permitted gradual inclusion of photo-only
conditions. Delayed implementation prolongs exposure to control deficiencies,
inspection costs, payment delays, and dissatisfaction; actual corrections depend on
the deficiencies found, not simply the technology rollout date.

The programme should therefore be funded to:

1. verify every monitorable parcel rather than only a sample;
2. resolve discrepancies before payment;
3. create traceable and auditable evidence;
4. accelerate valid payments by a target of **two months**;
5. reduce physical-inspection cost by a target of **40%**; and
6. reduce the error rate and associated financial corrections without weakening farmers' procedural rights.

These monetary figures and targets come from the case brief, not independently
verified Hungarian national statistics. Corrections avoided must be attributed by
cause; broader coverage cannot eliminate corrections unrelated to monitoring.

Payment reporting must distinguish **first material payment** from **substantially
complete payment**, measured against the previous three claim years using claim and
treasury records. Report median/P90 time to each, year-end paid share, and unpaid
value in December/March, separately for no-advance, partial-advance, and
maximum-advance cohorts. The proposed substantially-complete threshold is 90% of
final eligible value, a measurement convention for agency validation, not a legal rule.
Financial corrections, inspection cost, farmer satisfaction, and overturned adverse
decisions should be reported alongside these measures.

The two-month target concerns delayed cohorts and outstanding balances, not a
universal acceleration of an advance already received on 16 October. Ordinary/balance
payments normally start from 1 December, with the normal deadline on 30 June of the
following year. Earlier readiness must respect those windows and the required
controls; see the
[CAP payment calendar](../../docs/research/cap-claim-and-payment-calendar.md).

### Cost of inaction

- Continued Commission financial corrections paid from the national budget.
- Continued inability to demonstrate full AMS coverage.
- Delayed payments and reduced farmer liquidity.
- Increasing operational pressure on inspectors and caseworkers.
- Inconsistent evidence and weak audit traceability.
- Higher risk that rushed automation is introduced later without adequate safeguards.

---

## 2. Stakeholders and Accountability

### Proposed governance

| Role | Accountability |
|---|---|
| Executive sponsor | President of the paying agency; owns benefits, funding, and risk acceptance |
| Programme owner | Senior agency executive with authority over claims operations, technology, and rollout |
| Ministry of Agriculture | Policy alignment, national CAP Strategic Plan, and political oversight |
| Paying-agency operations | Claim processing, discrepancy resolution, payment workflow, and service levels |
| Inspectors | Physical verification and expert review of ambiguous evidence |
| Legal/sanctions officers | Adverse decisions, reductions, penalties, and appeal positions |
| Data Protection Officer | GDPR lawful basis, DPIA, data-subject rights, and retention |
| CISO/security team | NIS2 controls, threat model, incident response, and resilience |
| Model risk/governance board | Model approval, thresholds, drift, fairness, and material changes |
| EU Commission liaison | Audit-pack requirements and regulatory assurance |
| Farmer representatives | Usability, accessibility, communication, and trust |

### Decision authority

The programme owner runs the transformation day to day. The Ministry defines policy and scheme interpretation but should not approve individual claims. Inspectors and legal officers retain authority for adverse administrative decisions. Technology teams operate the platform but cannot change eligibility rules or model thresholds without controlled approval.

---

## 3. Current-State Discovery

The design phase begins with a twelve-week discovery covering:

- current AMS coverage by scheme, region, crop, and parcel type;
- LPIS/IACS data quality;
- current claim, correction, inspection, appeal, and payment workflows;
- causes of the EUR 60 million in corrections;
- existing integrations and identifiers;
- historical imagery, inspections, sanctions, and appeals;
- farmer channels and accessibility needs;
- security and business-continuity capabilities;
- audit-pack requirements; and
- current processing cost and service-level baselines.

### Systems expected to integrate

- Land Parcel Identification System;
- Integrated Administration and Control System;
- Geo-Spatial Application System;
- national farmer portal and eID;
- payment and treasury systems;
- GIS and document-management platforms;
- inspection scheduling and mobile tools;
- national registers;
- audit and records-management systems; and
- Copernicus Data Space services.

The deterministic payment-system adapter exports only approved readiness/decision
records. The existing authorised agency system retains payment execution and its
ledger; acknowledgements, settlements, balances, recoveries, and offsets are
reconciled to case state using stable transaction and idempotency references.
An agent or model-consistent parcel cannot authorise a transfer.

### Data-quality gate

The project must not train or evaluate models before establishing:

- authoritative parcel and claim identifiers;
- versioned parcel boundaries;
- label provenance;
- inspection-result quality;
- missing-data rates;
- duplicate and conflicting records;
- scheme-year rule versions; and
- representative regional, seasonal, crop, and weather coverage.

One year of data is insufficient as the sole training basis. The preferred initial dataset covers multiple scheme years and weather conditions, with targeted supplementation for rare crops and hard-to-observe landscapes.

---

## 4. Agent Scope and Authority

### Parcel Monitoring Agent

**May autonomously:**

- ingest approved Sentinel and supporting data;
- calculate deterministic features;
- classify crop or agricultural activity;
- calculate confidence and data-quality indicators;
- identify consistency, discrepancy, or inconclusive status;
- create an evidence package; and
- route a case according to approved thresholds.

**Must never autonomously:**

- reject a claim;
- reduce a payment;
- impose a penalty or fraud label;
- infer non-compliance solely from missing or poor-quality imagery;
- change a farmer declaration;
- override accepted evidence; or
- close an appeal.

### Farmer Guidance Agent

It may explain published rules, pre-check a draft claim, identify missing information, and guide evidence submission. It must clearly distinguish guidance from an official decision, cite the applicable scheme-year rule, and escalate ambiguous legal interpretation to a caseworker.

It should support Hungarian first, with approved terminology, plain language, accessible web/mobile experiences, and assisted channels for farmers who cannot use digital self-service.

### Discrepancy Resolution Agent

It may issue approved notifications, explain the detected inconsistency, request specified evidence, validate technical properties of evidence, and recommend resolution under deterministic rules.

It must escalate when:

- confidence is below the approved threshold;
- evidence conflicts;
- the farmer disputes the observation;
- an adverse financial consequence is possible;
- the case falls outside an approved policy;
- fraud is suspected; or
- the response deadline or legal time limit is at risk.

### Inspection Prioritisation Agent

This remains **L2 recommendation only**. It ranks cases using approved risk factors but does not order an inspection or determine non-compliance. The agency must test for geographic, farm-size, crop, and other proxy biases and prevent protected or irrelevant personal attributes from entering the model.

### Audit Evidence Agent

It may autonomously compile a draft pack from immutable source records, but the pack must be validated against a schema and signed off by an authorised official before external submission.

---

## 5. End-to-End Workflow

```text
Claim submitted
      |
Administrative and deterministic checks
      |
Approved imagery and feature pipeline
      |
Parcel classification + confidence + provenance
      |
  +---+----------------------+------------------+
  |                          |                  |
Consistent               Inconclusive       Discrepancy
  |                          |                  |
Eligible workflow      Alternative data      Farmer notice
  |                    or evidence request     and evidence request
  |                          |                  |
  +--------------------------+------------------+
                             |
                     Deterministic validation
                             |
              +--------------+--------------+
              |                             |
          Resolved                       Disputed/adverse
              |                             |
      Payment calculation             Human case review
                                            |
                                  Authorised decision
                                            |
                                    Complaint/appeal
```

Every material transition records:

- claim and parcel identifiers;
- scheme-year rule version;
- input data and provenance;
- model and feature-pipeline version;
- confidence and quality indicators;
- agent action and tool calls;
- farmer communication;
- submitted evidence;
- human reviewer and rationale;
- final decision authority; and
- timestamps and correlation IDs.

---

## 6. Uncertainty and Missing-Imagery Failure Path

If Sentinel-2 is obscured by cloud and Sentinel-1 is ambiguous:

1. The pipeline marks the result **inconclusive**, not non-compliant.
2. It attempts approved alternative observations, including adjacent dates, time-series features, equivalent data sources, or previous validated evidence where legally permissible.
3. The farmer receives a plain-language notice explaining what could not be confirmed.
4. The system requests only evidence relevant to the unresolved condition, such as a geo-tagged photograph or document.
5. The evidence service validates timestamp, location, integrity, and permitted format without treating metadata as proof of eligibility by itself.
6. An unresolved or disputed case enters a human-review queue with a legal deadline and service-level priority.
7. Payment handling follows national law and approved policy: unaffected claim elements should not be delayed unnecessarily, and no adverse inference is made merely because the sensor data is unavailable.
8. If the legal deadline cannot be met safely, the authorised official applies the approved provisional, partial-payment, extension, or manual-processing procedure.

The system must never fabricate certainty, silently substitute old data, reject a claim because imagery is missing, or let an agent invent a new evidence rule.

---

## 7. Evidence Acceptance

The agency must publish a versioned evidence policy defining:

- accepted evidence types;
- file formats and size limits;
- capture window;
- geolocation tolerance;
- device and application requirements;
- integrity and anti-tampering checks;
- retention period;
- manual exceptions;
- accessibility alternatives; and
- appeal rights.

Geo-tagged photographs are supporting evidence, not automatically conclusive evidence. Anti-fraud controls should detect reused images, impossible locations, manipulated metadata, and synthetic content, while ensuring that detection results trigger review rather than automatic punishment.

---

## 8. Human Oversight and Administrative Rights

The proposed system is likely to be treated as high risk because it supports decisions concerning access to public benefits. The design therefore assumes the strict control set:

- documented risk-management system;
- representative data and label governance;
- technical documentation;
- automatic event logging;
- human oversight;
- accuracy, robustness, and cybersecurity testing;
- post-deployment monitoring;
- incident handling; and
- controlled material changes.

### Right to be heard

Before an adverse decision, the farmer receives:

- the claimed condition under review;
- the observed evidence;
- a comprehensible reason for the discrepancy;
- model confidence and relevant limitations in farmer-safe language;
- instructions and time limits for correction or evidence;
- access to human review; and
- the complaint or appeal route.

### Accountability

The authorised administrative official remains accountable for the final decision. The model owner is accountable for technical performance, the policy owner for rules, the data owner for source quality, and the platform owner for availability and security. These accountabilities must be explicit rather than collapsed into a generic statement that “AI made the decision.”

---

## 9. Explainability

Each parcel result should provide layered explanations:

### Farmer view

- what condition was checked;
- whether the result is consistent, inconsistent, or inconclusive;
- which observation period was used;
- the main observable indicators;
- confidence or uncertainty in plain language;
- what evidence can resolve the issue; and
- how to request human review.

### Caseworker view

- time-series visualisation;
- source imagery and quality masks;
- relevant features and thresholds;
- comparison with the declaration;
- model and rule versions;
- similar historical examples where appropriate; and
- alternative explanations or known limitations.

### Auditor view

- immutable source references;
- data lineage;
- reproducible feature and model configuration;
- evaluation results for the deployed version;
- decision chronology;
- human interventions; and
- signed evidence manifest.

Feature attribution alone is not sufficient. Explainability must connect the technical observation to the relevant administrative rule.

---

## 10. GDPR and Data Protection

The expected lawful basis is performance of a public task and/or compliance with a legal obligation, subject to confirmation by the DPO and legal counsel.

Before pilot processing, the agency must complete a DPIA covering:

- parcel, identity, claim, financial, and location data;
- geo-tagged photographs;
- profiling and inspection prioritisation;
- automated recommendations;
- data-subject rights;
- data sharing with Commission and assurance bodies;
- processors and international transfers;
- retention and deletion;
- security controls; and
- residual risk.

### Data principles

- collect only data required for a defined CAP purpose;
- separate operational, analytics, and model-training datasets;
- pseudonymise training and evaluation data where possible;
- use role-based and attribute-based access;
- encrypt data in transit and at rest;
- prevent production agents from unrestricted data exploration;
- apply retention by evidence category and scheme year;
- log all material access; and
- support correction of inaccurate source data.

No decision with legal or similarly significant effect should be made solely by an unconstrained agent. Human review must be meaningful, timely, and empowered to change the outcome.

---

## 11. Security and Resilience

### Threat model

The solution must address:

- ransomware;
- identity compromise;
- malicious or manipulated farmer evidence;
- prompt injection through uploaded content;
- data poisoning;
- model or feature-pipeline tampering;
- unsafe agent tool invocation;
- supply-chain compromise;
- insider misuse;
- denial of service during payment peaks; and
- corruption of audit evidence.

### Core controls

- Microsoft Entra ID, phishing-resistant MFA, and privileged identity management;
- workload identity rather than embedded secrets;
- private endpoints and network segmentation;
- signed container images and controlled registries;
- allowlisted agent tools with least-privilege identities;
- structured-output validation;
- malware and content scanning;
- separation of evidence ingestion from agent instructions;
- immutable audit storage;
- key management and rotation;
- central security monitoring;
- dependency and image vulnerability management;
- tested incident-response playbooks; and
- supplier security obligations.

### Ransomware continuity scenario

If the agent platform is unavailable during the payment peak:

1. Freeze automated state changes and revoke compromised identities.
2. Keep the authoritative claims and payment systems isolated from the agent runtime.
3. Switch to the documented manual/degraded workflow using the last trusted case state.
4. Prioritise identity, authoritative claim data, case chronology, payment interfaces, and evidence retrieval for restoration.
5. Restore from isolated, immutable, tested backups into a clean environment.
6. Verify software signatures, configuration baselines, database integrity, event-chain continuity, and evidence-manifest hashes.
7. Reconcile all queued or interrupted actions before resuming automation.
8. Require authorised human approval to release payments affected during the incident.
9. meet applicable NIS2 and national incident-notification duties.

Recovery objectives must be agreed from the legal payment calendar. A proposed starting point is:

- critical case and payment interfaces: hours, not days;
- evidence retrieval: same business day;
- analytical reprocessing: recover after transactional services; and
- no loss of material decision events.

These targets require formal business-impact analysis before adoption.

---

## 12. Data Sovereignty and Copernicus

National claim, farmer, and decision data should remain in approved EU regions under agency-controlled identities, keys, contracts, and logging. Any processor or subprocessor requires documented legal and security assessment.

Copernicus data should be acquired through approved catalogue and processing interfaces with:

- source product identifiers;
- acquisition and processing timestamps;
- licence and attribution metadata;
- checksum or equivalent integrity data;
- processing parameters;
- retention policy; and
- lineage to derived evidence.

The architecture may use Copernicus Data Space processing for large raster operations while retaining versioned derived products and evidence in agency-controlled storage. LPIS and published spatial services must be assessed for applicable INSPIRE obligations.

---

## 13. Farmer Experience, Accessibility, and Trust

The service should provide:

- Hungarian-language plain-language guidance;
- WCAG-aligned accessible web and mobile channels;
- eIDAS-compatible authentication through the national identity approach;
- assisted digital service, telephone support, and in-person alternatives;
- low-bandwidth workflows;
- clear status tracking;
- reusable evidence where legally permitted;
- notices that separate guidance from official decisions; and
- an accessible complaint and appeal process.

Trust should be measured using:

- farmer satisfaction;
- complaint volume and themes;
- evidence-request burden;
- appeal and overturn rates;
- channel abandonment;
- accessibility defects;
- time to human assistance; and
- outcome differences by region, farm size, crop, and digital channel.

---

## 14. Technical Architecture

### Recommended platform split

| Capability | Recommended platform |
|---|---|
| Farmer/staff portal, case APIs, rules, evidence, and agent orchestration | AKS |
| Foundation-model inference and embeddings | Microsoft Foundry managed model deployments |
| Crop/activity model training and batch/online inference | Azure Machine Learning |
| Sentinel catalogue and large raster processing | Copernicus Data Space services |
| Raw/derived imagery and evidence | ADLS Gen2 / Blob Storage |
| Guidance and policy retrieval | Azure AI Search |
| Workflow events | Azure Service Bus |
| Secrets and keys | Azure Key Vault |
| Operational claim/case state | Managed operational database |
| Immutable material-event log | Tamper-evident/immutable audit storage |
| Monitoring | Azure Monitor, Application Insights, managed metrics and dashboards |

### User identity and mobile frontend

The architecture uses separate identity authorities for farmers, staff, and workloads:

- **Farmers:** authenticate through the Hungarian national eID or another approved
  eIDAS-compatible government identity provider.
- **Agency staff and inspectors:** authenticate through the agency's Microsoft Entra
  workforce tenant, using Conditional Access and MFA; privileged roles use PIM.
- **AKS services:** use Entra Workload Identity and managed identities, not user
  credentials or embedded secrets.

Entra External ID is an optional federation/CIAM broker only if the agency verifies
that the national identity provider, assurance level, claims, and eIDAS requirements
are supported. It must not downgrade or replace the national identity proof.
Interactive clients use OIDC Authorization Code with PKCE; APIs validate tokens and
enforce case-level access server-side.

Provide a responsive farmer web portal and installable PWA sharing the same APIs. The
mobile experience should support claim status, parcel maps, evidence requests, guided
geo-tagged photo capture, resumable uploads, and accessible Hungarian-language content.
An inspector field-mobile workflow should provide assigned visits, maps, checklists,
photo capture, and signed notes using staff Entra authentication. Offline capture may
queue drafts, but only the server confirms submission and records the official receipt
time. Select a separate native farmer application only if discovery demonstrates
required device/offline capabilities that a PWA cannot meet.

### Design principles

- Agents orchestrate; deterministic services own rules and decisions.
- The language model never directly writes payment or sanction state.
- All tools are explicit, allowlisted, authorised, and schema validated.
- Interactive and background agents use separate deployments and identities.
- Every prompt, model, rule, and tool contract is versioned.
- Long-running seasonal workflows use durable state rather than chat memory.
- Satellite processing is batch-oriented and idempotent.
- The architecture supports canary deployment and rollback.

### Scale

The system scales by parcel and observation event, not merely by farmer count. Processing is partitioned by geography, scheme, and acquisition window. Queues absorb seasonal peaks, while batch endpoints and stateless workers scale horizontally.

The cost model must include:

- Copernicus processing and data movement;
- storage and lifecycle tiers;
- AML training and inference;
- AKS baseline and peak capacity;
- model-token usage;
- search;
- monitoring and log retention;
- evidence retention; and
- manual-review demand.

---

## 15. Model Development and Evaluation

### Training approach

Start with a supervised, task-specific crop/activity classifier and deterministic remote-sensing features. Foundation models may assist analysts or explanations but should not replace a validated parcel-classification pipeline without evidence of superior performance and controllability.

Training and test data should cover:

- multiple scheme years;
- all target seasons;
- regions and landscape types;
- parcel sizes;
- common and rare crops;
- cloud and weather variation;
- different agricultural practices; and
- known difficult and ambiguous cases.

### Metrics

Report:

- per-class precision, recall, and F1;
- calibration;
- inconclusive rate;
- false-discrepancy rate;
- performance by region, parcel size, crop, and season;
- human override rate;
- appeal and overturn rate;
- data-drift indicators; and
- time from observation to actionable result.

Accuracy alone is insufficient. The false-discrepancy rate and unequal error burden are particularly important because unnecessary evidence requests impose costs on compliant farmers.

### Production monitoring

- input and label drift;
- confidence distribution;
- missing-data and cloud-cover rates;
- model and rule version;
- tool errors and timeouts;
- queue age;
- human-review backlog;
- farmer response times;
- security signals; and
- downstream payment outcomes.

Material performance deterioration automatically reduces autonomy and routes more cases to human review.

---

## 16. Pilot Design

### Proposed pilot

Select:

- one region with representative infrastructure and engaged operational leadership;
- one relatively well-observed major crop;
- one more difficult crop or fragmented-parcel category;
- one income-support intervention and one monitorable eco-scheme condition;
- a balanced sample of small, medium, and large farms; and
- a control group processed under the existing workflow.

Avoid selecting only the easiest region or crop because this would overstate national readiness.

### Duration

Run through one complete claim and monitoring cycle, preceded by historical shadow-mode evaluation over at least two prior scheme years where data permits.

### Baseline

- claim-to-payment duration;
- discrepancy and correction rate;
- inspection volume and cost;
- Commission/audit findings;
- evidence-request volume;
- staff handling time;
- farmer complaints and satisfaction;
- appeal and overturn rate; and
- system availability.

### Initial go/no-go thresholds

Thresholds require agency approval, but the pilot should not progress unless:

- no autonomous adverse decisions occur;
- safety, privacy, and security controls pass;
- classification meets approved per-class thresholds;
- false-discrepancy and unequal-error rates remain within agreed limits;
- every material decision is reproducible from the audit trail;
- farmer notification and human-review SLAs are met;
- operational handling time improves;
- no material group suffers a disproportionate burden;
- recovery and rollback exercises pass; and
- the benefits case remains credible at national scale.

### Stop conditions

- evidence of farmer harm from automation;
- missing or corrupt audit records;
- material security incident;
- systematic regional or group bias;
- model drift below the approved threshold;
- unresolved legal or DPIA risk;
- excessive manual-review backlog;
- integration instability affecting payments; or
- inability to reverse an erroneous automated state.

### Attribution

Use a phased or matched-control evaluation, adjust for crop, region, weather, parcel size, and workload volume, and compare with historical scheme-year baselines. Report confidence intervals and avoid attributing all change to the platform.

---

## 17. Rollout and Change Management

### Phases

1. Discovery and legal/security assessment.
2. Historical evaluation and shadow mode.
3. Limited pilot with no autonomous adverse action.
4. Independent assurance and farmer feedback.
5. Expansion by scheme, crop, and region.
6. National operation with continuing monitoring.

### Rollback

- retain the current manual workflow during pilot;
- use versioned deployments and database migrations;
- keep an authoritative event log;
- make agent actions idempotent;
- support replay from the last trusted state;
- disable individual agents or tools independently;
- revert model and rule versions;
- route all cases to manual processing when thresholds fail; and
- preserve farmer deadlines and appeal rights during rollback.

### Workforce impact

Automation should shift staff from repetitive checking toward complex evidence review, farmer assistance, quality assurance, and investigation. The programme requires training, workload redesign, role clarity, and workforce consultation—not just technical deployment.

---

## 18. Success Measures

| Outcome | Measure |
|---|---|
| Faster payment | Median/P90 to first material and substantially complete payment; target direction: up to two months earlier for delayed cohorts/balances within legal windows |
| Payment completion | Date reaching the proposed 90% of final eligible value, share paid by year-end, and unpaid value at 31 December/31 March, split by advance cohort |
| Lower corrections | Annual value and cause of Commission financial corrections |
| Lower inspection cost | Cost per claim and total physical-inspection cost; target direction: 40% reduction |
| Better accuracy | Confirmed error, false-discrepancy, and human-overturn rates |
| Full monitoring | Percentage of monitorable parcels processed with valid evidence |
| Farmer experience | Satisfaction, complaint, abandonment, evidence burden, and appeal metrics |
| Fairness | Error and burden by region, parcel size, crop, and farmer cohort |
| Auditability | Percentage of decisions reproducible from complete evidence lineage |
| Resilience | Availability, recovery performance, backlog recovery, and audit-log integrity |
| Efficiency | Staff handling time and manual-review volume |

Targets should be fixed only after baseline discovery. Benefits must be reported net of platform, processing, support, and change-management cost.

---

## 19. Required Sign-Offs

Before pilot:

- programme sponsor;
- claims operations;
- scheme-policy owner;
- legal counsel;
- Data Protection Officer and DPIA approval;
- CISO/security authority;
- architecture and cloud governance;
- records-management authority;
- model risk/governance board;
- accessibility owner;
- procurement/vendor risk; and
- paying-agency accreditation or assurance function.

Before national rollout:

- successful pilot assurance;
- EU AI Act classification and required conformity route;
- Commission/audit liaison review of evidence;
- business-continuity exercise;
- security testing;
- fairness and accessibility review;
- operational readiness;
- farmer communication plan; and
- explicit residual-risk acceptance.

---

## 20. Items Requiring Agency Validation

The following cannot be answered reliably from the case brief and must remain explicit discovery items:

- exact AMS coverage and current error rates;
- detailed causes of financial corrections;
- national legal basis and administrative procedure;
- exact crop/activity taxonomy;
- acceptable model thresholds;
- evidence tolerances and deadlines;
- current system interfaces and data quality;
- number of parcels and seasonal processing volume;
- target recovery objectives;
- EU Commission audit-pack format;
- retention schedules;
- available budget and procurement constraints;
- farmer channel and language requirements;
- organisational capacity for manual review; and
- formal EU AI Act classification and conformity obligations.

The design should not hide these unknowns behind technical assumptions.

---

## 21. Concise Defense Answers

### Why fund this now?

The agency must modernise a mandatory control process governing EUR 2 billion in annual payments. The current approach cannot review every parcel, contributes to delays and financial corrections, and does not provide the evidence quality required for full AMS operation. The programme creates full-coverage monitoring, resolves discrepancies before payment, and improves auditability while retaining human authority for adverse decisions. We will first commit to reducing median payment time against the three-year baseline, with corrections, inspection cost, farmer burden, and overturned decisions as co-equal measures.

### Where is the autonomy boundary?

Agents may observe, classify, explain, request evidence, compile records, and recommend routing. They may not reject claims, reduce payments, impose penalties, label fraud, or close appeals. Any disputed or potentially adverse outcome requires an authorised human decision after the farmer has had a meaningful opportunity to respond.

### What happens when satellite evidence is uncertain?

The result becomes inconclusive, not non-compliant. The system seeks approved alternative observations, asks the farmer only for relevant evidence, and escalates unresolved cases to a time-bound human review. Missing imagery alone can never justify an adverse decision.

### What happens during ransomware?

Automated state changes stop, authoritative claim and payment systems remain isolated, and the agency switches to its degraded manual workflow. Services are restored from immutable backups into a clean environment, evidence integrity is verified, interrupted actions are reconciled, and humans authorise affected payments before automation resumes.

### How is the pilot made credible?

Use representative easy and difficult crop/parcel cohorts, a comparison group, historical shadow mode, explicit safety and performance thresholds, and predefined stop conditions. Adjust results for weather, region, parcel size, and workload so benefits are not incorrectly attributed to the platform.

---

## Repository References

- [`case-study-47.md`](../case-study-47.md)
- [`solution-design-questions.md`](./solution-design-questions.md)
- [`../../docs/architecture/aks-centered-foundry-architecture.md`](../../docs/architecture/aks-centered-foundry-architecture.md)
- [`../../docs/research/cap-claim-process-and-equity.md`](../../docs/research/cap-claim-process-and-equity.md)
- [`../../docs/regulatory-compliance/eu-ai-act.md`](../../docs/regulatory-compliance/eu-ai-act.md)
- [`../../docs/regulatory-compliance/gdpr.md`](../../docs/regulatory-compliance/gdpr.md)
- [`../../docs/regulatory-compliance/nis2-directive.md`](../../docs/regulatory-compliance/nis2-directive.md)
