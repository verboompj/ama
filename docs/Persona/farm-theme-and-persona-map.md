# Field & File: Farm Theme, Persona Map, and Visual Identity

![Field & File logo](../../assets/field-and-file-logo.svg)

## 1. Creative Direction

**Field & File** is the presentation theme for the CAP subsidy verification case
study. It uses the appeal of an observational farm documentary: practical work,
unpredictable weather, expensive mistakes, strong personalities, and the recurring
collision between agricultural reality and administrative rules.

The theme is inspired by the *kind* of tension made accessible by programmes such as
*Clarkson's Farm*, but it is not a reproduction of that programme. It must not use its
name as the case-study brand, imitate its logo, reproduce dialogue or storylines, use
programme imagery, or present fictional personas as its real cast. Field & File is an
original identity for a fictional Hungarian farm and paying agency.

### Theme proposition

> A farming year seen from both sides of the gate: the people working the land and
> the people responsible for turning evidence into a fair public decision.

The theme gives a human shape to an otherwise technical architecture:

- the **field** represents crops, weather, soil, parcels, and farmer experience;
- the **file** represents claims, rules, evidence, decisions, and auditability;
- the **satellite signal** connects physical conditions to digital observations;
- the **check mark** represents verified evidence, not automatic approval;
- the journey **from parcel to payment** connects every persona and system component.

## 2. Fictional Setting

The story follows **Napraforgó Farm**, a fictional mixed arable farm in Hungary.
“Napraforgó” means sunflower and gives the setting local agricultural character
without referring to a real beneficiary.

The farm grows a seasonal mix of wheat, maize, sunflower, and cover crops across
parcels with different sizes and boundary conditions. Its income depends partly on
CAP support. The owners understand farming but do not necessarily understand remote
sensing, administrative law, or AI confidence scores.

The second recurring location is the fictional **National Agricultural Support
Office**, representing the paying agency. It is responsible for processing claims,
operating the Area Monitoring System, resolving discrepancies, conducting
inspections, protecting due process, and providing an audit trail.

The narrative should never imply that one side is foolish or obstructive. Farmers
have practical knowledge and financial exposure; officials have legal obligations
and public accountability. Most useful tension comes from incomplete evidence,
different vocabulary, time pressure, and uncertainty rather than from villains.

## 3. Seasonal Story Arc

The case can be presented as one agricultural year. Each chapter introduces a
business problem before showing the relevant data, agent, service, and control.

| Chapter | Farm event | Administrative event | Main question |
|---|---|---|---|
| 1. Winter planning | Crop plan and cash-flow forecast | New scheme rules are published | What support is available, and what must the farmer do? |
| 2. Spring declaration | Fields are prepared and sown | The CAP claim is drafted and submitted | Are the parcels, crops, and commitments declared correctly? |
| 3. Early monitoring | Crops emerge unevenly and the farmer records a material event in the app | Sentinel observations and farmer evidence begin accumulating | Does observed activity agree with the declaration, and is timely context already available? |
| 4. The anomaly | Weather or replanting changes one parcel | The system detects a possible mismatch | Is this an error, a valid exception, or uncertain evidence? |
| 5. Evidence | The farmer reuses or submits a guided geo-tagged photo | A caseworker reviews claimant-supplied and remote evidence | Can the question be resolved fairly without independent inspection? |
| 6. Field survey | An inspector uses ground observation or an authorised drone mission | Structured imagery and findings enter the case file | What can close-range evidence establish that Copernicus could not? |
| 7. Autumn advance | Harvest and farm cash-flow needs converge | Eligible advances may begin from 16 October after sufficient controls | Is an eligible amount established for an advance without hiding unresolved issues? |
| 8. Final payment and audit | The farm plans the next season | Balance decisions, payments, appeals, and control-system audit continue | Can every amount and conclusion be explained and reproduced? |

This structure keeps the architecture grounded in user consequences. A satellite
classification is never the end of a chapter; the end is a clear next step, a
resolved exception, a human decision, or auditable evidence.

