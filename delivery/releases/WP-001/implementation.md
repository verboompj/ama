# WP-001 / U001 Bicep implementation: compiled, acceptance blocked

**Thirteen authored files exist: ten Bicep templates, two parameter files and
one author contract suite. All ten templates compile and both parameter files
compile with synthetic inputs. The effective ARM contract suite fails before
its assertions complete. This candidate is NOT locally validated or approved
for deployment.**

## Authority, ownership and exact inputs

The requesting user renewed "approva and build iac templates". The unchanged
[implementation assignment](assignments/U001-implementation.md) records the
transfer from the interrupted specialist to the parent session performing the
Bicep engineering role; no concurrent writer or model fallback. Host identifies
the parent model as HIGH `gpt-6.1-sol`. This author is not an independent tester.

The architect's actual [release](design-release.md), SHA-256
`93f5298fe7bf378df0c2267f123a448b7a0cd45cf7df42c3d9ba99c793363be9`,
and implementer acceptance remain unchanged. Exact approved design/cost/plan
and scoped disposition bytes are identified by U001-approved-inputs and
U001-release-evidence session manifests. No design/cost/plan/framework amendment
was made during implementation.

Candidate C001: session
`files/U001-iac-candidate-C001/manifest.json`, with preserved source-relative
copies and SHA-256 for all thirteen authored files. Producer is the parent
author, not an independent reviewer. The manifest also records SHA-256 for
twenty restored published AVM main templates, registry manifests and source
archives. These cache digests identify downloaded bytes, not vendor signatures
or proof that version tags can never change.

## Produced files

| Path | Implemented responsibility |
|---|---|
| `infra/main.bicep` | Subscription composition, two project RGs, fixed tags/address plan, constrained inputs and whitelisted foundation output |
| `infra/modules/identities.bicep` | Two MIs and kubelet-scoped MI Operator assignment |
| `infra/modules/monitoring-base.bicep` | LAW, observer Reader and email action group |
| `infra/modules/connectivity.bicep` | Seven subnet children, three NSGs/PIPs/zones, Firewall/NAT/UDR, inbound DNS resolver and full native VPN |
| `infra/modules/services.bicep` | Private ACR/KV, AcrPull, diagnostics and two external PEs/zone groups |
| `infra/modules/aks.bicep` | Full native cluster, inline pools, maintenance children and diagnostics |
| `infra/modules/monitoring-cluster.bicep` | Container Insights DCR and cluster DCRA |
| `infra/modules/access-and-alerts.bicep` | Subscription orchestrator with explicit project-RG scopes |
| `infra/modules/cluster-access.bicep` | Cluster-scoped, canonical human/role tuple assignments |
| `infra/modules/platform-alerts.bicep` | Two scheduled log alerts and dual-project-RG failed-ARM alert |
| `infra/environments/poc.bicepparam` | Protected local environment bindings; explicit replay user count |
| `infra/tests/fixtures/poc.contract.bicepparam` | Valid-format synthetic IDs/contact, public-only SSH and certificate |
| `infra/tests/contracts.test.mjs` | Local compiler inventory and effective ARM contract checks; currently failing evaluator |

Twenty direct AVM paths/versions are the exact plan inventory. Native exceptions
remain cluster `2026-03-01`, VPN `2025-01-01`, maintenance `2025-10-01`,
DCRA `2023-03-11`, cluster grants `2022-04-01` and diagnostics
`2021-05-01-preview`. No new native convenience resource or AVM substitution.

AVM zone inputs require integer arrays and convert them to the published
resource's zone contract. Subnet deployment loops use fixed integer indices:
module names/counts must be deployment-start values, while actual subnet inputs
consume completed NSG/NAT/UDR outputs. Routes use the published nested
`properties` shape. These are implementation corrections, not topology changes.
The KV AVM derives its tenant from `subscription().tenantId`; the services module
records its explicit expected-tenant input but cannot force the provider context.
Exact tenant matching remains a required future execution preflight.

## Commands and actual results

Existing compiler: `/Users/verboompj/.azure/bin/bicep` **0.43.8 (310735909d)**.
Node: **v25.8.1**. No installation or upgrade.

Final command inventory and diagnostics are preserved in session
`files/U001-iac-author-evidence/attempt-5/author-commands.json`.
Compiled JSON and synthetic bindings are in `compiled-synthetic.json`;
no generated ARM/parameter JSON or private material was written into the repo.

