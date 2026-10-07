# Personas and Use Cases for Agentic CAP Subsidy Verification

## 1. Purpose

This document translates Case Study 47 into a user-centred view of the proposed
agentic CAP subsidy platform. It identifies the people who apply for, administer,
inspect, govern, audit, and operate the service, and describes the outcomes each
persona needs from it.

The personas are **role-based design personas**, not profiles of real individuals.
They are derived from the repository's case brief, research, architecture, and
regulatory notes. Where the repository does not provide enough detail, this document
marks the content as a **design hypothesis** that must be validated through interviews,
workflow observation, service data, and policy review.

The central service is not simply a satellite-classification tool. It is an
administrative decision-support system through which approximately 160,000 farmers
seek access to public funds, agency staff administer approximately EUR 2 billion per
year, inspectors investigate uncertain cases, legal officers protect due process,
and EU auditors assess whether Hungary's controls are reliable.

## 2. Persona Landscape

| Persona | Role in the service | Primary concern | Decision authority |
|---|---|---|---|
| Farmer / CAP applicant | Applies for support and responds to evidence requests | Receive the correct payment quickly and fairly | Submits, corrects, explains, and contests their own claim |
| Agricultural adviser / authorised representative | Helps farmers prepare and manage claims | Complete accurate claims for multiple clients | Acts only within delegated authority |
| Paying-agency caseworker | Manages claims and resolves routine exceptions | Move cases to a correct, timely conclusion | Applies policy within delegated administrative limits |
| Field inspector | Verifies conditions that remote monitoring cannot resolve | Collect defensible field evidence efficiently | Records findings; does not define policy |
| Legal and sanctions officer | Reviews adverse, disputed, or sanctionable cases | Ensure decisions are lawful, proportionate, and reasoned | Approves or rejects adverse measures and sanctions |
| Programme owner / operations manager | Owns national service performance | Deliver compliant payments at national scale | Sets operating policy, service levels, and escalation rules |
| Ministry policy official | Owns policy intent and political accountability | Ensure national CAP implementation meets policy goals | Sets or approves policy, not individual claim outcomes |
| EU Commission auditor | Assesses control-system reliability and expenditure legality | Obtain complete, reproducible audit evidence | Raises findings and financial corrections |
| Data protection, AI risk, and compliance officer | Provides independent compliance oversight | Prevent unlawful or insufficiently governed processing | Approves controls or requires remediation |
| IT, security, and platform operator | Runs and protects the digital service | Keep a payment-critical system secure and available | Operates technology; cannot determine benefit eligibility |
| Geospatial / data science specialist | Builds and evaluates monitoring models | Produce accurate, explainable, stable classifications | Recommends model releases and thresholds |
| Farmer association / civil-society representative | Represents collective farmer interests | Ensure the system is understandable, accessible, and fair | Influences policy and rollout; no individual case authority |

### Primary versus supporting personas

The **primary service personas** are the farmer, authorised representative, caseworker,
field inspector, and legal/sanctions officer. They directly participate in the
claim-to-payment and discrepancy-resolution journey.

The **governance personas** are the programme owner, Ministry policy official, EU
Commission auditor, and compliance officer. They establish, monitor, or audit the
conditions under which the primary journey operates.

The **enabling personas** are the platform operator and geospatial/data science
specialist. They make the service reliable and technically credible but must not
silently acquire administrative decision authority.

## 3. Cross-Persona Design Principles

1. **No adverse action without due process.** A farmer must be told what is in
   question, see the relevant evidence, respond within a reasonable period, and
   receive a reasoned decision. Human officials retain sanction authority.
2. **Automation must expose uncertainty.** Classifications, risk scores, and agent
   recommendations must include confidence, evidence provenance, model/version
   information, and a clear route to human review.
3. **One case, one traceable record.** Claims, satellite observations, correspondence,
   submitted evidence, human decisions, and model outputs must form a coherent,
   time-ordered case file.
4. **Users see language appropriate to their role.** Farmers need plain-language
   explanations and concrete next steps; specialists and auditors need technical
   detail and reproducibility.
5. **Accessibility and assisted service are core channels.** A mobile or web portal
   cannot be the only viable route for farmers with disabilities, low digital
   literacy, unreliable connectivity, or limited access to suitable devices.
6. **Policy and model logic are versioned separately.** The system must show which
   legal rule, scheme year, policy interpretation, model, and data source were used
   for a decision.
7. **Least privilege and separation of duties apply.** Technical operators should
   not change claim outcomes; caseworkers should not alter models; model developers
   should not approve sanctions; auditors should receive only the data they need.
8. **National scale must not erase local context.** Weather, crop calendars, parcel
   characteristics, regional practices, and data gaps can affect remote observations.
9. **The system must fail safely.** Missing imagery, conflicting evidence, low model
   confidence, expired rules, or unavailable integrations must produce an explicit
   exception, not a false approval or rejection.
10. **Success is measured as a public service.** Accuracy matters alongside payment
    timeliness, avoidable inspections, successful discrepancy resolution, appeal
    outcomes, accessibility, complaint volume, and farmer trust.

---

## 4. Primary Persona: The Farmer / CAP Applicant

### Background

The farmer is an individual producer, family farm, cooperative representative, or
other eligible agricultural beneficiary applying for CAP support. The repository
does not define farm size, age, education, digital ability, or connectivity, so the
service must not assume a single "typical farmer."