Farmer photo capture is a recurring capability across the season rather than a feature
revealed only after an exception. It remains optional unless an approved scheme rule
or proportionate evidence request requires it. Independent random validation and
surveyor findings remain separate from claimant-supplied evidence.

Payment is not triggered directly by sowing or harvest. The storyline distinguishes
agricultural events, evidence acceptance, eligibility calculation, advance readiness,
advance payment, and final balance. The detailed calendar is documented in
[CAP Claim and Payment Calendar](../research/cap-claim-and-payment-calendar.md).

## 4. Persona-to-Cast Map

These are narrative roles, not comedy impressions or copies of television
personalities. Each character represents an existing design persona documented in
[Personas and Use Cases](./personas-and-use-cases.md).

| Existing persona | Field & File role | Narrative function | Typical scene | Product touchpoint |
|---|---|---|---|---|
| Farmer / CAP applicant | **The Farmer** | Keeps the consequences real: crops, weather, deadlines, and cash flow | Finds that a replanted parcel no longer matches the original declaration | Farmer portal, parcel map, guidance agent, evidence upload |
| Agricultural adviser / authorised representative | **The Farm Adviser** | Translates policy language into a workable farm plan | Reviews several parcels before the claim deadline | Delegated access, claim pre-check, client dashboard |
| Paying-agency caseworker | **The Caseworker** | Connects automated monitoring to lawful administration | Opens an exception with conflicting satellite and farmer evidence | Case workspace, discrepancy explanation, decision support |
| Field inspector | **The Inspector** | Provides independent physical evidence for unresolved and randomly sampled parcels | Surveys a small or cloud-obscured parcel by ground and authorised drone | Mobile inspection plan, offline map, drone manifest, evidence capture |
| Legal and sanctions officer | **The Decision Guardian** | Protects due process when consequences become adverse | Reviews a proposed reduction and the farmer's response | Legal review queue, rule version, reasoned-decision record |
| Programme owner / operations manager | **The Operations Lead** | Shows national scale, queues, deadlines, and service performance | Responds to a monitoring backlog before payment deadlines | Operational dashboard, SLA alerts, exception trends |
| Ministry policy official | **The Policy Owner** | Connects political intent to executable rules | Assesses whether an eco-scheme is producing the intended outcome | Policy analytics, scheme versioning, aggregate reporting |
| EU Commission auditor | **The Auditor** | Tests whether claims and controls are reproducible | Selects a sample and reconstructs why payment was made | Evidence pack, lineage view, immutable audit record |
| Data protection, AI risk, and compliance officer | **The Safeguards Officer** | Challenges unnecessary data use and unsafe automation | Reviews model inputs, retention, and human-oversight controls | AI inventory, DPIA evidence, model and prompt logs |
| IT, security, and platform operator | **The Platform Engineer** | Makes reliability and security visible | Handles a service failure during an evidence deadline | AKS operations, queues, observability, recovery controls |
| Geospatial / data science specialist | **The Earth Observation Specialist** | Explains what satellite data can and cannot prove | Investigates low confidence caused by mixed pixels | Feature pipeline, model evaluation, prediction store |
| Farmer association / civil-society representative | **The Farmer Advocate** | Tests accessibility, fairness, and trust beyond one farm | Raises a pattern of false alerts affecting small parcels | Outcome analytics, complaints, consultation and appeal data |

### Persona group treatment

#### The farm team

The Farmer and Farm Adviser should be shown in the physical context of the farm:
weather, machinery, crops, mobile connectivity, and competing work. Their screens
must use plain language and focus on actions, dates, affected parcels, and financial
consequences.

#### The public-service team

The Caseworker, Inspector, and Decision Guardian should be shown as accountable
professionals rather than faceless bureaucracy. Their tools need evidence provenance,
policy versions, uncertainty, deadlines, and clear authority boundaries.

#### The governance team

The Operations Lead, Policy Owner, Auditor, and Safeguards Officer see aggregate
patterns or reconstructed decisions. Their story is about whether the service is
effective, lawful, fair, and reproducible—not merely whether model accuracy is high.

