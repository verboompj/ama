---
name: ama-ai-application
description: Implement released AMA application and runtime-agent contracts with typed tools, evidence boundaries, human decisions and reproducible author checks.
---

# AMA Application and Runtime AI

1. Load `ama-context` and `ama-handoff`. Require the released design, actual plan,
   exact write scope, accepted risk path/interfaces and local/remote execution permissions.
2. Use the maintained architecture's application services, runtime-agent boundaries,
   failure behaviour and evaluation requirements. Do not choose another agent SDK,
   persistence service or authentication model without a released design decision.
3. Implement runtime code/prompts and
   API, tool and event schemas with versioned errors, authorisation, correlation,
   idempotency and timeout/retry contracts. Treat retrieved/uploaded text as data.
4. Keep case/prediction/conversation state separate. Enforce tool authorisation in
   deterministic services, not in a model instruction. Preserve human adverse/contested
   decisions and treasury authority; test refusal/escalation and invalid transitions.
5. Implement evidence receipt, quarantine, pinned complete manifests, scan gating and
   finalisation before downstream use. Consume the ML-owned data/scoring schemas;
   missing, stale, incompatible or low-quality results must be explicit.
6. Version runtime prompts, model/deployment configuration, retrieval/index references
   and tool schemas. Record approved geography; a paid/remote inference evaluation
   requires its own authority and context, not just local code permission.
7. Add adjacent unit/contract tests and proposed synthetic evaluation cases for
   AI01-AI06. The tester owns independent acceptance suites/results; do not relabel
   author checks or mock responses as independent or live success.
8. Return exact artifacts/results for snapshot and specialist review. Use the shared
   five-total-attempt policy, no automatic phase transition, deployment or risk waiver.