Farmers may participate in direct-payment schemes, eco-schemes, rural-development
measures, or other interventions under Hungary's CAP Strategic Plan. Eligibility can
depend on parcel boundaries, declared crops, agricultural activity, dates, land
management practices, environmental conditions, and supporting evidence.

The farmer's relationship with the agency is asymmetric: the agency controls access
to important income support and possesses satellite, administrative, and historical
data that the farmer may not understand or see. A delayed or reduced payment can
affect seasonal liquidity, while an incorrect declaration can expose the farmer to
recovery or sanctions.

### Representative context

**Design hypothesis to validate:** A farmer may manage claims personally, delegate
them to an adviser, or rely on assisted service. They may work outdoors, use a mobile
device more often than a desktop, have intermittent connectivity, and need to respond
during time-sensitive agricultural work.

### Goals

- Understand which schemes and eco-schemes are relevant before submitting a claim.
- Submit a complete and accurate claim without mastering regulatory language.
- See whether declared parcels and activities agree with agency-held data.
- Correct genuine mistakes before they become adverse decisions.
- Understand why the system has raised a discrepancy.
- Submit acceptable evidence with minimal effort.
- Receive the correct payment as early and predictably as possible.
- Exercise the right to be heard, access the case file, and contest an incorrect
  conclusion.
- Know whether communication comes from an AI agent or a human official.

### Frustrations and risks

- Complex or changing scheme rules.
- Unclear parcel maps or outdated boundaries.
- Explanations based on technical terms such as vegetation indices, confidence
  thresholds, or model classifications.
- Requests for geo-tagged photos that arrive too late, are difficult to capture, or
  do not explain what must be visible.
- Poor mobile connectivity or lack of a compatible device.
- Fear that an automated flag is already a final decision.
- Repeated requests for information already supplied elsewhere.
- Missed deadlines caused by inaccessible or unnoticed notifications.
- Financial harm from delayed, reduced, or withheld payments.
- Concern about how identity, location, farm, and photographic data are used.

### Functional requirements

- Hungarian-language, plain-language guidance tied to the current scheme year.
- Eligibility pre-checks that distinguish guidance from a binding decision.
- Map-based review of declared parcels and relevant LPIS information.
- Clear status for every claim and parcel: submitted, under monitoring, action
  required, under human review, approved, adjusted, paid, or appealed.
- Early warnings that identify the rule, parcel, observed condition, confidence, and
  response deadline.
- A discrepancy explanation showing:
  - what the farmer declared;
  - what the agency observed;
  - the dates and source of the observations;
  - why the difference matters under the applicable rule;
  - what evidence can resolve it;
  - whether a human has reviewed the case.
- Guided capture and upload of geo-tagged photos, including offline capture,
  validation, consent/privacy notice, and upload retry.
- An always-available parcel evidence option for voluntary material-event capture,
  approved scheme milestones, and focused agency requests; this must not become a
  universal photo requirement without a lawful and proportionate rule.
- Alternative evidence submission where a photo is inappropriate or impossible.
- Ability to correct a declaration, provide an explanation, request human review,
  and lodge an appeal.
- Downloadable or printable case file, correspondence, submitted evidence, and
  reasoned decision.
- eIDAS-compatible authentication and legally reliable submission receipts.
- Delegation controls for advisers or representatives, including scope and expiry.
- Accessible web and mobile experiences plus assisted-service alternatives.

### Non-functional requirements

- High availability during claim and evidence deadlines.
- Low-bandwidth and mobile-first interaction for common tasks.
- WCAG-aligned accessibility for the public-sector portal and mobile application.
- Notifications through more than one configured channel, without exposing sensitive
  claim details in insecure messages.
- Tamper-evident submission receipts and timestamps.
- Data minimisation, understandable privacy notices, retention transparency, and
  secure handling of location and photo metadata.
- Consistent explanations: the same evidence and rule should not produce materially
  different wording or outcomes without a recorded reason.

### Key use cases

#### F-01: Explore eligibility before applying

**Trigger:** The farmer wants to understand available support for the coming scheme
year.

**Main flow:**
1. The farmer authenticates or uses a clearly labelled anonymous guidance mode.
2. The Farmer Guidance Agent asks only relevant questions about farm and intended
   activities.
3. It identifies potentially applicable schemes, obligations, deadlines, and likely
   evidence needs.
4. It cites the authoritative rule and labels the result as guidance, not approval.
5. The farmer saves a checklist or begins a draft claim.

**Success:** The farmer can make an informed decision without interpreting the full
regulatory corpus.

#### F-02: Pre-check a draft claim

**Trigger:** A draft claim contains parcel, crop, or activity declarations.

**Main flow:**
1. The service validates completeness and basic rule compatibility.
2. It compares parcel geometry and declarations with the permitted agency datasets.
3. It identifies likely errors, conflicts, or missing information.
4. The farmer corrects the draft or submits with an explanation.
5. The service preserves the pre-check result and submitted version separately.

**Success:** Avoidable declaration errors are resolved before formal assessment.

#### F-03: Respond to an AMS discrepancy

**Trigger:** Satellite monitoring identifies a material mismatch or cannot confidently
verify a condition.

**Main flow:**
1. The farmer receives an accessible notification with a response deadline.
2. The case view explains the declaration, observation, affected rule, and uncertainty.
3. The service offers valid response options: correct, explain, upload evidence,
   request assistance, or request human review.
