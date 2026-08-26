---
name: gauntlet-loop
description: "Run a bounded adversarial quality loop with independent critics, frozen benchmarks, repair, and retest over a real artifact. Use only when hidden-defect risk makes one direct check insufficient."
---

# Gauntlet Loop

The builder MUST NOT finally approve its own work.

## Trigger

Run when the user asks for a gauntlet, independent critics, red-team-until-acceptance, benchmark-and-repair, release readiness, real UI testing, hidden tests, or repeated evidence-driven improvement.

An orchestrator may invoke it only when all are true:

- a meaningful artifact exists;
- acceptance can be judged against evidence;
- one direct test is not enough;
- at least two material risks exist, such as costly failure, several journeys, visual quality, integration, persistence, security, recovery, or supplied references.

Do not auto-run it for factual questions, trivial rewrites, one-line fixes, tiny scripts, formatting, or work whose extra review costs more than the likely gain.

## Roles

- **Lead:** freezes scope, task benchmarks, standing completion bar, coverage manifest, budget, ownership, state, triage order, and stop decision.
- **Builder:** makes one bounded repair, runs local checks, and supplies reproducible evidence. It MUST NOT weaken tests or acceptance criteria.
- **Critic:** read-only. It receives the goal, benchmark, environment, and real artifact—not the builder’s conclusion. It has a distinct charter and anti-charter and tries to falsify acceptance.
- **Judge:** reviews the integrated artifact, task gates, standing completion bar, and benchmark integrity. It is not the primary builder.

Prefer a separate fresh context for critics and judge. If unavailable, use a segregated review packet and label independence as reduced. Every critic and judge records an identity receipt: requested reviewer, actual model, serving-family verification, context boundary, and artifact inspected. Different CLI names do not prove independence; unverified identity reduces it. Delegated-review claims require live child, tool, or artifact evidence.

## Benchmark

Before substantial changes, register requirements in this order: user requirements, authoritative specifications, supplied references, required current behavior, deterministic tests, measured targets, structured rubrics, then subjective judgment.

Each benchmark records ID, provenance, observable requirement, verification method, tested artifact or revision, environment, entrypoint and authentication context when relevant, hard gate or soft score, threshold, evidence path, status, confidence, and public or holdout class. A verdict MUST NOT exceed the actual evidence scope. Inventory is not execution; unit, harness, simulated, or auth-bypassed evidence is not deployed or production proof without demonstrated equivalence. Record the project’s standing Definition of Done separately when one exists. For a consequential claim supported by several evidence types, record a compact assurance case: claim, scope, argument, evidence, assumptions or defeaters, and status. For engineering artifacts, select only relevant quality attributes: correctness, performance, compatibility, usability or accessibility, reliability, security, maintainability, portability, and safety.

Freeze the benchmark version. Any change needs a reason, diff, authorization source, impact on prior evidence, and confirmation that it is not a pass-seeking weakening. For model-based, simulated, generated, or transformed work, define two gates when applicable: a **model gate** that reproduces relevant history and holdout evidence, and a **reality gate** that proves the derived procedure on the actual integrated artifact. For procedural outcomes, include required intermediate transitions and invariants, not only final-state checks. Hard gates MUST pass before soft polish can produce `PASS`. Do not claim standards compliance unless the scoped requirements were actually verified.

## Loop

