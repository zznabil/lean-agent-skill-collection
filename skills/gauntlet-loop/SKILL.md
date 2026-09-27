---
name: gauntlet-loop
description: "Run a bounded adversarial quality loop with independent critics, frozen benchmarks, repair, and retest over a real artifact. Use only when hidden-defect risk makes one direct check insufficient."
---

# Gauntlet Loop

Use applicable ISO/IEC 25010 quality attributes, ISO/IEC/IEEE 29119-inspired traceability and ISO/IEC/IEEE 15026-2-inspired assurance cases. Apply OWASP ASVS, WCAG 2.2 or `AI-ASSURANCE.md` only to relevant risks. The builder MUST NOT finally approve its own work.

## Trigger and ownership

Run on a user's gauntlet/red-team request or when hidden-defect risk makes a normal focused review plus one direct check insufficient. Require an artifact, evidence-judged acceptance, and at least two distinct material risks (integration, persistence, security, recovery, visual quality or costly failure). Do not use for factual questions, tiny rewrites or formatting. Every lane must address a separate gap.

- **Lead:** freeze scope, benchmarks, standing completion bar, coverage, budget, ownership and stop decision.
- **Builder:** make bounded repairs and supply reproducible evidence; never weaken a test or acceptance criterion.
- **Critic:** read-only, with goal, real artifact, benchmark, distinct charter and anti-charter—not the builder's conclusion. **Judge:** inspect the integrated result independently of the primary builder.
- Prefer fresh contexts; otherwise mark independence reduced. Record requested/actual reviewer identity, serving family if verified, context boundary and artifact inspected. Names alone do not prove independence; claims of delegation require live evidence.

## Freeze the benchmark

Order evidence authority: user requirements, authoritative specifications, supplied references, required current behavior, deterministic tests, measured targets, structured rubrics, subjective judgment. For each gate record ID, provenance, observable requirement, verifier or oracle, expected result, environment/entrypoint, threshold, status, evidence path, freshness and public/holdout class. Keep the standing Definition of Done separate. Test an oracle against a representative broken state and a positive control when consequential; status records are not execution.

Any benchmark change needs a reason, diff, authority and impact on prior evidence; never weaken it to pass. Hard gates precede soft scores. For model/simulated work, require both history/holdout model gate and actual integrated reality gate when applicable; procedural tasks need intermediate invariants. Do not claim standards conformance from unverified scope. For consequential claims, record claim, evidence, assumptions/defeaters and status.

## Bounded loop

1. Preflight scope, permission, false-pass risks, rollback and budget; create a checkpoint and acceptance ledger. Baseline the real artifact, required journeys, tests and measurements.
2. Map every required slice once, count gaps/overlap and give coupled areas one owner before fan-out. Repair the smallest useful defect; save changed artifact and evidence.
3. Run deterministic checks. Verify each gate observes its named outcome, can fail, and independently calculates figures; a known positive fixture calibrates absence checks. Reject weak oracles before judging quality.
4. Use distinct read-only lanes from `CRITIC-LANES.md`; for AI/agent systems inspect `AI-ASSURANCE.md` and any current AI asset card. Distinguish outcome, full trajectory and tool-choice evidence. Separate findings from verification, and raw observations from inference (`VERIFIED`, `ASSUMED`, `REFUTED`, `UNKNOWN`). A causal hypothesis needs a falsifier.
5. Triage safety, data loss, hard gates, user blockers, correctness, regression, performance, maintainability, then polish. Repair a tight cluster, rerun its failed gate and adjacent regression checks. Evidence is stale after artifact, verifier, input, environment, entrypoint, auth or dependency changes. Stop dependent steps at first material mismatch; revert a regression.
6. Wait at real join barriers, verify every manifest row and critic claim, then judge the integrated artifact. Once all hard gates pass, run one focused counterexample/integration pass and stop unless a named material gap justifies another round. Extend only with verified progress and budget; repair a shared cause before repeating a failed wave. Disclose capped or unprocessed items.
7. A fresh final judge re-executes the current critical oracles, checks both claim-to-evidence and requirement-to-decision coverage, and inspects integration, real journeys, rollback, stray files, debug settings and secrets. Both model and reality gates pass when applicable.

## Status, limits and state

Track separately: run state `ACTIVE|COMPLETE|BLOCKED|BUDGET EXHAUSTED|CANCELLED`; verdict `PASS|CONDITIONAL PASS|FAIL|NOT JUDGED`; severity `P0..P3`; disposition `blocking|nonblocking` plus repair state. A hard-gate failure or verified blocking defect is `FAIL`; missing required evidence is `NOT JUDGED` unless the benchmark defines it as failure. Pair either with `BLOCKED` or `BUDGET EXHAUSTED` when execution stops. `CONDITIONAL PASS` requires every hard gate passed and only explicitly accepted, owned, nonblocking residuals; `ABANDONED`, `DEFERRED`, or `OWNER_DECISION` on a required gate is non-passing. Severity alone does not decide disposition.

Unless the user sets limits: one baseline, four major repair rounds, two consecutive no-improvement rounds, at most two builders, three critics, one tie-breaker, five critical journeys, three required visual viewports per state and one final integration gauntlet. Reserve ~40% of delegated budget for verification/integration. Ceilings are not targets. Use `.gauntlet/state.md`, `benchmarks.yaml`, `defects.md`, `evidence/` per `STATE-FORMAT.md`; checkpoint after each repair round, material result or approval gate.

For measurable work show named 20-cell ASCII progress from durable processed items, rounded down and separate from verdict; a failed/blocked/skipped/untested item counts only when terminally classified with evidence, never as passed. If no defensible denominator exists, report phase and evidence without a bar. Final report leads with verdict, run state, named coverage, hard-gate tally and blocking findings, then before/after score, fresh evidence, limits, risks, rollback and next action. Re-measure numeric claims; label unmeasured or unsupported ones `NOT MEASURED` or `UNVERIFIED`. Separate observed failure from unknown cause and own actual agent errors.

**User-facing:** Apply the global outcome-first communication kernel; without it, combine ISO 24495-1 and W3C COGA for clarity, ASD-STE100 only for suitable technical prose, BCP 14 for normative force, IEC/IEEE 82079-1 for procedures, OWASP ASVS for applicable security evidence, and Easy-to-Read only with intended-user review. Preserve evidence, uncertainty, meaning, voice and permissions; never claim unverified conformance.