#### The enabling team

The Platform Engineer and Earth Observation Specialist operate the system but do not
decide entitlement. Their scenes make separation of duties explicit: they can restore
a service or recommend a model threshold, but they cannot approve, reduce, or sanction
a claim.

## 5. Character Design Principles

Characters should feel recognisable without becoming caricatures.

1. **Competent but bounded.** Every person has expertise and blind spots.
2. **Different vocabularies.** The farmer speaks in fields and seasons; the specialist
   speaks in observations and confidence; the official speaks in rules and evidence.
3. **Consequences before technology.** Start with the missed payment, unclear parcel,
   or inspection journey—not with an Azure service.
4. **Humour from situations, not humiliation.** Weather, forms, machinery, and
   mismatched terminology can provide lightness. Avoid mocking farmers, civil
   servants, rural communities, or accessibility needs.
5. **No AI hero character.** Agents assist the cast; they are not magical colleagues
   and never replace accountable human authority.
6. **Visible disagreement.** A useful story allows the farmer's account, satellite
   signal, and rule interpretation to differ until evidence resolves the case.
7. **Fiction is labelled.** Names, farms, screenshots, claims, and measurements used
   in the presentation must be explicitly identified as synthetic.

## 6. Brand Name and Voice

### Name

**Field & File**

The alliteration makes the name memorable, while the ampersand shows that agricultural
reality and administration are part of one service—not opposing systems.

### Tagline

**From parcel to payment**

Alternative supporting lines:

- Evidence from the field. Decisions people can understand.
- See the crop. Explain the signal. Protect the decision.
- One farming year. Every claim traceable.

### Voice

| Attribute | Use | Avoid |
|---|---|---|
| Practical | “This parcel needs another observation before a conclusion is possible.” | Abstract transformation language |
| Plain-spoken | Explain NDVI or confidence in ordinary terms before technical detail | Unexplained acronyms and model jargon |
| Dryly human | Acknowledge weather, deadlines, and real operational friction | Forced jokes or television catchphrases |
| Fair | Present the farmer's and agency's evidence side by side | Treating a model flag as proof of wrongdoing |
| Precise | Name the parcel, date, rule, source, and uncertainty | “The AI says the claim is wrong” |
| Calm | Give a clear next action and deadline | Alarmist messages for low-confidence observations |

## 7. Logo

The logo in [`assets/field-and-file-logo.svg`](../../assets/field-and-file-logo.svg)
combines five elements:

1. a **dark square parcel** as the dependable administrative frame;
2. a **green field** for the working landscape;
3. **gold crop rows** for the seasonal and economic outcome;
4. a **blue signal** for Copernicus observations and digital communication;
5. a **white check** for verified, reviewable evidence.

The check must not be described as “AI approval.” It means that evidence has moved
through a controlled verification process.

### Logo usage

- Keep clear space around the mark equal to at least half the icon's corner radius.
- Use the full lock-up on title slides, repository pages, and section dividers.
- The square icon may be used alone for diagrams or avatars only when the Field & File
  name appears elsewhere.
- Place it on cream or white backgrounds whenever possible.
- Do not recolour individual elements, stretch the mark, add shadows, or place it over
  detailed satellite imagery.
- Do not combine it with the name, logo, typography, or visual marks of *Clarkson's
  Farm* or any broadcaster.

## 8. Colour System

The palette combines soil, crops, harvest, sky, and administrative ink. Colour must
support meaning but never be the only way that status is communicated.

| Token | Hex | Meaning | Recommended use |
|---|---|---|---|
| **Ink** | `#1E2521` | Authority, clarity, legibility | Main text, navigation, diagram outlines |
| **Soil** | `#4A3528` | Land, practical work, permanence | Secondary headings, farm-side accents |
| **Crop** | `#52734D` | Healthy fields, normal progress | Primary brand colour, positive status with text/icon |
| **Harvest** | `#D9A441` | Attention, season, value | Highlights, selected parcels, callouts |
| **Signal** | `#5B8FA8` | Satellite data, digital services | Data flows, links, observation layers |
| **Cream** | `#F5F0E6` | Paper, warmth, accessibility | Main background and cards |
| **White** | `#FFFFFF` | Space and evidence surfaces | Tables, maps, case-file panels |
| **Action red** | `#B33A3A` | Deadline or confirmed blocking issue | Sparingly, always with label and icon |

