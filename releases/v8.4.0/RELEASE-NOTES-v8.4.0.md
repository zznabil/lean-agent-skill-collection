# Lean Agent Skill Collection V8.4.0 — Proof Integrity & Verified Orchestration

V8.4.0 keeps the 23-skill routing surface and absorbs selected mechanisms from `Leonxlnx/unlazy` at commit `473d4b80421c36d733042434cd4b938f81a19ef1`.

## Main changes

- Acceptance gates must observe the named outcome and have a credible failure path.
- Output-matched gates require process success plus a success-only marker.
- Negative or absence checks need a known positive control when consequential.
- Supplied figures must be calculated independently from source data.
- Load-bearing verifiers should fail against a representative broken state when practical.
- Stored status, checked boxes, and worker reports are historical claims; parents and judges re-execute current critical checks.
- Required `ABANDONED`, `DEFERRED`, or `OWNER_DECISION` gates remain non-completion unless an authorized scope change removes them.
- Delegated plans inventory every omittable outcome and acceptance-changing constraint with a stable owner and observation.
- Parallel waves launch all workers and record distinct native handles before the first wait; hosts without that evidence use the sequential fallback.
- Ownership is released after parent verification, enabling rolling dispatch.
- Leaf gates remain local; interface, end-to-end, joined-state, and regression gates run at integration level.
- Progress is based on resolved work or acceptance state, not cosmetic edits or repeated status reads.

## Deliberate non-adoption

Lean does not bundle Unlazy's Node checker, parser, gate linter, dispatcher, installer, approval store, Stop hook, templates, or host adapters. Projects may install the upstream runtime separately after pinning and reviewing it. The upstream source was not tagged or released at review time, and an open Windows/Node issue reported a platform-specific fail-closed file-identity defect.

## Compatibility

- Same 23 canonical skills.
- Same six profile names and inventories.
- Same manual and implicit invocation policy.
- No new dependency, service, hook, installer, executable skill payload, or automatic trusted-state mutation.

## Validation

- 40 proof-integrity scenarios.
- 20-pass static release audit.
- Deterministic double builds.
- Validator rejection controls.
- Source, package, archive, and repository validation.
- PowerShell 7 and Windows PowerShell 5.1 CI.
- Annotated tag and public-release read-back.

## Evidence limits

This release does not establish live OMP, Codex, or ChatGPT behavior; it does not mechanically enforce gates without an external host or project runtime; and it makes no formal conformance claim.
