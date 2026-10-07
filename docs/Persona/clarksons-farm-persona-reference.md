# Clarkson's Farm: Persona Reference Map

## 1. How to Use This Mapping

The cast provides recognisable reference points for the farm side of the case:
**Jeremy as the Farmer, Charlie as the Adviser, Kaleb as the Farm Operations Lead,
Gerald as the Experienced Field Contributor, and Lisa as the Farm Business
Administrator.**

These are role analogies, not assertions about anyone's real subsidy applications,
access permissions, or behaviour. The proposed CAP process remains fictional and
Hungarian; the programme's setting is British. Do not assume its regulatory events
are examples of Hungarian CAP administration.

The formal requirements and decision rights remain in
[Personas and Use Cases](./personas-and-use-cases.md). The presentation identity
remains [Field & File](./farm-theme-and-persona-map.md), not a branded adaptation of
the programme.

## 2. The Farm Team

| Cast reference | Relevant public role | Case-story role | Mapping strength and boundary |
|---|---|---|---|
| **Jeremy Clarkson** | Farm owner and farmer in the programme | **The Farmer / CAP Applicant** | Strong: plans the farm, approves declarations, faces weather and cash-flow consequences, responds and contests. This does not imply any real claim history. |
| **Charlie Ireland** | Farm-management and agricultural adviser; specialises in strategic planning | **The Farm Adviser / Authorised Representative** | Strong functional match: interprets obligations, pre-checks declarations, coordinates evidence and deadlines. In the fictional service, acting for the farmer requires explicit delegation. He is not a ministry policy setter or sanction officer. |
| **Kaleb Cooper** | Hands-on farmer; farming operations and farm-management role in the series | **The Farm Operations Lead** | Strong farm-side match: knows what was planted, replanted, harvested, or done on a particular date. An operational facet of the Farmer persona, not the national paying-agency Operations Manager. |
| **Gerald Cooper** | Experienced farm contributor; construction and practical maintenance role in the programme | **The Experienced Field Contributor** | Partial but useful: brings practical context about field access, physical features, and maintenance. He is not an independent agency inspector, cadastral surveyor, or qualified drone operator merely because he works on the farm. |
| **Lisa Hogan** | Runs the farm shop and supports its commercial activity | **The Farm Business Administrator** | Partial: a reference for business coordination, deadlines, records, and understanding payment status. Shop management does not establish real CAP-administration duties; fictional claim access requires delegated authority. |

**Charlie makes the plan; Kaleb makes the field activity happen; Gerald adds practical
field context; Lisa keeps the business-facing work coordinated; Jeremy owns the
claim and its consequences.** This is a proposed narrative division, not a claim
that the programme depicts these exact CAP responsibilities.

Kaleb, Gerald, and Lisa do not require three new top-level service personas. They
make the existing Farmer and Authorised Representative personas more concrete.
If a prototype later needs distinct worker permissions, define those task-scoped
capabilities explicitly rather than granting every farm employee full claim access.

## 3. Mapping the Complete Persona Catalogue

Not every design persona has a named counterpart in the principal cast. Keeping
those gaps visible is better than inventing administrative authority for a familiar
farm character.

| Existing design persona | Cast reference or narrative treatment | What carries across |
|---|---|---|
| Farmer / CAP applicant | **Jeremy**, supported by Kaleb's field knowledge | Claim ownership, farm reality, evidence, deadlines, and payment consequences |
| Agricultural adviser / authorised representative | **Charlie**; Lisa is a partial administrative supporting reference | Translating obligations into action and coordinating authorised work |
| Paying-agency caseworker | **No direct named farm-cast counterpart**; retain the fictional Caseworker | Public-authority case review is a different responsibility from advising the farmer |
| Field inspector | **No direct named farm-cast counterpart**; retain **Eszter**, the fictional surveyor | Independent ground/drone findings; Kaleb and Gerald provide claimant-side context, not independent validation |
| Legal and sanctions officer | **No direct named farm-cast counterpart**; retain the Decision Guardian | Reasoned adverse decisions, hearing rights, and appeal safeguards |
| Programme owner / paying-agency operations manager | **No direct counterpart**; retain the agency Operations Lead | National queues and payment service levels; Kaleb manages farm work, not the paying agency |
| Ministry policy official | **No direct counterpart**; retain the Policy Owner | Scheme design and policy accountability; Charlie explains rules but does not make them |
| EU Commission auditor | **No direct counterpart**; retain the Auditor | Independent reconstruction of controls, decisions, and expenditure |
| Data protection, AI risk, and compliance officer | **No direct counterpart**; retain the Safeguards Officer | Lawful processing, oversight, model governance, and retention |
| IT, security, and platform operator | **No direct counterpart**; retain the Platform Engineer | Digital reliability and security; Gerald's practical maintenance role is not an IT-security equivalence |
| Geospatial / data science specialist | **No direct counterpart**; retain the Earth Observation Specialist | Technical satellite/model expertise; Charlie and Kaleb contribute domain knowledge, not model approval authority |
| Farmer association / civil-society representative | **Jeremy and Kaleb as an illustrative farmer-facing perspective**, not actual appointed representatives | Communicating practical farmer impact; formal collective representation remains a separate role |

