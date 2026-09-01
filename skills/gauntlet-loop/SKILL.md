---
name: gauntlet-loop
description: "Run a bounded adversarial quality loop with independent critics, frozen benchmarks, repair, and retest over a real artifact. Use only when hidden-defect risk makes one direct check insufficient."
---

# Gauntlet Loop

Select applicable **ISO/IEC 25010** quality attributes, use **ISO/IEC/IEEE 29119-inspired** verification traceability, and structure consequential claims as **ISO/IEC/IEEE 15026-2-inspired assurance cases**. Use applicable **OWASP ASVS**, **WCAG 2.2**, or `AI-ASSURANCE.md` requirements rather than generic quality labels.

The builder MUST NOT finally approve its own work.

## Trigger

Run when the user asks for a gauntlet, independent critics, red-team-until-acceptance, benchmark-and-repair, release readiness, real UI testing, hidden tests, or repeated evidence-driven improvement.

An orchestrator MUST NOT invoke it for DIRECT work. Before invocation, record the material risk or evidence gap that a normal focused review and one decisive check cannot resolve. It may invoke Gauntlet only when all are true:

- a meaningful artifact exists;
- acceptance can be judged against evidence;
- one direct test is not enough;
- at least two material risks exist, such as costly failure, several journeys, visual quality, integration, persistence, security, recovery, or supplied references.

Do not auto-run it for factual questions, trivial rewrites, one-line fixes, tiny scripts, formatting, or work whose extra review costs more than the likely gain. Every critic and lane must map to a distinct material risk or evidence gap; overlapping critics are not extra assurance.

## Roles

- **Lead:** freezes scope, task benchmarks, standing completion bar, coverage manifest, budget, ownership, state, triage order, and stop decision.
- **Builder:** makes one bounded repair, runs local checks, and supplies reproducible evidence. It MUST NOT weaken tests or acceptance criteria.
- **Critic:** read-only. It receives the goal, benchmark, environment, and real artifact—not the builder’s conclusion. It has a distinct charter and anti-charter and tries to falsify acceptance.
- **Judge:** reviews the integrated artifact, task gates, standing completion bar, and benchmark integrity. It is not the primary builder.

Prefer a separate fresh context for critics and judge. If unavailable, use a segregated review packet and label independence as reduced. Every critic and judge records an identity receipt: requested reviewer, actual model, serving-family verification, context boundary, and artifact inspected. Different CLI names do not prove independence; unverified identity reduces it. Delegated-review claims require live child, tool, or artifact evidence.

## Benchmark

Before substantial changes, register requirements in this order: user requirements, authoritative specifications, supplied references, required current behavior, deterministic tests, measured targets, structured rubrics, then subjective judgment.

Each benchmark records ID, provenance, observable requirement, verifier or oracle, expected result, oracle-calibration evidence when material, tested artifact or revision, environment, entrypoint and authentication context when relevant, hard gate or soft score, threshold, evidence path, status, confidence, and public or holdout class. A verdict MUST NOT exceed the actual evidence scope. Inventory is not execution; unit, harness, simulated, or auth-bypassed evidence is not deployed or production proof without demonstrated equivalence. Record the project’s standing Definition of Done separately when one exists. For a consequential claim supported by several evidence types, record a compact assurance case: claim, scope, argument, evidence, assumptions or defeaters, and status. For engineering artifacts, select only relevant quality attributes: correctness, performance, compatibility, usability or accessibility, reliability, security, maintainability, portability, and safety.

Freeze the benchmark version. Any change needs a reason, diff, authorization source, impact on prior evidence, and confirmation that it is not a pass-seeking weakening. For model-based, simulated, generated, or transformed work, define two gates when applicable: a **model gate** that reproduces relevant history and holdout evidence, and a **reality gate** that proves the derived procedure on the actual integrated artifact. For procedural outcomes, include required intermediate transitions and invariants, not only final-state checks. Hard gates MUST pass before soft polish can produce `PASS`. Do not claim standards compliance unless the scoped requirements were actually verified.

## Loop