4. Submitted evidence is validated for format, location, time, and integrity.
5. The Discrepancy Resolution Agent resolves only cases covered by approved rules;
   disputed or uncertain cases go to a caseworker.
6. The farmer receives a receipt and updated case status.

**Success:** The issue is resolved before payment where possible, without removing the
farmer's right to challenge the outcome.

#### F-04: Contest an adverse conclusion

**Trigger:** The agency proposes a payment reduction, exclusion, recovery, or sanction.

**Main flow:**
1. The farmer accesses the complete relevant case evidence.
2. The service presents the proposed measure and its legal and factual basis.
3. The farmer responds, supplies evidence, or appoints a representative.
4. A human legal/sanctions officer reviews the case.
5. The farmer receives a reasoned decision and appeal instructions.

**Success:** No adverse individual measure is imposed without a meaningful opportunity
to be heard.

#### F-05: Capture seasonal parcel evidence

**Trigger:** A material farm event occurs, an approved scheme milestone becomes due,
or the farmer wants to preserve timely evidence before a discrepancy exists.

**Main flow:**
1. The farmer opens the claimed parcel and selects the evidence purpose.
2. The application provides safe, accessible capture instructions.
3. It records the authorised parcel/task context, time, location and accuracy, while
   explaining that GPS supports provenance but does not prove the image content.
4. The farmer captures an offline draft or uploads the evidence.
5. The service validates and registers the evidence, issues a receipt, and keeps
   `received` distinct from `sufficient for a task`.
6. Relevant evidence is reused if monitoring later raises the same question.

**Success:** Time-sensitive farmer evidence can prevent avoidable repeat requests or
inspection without becoming mandatory surveillance or an automatic claim decision.

---

## 5. Primary Persona: The Agricultural Adviser / Authorised Representative

### Background

This persona represents consultants, accountants, cooperative staff, family members,
or other authorised parties who help one or more farmers understand schemes and manage
claims. The repository mentions farmer associations but does not define the current
representation model; delegation arrangements therefore require discovery.

The adviser can reduce errors and improve access for farmers with limited time or
digital confidence. The same role also creates privacy and security risks if delegated
access is too broad, permanent, or difficult to revoke.

### Goals

- Manage authorised work efficiently across multiple clients.
- Know exactly which actions can be taken for each farmer.
- Identify approaching deadlines and unresolved discrepancies.
- Reuse knowledge and workflows without mixing client data.
- Produce a clear record of advice, submissions, and approvals.

### Requirements

- Explicit, granular, time-limited delegation accepted by the farmer.
- Separate identities for the representative and represented farmer.
- Portfolio dashboard with filters for deadlines, scheme, status, and required action.
- Bulk status review, but controlled submission and attestation per claimant.
- Strict tenant/client separation and prevention of accidental cross-client uploads.
- Audit trail showing who viewed, changed, submitted, or withdrew information.
- Ability for the farmer or agency to revoke access immediately.
- No ability to bypass farmer hearing rights or human sanction controls.

### Key use cases

- **AR-01:** Accept and manage a farmer's delegated authority.
- **AR-02:** Prepare a claim for farmer review and legally valid submission.
- **AR-03:** Coordinate evidence collection for several open discrepancies.
- **AR-04:** Transfer or terminate representation without losing the official case
  history.

---

## 6. Primary Government Persona: The Paying-Agency Caseworker

### Background

The caseworker is the operational public official who assesses claims, handles
exceptions, communicates with applicants, and moves cases toward payment. The exact
Hungarian team structure and delegation limits are open questions in the repository.

The proposed system changes the caseworker's role from manually reviewing a sample of
claims toward supervising automated full-coverage monitoring and resolving exceptions.
This can improve reach but may also create automation bias, queue overload, and a loss
of practical judgement if the system hides the evidence behind a simple risk label.

### Goals

- Resolve the right cases in the right order.
- Understand why an agent raised or resolved an issue.
- Avoid requesting unnecessary evidence or duplicating communication.
- Apply the current rule consistently while recognising legitimate exceptions.
- Meet payment and response service levels.
- Escalate legal, policy, fraud, data-quality, or model-quality issues correctly.
- Leave a complete case record that another official or auditor can understand.

### Frustrations and risks

- Large seasonal queues with many similar alerts.
- False positives caused by cloud cover, unusual weather, parcel boundaries, or model
  drift.
- Conflicting information across IACS, LPIS, portal, payment, and GIS systems.
- Agent-generated explanations that sound confident but do not cite a valid rule.
- Pressure to clear cases quickly at the expense of due process.
- Difficulty distinguishing policy exceptions from technical failures.
- Automation bias: treating a high score as proof.
- Manual workarounds that fragment the audit trail.

### Functional requirements

- Work queue prioritised by deadline, payment impact, uncertainty, vulnerability, and
  case age rather than risk score alone.
- Parcel and case timeline combining declarations, imagery, model outputs, agent
  actions, messages, evidence, and prior human decisions.
- Side-by-side comparison of the farmer declaration and observed evidence.
- Human-readable rationale with links to the exact rule and policy version.
- Ability to inspect source imagery and technical details when needed.
- Confidence and data-quality indicators, including cloud cover, missing observations,
  boundary uncertainty, and out-of-distribution warnings.