### Accessible combinations

- Use **Ink on Cream or White** for body text.
- Use **White on Ink, Soil, or Crop** for large labels and title bands.
- Use Harvest as an accent, not as small text on a light background.
- Pair status colours with words and icons: `Action required`, `Under review`,
  `Verified`, or `Unable to determine`.
- Use patterns or outlines as well as colour to distinguish crop classes on maps.
- Validate presentation and application combinations against WCAG contrast
  requirements before implementation.

## 9. Typography

Use typography that balances rural editorial character with public-service clarity.

| Role | Typeface | Fallback | Use |
|---|---|---|---|
| Display and chapter titles | **Roboto Slab** | Georgia, serif | Story chapters, persona names, key statements |
| Interface and body | **Segoe UI** | Arial, sans-serif | Body text, diagrams, tables, UI concepts |
| Technical evidence | **Cascadia Mono** | Consolas, monospace | Parcel IDs, model versions, timestamps, dataset lineage |

Typography should remain restrained:

- use sentence case rather than all caps for headings;
- reserve uppercase with letter spacing for short labels and the tagline;
- use bold to show hierarchy, not to simulate shouting;
- keep technical identifiers visually separate from farmer-facing explanations;
- do not imitate the typography or hand-painted signage of the television programme.

## 10. Imagery and Illustration

### Preferred imagery

- wide agricultural landscapes with visible parcel structure;
- close views of crops, soil, machinery, and evidence collection;
- maps and Sentinel imagery paired with an explanation of observation dates;
- people using the service in realistic contexts rather than posed “AI” imagery;
- contrasting field and office views to reinforce the Field & File concept;
- seasonal sequences showing that crop classification depends on time series.

### Avoid

- imagery, screenshots, locations, cast likenesses, or promotional assets from
  *Clarkson's Farm*;
- glowing brains, humanoid robots, or unexplained AI-generated dashboards;
- presenting a single attractive satellite image as sufficient crop proof;
- idyllic stock photography that hides weather, mud, small parcels, or accessibility;
- red overlays that imply fraud before a case has been reviewed.

### Graphic motif

Use a **split-frame motif**:

- left side: field, parcel, crop, or farmer evidence;
- right side: claim, rule, case status, or audit record;
- centre connector: a Signal-blue line showing the observation or workflow;
- footer: source, date, confidence, and responsible decision-maker.

This motif can also structure architecture slides: physical world on the left, digital
processing in the centre, and accountable public decision on the right.

## 11. Icons and Data Visualisation

Use simple line icons with rounded corners and consistent stroke widths.

| Concept | Icon metaphor |
|---|---|
| Farmer action | Boot or field gate |
| Parcel | Outlined irregular field |
| Satellite observation | Signal arcs over a parcel |
| Evidence | Document with location pin |
| Human review | Eye or person beside a checklist |
| Rule | Open policy book |
| Payment | Coin or bank transfer arrow |
| Audit | Magnifier over a timeline |
| Uncertainty | Dashed parcel with question mark |
| Agent assistance | Speech bubble with a small tool symbol |

Charts should use Crop, Harvest, and Signal as the main series colours. Action red is
reserved for actual deadlines, failed controls, or confirmed exceptions. Model
confidence should use labelled ranges rather than a red-to-green “truth meter.”

## 12. Applying the Theme to the Architecture

The theme changes presentation, not authority or technical boundaries.

