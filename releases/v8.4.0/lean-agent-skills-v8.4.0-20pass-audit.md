# Lean Agent Skills V8.4.0 — 20-pass release audit

## Decision

**PASS STATIC — LIVE HOST AND USER VALIDATION PENDING**

V8.4.0 keeps 23 canonical skills, 17 implicitly selectable skills, 6 manual-only skills, and six deployment profiles. No routed skill, dependency, service, runtime hook, executable skill payload, installer, or automatic trusted-state mutation is added.

## Unlazy synthesis

Reviewed source: `Leonxlnx/unlazy` at commit `473d4b80421c36d733042434cd4b938f81a19ef1`. The source targeted an unreleased 2.1.0 and had no Git tag or GitHub Release at review time. Its current implementation is strong and unusually explicit about command trust, evidence freshness, orchestration, and limitations. The runtime remains upstream because it adds a substantial executable and host-specific control plane and had an open Windows/Node file-identity failure report at review time.

### Absorbed

- observable, falsifiable gate outcomes;
- process success plus success-only output when text matching is used;
- positive controls for negative or absence checks;
- independent measurement of supplied numbers;
- sensitivity against representative broken states;
- historical status versus current re-execution;
- parent re-verification of returned work;
- required abandonment as visible non-successful handoff;
- revisioned contract inventories;
- exact ownership claim/release lifecycle;
- launch all native workers and capture handles before waiting;
- rolling dispatch after verification;
- leaf-local versus branch-integration gates;
- semantic rather than cosmetic progress.

### Rejected or kept upstream

- a new `unlazy` route;
- Depth Tree effort multiplication;
- Node checker, parser, linter, dispatcher, installer, approval store, Stop hook, and host adapters;
- universal lexical warning thresholds or manual-gate ratios;
- claims that ownership leases provide process or filesystem isolation.

## Audit passes

| Pass | Perspective | Result |
|---:|---|---|
| 1 | Version, license, metadata, and six-profile alignment | PASS STATIC |
| 2 | 23-skill inventory and support-reference closure | PASS STATIC |
| 3 | OpenAI adapter schema and manual/implicit policy | PASS STATIC |
| 4 | Trigger overlap and routing-surface preservation | PASS STATIC |
| 5 | Adaptive prose and simple-turn restraint | PASS STATIC |
| 6 | Considerate agency and permission boundaries | PASS STATIC |
| 7 | Human-usable information and cognitive accessibility | PASS STATIC |
| 8 | Teaching, transfer, and Easy-to-Read boundaries | PASS STATIC |
| 9 | Explicit standards and project-influence provenance | PASS STATIC |
| 10 | Requirements, quality, lifecycle, and assurance traceability | PASS STATIC |
| 11 | Gate-to-outcome mapping and falsifiable oracle rules | PASS STATIC |
| 12 | Positive-control, supplied-number, and sensitivity rules | PASS STATIC |
| 13 | Executable verifier trust and approval-versus-proof boundary | PASS STATIC |
| 14 | Historical status, evidence freshness, and parent re-execution | PASS STATIC |
| 15 | Required abandonment and residual-risk disposition | PASS STATIC |
| 16 | Contract inventory, stable IDs, ownership, and revision handling | PASS STATIC |
| 17 | Launch waves, distinct handles, sequential fallback, and rolling dispatch | PASS STATIC |
| 18 | Leaf-local versus branch-integration verifier placement | PASS STATIC |
| 19 | Semantic progress and no-progress detection | PASS STATIC |
| 20 | Deterministic builds, archive validation, PowerShell 7, and Windows PowerShell 5.1 | PASS CI REQUIRED |

## Static evaluation corpus

The release includes 40 cases across oracle quality, negative controls, measurement, command trust, re-verification, freshness, handoff, semantic progress, contract inventory, gate placement, ownership, parallelism, rolling dispatch, shared failure, final reporting, and runtime boundaries.

## Remaining limits

- Live routing and instruction adherence in OMP, Codex, and ChatGPT were not measured.
- No claim is made that Lean reproduces Unlazy's mechanical enforcement without the upstream runtime.
- No target-user, accessibility, or task-success study was run.
- Static scenario classification does not prove every model will choose the correct behavior.
- Formal standards, security, accessibility, usability, or quality conformance is not claimed.
- Upstream Unlazy may change after the pinned reviewed commit.
