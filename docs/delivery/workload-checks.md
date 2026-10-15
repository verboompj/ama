# Workload Validation Catalogue

## Scope, Owners and Evidence

These checks make [Workload Guidance](workload-guidance.md) executable as a review/test
contract. They apply to the released scope, not a generic App Service/SQL example.
The reviewed artifacts are Azure workload designs, Bicep, parameters and deployment
evidence, not the engineering agents, skills, prompts or orchestration setup.
No infrastructure, Azure connection or completed validation is implied by this catalogue.

The architect authors the design. The **infrastructure-tester independently reviews
all five WAF pillars**, writes `architecture-review.md`, and executes technical checks.
It must not author/change the design it reviews. Security and compliance retain their
own findings; the coordinator consolidates evidence but cannot supply their passes.

Each package's `test-plan.md` instantiates applicable checks below with exact resources,
properties, expected values/thresholds, commands, input snapshot/parameter variants,
gate, owner and evidence path. Reference the criterion IDs in the
[design acceptance matrix](../../delivery/templates/design-release.md). A checklist tick or an
unresolved parameter expression is not evidence that a property has the required value.

Required current-gate checks block on `FAIL`, `BLOCKED` or `NOT RUN`. A genuinely
inapplicable check needs a service/scope-specific rationale accepted in the design.
Later checks remain `NOT RUN` at earlier gates. Design assertions about operational
behaviour must have later observed checks; they cannot be passed by static review alone.

## Design and Planning Checks

| ID | Required check | Owner / evidence | Earliest required gate |
|---|---|---|---|
| WV01 | Design includes readable/syntax-checked diagrams, complete resource/SKU/region list, boundaries, module contracts, data flows and unresolved assumptions | Architect supplies design; tester checks snapshot completeness and diagram validation evidence | design-released |
| WV02 | Independently assess Reliability, Security, Cost Optimization, Operational Excellence and Performance Efficiency against stated targets, alternatives and current official guidance | Tester writes all five pillar rows, specific findings and disposition in `architecture-review.md`; no WAF certification/health score invented | design-released |
| WV03 | Verify published AVM paths/versions, required parameters/outputs and documented gaps; reconcile security/compliance requirements with the design | Bicep engineer supplies `feasibility.md`; tester references it and separate specialist dispositions | design-released |
| WV04 | Produce a workload-specific implementation plan derived from reviewed architecture, with exact files, dependency graph/layers, parallel-write boundaries and acceptance/tests per task | Coordinator writes `development-plan.md`; architect/implementer accept contracts and sequencing; every required review finding has a disposition/task | design-released |

The [architecture-review template](../../delivery/templates/architecture-review.md) and
[development-plan template](../../delivery/templates/development-plan.md) define the reports.
The generic [delivery backlog](../../delivery/tasks.md) is not a substitute for the workload plan.
Planning may identify remediation tasks, but unresolved required design blockers still
prevent release. Material changes invalidate affected design reviews.

## Local Code and Control Checks

| ID | Required check | Expected evidence | Earliest required gate |
|---|---|---|---|
| WV05 | Restore/build every scoped module and deployment root, including modules not reached by a root build | Planned file inventory, tool version, exact command and zero-error results per file | locally-validated |
| WV06 | Compile each required environment parameter variant against its root | Parameter-file inventory and successful compilation; missing required values are blockers, not substituted defaults | locally-validated |
| WV07 | Inspect linter diagnostics, not just process exit status | No errors or undispositioned warnings; any accepted warning references a specific diagnostic, location, rationale and genuine approval; no blanket rule suppression | locally-validated |
| WV08 | Verify exact AVM pins, typed contracts, scopes and dependency wiring against the released design | Source/module/compiled-template assertions with approved parameters; documented native-resource exceptions | locally-validated |
| WV09 | Verify naming and required tags on resources that support them | Per-resource assertions against approved naming rules and `environment`, `workload`, `owner`, `costCenter`; documented service limitations/exceptions | locally-validated |
| WV10 | Reject public data-store access and verify the approved private connectivity/DNS configuration | Service-specific effective property/parameter assertions; appropriate private endpoint or approved private networking design; no assumption that creating an endpoint disables public access | locally-validated |
| WV11 | Verify identity, RBAC and secret handling | AKS Workload Identity/managed identity and exact role scopes match design; no plaintext secrets/credential outputs; Entra-only SQL when SQL is in scope | locally-validated |
| WV12 | Verify applicable TLS, subnet/NSG/egress and diagnostics controls | Supported TLS settings meet the approved minimum (at least TLS 1.2); allowed/denied paths and diagnostic destinations match design; no blanket NSG edits to platform-managed subnets | locally-validated |
| WV13 | Verify repository-specific architecture restrictions and quality controls | CPU-only AKS/NAP restrictions, approved Foundry processing geography, state/evidence boundaries and specified model/data contracts are represented correctly | locally-validated |
| WV14 | Independently reconcile implementation, security/compliance findings and documentation with the design | Separate candidate review dispositions, tester results, architect `conformance.md`, matching runbooks/diagrams; pending operational checks identified | locally-validated |

