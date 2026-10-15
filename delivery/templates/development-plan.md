# Workload Development Plan: WP-<number>

Template only. Coordinator derives this from the actual reviewed design, not by
copying the generic delivery backlog. No implementation or CI/CD authorisation.

| Field | Value |
|---|---|
| Planning assignment / owner | delivery-coordinator / TODO |
| Design snapshot and architecture-review revision | TODO |
| Security/compliance findings / feasibility inputs | TODO |
| Intended release scope / excluded later work | TODO |
| Architect / Bicep engineer contract acceptance record location | TODO; acceptance is recorded against this plan revision outside frozen inputs |

## Implementation Tasks

| Task ID | Owner | Exact files/resources and input/output contract | Prerequisites | Finding IDs addressed | Acceptance criteria / WV checks / gate | Status |
|---|---|---|---|---|---|---|
| TODO | TODO | TODO | TODO | TODO | TODO | pending |

Tasks cover the actual package's deployment scopes, resource/module dependencies,
parameters, identity/networking, diagnostics, documentation and validation. Include
app/model bootstrap only where it is expressly in scope. Every required review finding
has a resolved disposition or an explicit task/decision; unresolved required design
findings still block design release.

## Dependency Graph and Parallel Work

Add a Mermaid dependency graph derived from these task IDs. Explain dependency
layers, which files have a single writer, permissible parallel work and the
integration/retest order. Bicep still owns the resource deployment graph.

## Validation Inventory

List every scoped module/root and required environment parameter file. Map WV01-WV22
to the package's exact resources, properties, values/thresholds, commands/methods,
evidence paths, owners and earliest required gate. Record applicability limitations
and any specifically approved warning dispositions.

## Scope and Change Control

Record plan acceptance against the design before implementation. Material contract
changes return to the architect and reopen affected reviews/approval. GitHub Actions,
deployment and live verification remain separate future tasks unless expressly
authorised; do not add a pipeline simply because the reference example includes one.