| Command / scope | Actual result |
|---|---|
| `bicep --version` | Exit 0 |
| `bicep restore --pattern 'infra/**/*.bicep'` | Exit 0; public registry only |
| `bicep build --no-restore --stdout <file>` for each of all ten inventory files | Each exit 0, warnings retained below |
| `bicep lint --no-restore --pattern 'infra/**/*.bicep'` | Exit 0, warnings retained; not blanket WV07 acceptance |
| `bicep build-params --no-restore --stdout infra/tests/fixtures/poc.contract.bicepparam` | Exit 0, synthetic fixture |
| Same command for `infra/environments/poc.bicepparam` | Exit 0 with explicitly supplied synthetic environment bindings only |
| `node --test infra/tests/contracts.test.mjs` | **FAIL**, exit 1: evaluator `map` received an unresolved input and aborted before the five declared contract tests completed |

The environment file requires `AMA_TENANT_ID`, `AMA_OPERATOR_PRINCIPAL_ID`,
`AMA_OBSERVER_PRINCIPAL_ID`, both `AMA_*_PRINCIPAL_TYPE` values,
`AMA_SSH_PUBLIC_KEY`, `AMA_ALERT_EMAIL`, `AMA_VPN_ROOTS_JSON`,
`AMA_VPN_REVOKED_CLIENTS_JSON` and `AMA_USER_NODE_COUNT`. No real values are
committed. Compiling with synthetic bindings is not protected actual-value WV06
acceptance; that remains **NOT RUN** for actual use.

Fixture public certificate and SSH material were generated in memory. The
ephemeral certificate private key was passed to local OpenSSL over stdin, never
persisted; only public output was inserted into the fixture. The fixture is not
an operational CA/device inventory. The suite includes DER X509 parsing, SSH
wire-format checks and malformed/duplicate input cases, but its setup failure
means those declared cases have **not passed**.

### Warning dispositions

These are author proposals, not independent approval. No warning is suppressed.

| Rule / location | Author rationale / remaining acceptance |
|---|---|
| BCP081, connectivity line 62 | Published NSG pin uses API `2025-09-01`, not described by installed compiler types; exact restored body/API needs independent review and later provider validation |
| BCP081, AKS line 21 and existing-cluster declarations in cluster-access line 7 / monitoring-cluster line 48 | Approved native `2026-03-01` lacks compiler type metadata; successful compilation does not verify its provider schema or availability |
| BCP081, services line 54 | Published KV pin uses API `2026-02-01`; same type-metadata limitation |
| no-hardcoded-env-urls, connectivity lines 244-245 | Exact released finite firewall inventory specifies public-cloud ARM/Entra hosts, not arbitrary multi-cloud endpoints; no automatic broadening |
| adminusername-should-not-be-literal, AKS line 53 | Released Linux username is fixed `azureuser`; only public key supplied, network SSH denied as designed; not a password or deployment credential |

WV07 and C1-C5/effective-body acceptance remain **BLOCKED / NOT RUN** as
applicable. Exit 0 alone does not accept the warnings or establish correct
native schema, scope, output non-forwarding or resource behaviour.

## Stable attempt accounting and stop

`WP001-IAC-AUTHOR-CHECK`: **5/5 consumed, 0 remaining**. Transport retries from
the earlier interruption were not counted as five workload attempts; the
initial reservation was carried into actual execution.

| Attempt | Actual outcome |
|---|---|
| 1 | Ten-file compile inventory failed on zone input types, deployment-start loop values, route shape and output for-expression. Relevant implementation corrections followed |
| 2 | Author runner failed root build: subnet module names still depended on runtime-valued config arrays. Names changed to stable indices |
| 3 | All fifteen compiler commands exited 0; evaluator failed on secure LAW output type casing |
| 4 | All fifteen compiler commands exited 0; evaluator failed resolving a type-reference output schema |
| 5 | All fifteen compiler commands exited 0; evaluator failed on unresolved input to ARM `map` |

No sixth fix/retest, renamed failing objective or delegated recheck has been
started. The evaluator is a test-tool defect or unsupported-expression gap,
not demonstrated Azure service failure. It still blocks the candidate gate:
an unexecuted assertion is not PASS.

Independent acceptance suite/test review, architect conformance and matching
operational documentation are **NOT RUN**. This report supplies no independent
gate acceptance. Later exact-context validation, what-if, live counts,
availability/quota/names, credentials/permissions, funded window and deployment
approval remain **NOT RUN**; no Azure or browser operation occurred.

**Stopped author execution at the five-attempt limit.** Return C001 and this
failure to the coordinator/accountable owner for escalation, preserving the
counter and unchanged approved release. No ML/app/Foundry, workflow, commit,
push or deployment.
