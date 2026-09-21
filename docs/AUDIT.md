# V8.10.0 Quick Mode acceptance

Use [the Quick Mode design](QUICK-MODE-DESIGN-v8.10.0.md) for the current change and evidence boundary.

## Required source and package properties

- `quick-mode` is natural-language selectable only after an explicit user request and appears exactly once in Core, Engineering, Complete, and Get It Done.
- Communication and Gauntlet do not contain Quick Mode.
- Removing the declared Quick Mode addition reconstructs the exact V8.8 profile memberships.
- The existing 25 V8.8 instruction roots and frozen references remain unchanged.
- The default validation mode is one smoke check.
- Selected dogfooding requires tool-mediated use of the actual running project.
- Selected automated UAT requires one replayable user journey with a real assertion.
- Source inspection, compilation alone, unit tests alone, and an uninteracted screenshot are rejected as interaction evidence.
- Unavailable tools produce `BLOCKED` or `UNRUN`, not an invented pass.
- Quick Mode does not claim production readiness or weaken permission, safety, data, security, compatibility, or accessibility floors.

## Automated gates

Run deterministic double builds, validator rejection controls, source/package validation, repository auditing, and V8.8 prose-preservation checks on PowerShell 7 and Windows PowerShell 5.1. Validate 24 unique Quick Mode fixtures across activation, anti-trigger, scope, safety, smoke, dogfooding, automated UAT, and unavailable-tool categories. Verify the exact release mirror and every profile package.

These are static source and distribution checks. They do not prove live host selection, tool availability, successful dogfooding, successful automated UAT, improved task completion, or production safety.

This pull request is review-only. Do not infer merge, tagging, publication, or local installation from a passing PR check.

---

# V8.8.0 prose-preservation acceptance

Use [the V8.8.0 design](PROSE-CLARITY-v8.8.0.md) for the current change, source walkthroughs, frozen baseline, reconstruction checks and evidence limits. Existing V8.7 checks remain required; add `scripts/test-prose-preservation.ps1 -ArtifactsDirectory ./artifacts/repro-a` on both PowerShell hosts. Execution results belong to the exact CI revision, not this document.

No live model performance or conformance result is asserted. The earlier record below remains historical context for the inherited checks.

---

# Lean Agent Skills V8.7.0 — release audit

## Evidence boundary

This is the scoped source-review and release acceptance record. Exact-commit CI and publication readback provide execution results; this document is not a live model-evaluation report. The 32 fixtures are authored expectations, not 32 successful agent runs.

## Review perspectives

| Pass | Perspective | Acceptance evidence |
|---:|---|---|
| 1 | Trigger and scope | Operational/evaluative prose covered; casual language and requested artifacts protected |
| 2 | Truth and certainty | Genuine uncertainty and evidence scope/degree retained |
| 3 | Logical meaning | Precise negation and statistical/legal/source distinctions preserved |
| 4 | Accountability | Actual agent action and correction explicit; unknown actor stays unknown |
| 5 | Safety | Recovery remains within existing permissions; no unauthorised action implied |
| 6 | Global and standalone operation | AGENTS, wait-what, 22 fallbacks, and 23 adapters carry the rule |
| 7 | Internal handoff | Worker status and ledgers retain observed failures and unknown causes |
| 8 | Regression boundary | Existing modes, status model, evidence rules, prose sources, and requested wrappers retained |
| 9 | Lean packaging | 23 skills and six profile inventories unchanged; no runtime or routed skill added |
| 10 | Source attribution | W3C/OpenAI support scoped; informal term and failed Astra retrieval disclosed |
| 11 | Validator sensitivity | Positive controls plus 14 deliberate missing-clause/metadata mutations must pass |
| 12 | Release integrity | PR and exact-main CI on both PowerShell hosts; tagged-source assets and downloaded byte equality required |

## Automated gates

Run deterministic double builds, validator rejection controls, source/package validation, and repository auditing on PowerShell 7 and Windows PowerShell 5.1. Validate 32 unique nonempty fixtures, category coverage, and byte-identical release mirror. Inspect every generated profile's direct-claims metadata and policy contents.

String-presence checks protect distribution integrity but do not prove that an agent obeys the text. No independent-agent review, live OMP/Codex/Hermes/ChatGPT A/B, user comprehension, or formal conformance is claimed.

## Release rule

Merge only after the current PR revision passes both hosts. Wait for exact merged-commit CI before creating a new annotated tag. Build fresh assets, publish a separate public release, download every asset, compare bytes, and read back the tag and release. Earlier releases remain unchanged.