1. **Preflight:** define scope, non-goals, permissions, false-pass risks, rollback, and budget. Create a checkpoint and acceptance ledger with check, expected result, and evidence fields.
2. **Baseline:** run the artifact, tests, required journeys, screenshots, and measurements. Record working behavior and failures.
3. **Decompose:** map dependencies and write a coverage manifest before fan-out. Every required slice or journey appears exactly once. Verify counts, gaps, overlap, caps, and remainder. Give each shared or coupled area one owner.
4. **Build:** make the smallest useful change. Avoid unrelated rewrites. Save diff and evidence.
5. **Deterministic checks:** build, lint, test, and measure before subjective review. Audit the gate itself: it must observe the named outcome, have a credible failure path, calculate supplied figures independently, and use a known positive control for consequential negative or absence checks. When practical, confirm sensitivity against a representative broken state. Reject hard-gate failures and weak oracles before continuing.
6. **Attack:** select only relevant lanes from `CRITIC-LANES.md`. For AI or agent systems, read `AI-ASSURANCE.md`, inspect the current AI asset card when available, and select only applicable versioned requirements and threat cases. For agentic artifacts with traces, distinguish end-outcome, full-trajectory, and individual tool-choice or argument evaluation. Keep finders and verifiers separate. Critics MUST inspect the real artifact, attempt refutation, and report reproducible findings. Preserve raw evidence separately from conclusions; mark material claims `VERIFIED`, `ASSUMED`, `REFUTED`, or `UNKNOWN`. When investigating cause, collect evidence before forming stories and assign one falsifier to each competing hypothesis.
7. **Triage:** rank safety, data loss, hard gates, user blockers, correctness, regression risk, performance, maintainability, then polish. Choose the highest expected improvement per cost and risk. Set the default under uncertainty from the more costly error direction.
8. **Repair:** fix one defect or tight cluster. Add regression coverage when practical.
9. **Retest:** rerun the failed benchmark, adjacent checks, and relevant regression set with fresh evidence. Treat evidence as stale when the artifact or revision, verifier or rubric, relevant inputs, environment, entrypoint, authentication context, or required dependencies changed. For a multi-step procedure, stop dependent steps at the first material mismatch. Revert a change that makes the total result worse.
10. **Barrier:** pipeline independent finding→verify paths. Wait for the whole field only when global deduplication, ranking, a join, convergence, or the judge requires it. Verify every manifest row and critic claim before carrying it forward.
11. **Decide:** after all hard gates pass, run one focused clean counterexample or integration pass and stop unless a named unresolved risk justifies another round. Extend only while a material gap is fixable, the last round added verified progress, and budget remains. If a whole wave fails the same way, repair the shared contract or environment before another wave. Disclose every stopped, skipped, capped, or unprocessed item.
12. **Final judge:** use a clean environment when practical; re-execute the current critical oracles rather than trusting status records; run integrated tests and journeys; inspect screenshots and diffs; and verify benchmark integrity, standing completion, persistence, operations, rollback, stray files, debug settings, and secrets. When model and reality gates apply, both MUST pass. Check both directions: every acceptance claim has evidence, and every material benchmark appears in the decision.

## Status model

Track four axes separately:

- **Run state:** `ACTIVE`, `COMPLETE`, `BLOCKED`, `BUDGET EXHAUSTED`, or `CANCELLED`.
- **Artifact verdict:** `PASS`, `CONDITIONAL PASS`, `FAIL`, or `NOT JUDGED`.
- **Finding severity:** `P0` through `P3` describes impact.
- **Disposition:** `blocking` or `nonblocking`; repair state is recorded separately as `open`, `fixed`, `blocked`, or `deferred`.

A required benchmark or task gate with `ABANDONED`, `DEFERRED`, or `OWNER_DECISION` disposition remains non-passing and normally blocking until an authorized benchmark or scope change removes it. An explicitly accepted, owned residual can support `CONDITIONAL PASS` only when it is outside every hard gate and is nonblocking.

A severity does not decide disposition by itself. `P0` and `P1` are normally blocking. A `P2` MAY be blocking when the frozen benchmark, standing Definition of Done, or repair class requires `block now` or `fix before merge`; otherwise it is a nonblocking follow-up only when explicitly accepted and owned. Do not write the ambiguous phrase `P2 blocked`; write, for example, `P2 / blocking / repair blocked` or `P2 / nonblocking / follow-up`.

Use verdicts as follows:

- `PASS` — every hard gate passes, the acceptance threshold is met, and no blocking finding remains.
- `CONDITIONAL PASS` — every hard gate passes and only explicitly accepted, owned, nonblocking residuals remain.
- `FAIL` — a hard gate fails or a verified blocking finding remains.
- `NOT JUDGED` — required evidence or coverage is unavailable and no verified failure is sufficient to decide `FAIL`.

Run state explains why execution stopped. A verified blocking defect whose repair cannot proceed is `Verdict: FAIL` with `Run state: BLOCKED`. Missing required evidence is normally `Verdict: NOT JUDGED` with `Run state: BLOCKED`, unless the frozen benchmark explicitly defines missing evidence as failure. Budget exhaustion is likewise a run state: pair it with `FAIL` when a blocking failure is known, otherwise with `NOT JUDGED`.

## Default limits

When the user gives no budget: one baseline; four major repair rounds total; two consecutive no-improvement rounds; at most two parallel builders, three critics, one tie-breaker, five critical journeys, three required visual viewports per state, and one final integration gauntlet. For delegated runs, reserve about 40% of the usable budget for verification and integration unless a cheap deterministic verifier justifies less. These are ceilings, not targets.

## Durable state

Use `.gauntlet/state.md`, `.gauntlet/benchmarks.yaml`, `.gauntlet/defects.md`, and `.gauntlet/evidence/`. Nested runs may store these below the parent goal state. Use `STATE-FORMAT.md` for the minimum fields. Checkpoint after each repair round, material test result, approval gate, or interruption risk.

## Progress

Progress measures completion of a **named work track or coverage set**, not quality, success, or acceptance. At meaningful milestones use exactly 20 cells. During an ongoing run, the generic form is allowed:

```text
Progress: [############--------] 60% (6/10)
```

In a terminal report, label what the bar counts and report verdict separately:

```text
Audit     [####################] 100% (8/8) complete
Verdict:  FAIL
Checks:   7 PASS, 1 FAIL
```

`#` is completed and `-` is remaining. Derive values from durable state and round down. A `FAIL`, `BLOCKED`, `SKIPPED`, or `NOT TESTED` item MAY count as processed only when its terminal classification and evidence are recorded; it never counts as passed. Cosmetic edits, repeated status reads, timestamps, and tool calls do not count as progress when no resolved benchmark, defect, contract, or coverage state changed. Do not show a bare `Progress: 100%` beside a non-pass verdict. When no defensible total exists, report phase, evidence, highest-priority defect, next action, and budget without inventing a bar. Prefer the word `complete` rather than `✓` for a finished track when the artifact verdict is not `PASS`.

## Final report

Lead with these separate fields:

```text
Verdict: <PASS | CONDITIONAL PASS | FAIL | NOT JUDGED>
Run state: <COMPLETE | BLOCKED | BUDGET EXHAUSTED | CANCELLED>
<Named track> [####################] 100% (<processed>/<planned>) complete
Hard gates: <passed>/<total> PASS
Blocking findings: <count>
```

Then report model/reality gate status when applicable, standing completion status, before/after score, decisive executed evidence, failed or unavailable checks, remaining defects, stable checkpoint, rollback, stop reason, confidence, and next highest-value issue. Keep the user-facing packet outcome-first: link the durable ledger instead of replaying each critic round, repair attempt, command, or tool event.

Re-run or re-measure every numeric claim in the final packet. If a metric was not actually measured, say `NOT MEASURED`; source inspection may identify potential impact but cannot create a measurement. No quality claim is valid without linked evidence. Mark unsupported claims `UNVERIFIED`.

**User-facing:** Apply the global outcome-first delivery overlay. Match reply length and structure to the weight of the ask. Investigate enough internally to be right, but report only the useful outcome, fresh verification, material uncertainty, and remaining user action; do not replay routine tool calls or internal process. Simple turns stay short. For substantive chat, use **Summary** and **TL;DR** when required by the active user or host contract or when they improve navigation; each MUST add distinct value and MUST NOT repeat the same conclusion. Apply **ASD-STE100**, **ISO 24495-1**, and **W3C COGA** proportionally. Add Feynman, Diátaxis, or BCP 14 only when their function applies. Use truthful named 20-cell progress separate from verdict. Preserve machine and artifact formats. Be considerate, avoid surprise scope, and leave the result ready to use or resume.
