# Unlazy re-audit — V8.4.0

## Decision

**ABSORB SELECTIVELY. DO NOT ADD A ROUTED `unlazy` SKILL OR VENDOR ITS RUNTIME.**

Source reviewed: `Leonxlnx/unlazy` at commit `473d4b80421c36d733042434cd4b938f81a19ef1`. The repository describes the source as an unreleased target `2.1.0`; no Git tag or GitHub Release existed at review time.

## What changed upstream

The current source moved far beyond the original Depth Tree prompt. Its strongest additions are:

- acceptance gates written before real work;
- strict gate parsing and fail-closed malformed state;
- independent `--reverify` rather than trusting checked boxes or worker evidence;
- gate-quality linting for weak or tautological oracles;
- positive controls for negative checks and independent measurement of supplied figures;
- visible abandonment as handoff rather than success;
- scoped pipelines, exact ownership declarations, rolling dispatch, and branch-level integration gates;
- launch waves that require every native worker handle before the first wait;
- semantic no-progress detection based on resolved gate and dispatch state;
- explicit approval before executing inherited gate commands;
- a documented security boundary: approval is consent, not a sandbox.

## Lean decisions

| Upstream capability | Decision | Lean home |
|---|---|---|
| New `unlazy` routed skill | Reject | Overlaps `get-it-done`, `plan`, `test`, and `gauntlet-loop` |
| Node checker, dispatcher, installer, approval store, and Stop hook | Keep upstream/project-local only | No runtime dependency or hook in Lean |
| Falsifiable gate and oracle-authoring rules | Strongly absorb | `ENGINEERING-CORE`, `test`, `review`, `gauntlet-loop` |
| Parent re-execution of returned-work checks | Strongly absorb | `get-it-done`, `ORCHESTRATION`, `gauntlet-loop` |
| Required abandonment as non-successful handoff | Strongly absorb with Lean residual-risk nuance | `get-it-done`, `gauntlet-loop` |
| Revisioned contract inventory | Absorb | `plan`, `get-it-done`, durable state |
| Exact ownership claim and release lifecycle | Absorb as coordination semantics | `ORCHESTRATION`; no sandbox claim |
| Native launch-wave barrier and distinct handles | Absorb | `ORCHESTRATION` |
| Rolling dispatch after parent verification | Absorb | `ORCHESTRATION` |
| Leaf-local versus branch-integration gates | Strongly absorb | `plan`, `ORCHESTRATION` |
| Semantic progress instead of edit activity | Strongly absorb | `get-it-done`, `gauntlet-loop` |
| Fixed effort multiplication by tree depth | Reject | Upstream itself retired the arithmetic claim |
| Mostly manual gate ratio or lexical lint warnings as universal blockers | Reject globally | Diagnostics only; risk and task decide |

## Why the runtime was not adopted

The runtime is useful but is not a lean, vendor-neutral foundation. It adds Node scripts, executable gate files, an approval store, optional host settings mutation, hook lifecycle, locks, leases, dispatch state, shell/PATH behavior, and platform-specific process cleanup. The source was not tagged or released at review time. An open Windows report also reproduced fail-closed file-identity errors on one Node/NTFS configuration despite the published CI matrix. These facts do not invalidate the project, but they make vendoring it into the stable Lean core a poor trade.

## Boundary

Lean adapts the stable behavioral mechanisms. It does not copy or bundle Unlazy's checker, parser, dispatcher, installer, Stop hook, templates, approval records, or host adapters. Projects may adopt the upstream runtime separately after pinning an exact commit, reviewing its executable paths, and testing their actual platform.
