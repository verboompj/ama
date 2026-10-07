# Clarkson's Farm: Persona Reference Map

## 1. How to Use This Mapping

The mapping uses exactly two characters and two existing personas:
**Jeremy Clarkson as Farmer / CAP applicant** and **Charlie Ireland as
Agricultural adviser / authorised representative**.

One character maps to each of these personas. The other catalogue personas remain
unassigned to programme characters; no additional personas or permissions are introduced.

These are role analogies, not assertions about anyone's real subsidy applications,
access permissions, or behaviour. The proposed CAP process remains fictional and
Hungarian; the programme's setting is British. Do not assume its regulatory events
are examples of Hungarian CAP administration.

The formal requirements and decision rights remain in
[Personas and Use Cases](./personas-and-use-cases.md). The presentation identity
remains [Field & File](./farm-theme-and-persona-map.md), not a branded adaptation of
the programme.

## 2. Characters to Existing Personas

| Cast reference | Relevant public role | Existing catalogue persona | Mapping strength and boundary |
|---|---|---|---|
| **Jeremy Clarkson** | Farm owner and farmer in the programme | **Farmer / CAP applicant** | Strong: plans the farm, approves declarations, faces weather and cash-flow consequences, responds and contests. This does not imply any real claim history. |
| **Charlie Ireland** | Farm-management and agricultural adviser; specialises in strategic planning | **Agricultural adviser / authorised representative** | Strong functional match: interprets obligations, pre-checks declarations, coordinates evidence and deadlines. Acting for the farmer requires explicit delegation; this does not confer policy or sanction authority. |

The existing persona's requirements and authority remain unchanged. A character
reference does not make a farm employee an account holder, grant delegation, or
justify a shared login.

## 3. Mapping the Complete Persona Catalogue

Not every design persona has a named counterpart in the principal cast. Keeping
those gaps visible is better than inventing administrative authority for a familiar
farm character.

| Existing design persona | Cast reference or narrative treatment | What carries across |
|---|---|---|
| Farmer / CAP applicant | **Jeremy Clarkson** | Farm reality, evidence, deadlines, and payment consequences; no assertion of real claim history |
| Agricultural adviser / authorised representative | **Charlie Ireland** | Translating obligations into action and coordinating explicitly delegated work |
| Paying-agency caseworker | **No direct named farm-cast counterpart**; retain the fictional Caseworker | Public-authority case review is a different responsibility from advising the farmer |
| Field inspector | **No direct named farm-cast counterpart**; retain **Eszter**, the fictional surveyor | Independent ground/drone findings, separate from Jeremy's claimant-supplied evidence |
| Legal and sanctions officer | **No direct named farm-cast counterpart**; retain the Decision Guardian | Reasoned adverse decisions, hearing rights, and appeal safeguards |
| Programme owner / operations manager | **No direct counterpart**; retain the agency Operations Lead | National queues and payment service levels |
| Ministry policy official | **No direct counterpart**; retain the Policy Owner | Scheme design and policy accountability; Charlie explains rules but does not make them |
| EU Commission auditor | **No direct counterpart**; retain the Auditor | Independent reconstruction of controls, decisions, and expenditure |
| Data protection, AI risk, and compliance officer | **No direct counterpart**; retain the Safeguards Officer | Lawful processing, oversight, model governance, and retention |
| IT, security, and platform operator | **No direct counterpart**; retain the Platform Engineer | Digital reliability and security |
| Geospatial / data science specialist | **No direct counterpart**; retain the Earth Observation Specialist | Technical satellite/model expertise; Charlie's advice does not confer model approval authority |
| Farmer association / civil-society representative | **No cast assignment**; retain the Farmer Advocate | Collective representation remains separate from Jeremy's individual Farmer persona |

The programme's interactions with local government can illustrate the broad
farm/public-authority interface. They are not a one-to-one mapping of a local
planning council to a CAP paying agency, ministry, auditor, or sanctions office.
Do not turn officials into generic antagonists.

## 4. Using the References in the Business Process

The [business-process flow](../architecture/business-process-flow.md) can be explained
using these reference roles without changing its architecture or legal controls.

| Business stage | Farm-side reference | Agency-side responsibility |
|---|---|---|
| Plan the season | Jeremy sets objectives; Charlie explains obligations and advises on the plan | Policy Owner publishes approved rules and evidence windows |
| Prepare the claim | Charlie prepares/pre-checks; Jeremy reviews and submits | Case service records the claim version and reliable receipt |
| Capture normal evidence | Jeremy records a purposeful crop/activity photo; Charlie coordinates evidence if delegated | Evidence service validates and registers claimant-supplied material |
| Explain an apparent mismatch | Jeremy provides dates and field activity; Charlie relates the account to the rule | Caseworker assesses the scoped question and uncertainty |
| Perform an independent check | Jeremy facilitates access and provides context, without replacing the selected observation | Eszter records an independent ground/drone finding before AI suggestions |
| Establish and pay entitlement | Jeremy and Charlie, if delegated, see established, authorised, and paid amounts separately | Agency confirms readiness; the authorised treasury system executes and reconciles |
| Contest an adverse outcome | Jeremy responds or delegates Charlie to assist | Decision Guardian provides due process and a reasoned decision; appeal remains available |

The character names are presentation references only. Use fictional identities and
synthetic records in screenshots and demonstrations, not real cast identities
registered as claimants.

## 5. Example Scene: Replanting Meets an Uncertain Satellite Signal

This is an invented case example, not an episode synopsis.

Jeremy's fictional counterpart declares a sunflower parcel, then replants part of it
after a weather event. Charlie's counterpart checks whether a claim amendment is
needed and, if delegated, coordinates the response deadline and receipt. Jeremy
captures the relevant field activity and explains what changed.

The app registers a purposeful farmer photo with capture time and location context.
Cloud and mixed pixels still prevent Sentinel monitoring from settling the whole
parcel. The Caseworker requests a focused explanation rather than treating the model
as proof of wrongdoing.

If the scoped question remains unresolved, Eszter performs an approved ground/drone
inspection and attests independent findings. The Caseworker combines those findings
with the seasonal record; authorised officials apply the rules. A separately selected
random check still proceeds even if the farmer's explanation is convincing.

Any earlier payment benefit comes from resolving avoidable holds or an outstanding
balance within the legal calendar, not from paying automatically when Jeremy uploads
a photo or harvests a field.

## 6. Presentation Guardrails and Sources

Use factual names and professional roles as comparative references. Do not copy
programme dialogue, images, logos, character impressions, or episode storylines,
and do not imply cast or broadcaster endorsement. Avoid using accents, personal
traits, or private circumstances as product requirements or comedy devices.

Public professional-role sources:

- [Amazon: Everything you need to know about Clarkson's Farm](https://www.aboutamazon.com.au/news/entertainment/everything-you-need-to-know-about-clarksons-farm)
  describes Jeremy's farming role and the farm setting.
- [Ceres Rural: Charlie Ireland](https://www.ceresrural.co.uk/team/charlie-ireland/)
  describes his farm-management, consultancy, and strategic-planning expertise.

All CAP workflow assignments above are this repository's proposed analogies, not
facts supplied by those sources.