- Approved response templates that remain editable and identify AI-generated content.
- Structured resolution outcomes and reason codes.
- Escalation to inspector, legal officer, policy owner, data steward, or model support.
- Four-eyes approval for defined high-impact actions.
- Protection against silent agent closure of disputed or low-confidence cases.
- Searchable precedent or guidance without exposing unrelated farmer data.

### Non-functional requirements

- Role-based access, strong authentication, session controls, and complete audit logs.
- Predictable performance during seasonal peaks.
- Keyboard-efficient and accessible desktop workflow.
- Explainability sufficient for the official to take responsibility for the action.
- Clear display of stale integrations or unavailable evidence.
- Immutable history for material changes, with correction rather than deletion.

### Key use cases

#### CW-01: Triage the exception queue

**Trigger:** Monitoring or claim validation creates cases requiring human attention.

**Main flow:**
1. The caseworker opens a queue with transparent prioritisation factors.
2. The service separates technical failures, missing farmer responses, policy
   exceptions, and substantive discrepancies.
3. The caseworker reviews the highest-priority case and its evidence completeness.
4. They resolve it, request information, schedule inspection, or escalate it.

**Success:** High-impact and time-sensitive cases receive attention without obscuring
fairness or due-process deadlines.

#### CW-02: Review an agent-proposed resolution

**Trigger:** The Discrepancy Resolution Agent proposes accepting or rejecting evidence.

**Main flow:**
1. The caseworker sees the proposed outcome, applicable rule, evidence, and confidence.
2. They inspect any policy or data-quality warnings.
3. They accept, modify, or reject the proposal and record a reason.
4. Material overrides are captured for model and policy evaluation.

**Success:** Automation accelerates routine work without displacing accountable human
judgement.

#### CW-03: Request targeted field verification

**Trigger:** Available remote and farmer-supplied evidence cannot resolve a material
condition.

**Main flow:**
1. The caseworker selects the unresolved condition, not a generic "inspect" action.
2. The system packages the relevant parcel, question, evidence, and deadline.
3. An inspection task enters the scheduling workflow.
4. Findings return to the same case file.

**Success:** The inspector collects only the evidence needed to resolve the case.

---

## 7. Primary Government Persona: The Field Inspector

### Background

The field inspector performs on-the-spot checks where remote monitoring is unsuitable,
inconclusive, legally insufficient, or selected through an approved control strategy.
The transformation target is not to eliminate inspection but to reduce unnecessary
visits and make remaining inspections more focused.

Inspectors work in the field, may have limited connectivity, and need evidence that
can survive administrative and audit scrutiny. Their safety, travel constraints, and
seasonal scheduling are not described in the repository and require discovery.

### Goals

- Understand exactly why a parcel requires inspection.
- Plan routes and visits efficiently.
- Collect complete, admissible evidence once.
- Work offline and synchronise safely.
- Avoid being directed solely by an opaque risk score.
- Record observations without being pushed toward the model's conclusion.

### Requirements

- Inspection task with legal basis, scope, parcel geometry, unresolved questions, and
  relevant prior evidence.
- Map and navigation support with offline parcel data.
- Structured checklists tied to scheme and control requirements.
- Secure photo, video, note, measurement, and geolocation capture.
- Controlled drone-mission support where lawful and proportionate, including flight
  scope, raw imagery, mission logs, quality checks, and chain of custody.
- Device time and integrity checks with a visible chain of custody.
- Ability to record "not observable," safety issues, access refusal, or changed field
  conditions.
- Independent evidence capture before revealing the model's preferred conclusion where
  confirmation bias is a concern.
- Offline operation and conflict-safe synchronisation.
- Inspector attestation and supervisor review where required.
- No automatic conversion of an observation into a sanction.

### Key use cases

- **IN-01:** Receive and plan risk-targeted inspections.
- **IN-02:** Conduct a scoped parcel inspection offline, using ground or authorised
  drone evidence as appropriate.
- **IN-03:** Submit a complete evidence package to the claim case.
- **IN-04:** Report systematic map, policy, or model problems observed across visits.
- **IN-05:** Conduct an independently selected random or stratified spot check for
  control-system validation.

---

## 8. Primary Government Persona: The Legal and Sanctions Officer

### Background

This persona reviews disputed cases and proposed adverse measures such as payment
reductions, exclusions, recoveries, or sanctions. The case brief explicitly keeps
sanction decisions with inspectors and legal staff. In practice, exact authority and
separation between factual inspection findings and legal decisions must be confirmed.

The legal officer protects both public funds and the farmer's procedural rights. They
need a record that shows not just the final model output but the complete reasoning
chain and the farmer's opportunity to respond.

### Goals

- Determine whether the facts and applicable law support the proposed action.
- Ensure the farmer was informed, heard, and given access to relevant evidence.
- Apply measures consistently and proportionately.
- Produce a reasoned, defensible decision.
- Prevent an agent or operational target from predetermining the outcome.

### Requirements

- Complete case file with immutable chronology and provenance.
- Exact legal rule, scheme year, policy guidance, and decision template version.
- Clear distinction between facts, model inferences, agent recommendations, and human
  findings.
- Evidence of notices, delivery, deadlines, farmer responses, and accessibility or
  assistance requests.
- Conflict-of-interest and separation-of-duties controls.
- Ability to remand a case for further evidence or correct a procedural defect.
- Consistency checks against approved policy and comparable decisions.
- Human-authored or human-approved reasoning for adverse measures.
- Appeal-route generation and legally reliable notification.
- Reporting on overturned decisions and recurring procedural failures.

