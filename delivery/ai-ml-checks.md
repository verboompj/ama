# Application, AI and ML Workload Checks

## Scope and Independent Ownership

These checks assess application/runtime CAP agents and crop-data/model artifacts
alongside [WV01-WV22](workload-checks.md), under the accepted
[risk path](handoffs.md#risk-based-review-paths).

`application-ai-engineer` writes application/runtime artifacts; `ml-data-engineer`
writes data/model artifacts. The existing `infrastructure-tester` owns independent
acceptance/evaluation suites and dispositions using `ama-ai-ml-validation`.
Security/compliance assess their requirements against that evidence. Statistical
quality evaluation requires the assigned independent technical expertise.
Unavailable domain competence, data, tools or authority is `BLOCKED`, not a pass.

The design/test plan assigns exact inputs, owners, methods, thresholds, sample/slice
coverage, numerical tolerances and earliest required gate before candidate evaluation.
Missing current-gate evidence blocks that gate. Inapplicable checks require a scoped
reason; later authorised live checks remain `NOT RUN`. All review/test loops retain
the [five-total-attempt ceiling](multi-agent-framework.md#review-loop-limit).

## Application and Runtime AI

| ID | Required check | Independent evidence | Earliest gate |
|---|---|---|---|
| AI01 | API, event, tool and scoring contracts match the released versions | Schema/consumer tests, error/timeout/idempotency cases, incompatible/missing/stale result handling | locally-validated |
| AI02 | Case-level access and deterministic tool authorisation preserve human/treasury boundaries | Positive/negative synthetic role/case tests; invalid calls cause no state transition; required approvals cannot be supplied by an LLM | locally-validated |
| AI03 | Untrusted runtime uploads/retrieval/tool text cannot grant authority or bypass evidence quarantine | Controlled adversarial fixtures, incomplete/changed manifests, unclean scans and unsafe requested actions rejected by application controls | locally-validated |
| AI04 | Runtime answers meet approved quality and escalation criteria | Versioned questions, sources, runtime prompt/model/tool/index configuration, groundedness/rule-citation/refusal/escalation results and sample limitations | locally-validated |
| AI05 | Dependencies fail explicitly and tracing supports diagnosis | Synthetic Foundry/search/scoring outage, quota, invalid-schema and low-quality cases; explicit degraded state, safe fallback and trace/correlation assertions | locally-validated |
| AI06 | Observed runtime integration meets approved targets in the authorised environment | Actual identity/model/ingress/scoring/telemetry evidence and authorised live evaluation results; mock success does not satisfy this check | operationally-verified |

Where AI04 is due locally, the plan must distinguish deterministic fixture tests
from approved remote inference evaluation. If real-model evidence is required at
that gate, absent remote-call authority is a blocker, not permission to count mocks.
An application slice with no LLM use may justify excluding answer-quality checks;
its API, access, evidence and failure contracts still require applicable tests.

## Data and Model Lifecycle

| ID | Required check | Independent evidence | Earliest gate |
|---|---|---|---|
| ML01 | Sources, geometry, taxonomy and dataset lineage are versioned and lawful for scope | Machine-readable product/version/hash/licence manifests, authority/weak-label status, exclusions and protected input references | locally-validated |
| ML02 | Splits prevent holding/spatial/duplicate/temporal leakage | Frozen train/validation/test IDs and grouping assertions; out-of-time/out-of-region reserves and documented coverage limitations | locally-validated |
| ML03 | Features obey acquisition/availability/as-of contracts without target leakage | Prefix replay assertions; all cutoff snapshots stay grouped; declarations, target labels/confidence and later outcomes excluded from predictors | locally-validated |
| ML04 | Final-test isolation and pre-agreed acceptance remain intact | Locked protocol/test references, candidate/threshold freeze, training/validation-only tuning history and independent evaluation execution | locally-validated |
| ML05 | Quality, calibration and abstention meet the scoped approved targets | Approved baseline comparison, per-class/slice/cutoff metrics, uncertainty/coverage/error analysis, missing-data and unsupported-window tests | locally-validated |
| ML06 | The frozen candidate can be reproduced and traced | Exact code/dependency/environment/data/config/seed references, model hash and successful independent replay within agreed tolerances | locally-validated |
| ML07 | Model/scoring release bundle matches its claims and consumers | Model card, versioned input/output/taxonomy contract, supported windows, calibration/threshold report, limitations, consumer tests and promotion/rollback plan | locally-validated |
| ML08 | Authorised model operation/promotion is supported by real evidence and human decisions | Recorded data-science/CAP/legal/data-protection/security owners' required approvals; actual scoring/monitoring/drift/rollback evidence for the requested stage | operationally-verified |

Use the [training procedure](../docs/copernicus/crop-classification/crop-classifier-training-procedure.md)
as the methodological source. Weak-label agreement is not inspected Hungarian
accuracy. A five-attempt budget never permits tuning on a final-test set; failures
require the approved isolation/protocol rules, not repeated adaptive testing.

## Required Machine-Readable Artifacts

The ML writer's package inventory identifies source/product hashes and licences,
geometry/taxonomy versions, dataset exclusions, grouped splits, feature order and
cutoffs, dependency lock/environment, code commit, seeds/configuration, candidate
model hash, metric/slice results and replay commands. Report cards explain those
artifacts; Markdown alone does not replace them. Actual formats and paths are
selected in the released design.

Runtime AI similarly versions its prompt/model deployment, tool/API schemas,
retrieval/index references, evaluation cases and traces. Sensitive evaluation sets
and raw data stay in approved storage; repository evidence contains safe references.
