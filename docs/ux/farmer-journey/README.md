# Field & File: Farmer Journey Draft

**Status: illustrative UX draft 0.1, not a released application design.**

Open [`index.html`](index.html) locally in a browser. The file includes its logo,
styles and interactions; it needs no server, package installation or internet.
Nothing is submitted to Azure or an agency. No real sign-in, GPS, camera, files,
claimant records, model calls or payment services are connected.

## Design Basis

The primary persona is the [Farmer / CAP applicant](../../Persona/personas-and-use-cases.md#4-primary-persona-the-farmer--cap-applicant),
with an authorised adviser as a supporting route. The fictional setting, original
logo, plain-spoken voice and field/file motif come from the existing
[Field & File identity](../../Persona/farm-theme-and-persona-map.md).
The logo is embedded unchanged from
[`assets/field-and-file-logo.svg`](../../../assets/field-and-file-logo.svg).
The interface uses light cream and white surfaces, Crop green (`#52734D`) for
primary actions, Harvest gold (`#D9A441`) for attention and Signal blue (`#5B8FA8`)
for the field diagram. Gold and blue accents are paired with dark text rather
than small, low-contrast coloured text. The existing Clawpilot detection script
and base light/dark tokens remain intact; an explicit Field & File `--cp-*` brand
override keeps this farmer draft light even with OS dark mode or
`?clawpilotTheme=dark`. This is a local draft choice, not a global theme change.

## English and Hungarian

English is the default. Use **English / Magyar** in the header, or open
`index.html?lang=hu` / `index.html?lang=en`. The active button has
`aria-pressed="true"`; each button declares its own `lang`. The same controls
move into an open confirmation/help dialog so language can be changed there
without dismissing it, then return to the header. There are no cookies or
language preferences stored between page loads.

All screens, navigation, help, confirmations, status messages, diagram labels,
accessible names, form guidance, custom required/minimum-length validation,
page title and downloadable fictional summary use the selected language.
The unchanged logo and farm name remain brand names. User-entered text and
stable `DEMO-*` identifiers are not translated.

Switching language preserves the current screen, typed text, selected crop and
evidence purpose, sample image, offline status, completeness check, receipts,
pending confirmation action and payment preview. Open explanatory sections stay
open. State still exists only in the open page; reloading is not save/resume.
The wording is shorter and action-oriented, with technical evidence-check detail
behind an optional explanation. Hungarian uses polite address and “tábla” for
the farmer-facing field, while the fictional parcel IDs remain unchanged.
Both language versions are **draft translations/copy requiring native-speaker
and domain-owner approval**, not approved agency notices or legal guidance.

The flow follows the maintained [business process](../../architecture/business-process-flow.md)
and [application architecture](../../architecture/aks-centered-foundry-architecture.md#511-user-authentication-and-client-channels).
This is outside WP-001's infrastructure assessment and does not release app
implementation, change the platform or authorise a deployment.

## Scenario and Navigation

Napraforgó Farm has three **synthetic** parcels totalling 18.4 ha. The base
scenario is dated **20 June 2026**, irrespective of the computer clock. An annual
claim was received on an illustrative 15 May; the farmer now needs to respond to
an uncertain crop observation on parcel `HU-DEMO-047-12`.

The original declaration says sunflower. An example explanation is storm damage
on 22 May and replanting with maize on 26 May. These dates, areas, observations,
deadlines, amounts and task references are invented UX data, not verified scheme
rules or a real beneficiary's history. No real person's likeness is used.

Suggested walkthrough:

1. **Start here → My season:** enter a simulated farmer session and identify the
   next action without interpreting remote-sensing terminology.
2. **My fields → Action needed:** inspect the schematic, compare the declaration
   and observations, and see the uncertainty, affected question and example deadline.
3. **My application:** draft a change to maize, explain the change, check its
   completeness, review and explicitly confirm. The original version remains.
4. **Action needed:** send a separate explanation or request human review.
5. **My evidence:** attach a synthetic photo placeholder and describe its purpose.
   Try offline mode: the draft stays in the open page and is not sent on reconnect.
   Review the sample package online, then separately simulate successful file checks.
6. **Case & decisions:** follow receipts and pending assessment; download a
   clearly labelled demo summary. Expand the separate appeal example to inspect
   its confirmation pattern, not to appeal a nonexistent base-scenario decision.
7. **Payments:** expand designer controls to compare pending, advance-authorised,
   advance-settled and final-settled displays. These are separate scenarios, not
   farmer payment controls.

Use **Reset demo** to clear the walkthrough. All state exists only in memory:
reload, reset or closing the page discards it. This is not durable offline storage.
No data is saved in cookies, local storage or a backend.

## Screen-Level Draft Requirements

| Screen | Farmer task and content | Primary action / next state | Architecture boundary | Draft acceptance criterion |
|---|---|---|---|---|
| 01 Start here | Understand the service and enter the farmer context | Simulated entry → My season | Future national eID, `web-bff`; no credentials in prototype | Explain that sign-in is simulated; prevent access to workspace screens before entry |
| 02 My season | See next action, claim receipt, parcel count and payment uncertainty | Open parcel question, parcels or evidence | `web-bff` aggregates case-owned data | Name the affected parcel and date; do not label an uncertain observation as fraud or an adverse decision |
| 03 My application | Review original claim and prepare a distinct amendment | Completeness pre-check → confirmation → demo amendment receipt | `case-api`, versioned deterministic rules | A valid draft, changed crop and explicit confirmation are required; preserve original declaration; no submission offline |
| 04 My fields | Understand crop, area and parcel-specific monitoring status | Open parcel 12 question or evidence | Authorised case/parcel views, approved observation references | Provide a textual register alongside the schematic; state that it is not a geographic map or LPIS data |
| 05 Action needed | Compare declared/observed facts, limitations, rule/task reference and response options | Confirm explanation, amend, add evidence or request human review | `case-api`, approved discrepancy workflow; contested/adverse cases escalate | Require meaningful response text; explicit confirmation creates only a receipt; question stays unresolved pending assessment |
| 06 My evidence | Choose approved purpose, record context and track package handling | Local draft → explicit sample upload → quarantine → registration → pending assessment | `case-api` verifies scope; `evidence-api` owns package checks/receipt | No real capture; offline is not received; reconnect does not submit; registration never implies sufficient evidence or approval |
| 07 Case & decisions | Follow chronology, see responsible next actor, obtain records and understand contest rights | View history, download demo summary, inspect separate appeal pattern | Authoritative case records and human decision/appeal process | Keep receipts distinct from outcomes; label exported summary as incomplete/non-official; no AI-made adverse decision |
| 08 Payments | Understand estimated, established, authorised and confirmed paid values | Read statuses; designer-only scenario selection | Deterministic adapter reconciles authoritative treasury ledger | An authorised but unsettled advance must show zero confirmed paid; never expose a farmer/agent payment-execution action |

## Interaction and Edge-State Contract

| State | Required behaviour |
|---|---|
| No session | Production requires the approved identity flow; this draft routes workspace navigation to simulated entry |
| Invalid or incomplete draft | Native form validation and explicit feedback prevent confirmation; pre-check is not a legal or eligibility verdict |
| Edited amendment after pre-check | Invalidate the completeness result; require a new pre-check before confirmation |
| Offline | Explanations and evidence may be drafted in the open page; no receipt, human-review request or amendment submission is created |
| Reconnected | Keep draft content, but require explicit submission; never silently send a queued claim or package |
| Evidence absent | Sample package cannot be sent without the placeholder and a meaningful description; alternative response and assistance remain available |
| Evidence in quarantine | Display pending checks; do not show registration or sufficiency |
| Evidence registered | Retain pending scoped assessment; do not cancel independent validation or infer eligibility |
| Human review requested | Create a synthetic request receipt, not a decision, service guarantee or real contact |
| Appeal example | Separate hypothetical adverse-decision scenario; real notice, grounds, time limits and valid filing are unimplemented |
| Payment authorised, settlement unresolved | Display authorised amount separately from confirmed paid; do not trigger another instruction |
| Reset or reload | Discard in-memory state and clearly disclose this limitation |

Notifications use a polite live region; pages have a skip link, labelled inputs,
visible keyboard focus, semantic navigation and text status labels. The layout
adapts to a narrow viewport. Both legacy `clawpilotTheme` query values intentionally
render the light farmer brand. These provisions are not a WCAG conformance claim.

### Stable interaction hooks

Language buttons use `[data-language="en"]` and `[data-language="hu"]`; there is
one of each, including while a dialog is open. Existing screen IDs, `data-view`,
`data-action`, form-field IDs and receipt IDs remain unchanged. Visible labels
are no longer suitable language-independent test selectors.

Select values are stable keys, independent of their translated labels:

- `#crop`: `sunflower`, `maize`.
- `#evidencePurpose`: `event`, `milestone`, `response`.
- `#paymentScenario`: `pending`, `authorised`, `advance`, `final` (unchanged).
- Evidence lifecycle state remains `draft`, `quarantine`, `registered`; its
  display and exported status are translated, not the stored state.

Inline paired EN/HU copy keys supply rendered text directly; there is no
post-render text replacement, external localisation library, fetch or service.

## Draft Author Checks

Author-check loop `FARMER-UX-AUTHOR-01`, 21 October 2026: **5 of 5 total
attempts consumed; 0 remain. Final author result: PASS.** The first two attempts predate this
revision. Attempt 1 found that changing a payment scenario
closed its designer controls. Attempt 2 passed after preserving the open controls
and focus. This is author verification, not independent review or release approval.

The **previous revision's** checked `index.html` SHA-256 is
`730d7c8bdacff915c0851d15dcd78713f4dfc956539a426e3ef7f6403acf1d57`.
Headless Chromium exercised all workspace screens in light/dark mode at
1440 × 1000 and 390 × 844, with no page-width overflow. The interaction path
covered amendment validation/confirmation, stale pre-check invalidation,
cancellation, literal response text, human review after response, offline drafts,
reconnection without auto-send, separate quarantine/registration, payment status
separation, the hypothetical appeal, demo export and reset.
The embedded logo matched the source; no browser errors or remote requests occurred
in that previous revision. Those browser results do not validate the new branding
or bilingual revision.
The check script and four rendered previews remain in session-local evidence.
Current-revision browser validation is **PASS**, as reported by the parent for
final attempt 5 below.
Attempt 3: **FAIL** overall on a source-literal DEMO-identifier assertion: the
two unchanged parcel-10/14 IDs were assembled by the table template rather than
present as complete source literals. Scoped whitespace, both inline JavaScript
syntax checks, literal copy-key references, original theme bootstrap, retained
form IDs and byte-identical logo checks passed before that assertion. The table
now keeps the full parcel IDs as stable source values instead, without changing
their displayed IDs. That source-literal assertion was **NOT RECHECKED**; no
hidden retry or browser loop was run by the implementer.

Attempt 4: **INCOMPLETE**, as reported by the parent browser checker. All seven
workspace screens fitted at desktop/mobile sizes in English and Hungarian.
Forced-light styling passed under OS dark mode and the legacy dark query; the
logo remained identical. Crop selection, typed draft, completeness check and
open-dialog confirmation action survived language changes. Sample photo,
evidence purpose/note, offline drafting without automatic submission, and the
separate upload/registration steps passed through registration.

The harness then incorrectly expected `DEMO-EVIDENCE-001` in the case timeline,
which displays registered status rather than that receipt ID. The parent corrected
the expectation to check the receipt on the evidence screen for attempt 5. No
implementation defect was observed through that point; this is not a completed
browser pass. Action/review receipts, Hungarian case download and payment-scenario
checks were still pending at the end of attempt 4.

Attempt 5: **PASS**, reported by the parent's session-local
`check-farmer-bilingual.cjs` harness against `index.html` SHA-256
`1d440448c373cbb6240638d9faa2c965f2c471c2ab72765773a3d0c836f05a51`.
The final check covered:

- English/Hungarian at **1440 × 1000** and **390 × 844**, across all seven
  workspace screens and entry, with no page-width overflow.
- Forced-light appearance despite OS dark mode and the legacy dark-theme query;
  expected Crop green, Harvest gold and Signal blue tokens; unchanged,
  byte-identical embedded logo.
- Localised headings, HTML `lang`, page title and language-button pressed state;
  preserved crop options, typed draft and completeness check; translated open
  confirmation dialog with its pending action intact; user input rendered literally.
- Missing-photo and offline submission prevention; reconnection without automatic
  submission; preserved sample photo, evidence purpose and note; separate upload,
  quarantine and registration steps, with receipt retained on the evidence screen.
- Response followed by human-review receipts, the separate appeal example and
  Hungarian summary download.
- Locale-independent payment scenarios, including authorised versus confirmed-paid
  separation; reset clearing demo state while retaining Hungarian selection.
- No browser errors or remote requests. The parent also reported
  `git diff --check` **PASS**.

The harness and screenshots remain session-local evidence; they are not repository
artifacts. No HTML changes or additional test runs were made for this final
documentation update. The exhausted author loop does not constitute independent
review, production readiness or release approval.
Production native-speaker and domain-owner copy approval is **NOT RUN / pending**.
Usability research, assistive-technology review and real integrations are NOT RUN.

## Before Application Design Release

The following are explicit open requirements, not completed features:

- Native-speaker/domain-approved English and Hungarian copy, accessibility targets and validation with farmers,
  advisers and assisted-service users; actual service contacts/channels and hours.
- A full first-time annual claim journey: scheme selection, land entitlement,
  parcel geometry and commitments, save/resume, attachments, final declaration and
  legally reliable submission. This draft implements the amendment interaction,
  not every initial-application form.
- Confirmed national eID/federation and delegation contracts, scoped authority,
  session expiry, unauthorised/expired access, server-side case isolation and audit.
- Real rule citations, approved notices/deadlines, amendment admissibility,
  no-response handling, lawful alternatives, official adverse decisions and appeals.
- Per-parcel evidence selection beyond the parcel-12 slice, actual capture,
  permission refusal/low accuracy, secure durable offline storage, resumable upload,
  package hash/manifest validation, rejection/incomplete/malware states and retention.
- Independent inspection scheduling, farmer-facing scope and caseworker handoffs.
- Complete case-file export, document access, notification preferences/delivery
  failure, statutory deadline handling and correction/recovery flows.
- Intervention-specific currency/rates, exact financial calculations, partial
  holds, advance/balance/recovery/offset reconciliation and payment failure states.
- Approved API/event contracts, measurable acceptance targets, usability evidence,
  applicable privacy/security review and non-author validation before release.

The pre-application guidance, adviser assistance and appeal controls deliberately
show structure and boundaries rather than pretending these integrations exist.