The programme's interactions with local government can illustrate the broad
farm/public-authority interface. They are not a one-to-one mapping of a local
planning council to a CAP paying agency, ministry, auditor, or sanctions office.
Do not turn officials into generic antagonists.

## 4. Using the References in the Business Process

The [business-process flow](../architecture/business-process-flow.md) can be explained
using these reference roles without changing its architecture or legal controls.

| Business stage | Farm-side reference | Agency-side responsibility |
|---|---|---|
| Plan the season | Jeremy sets objectives; Charlie explains obligations; Kaleb tests operational feasibility | Policy Owner publishes approved rules and evidence windows |
| Prepare the claim | Charlie prepares/pre-checks; Jeremy reviews and submits; Lisa can coordinate records if authorised | Case service records the claim version and reliable receipt |
| Capture normal evidence | Kaleb records a purposeful crop/activity photo; Gerald contributes field context where relevant | Evidence service validates and registers claimant-supplied material |
| Explain an apparent mismatch | Jeremy gives the account; Charlie relates it to the rule; Kaleb provides dates and field activity | Caseworker assesses the scoped question and uncertainty |
| Perform an independent check | Farm team facilitates access and provides context, without replacing the selected observation | Eszter records an independent ground/drone finding before AI suggestions |
| Establish and pay entitlement | Jeremy and any delegated administrator see established, authorised, and paid amounts separately | Agency confirms readiness; the authorised treasury system executes and reconciles |
| Contest an adverse outcome | Jeremy responds or delegates Charlie to assist | Decision Guardian provides due process and a reasoned decision; appeal remains available |

The role names are presentation references only. Use fictional identities and
synthetic records in screenshots and demonstrations, not real cast identities
registered as claimants.

## 5. Example Scene: Replanting Meets an Uncertain Satellite Signal

This is an invented case example, not an episode synopsis.

Jeremy's fictional counterpart declares a sunflower parcel. A weather event leads
Kaleb's counterpart to replant part of it. Charlie's counterpart checks whether a
claim amendment is needed. Lisa's counterpart, if authorised, tracks the response
deadline and receipt. Gerald's counterpart contributes practical context about an
access point or physical feature relevant to interpreting the farmer evidence.

The app registers a purposeful farmer photo with capture time and location context.
Cloud and mixed pixels still prevent Sentinel monitoring from settling the whole
parcel. The Caseworker requests a focused explanation rather than treating the model
as proof of wrongdoing.

If the scoped question remains unresolved, Eszter performs an approved ground/drone
inspection and attests independent findings. The Caseworker combines those findings
with the seasonal record; authorised officials apply the rules. A separately selected
random check still proceeds even if the farmer's explanation is convincing.

Any earlier payment benefit comes from resolving avoidable holds or an outstanding
balance within the legal calendar, not from paying automatically when Kaleb uploads
a photo or Jeremy harvests a field.

## 6. Presentation Guardrails and Sources

Use factual names and professional roles as comparative references. Do not copy
programme dialogue, images, logos, character impressions, or episode storylines,
and do not imply cast or broadcaster endorsement. Avoid using accents, personal
traits, or private circumstances as product requirements or comedy devices.

Public professional-role sources:

- [Amazon: Everything you need to know about Clarkson's Farm](https://www.aboutamazon.com.au/news/entertainment/everything-you-need-to-know-about-clarksons-farm)
  describes the principal cast, Lisa's shop role, Gerald's construction role, and
  the farm-team setting.
- [Ceres Rural: Charlie Ireland](https://www.ceresrural.co.uk/team/charlie-ireland/)
  describes his farm-management, consultancy, and strategic-planning expertise.
- [Prime Video: Clarkson's Farm, Season 3](https://www.primevideo.com/detail/0HO8ENK0AIDHSLMA7DJV43S6YS/)
  provides the programme context for Kaleb's farm-management role.

All CAP workflow assignments above are this repository's proposed analogies, not
facts supplied by those sources.