### Key use cases

#### LS-01: Review a proposed adverse measure

1. Confirm authority, applicable law, and completeness of the record.
2. Verify that the farmer had a meaningful opportunity to respond.
3. Evaluate facts independently of the agent recommendation.
4. Approve, change, reject, or return the proposal for more work.
5. Issue a reasoned decision and appeal information.

#### LS-02: Review a contested automated classification

1. Examine the original declaration, imagery, derived features, model version, and
   confidence.
2. Review alternative evidence and any expert interpretation.
3. Determine whether the classification is sufficiently reliable for the legal
   conclusion.
4. Record whether the issue was factual, technical, procedural, or policy-related.

---

## 9. Governance Persona: The Programme Owner / Paying-Agency Operations Manager

### Background

The programme owner is the day-to-day accountable leader for the national claims and
monitoring service. This role translates the executive sponsor's objectives into
operating policy, staffing, service levels, rollout decisions, and measurable outcomes.
The repository identifies the need for this role but does not specify its formal
authority relative to the agency president or Ministry.

### Goals

- Pay eligible farmers correctly and earlier.
- Reduce error rates, inspection cost, and Commission financial corrections.
- Maintain public trust and operational continuity.
- Ensure agents operate within approved autonomy and escalation boundaries.
- Understand performance by scheme, region, crop, model, and process stage.
- Roll out incrementally without placing a payment season at unacceptable risk.

### Requirements

- Executive dashboard covering payment timeliness, unresolved cases, correction risk,
  inspection volume/cost, complaints, appeals, and farmer satisfaction.
- Agent performance metrics including automation rate, human override, false-positive
  rate, unresolved uncertainty, and failure modes.
- Ability to configure approved service levels and escalation policies through governed
  change, not ad hoc prompts.
- Scheme/year rollout controls, feature flags, pilot cohorts, and rollback capability.
- Capacity forecasts for seasonal volumes and human review queues.
- Business-continuity status and recovery objectives.
- Quality-assessment evidence required by the AMS.
- Governance forum for policy, legal, operations, security, and model decisions.
- Benefits tracking against the case targets: earlier payment, lower inspection cost,
  reduced financial corrections, and increased farmer satisfaction.

### Key use cases

- **PO-01:** Approve a phased rollout for selected schemes or regions.
- **PO-02:** Monitor payment-season operations and intervene in growing backlogs.
- **PO-03:** Review whether an agent may move from recommendation to bounded action.
- **PO-04:** Suspend a model or workflow when quality, fairness, or resilience falls
  outside approved thresholds.
- **PO-05:** Report outcomes and risks to the executive sponsor and Ministry.

---

## 10. Governance Persona: The Ministry Policy Official

### Background

The Ministry of Agriculture oversees national agricultural policy and Hungary's CAP
Strategic Plan. This persona is concerned with whether implementation reflects policy
intent, meets EU obligations, treats beneficiaries fairly, and avoids politically
damaging service failures.

The Ministry should not intervene in individual cases outside lawful governance
channels. The platform must therefore support aggregate policy insight without turning
operational data into an informal mechanism for political case handling.

### Goals

- Ensure national rules correctly implement the CAP Strategic Plan.
- Understand the effect of policy on farmers and administrative workload.
- Detect rules that are difficult to monitor, explain, or comply with.
- Demonstrate responsible use of public funds and AI.
- Manage public and parliamentary accountability.

### Requirements

- Aggregated, privacy-preserving policy dashboards.
- Scheme-level trends in eligibility, discrepancy causes, regional effects, appeals,
  processing time, and take-up.
- Traceability from implemented business rules to authoritative policy.
- Impact assessment before material rule or automation changes.
- Clearly governed access that prevents unnecessary exposure of individual farmer data.
- Scenario analysis for policy options, explicitly separated from production decisions.

### Key use cases

- **MP-01:** Evaluate whether an eco-scheme rule creates excessive farmer confusion or
  manual work.
- **MP-02:** Review national readiness and results for AMS obligations.
- **MP-03:** Approve policy clarification and ensure it propagates to guidance,
  validation, and decision logic.
- **MP-04:** Respond to aggregate public concerns with evidence.

---

## 11. Governance Persona: The EU Commission Auditor

### Background

The EU Commission auditor evaluates whether the Member State's management and control
system protects EU funds and complies with CAP financing, monitoring, and
clearance-of-accounts obligations. The auditor is an external oversight persona, not
an everyday platform user in the same sense as agency staff.

The Audit Evidence Agent may compile draft audit packs, but an autonomous draft is not
equivalent to audit acceptance. Evidence must be complete, reproducible, versioned,
and connected to the underlying source records.

### Goals

- Understand how Hungary's controls operate in policy and in practice.
- Reproduce samples and trace outcomes from declaration to payment.
- Assess AMS quality, model governance, human oversight, and exception handling.
- Verify that expenditure is legal and regular.
- Identify systemic weaknesses and quantify financial exposure.

### Requirements

- Read-only, least-privilege access or controlled export packages.
- Clear population definition and reproducible sample selection.
- Traceability across IACS, LPIS, satellite data, models, evidence, decisions, and
  payments.
- Model cards, validation results, release history, thresholds, drift records, and
  known limitations.