| Narrative object | Architecture equivalent |
|---|---|
| Farm notebook | Farmer portal and claim draft |
| Adviser checklist | Farmer Guidance Agent with cited scheme rules |
| View from above | Sentinel-1 and Sentinel-2 time series |
| Parcel history | Prediction Result Store and observation lineage |
| Agency in-tray | Service Bus queue and case-management workflow |
| Specialist's interpretation | Crop-scoring adapter and model explanation |
| Case conference | Interactive agent API plus authoritative case services |
| Signed decision | Deterministic rules, human approval, and case record |
| Audit box | Immutable evidence pack with model, rule, tool, and dataset versions |

Agents should be described as **farm-to-file assistants**:

- they retrieve and explain;
- they prepare and route;
- they identify missing evidence;
- they never silently change the authoritative claim;
- they never make an adverse payment or sanction decision.

## 13. Suggested Presentation Structure

1. **Cold open — “The field says one thing; the file says another.”**
   Introduce the anomaly and its financial significance.
2. **Meet the farm.** Introduce the Farmer, Adviser, parcels, crops, and seasonal plan.
3. **Meet the office.** Introduce the Caseworker, Inspector, and accountability chain.
4. **The claim journey.** Show the eight seasonal chapters.
5. **What the satellite sees.** Explain time series, resolution, weak labels, and
   uncertainty.
6. **What the agents do.** Map each bounded agent to a persona need.
7. **What only people decide.** Show authority boundaries and due process.
8. **Behind the gate.** Present the AKS-centred, Foundry-backed architecture.
9. **The difficult parcel.** Walk through one discrepancy end to end.
10. **The audit replay.** Reproduce the evidence, rule, model, prompts, tools, and
    human decision.
11. **The outcome.** Measure timely payment, fewer avoidable inspections, explainable
    decisions, and farmer trust.

## 14. Reusable Story Scenario

The Farmer declares sunflower on parcel `HU-DEMO-047-12`. Persistent cloud limits
optical observations during emergence, while Sentinel-1 radar indicates agricultural
activity. Later observations suggest the parcel may contain maize or may have been
replanted after weather damage.

The system must not convert that uncertainty into an accusation. Instead:

1. the Parcel Monitoring workflow records the conflicting observations;
2. the Farmer receives a plain-language explanation and valid response options;
3. the Farmer explains that storm damage required replanting and submits dated,
   geo-tagged evidence;
4. the Caseworker sees the declaration, time series, model confidence, farmer
   explanation, and applicable rule in one view;
5. if evidence remains insufficient, the Inspector receives a bounded field task;
6. when justified and lawful, the Inspector flies a scoped drone mission that adds
   close-range imagery without replacing the seasonal Copernicus record;
7. the Decision Guardian reviews any proposed adverse consequence;
8. the Auditor can later reconstruct every data source and decision.

This scenario includes the whole Field & File identity: real farm uncertainty,
satellite capability and limitations, agent assistance, human authority, and
auditable public administration.

## 15. Guardrails

- Field & File is an original case-study theme, not an endorsed adaptation or
  affiliation.
- Use only licensed, repository-owned, public-domain, or properly attributed imagery.
- Never use real claimant data or imply that synthetic characters are real people.
- Keep humour away from payment hardship, sanctions, disability, privacy, and appeal.
- Never label a farmer as fraudulent based only on a risk score or model result.
- Preserve the terminology and controls in the architecture and persona documents;
  narrative simplification must not misstate what the technology can establish.
- Put a fiction notice on public presentations and demonstrations.

## 16. Relationship to Existing Documentation

This document defines the narrative and visual layer. Detailed requirements remain in:

- [Personas and Use Cases](./personas-and-use-cases.md);
- [AKS-Centred Foundry Architecture](../architecture/aks-centered-foundry-architecture.md);
- [Crop Classification Goal](../copernicus/crop-classification/README.md);
- [Agricultural Analysis Use Case](../copernicus/crop-classification/agricultural-analysis-use-case.md);
- [High-Resolution Data Strategy](../copernicus/crop-classification/high-resolution-data-strategy.md).

If the story and the detailed documents differ, the detailed policy, persona, data,
and architecture requirements take precedence.