1. **Preflight:** define scope, non-goals, permissions, false-pass risks, rollback, and budget. Create a checkpoint and acceptance ledger with check, expected result, and evidence fields.
2. **Baseline:** run the artifact, tests, required journeys, screenshots, and measurements. Record working behavior and failures.
3. **Decompose:** map dependencies and write a coverage manifest before fan-out. Every required slice or journey appears exactly once. Verify counts, gaps, overlap, caps, and remainder. Give each shared or coupled area one owner.
4. **Build:** make the smallest useful change. Avoid unrelated rewrites. Save diff and evidence.
5. **Deterministic checks:** build, lint, test, measure, and reject hard-gate failures before subjective review.
6. **Attack:** select only relevant lanes from `CRITIC-LANES.md`. For AI or agent systems, read `AI-ASSURANCE.md` and select only applicable versioned requirements and threat cases. For agentic artifacts with traces, distinguish end-outcome, full-trajectory, and individual tool-choice or argument evaluation. Keep finders and verifiers separate. Critics MUST inspect the real artifact, attempt refutation, and report reproducible findings. Preserve raw evidence separately from conclusions; mark material claims `VERIFIED`, `ASSUMED`, `REFUTED`, or `UNKNOWN`. When investigating cause, collect evidence before forming stories and assign one falsifier to each competing hypothesis.
7. **Triage:** rank safety, data loss, hard gates, user blockers, correctness, regression risk, performance, maintainability, then polish. Choose the highest expected improvement per cost and risk. Set the default under uncertainty from the more costly error direction.
8. **Repair:** fix one defect or tight cluster. Add regression coverage when practical.
9. **Retest:** rerun the failed benchmark, adjacent checks, and relevant regression set with fresh evidence. Treat evidence as stale when the artifact or revision, verifier or rubric, relevant inputs, environment, entrypoint, authentication context, or required dependencies changed. For a multi-step procedure, stop dependent steps at the first material mismatch. Revert a change that makes the total result worse.
10. **Barrier:** pipeline independent finding→verify paths. Wait for the whole field only when global deduplication, ranking, a join, convergence, or the judge requires it. Verify every manifest row and critic claim before carrying it forward.
11. **Decide:** extend only while a material gap is fixable, the last round added verified progress, and budget remains. If a whole wave fails the same way, repair the shared contract or environment before another wave. Disclose every stopped, skipped, capped, or unprocessed item.
12. **Final judge:** use a clean environment when practical; run integrated tests and journeys, inspect screenshots and diffs, verify benchmark integrity, standing completion, persistence, operations, rollback, stray files, debug settings, and secrets. When model and reality gates apply, both MUST pass. Check both directions: every acceptance claim has evidence, and every material benchmark appears in the decision.

## Default limits

When the user gives no budget: one baseline; four major repair rounds total; two consecutive no-improvement rounds; at most two parallel builders, three critics, one tie-breaker, five critical journeys, three required visual viewports per state, and one final integration gauntlet. For delegated runs, reserve about 40% of the usable budget for verification and integration unless a cheap deterministic verifier justifies less. These are ceilings, not targets.

## Durable state

Use `.gauntlet/state.md`, `.gauntlet/benchmarks.yaml`, `.gauntlet/defects.md`, and `.gauntlet/evidence/`. Nested runs may store these below the parent goal state. Use `STATE-FORMAT.md` for the minimum fields. Checkpoint after each repair round, material test result, approval gate, or interruption risk.

## Progress

At meaningful milestones, MUST use the 20-cell format `Progress: [############--------] 60% (6/10)`. For several stages, use one aligned line per stage. `#` is completed, `-` is remaining, and `✓` appears only at 100%. Derive values from durable state and round down. If no defensible total exists, report phase, evidence, highest-priority defect, next action, and budget without inventing a bar.

## Final decision

End with `PASS`, `CONDITIONAL PASS`, `FAIL`, `BLOCKED`, or `BUDGET EXHAUSTED`. Lead with the decision, hard-gate status, model/reality gate status when applicable, standing completion status, before/after score, evidence, remaining defects, budget used, stable checkpoint, rollback, stop reason, confidence, and next highest-value issue.

Re-run or re-measure every numeric claim in the final packet. If a metric was not actually measured, say `NOT MEASURED`; source inspection may identify potential impact but cannot create a measurement. No quality claim is valid without linked evidence. Mark unsupported claims `UNVERIFIED`.

**User-facing overlay:** For eligible substantive chat prose, MUST keep `wait-what` active: **Summary** and answer, result, or next action first; friendly ASD-STE100-inspired prose; vital facts, uncertainty, failed or skipped checks, and truthful progress; **TL;DR** last. Exclude brief acknowledgments and machine or requested-artifact formats.