- Proof that agent actions followed approved policies and authority boundaries.
- Evidence of farmer notification, hearing, human review, and appeals for adverse cases.
- Tamper-evident logs and verifiable timestamps.
- Data minimisation and redaction for information not required by the audit.
- Signed-off audit packs with ownership, completeness checks, and source links.

### Key use cases

- **EA-01:** Trace a sampled payment back to eligibility evidence and controls.
- **EA-02:** Assess the annual quality of the Area Monitoring System.
- **EA-03:** Review a model or policy change that affected a significant population.
- **EA-04:** Investigate whether a control weakness warrants a financial correction.

---

## 12. Governance Persona: The Data Protection, AI Risk, and Compliance Officer

### Background

This composite persona covers independent oversight responsibilities that may in
reality be split among a Data Protection Officer, AI governance board, legal counsel,
information security, accessibility lead, and regulatory compliance teams. Discovery
must confirm the actual organisation and decision rights.

The system likely processes personal data, location data, farm business information,
geo-tagged photographs, model inferences, and decisions affecting access to public
benefits. It may therefore trigger GDPR impact-assessment duties and high-risk AI
obligations, in addition to CAP, accessibility, eIDAS, and administrative-law controls.

### Goals

- Ensure lawful, fair, transparent, and secure processing.
- Confirm that high-impact AI has effective human oversight.
- Prevent function creep and excessive retention.
- Make compliance demonstrable, not merely asserted.
- Ensure affected people can exercise their rights.

### Requirements

- Processing inventory, purposes, lawful bases, data categories, recipients, and
  retention schedules.
- DPIA and AI risk assessment linked to actual workflows and model releases.
- High-risk AI technical documentation, logging, validation, human-oversight design,
  robustness, and cybersecurity evidence.
- Data-subject and administrative-rights workflows that do not conflict.
- Privacy and accessibility testing before release.
- Bias/fairness evaluation across appropriate regions, farm types, schemes, and other
  legally permissible dimensions.
- Incident, complaint, model-failure, and rights-request registers.
- Authority to stop or condition deployment when controls are inadequate.

### Key use cases

- **CO-01:** Approve or reject a new data use or evidence type.
- **CO-02:** Review a model release and its human-oversight controls.
- **CO-03:** Investigate a complaint about automated treatment.
- **CO-04:** Verify retention and deletion of geo-tagged evidence.
- **CO-05:** Coordinate regulatory response after a data or AI incident.

---

## 13. Enabling Persona: The IT, Security, and Platform Operator

### Background

This persona operates the national portal, agent services, integrations, data
platform, identity, AKS workloads, and supporting Azure services. The platform is
payment-critical and falls within a public-administration cybersecurity context. The
repository also notes a ransomware scenario as a direct resilience concern.

### Goals

- Keep the service available, secure, recoverable, and observable.
- Protect farmer and agency data.
- Detect failures before they create missed deadlines or incorrect outcomes.
- Restore service within approved recovery objectives.
- Make changes safely without gaining access to unnecessary claim content.

### Requirements

- Strong identity, workload identity, secrets management, and privileged-access
  controls.
- Network segmentation and least-privilege service communication.
- Structured logs, metrics, traces, agent/tool-call observability, and security events.
- Correlation IDs from user interaction through agent, model, integration, and case
  outcome.
- Backup, disaster recovery, tested restoration, and degraded/manual operating modes.
- Supply-chain security, signed images, vulnerability management, and patch governance.
- NIS2-aligned incident detection, escalation, reporting, and evidence preservation.
- Prompt-injection, data-poisoning, malicious-file, and model-abuse protections.
- Capacity and cost monitoring for seasonal ingestion and inference peaks.
- Operational controls that do not allow administrators to alter official decisions
  without the normal case process.

### Key use cases

- **IT-01:** Detect and isolate a compromised agent or integration.
- **IT-02:** Recover service during a payment-critical outage.
- **IT-03:** Diagnose why an agent failed to complete a case action.
- **IT-04:** Deploy a versioned service change with rollback.
- **IT-05:** Produce operational evidence for a security or compliance investigation.

---

## 14. Enabling Persona: The Geospatial / Data Science Specialist

### Background

This persona develops and validates the parcel-monitoring capability using Sentinel-1,
Sentinel-2, LPIS parcel geometry, time-series processing, and potentially custom
computer-vision models. They bridge remote-sensing science and administrative use.

The specialist must account for clouds, revisit frequency, crop calendars, unusual
weather, radar/optical differences, parcel boundaries, mixed pixels, regional
variation, and activities that cannot be reliably observed remotely.

### Goals

- Produce accurate and calibrated crop/activity classifications.
- Know where the model is reliable and where it is not.
- Detect drift and data-quality problems early.
- Explain model behaviour to non-specialists.
- Improve quality without changing legal policy through model code.

### Requirements

- Versioned, reproducible training and evaluation datasets.
- Documented ground truth, labelling quality, and sampling strategy.
- Metrics by scheme, activity, crop, region, season, parcel type, and confidence band.
- Calibration, uncertainty estimation, and reject/abstain behaviour.
- Drift, data-quality, and out-of-distribution monitoring.
- Human override and appeal outcomes fed back as governed evaluation data, not
  automatically treated as labels.
- Model registry, approval gates, rollback, lineage, and technical documentation.
- Separation between model classification and legal eligibility logic.
- Tools to investigate clusters of false positives and systemic boundary errors.

### Key use cases

