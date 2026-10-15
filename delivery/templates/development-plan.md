# Workload Development Plan: WP-<number>

Template only. Derive this from the actual reviewed design.

| Field | Value |
|---|---|
| Planning assignment / owner | delivery-coordinator / TODO |
| Design revision / required review evidence | TODO |
| Security/compliance findings / feasibility inputs | TODO |
| Intended release scope / excluded later work | TODO |
| Risk path / approved targets and accountable owners | TODO |
| Architect / scoped implementers' contract acceptance record location | TODO; acceptance is recorded against this plan revision outside frozen inputs |

## Implementation Tasks

| Task ID | Owner | Exact files/resources and input/output contract | Prerequisites | Finding IDs addressed | Acceptance criteria / applicable WV, AI or ML checks / gate | Status |
|---|---|---|---|---|---|---|
| TODO | TODO | TODO | TODO | TODO | TODO | pending |

Tasks cover the actual package's deployment scopes, resource/module dependencies,
parameters, identity/networking, diagnostics, documentation and validation. Include
application, runtime-AI and data/model work only where expressly in scope, with the
appropriate writer and independent validator. Every required review finding
has a resolved disposition or an explicit task/decision; unresolved required design
findings still block design release.

## Dependency Graph and Parallel Work

Add a Mermaid dependency graph derived from these task IDs. Explain dependency
layers, which files have a single writer, permissible parallel work and the
integration/retest order. Bicep still owns the resource deployment graph.

## Validation Inventory

List scoped implementation artifacts, modules/roots and required parameter files. Map WV01-WV22
to the package's exact resources, properties, values/thresholds, commands/methods,
evidence paths, owners and earliest required gate. Record applicability limitations
and any specifically approved warning dispositions.
For application/ML scope also instantiate AI01-AI06 and ML01-ML08 from
`docs/delivery/ai-ml-checks.md`. Include API/event/scoring schemas, dataset/split and
feature manifests, pinned environments/configuration, model/evaluation artifacts,
replay commands and protected evidence locations. Identify human target/approval
owners before evaluation; missing targets are blockers.

## Review and Future Release Ownership

Record only the reviews required by the accepted risk path, their non-author owners,
deterministic commands and actual context limitations. Architect conformance is an
author-side check. Name the later automation author, authorised deployment operator
and human operational service owner; do not treat this plan as their execution approval.

## Scope and Change Control

Record plan acceptance against the design before implementation. Material contract
changes return to the architect and reopen affected reviews/approval. GitHub Actions,
deployment and live verification remain separate future tasks unless expressly
authorised.
