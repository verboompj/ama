# Handoff: F03 corrective cycle 2 — owner decision required

| Field | Value |
|---|---|
| Assignment / fixed inputs | [F03-integrate-feasibility](../assignments/F03-integrate-feasibility.md); [S002 manifest](../snapshots/S002/manifest.md), seven preserved files and eighteen committed references |
| Sender / recipient | azure-architect / current CLI coordinator and requesting user |
| Handoff state | accepted as a genuine blocker report, not a corrective draft or design approval |
| Scope / result | Design-release feasibility prerequisites, BLOCKED |
| Author loop | `WP001-F03-AUTHOR`, cycle 2; maximum 5, 2 used / 3 remaining |
| Model / tool limits | HIGH `gpt-6.1-sol` explicitly chosen. Agent-side actual runtime NOT VERIFIED; Learn search/fetch worked, local execution and SQL not exposed |
| Outputs / ownership | No files changed; paired design/cost and all other writers remain stopped. S002 identifies unchanged source revisions |
| Next authority | Requesting user chooses whether to retain unavailable current-gate evidence prerequisites or sponsor a narrowly scoped evidence/prerequisite amendment for independent review. Neither option approves the design or deployment |

## Unresolved current-gate prerequisites

**F04-03 / AC03:** available official version tables do not provide a complete
AKS 1.36.4-bound managed add-on inventory of CPU/memory requests, replicas,
DaemonSets and placement/tolerations. Resource customization guidance is not
evidence of the selected defaults or adequate capacity. The proposed 4 CPU/10 GiB
platform cap and per-node bin-packing remain unsubstantiated.

**F04-06:** official app-routing TLS guidance establishes certificate sync and
HTTPS termination, but the reviewed managed-controller documentation does not
establish the required version-bound minimum TLS 1.2 guarantee or supported
minimum-version override. This is missing evidence, not a demonstrated obsolete
TLS vulnerability. Exact signature/verifier/admission pins, trust/failure rules,
exceptions, destinations and resource footprint also remain unspecified.

The architect stopped after confirming these first-priority blockers rather than
rewriting the design around unsupported assumptions. F04-01/02/07 FAIL and
F04-04/05/08 BLOCKED remain open; F04-09 is still later authorised availability
evidence, NOT RUN. Native AKS/VPN exceptions have not been proposed or approved
by this stopped corrective execution.

## Actual evidence and constraints

Official sources accessed on 21 October 2026:

- [AKS supported versions](https://learn.microsoft.com/en-us/azure/aks/supported-kubernetes-versions)
- [Managed add-on customization](https://learn.microsoft.com/en-us/azure/aks/customize-resource-configuration)
- [App-routing Gateway API](https://learn.microsoft.com/en-us/azure/aks/app-routing-gateway-api)
- [Gateway customization allowlist](https://learn.microsoft.com/en-us/azure/aks/istio-gateway-api#configmap-customizations)
- [App-routing TLS](https://learn.microsoft.com/en-us/azure/aks/app-routing-gateway-api-tls)

The architect accepted the producer's S002 integrity evidence; independent local
hash verification in that role was NOT RUN because execution was unavailable.
No repeat of the 23-module publication investigation, generated infrastructure,
Azure query, validation, what-if, browser, deployment, commit or push occurred.
The coordinator applies the blocked SQL status because that tool was unavailable
to the specialist.

## Stop and requested human decision

Coordinated work pauses before complete-design review, actual plan and approval
packet. Authorising preparation of an alternative evidence plan would permit
only a proposal and required independent review; it would not approve a scope
amendment, waive TLS/security requirements, grant Azure measurement authority,
accept costs or release implementation. Keeping the current requirements means
waiting for the missing authoritative evidence.

No additional author, feasibility, review or snapshot attempt is reserved.
Carry existing counters forward on any authorised continuation.
