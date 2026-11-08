# AMA Foundation IaC

**Compiled candidate, not locally accepted or deployed.** WP-001's ten Bicep
templates and two parameter files have compiled with synthetic inputs using
Bicep 0.43.8. Restore and lint completed with documented warnings. The author
contract suite currently fails in its ARM-expression evaluator; the author
loop reached **5/5** and stopped. Do not treat compilation as provider validation,
independent acceptance or permission to deploy.

## Scope and Layout

[`main.bicep`](main.bicep) is the subscription root for two new project resource
groups in Sweden Central. The nine modules implement the approved private AKS
foundation, two managed identities, networking/Firewall/NAT, certificate-only
VPN, private DNS/resolver, private ACR and Key Vault, and minimal monitoring.
Twenty published AVMs are exactly pinned; native AKS/VPN and extension-resource
exceptions are identified in the approved design and implementation report.
AKS owns its node resource group; the templates do not precreate it.

| Location | Purpose |
|---|---|
| [`main.bicep`](main.bicep) | Root inputs, fixed address/tag configuration, dependencies and nonsecret output whitelist |
| [`modules/`](modules/) | Nine logical composition modules; one owner per resource |
| [`environments/poc.bicepparam`](environments/poc.bicepparam) | Required local bindings; no real operator/contact/key defaults |
| [`tests/fixtures/poc.contract.bicepparam`](tests/fixtures/poc.contract.bicepparam) | Synthetic compile-only fixture with public-only key/certificate material |
| [`tests/contracts.test.mjs`](tests/contracts.test.mjs) | Node author runner for restore, all builds, lint, parameters and effective contracts; currently failing |

No application, Foundry, Azure ML, dataset/model job, Kubernetes Gateway/Route/
TLS bootstrap, deployment script or CI/CD workflow is included. The agreed
sequence is infrastructure, Azure ML, then application/runtime, under separate
releases and approvals.

## Local Parameter Bindings

The environment file reads these values from the invoking process. Real values
must remain protected and outside repository files, reports and public outputs.

| Variable | Expected value |
|---|---|
| `AMA_TENANT_ID` | Approved tenant GUID |
| `AMA_OPERATOR_PRINCIPAL_ID`, `AMA_OBSERVER_PRINCIPAL_ID` | Approved principal GUIDs |
| `AMA_OPERATOR_PRINCIPAL_TYPE`, `AMA_OBSERVER_PRINCIPAL_TYPE` | Explicit `User` or `Group`; identical IDs must have matching types |
| `AMA_SSH_PUBLIC_KEY` | Public SSH key only |
| `AMA_ALERT_EMAIL` | Approved operations contact |
| `AMA_VPN_ROOTS_JSON` | Nonempty JSON array of `{name, publicCertData}`; continuous Base64 public X.509 CER, never PFX/private keys |
| `AMA_VPN_REVOKED_CLIENTS_JSON` | Full approved JSON revocation array of `{name, thumbprint}`; `[]` only for a genuinely empty inventory |
| `AMA_USER_NODE_COUNT` | Approved current count `1` or `2`, supplied explicitly for replay |

The system pool is fixed at two nodes. Do not replay creation settings against
a live cluster without separately authorised count reconciliation and inspected
what-if. A successful synthetic compilation of the environment file does not
approve its real values, tenant context, certificate inventory or replay state.

## Evidence and Remaining Gates

- [Actual design release](../delivery/releases/WP-001/design-release.md):
  exact design/plan approval for local authoring, not Azure execution.
- [Implementation and command results](../delivery/releases/WP-001/implementation.md):
  all ten builds, both synthetic parameter checks, warning proposals, failed
  evaluator and preserved C001 references.
- [Current ledger](../delivery/releases/WP-001/ledger.md):
  exhausted author budget, pending independent acceptance/conformance/docs and
  separate later environment/deployment approvals.

The recorded author entry point is `node --test infra/tests/contracts.test.mjs`
from the repository root, using the existing CLI-managed compiler at
`~/.azure/bin/bicep`. It is a failing check, not a deployment command or permission
for a sixth attempt under the exhausted loop. No checks were rerun to publish
these files.

Before any later Azure execution, the operator must confirm the exact target,
identity, scope and funding, obtain authorised validation/what-if evidence and
explicit deployment approval. Provider API/patch/SKU availability and runtime
DNS, TLS, IAM, egress, telemetry and resource behaviour have not been verified.