- **DS-01:** Train and validate a new seasonal model.
- **DS-02:** Recommend production confidence and escalation thresholds.
- **DS-03:** Investigate a rise in discrepancies for a region or crop.
- **DS-04:** Produce model evidence for an audit or contested decision.
- **DS-05:** Roll back or suspend an underperforming model.

---

## 15. Supporting Persona: The Farmer Association / Civil-Society Representative

### Background

Farmer associations, cooperatives, advocacy groups, and accessibility organisations
can represent patterns that individual case channels do not reveal. They can help the
agency test guidance, identify unintended impacts, and communicate change, while
remaining outside individual administrative decisions unless formally authorised.

### Goals

- Understand how the service affects different farmer groups.
- Identify inaccessible guidance, impractical evidence requests, or systemic errors.
- Participate in rollout and policy consultation.
- Build trust through transparent performance information.

### Requirements

- Published plain-language descriptions of AI use, rights, and escalation routes.
- Aggregate performance, complaint, appeal, and accessibility reporting.
- Structured consultation and issue-submission channels.
- Pilot participation and usability testing with diverse farmers.
- Protection against disclosure of individual or commercially sensitive farm data.

### Key use cases

- **FA-01:** Review and test farmer communication before rollout.
- **FA-02:** Raise a suspected systemic issue affecting a group of farmers.
- **FA-03:** Participate in periodic service and responsible-AI review.

---

## 16. End-to-End Use-Case Map

| Journey stage | Farmer-facing use case | Government use case | Agent support | Mandatory human control |
|---|---|---|---|---|
| Learn and prepare | Explore schemes and obligations | Publish approved guidance | Farmer Guidance Agent retrieves and explains current rules | Policy owner approves source rules and guidance boundaries |
| Draft | Prepare declarations and parcel details | Maintain reference data and validations | Agent pre-checks completeness and likely conflicts | Farmer confirms submission; material policy exceptions go to staff |
| Submit | Authenticate and submit claim | Register legally valid application | Agent validates format and issues receipt | Official record and deadlines governed by agency rules |
| Monitor | View claim/parcel status | Monitor all eligible parcels | Parcel Monitoring Agent classifies crop/activity time-series | Low-confidence and non-monitorable conditions abstain/escalate |
| Notify | Receive understandable discrepancy notice | Approve or supervise notification rules | Discrepancy Agent explains issue and requests approved evidence | No notice may imply a final adverse decision when it is not one |
| Respond | Correct, explain, or upload evidence | Review response and resolve exception | Agent validates evidence and may resolve bounded routine cases | Disputes, uncertainty, and adverse outcomes go to a human |
| Inspect | Cooperate with a targeted or validation visit | Collect unresolved or independently sampled field evidence, including authorised drone imagery where appropriate | Inspection Agent/queue packages and prioritises candidate tasks | Human authority orders the inspection; inspector independently records findings |
| Decide | Receive payment or proposed adverse measure | Apply rule and record reason | Agent assembles evidence and drafts explanation | Human decides sanctions and contested adverse measures |
| Appeal | Access file and challenge decision | Review appeal independently | Agent organises the record and deadlines | Competent human authority determines appeal |
| Audit | Understand retained record where relevant | Demonstrate control effectiveness | Audit Evidence Agent compiles traceable packs | Agency owner signs off; auditor independently assesses |

## 17. Shared Information Model Requirements

Every material case record should be able to answer:

- **Who** performed the action: farmer, representative, official, agent, service, model,
  or external auditor?
- **Under what authority** did they act?
- **What declaration or condition** was being assessed?
- **Which policy and legal version** applied?
- **What evidence** was available, and where did it come from?
- **Which model and configuration** produced an inference?
- **How confident and complete** was the evidence?
- **What action or recommendation** followed?
- **Was a human required, and who reviewed it?**
- **What did the farmer receive and when?**
- **What response or appeal opportunity** was available?
- **What was the final outcome**, payment impact, and reason?

## 18. Persona-Specific Success Measures

| Persona | Useful measures |
|---|---|
| Farmer | Time to payment, task completion, avoidable resubmission, successful assisted-service access, complaint rate, explanation comprehension, appeal outcome |
| Adviser | Claims managed per user, deadline misses, cross-client errors, delegation incidents, correction rate |
| Caseworker | Queue age, first-contact resolution, repeat evidence requests, human override quality, cases resolved before payment deadline |
| Inspector | Travel per resolved case, repeat visits, evidence completeness, offline sync failures, targeted-question resolution |
| Legal officer | Procedural-defect rate, overturned decisions, time to reasoned decision, consistency, remand rate |
| Programme owner | Financial corrections, payment timeliness, inspection cost, automation with safe abstention, backlog, farmer satisfaction |
| Ministry official | Scheme uptake, regional impacts, rule-related discrepancy rate, policy implementation outcomes |
| EU auditor | Time to reproduce sample, missing evidence rate, control findings, unresolved lineage gaps |
| Compliance officer | Rights-request performance, unresolved high risks, incidents, control exceptions, accessibility defects |
| Platform operator | Availability, recovery time, failed agent actions, security incidents, seasonal capacity, cost per parcel/claim |
| Data scientist | Precision/recall by cohort, calibration, abstention quality, drift, false-positive burden, model rollback frequency |

No measure should be used alone. For example, increasing the automation rate while
also increasing appeals, farmer confusion, or human overrides is not a successful
outcome.

## 19. Discovery and Validation Plan

These personas should be validated before detailed service and agent design.