Instantiate assertions with service-specific paths and expected values in the plan.
Inspect AVM implementation/defaults and compiled output where necessary: searching
only local wrappers can miss an unsafe module default. Where static resolution is not
possible, record the limit and require appropriate authenticated/runtime evidence.
Do not claim live IAM, DNS or network isolation from declarations alone.

### Command Inventory and Warning Policy

Use the installed native Bicep tooling (standalone `bicep` or `az bicep`) consistently.
Record its version and actual supported commands. For example, once files exist:

```text
bicep --version
bicep restore --file <scoped-module-or-root.bicep>
bicep build --file <scoped-module-or-root.bicep> --outfile <evidence-output.json>
bicep build-params --file <approved-environment.bicepparam> --outfile <parameter-output.json>
```

Repeat against the exact inventories, not guessed networking/database filenames.
Restore may contact the public module registry without requiring Azure authentication.
Treat compilation and diagnostics separately; capture warnings even when exit status
is zero. Follow the repository's approved Bicep configuration, and record a missing
tool/version capability explicitly. Do not install tools or change lint rules merely
to obtain a pass. Keep generated output non-sensitive and outside source files.

## Authenticated Context, Validation and Preview

| ID | Required check | Expected evidence | Earliest required gate |
|---|---|---|---|
| WV15 | Confirm actual Azure context before authenticated validation, what-if or live checks | Displayed tenant/subscription IDs and explicit user confirmation for environment, scope, identity and parameter snapshot; mismatches/login gaps block | deployment-ready |
| WV16 | Run Azure validation at the released deployment scope | Actual validate command/result for group/subscription scope, exact template/parameter revision and sufficient authorised permissions | deployment-ready |
| WV17 | Inspect what-if changes and readiness prerequisites | Creates/modifies/deletes reviewed against the plan; unexpected deletion/replacement or unresolved/unsupported preview analysis blocks approval until resolved; no automatic deployment | deployment-ready |

Only perform these when that stage is explicitly authorised:

1. Inspect the actual context, for example
   `az account show --query "{subscriptionName:name,subscriptionId:id,tenantId:tenantId}" --output json`.
   If not authenticated, ask the user to complete the required login; do not silently
   log in, switch subscription or open a browser.
2. Show tenant/subscription and require explicit confirmation of the intended
   environment, deployment scope, region, permitted identity and parameter snapshot.
   Reconfirm if these change. Never use a context mismatch as permission to switch.
3. Use `az deployment group validate` / `what-if` for an existing resource-group
   deployment, or `az deployment sub validate` / `what-if` with the approved location
   for subscription scope. Supply the released template and compiled parameter
   snapshot explicitly; record exact arguments without secrets.
4. Validate first, inspect preview second. Unsupported what-if detail is a limitation,
   not proof of no change. Record approval of the preview separately from any later
   deployment authorisation. Previews do not guarantee provisioning or runtime health.

WV15 is also a prerequisite for every later authenticated/live assignment, even
though an initial local candidate does not need an Azure connection.

## Post-Deployment Verification

These checks require a real, separately authorised deployment record. They define
future acceptance; this repository does not yet provide a deployment agent or pipeline.

| ID | Required check | Expected evidence | Earliest required gate |
|---|---|---|---|
| WV18 | Verify deployed resources, names, tags and configuration against the exact approved candidate | Actual deployment identity/result and read-only resource inventory; configuration drift recorded | operationally-verified |
| WV19 | Verify intended endpoints and TLS from approved network locations | Expected HTTPS/TLS responses through the intended application ingress; private management endpoints need not be publicly accessible | operationally-verified |
| WV20 | Verify private connectivity and denied public access | Endpoint connection approved/connected, intended DNS resolves correctly from workload network, data connection works and public/unauthorised paths fail using safe authorised probes | operationally-verified |
| WV21 | Verify effective identity/network/diagnostic behaviour | Least-privilege workload access succeeds, prohibited access fails, supported effective NSG/egress checks match design, and an approved test signal reaches monitoring | operationally-verified |
| WV22 | Verify the package's operational and business targets | Approved performance/recovery/model/evidence checks with observed results and limitations; load/destructive/recovery drills need separate approval | operationally-verified |

**Reference comparison:** the
[hackathon IaC workflow](https://github.com/pascalvanderheiden/energize-your-code-hackathon/blob/main/docs/use-case-iac.md#phase-5-execute-your-workflow)
and its reviewer/tester examples informed this explicit checklist. Their example
resource types, fixed task sequence, framework terminology and tester-edits-code
pattern are not adopted. We retain seven roles, independent assurance and staged
authorisation; no naming convention is justified by agent-orchestration guidance.