### Interviews and observation

- Farmers representing different farm sizes, schemes, regions, accessibility needs,
  digital confidence, connectivity, and representation models.
- Agricultural advisers who manage multiple claims.
- Caseworkers handling routine claims, discrepancies, complaints, and peak-season
  backlogs.
- Inspectors in field conditions, including offline work.
- Legal/sanctions and appeal staff.
- Programme operations, Ministry policy, DPO/compliance, security, and model teams.
- EU audit liaison staff and, where feasible, external audit stakeholders.

### Evidence to collect

- Current claim and discrepancy journey maps.
- Forms, letters, notification templates, and appeal decisions.
- Queue volumes, handling times, deadlines, and seasonal peaks.
- Root causes of current errors and financial corrections.
- Inspection selection rules, costs, outcomes, and repeat-visit rates.
- Portal analytics, contact-centre topics, complaints, and accessibility findings.
- Representative LPIS and IACS data-quality problems.
- Existing delegation and identity processes.
- Current audit-pack requirements and annual AMS quality-assessment outputs.
- Historical model or remote-sensing accuracy by scheme and region, if available.

### Questions that must remain open until validated

1. What distinct farmer segments materially change the service design?
2. Which channels and assisted-service routes are currently available?
3. What actions can caseworkers take without secondary approval?
4. What evidence may the Discrepancy Resolution Agent accept autonomously?
5. Which conditions are genuinely monitorable, partially monitorable, or
   non-monitorable for each scheme?
6. What confidence and data-quality thresholds trigger automatic resolution,
   farmer contact, caseworker review, or inspection?
7. What are the formal sanction and appeal decision authorities?
8. What audit-pack formats and retention periods are mandatory?
9. Which fairness dimensions may lawfully and meaningfully be evaluated?
10. What service levels apply to notices, farmer responses, human review, payment, and
    appeals?
11. What manual or degraded process is used during a cyber incident or major outage?
12. Which persona owns the final decision to suspend a model or agent?

## 20. Recommended Initial Use-Case Scope

For a first demonstrable release, focus on a narrow but complete journey rather than
attempting every persona at once:

1. Farmer reviews a pre-filled parcel declaration and receives plain-language guidance.
2. Parcel Monitoring Agent identifies either a confident match or an uncertain
   discrepancy from a versioned Sentinel time-series result.
3. Farmer receives an explanation and submits approved evidence.
4. Discrepancy Resolution Agent resolves a clearly bounded routine case or escalates.
5. Caseworker reviews the complete evidence trail and records a decision.
6. Audit Evidence Agent produces a traceable draft evidence pack.

This slice demonstrates farmer value, bounded autonomy, human oversight, geospatial
evidence, administrative due process, and auditability without requiring autonomous
sanctioning or a national-scale rollout.

## 21. Repository Sources

This document is based on the following repository material:

- [`../../case/case-study-47.md`](../../case/case-study-47.md) — business challenge,
  transformation objective, agent roles, outcomes, and authority boundary.
- [`../../case/casestudy/case-understanding-presentation.md`](../../case/casestudy/case-understanding-presentation.md)
  — stakeholder and business-context summary.
- [`../../case/casestudy/solution-design-questions.md`](../../case/casestudy/solution-design-questions.md)
  — explicit stakeholder, workflow, governance, accessibility, and technical unknowns.
- [`../research/hungary-agriculture-administration.md`](../research/hungary-agriculture-administration.md)
  — paying-agency responsibilities and farmer-facing digital context.
- [`../research/cap-subsidy-overview.md`](../research/cap-subsidy-overview.md) — CAP goals,
  funding structure, and farmer obligations.
- [`../regulatory-compliance/area-monitoring-system.md`](../regulatory-compliance/area-monitoring-system.md)
  — full-coverage monitoring, Sentinel/geotagged evidence, IACS/LPIS, and annual quality
  assessment.
- [`../regulatory-compliance/cap-horizontal-regulation.md`](../regulatory-compliance/cap-horizontal-regulation.md)
  — management/control systems and financial-correction context.
- [`../regulatory-compliance/cap-strategic-plan-regulation.md`](../regulatory-compliance/cap-strategic-plan-regulation.md)
  — national scheme and eligibility context.
- [`../regulatory-compliance/right-to-good-administration.md`](../regulatory-compliance/right-to-good-administration.md)
  — right to be heard, file access, timely handling, and reasoned decisions.
- [`../regulatory-compliance/gdpr.md`](../regulatory-compliance/gdpr.md) — personal-data
  principles, rights, security, and impact assessment.
- [`../regulatory-compliance/eu-ai-act.md`](../regulatory-compliance/eu-ai-act.md) — high-risk
  AI governance, logging, transparency, oversight, accuracy, and robustness.
- [`../regulatory-compliance/eidas-regulation.md`](../regulatory-compliance/eidas-regulation.md)
  — electronic identity and legally reliable submissions.
- [`../regulatory-compliance/web-accessibility-directive.md`](../regulatory-compliance/web-accessibility-directive.md)
  — public-sector web and mobile accessibility.
- [`../regulatory-compliance/nis2-directive.md`](../regulatory-compliance/nis2-directive.md)
  — cybersecurity risk management, continuity, and incident reporting.
- [`../architecture/copernicus-ai-solution-architecture.md`](../architecture/copernicus-ai-solution-architecture.md)
  — proposed platform, data flow, operations, and technical components.
