# Skill design playbooks
Load only the section that the task needs.

## Stack selection
1. Inspect the project. Name its relevant capability areas.
2. Search several plausible candidates for each area when candidates exist. Read each skill, not just its title.
3. Select exact IDs without redundancy. Record gaps rather than select a poor fit.
4. Create a small manifest. Record collection identity, source revision or digest, target host and scope, project constraints, selected IDs, and the reason for each selection.
5. Audit permissions, executable files, workflow source, hooks, installers, network calls, auto-update behavior, trusted-state mutation, licenses, dependencies, and trigger collisions.
6. Validate and preview the installation plan before you apply it. Do not install a full catalog just because it is available. For standards, keep a registry with version, status, official source, reviewed date, decision, Lean home, reused text, and next review trigger.

## Evaluation
Use three evaluation layers. Evidence from a lower layer cannot prove a higher layer.
1. **Structural:** Check frontmatter, names, paths, adapters, references, declared dependencies, package shape, and command or manifest parity.
2. **Trigger and routing:** Test realistic positive prompts, negative prompts owned by another skill, anti-trigger cases, and description collisions. Lexical ranking gives a cheap approximation. It does not prove semantic fit.
3. **Behavioral:** Compare a fresh-context candidate with no skill, or a new version with the previous version. Use the real artifact and tool trace when execution matters. When delegation or cross-host behavior matters, run a live topology cell. Record host, requested and actual model or verified family, tool trace, Git or filesystem artifacts, and failures. A simulated prompt proves only routing.
For each skill, include several natural positive prompts, several negative prompts, and one edge or pressure case. Include at least one behavioral case when the skill can materially change execution. Use objective assertions for verifiable outcomes. Use human or blinded review for subjective quality. Before you trust an evaluator, calibrate it with a known-good case and a representative broken or misrouted case. Use a positive control for absence claims. Calculate supplied figures independently. Rerun the current evaluator; do not accept a stored status line. Distinguish execution artifacts from conversation-only deliverables. Do not substitute dialogue for tests of a workflow that should act.
Record pass rate, failures, token use, duration, and variance when exposed. For model-based evaluation, also record evaluator model or family, rubric or prompt, threshold, dataset revision, randomness, repetitions, visible or holdout class, and cost. For agent workflows with traces, distinguish end-outcome, trajectory, and individual tool-choice or argument evaluation. Inspect tests that do not discriminate, flaky cases, and quality gained per extra context. Correct the smallest material weakness. Rerun the same cases, then expand the suite.
For a collection audit, also test **activation timing and frequency**. Cover clear positives, ambiguous neighbours, negative prompts, routine no-skill prompts, repeated workload prompts, explicit selection, and each supported host surface. Record intended frequency, missed activation, wrong-primary selection, unnecessary activation, and the cost of each error. A manual-only skill should have zero autonomous activation by design. Use lexical similarity to screen for collisions, not to estimate live routing probability.

## No-skill ablation and sunset
1. For each material skill change, compare the same task with the candidate skill, no skill beyond trusted root policy, and the nearest competing skill. Measure outcome quality, corrections, checks, tool choice, token or time cost, and false confidence when exposed.
2. Record real use, successful examples, wrong activations, manual overrides, user satisfaction, maintenance cost, and the unique behavior that the skill still owns.
3. Start deletion review when a skill does not beat the no-skill baseline, another authority owns most of its behavior, it mainly repeats model defaults, its required runtime is absent from target hosts, or its false-activation cost exceeds demonstrated value.
4. A skill with no material successful use across two releases SHOULD be retired, merged, or moved project-local. An exception requires a documented low-frequency high-impact case.

## Considerate-agency evaluation
### Pass 15 — Human effort and loop closure
Compare the candidate, no-skill baseline, and nearest competitor. Check avoidable questions, repeated context, user interventions, unresolved housekeeping, steps to first use, decision-ready responses, and loop closure. Verify that users can easily find, use, recover, and resume the artifact. State any remaining user action explicitly.
### Pass 16 — Initiative and restraint calibration
Test a balanced set of **ACT**, **ASK**, and **DO NOT ACT** scenarios. Record missed follow-through, unnecessary questions, surprise actions, scope creep, unsafe autonomy, and correct-disposition rate. More initiative does not always improve results. The skill must complete obvious safe follow-through, recommend and ask on consequential choices, and refuse speculative or unrelated expansion.

## Context economy
State what each context pointer reaches and which distinct branches should load it. Use one trigger for each real branch. Synonyms do not create branches. Use the environment as the source of truth for cheap discoverable facts, such as scripts, paths, and configuration. Document reasons, hidden conventions, and gotchas that inspection cannot reveal cheaply. Give each ordered step a checkable completion criterion. Prefer positive target behavior. Use prohibitions only for hard guardrails.

## Workflow authoring and review
1. Decide first whether the task justifies a reusable workflow. Keep an ordinary prompt or one agent when work is short, tightly sequential, or cannot be partitioned without duplicate context.
2. Frame `input → work or judgment → structured trustworthy result`. Before you choose the agent count, record population, dependence, trust asymmetry, mutation, and the highest-cost failure.
3. Design dataflow before prompts. For each stage, name input, judgment versus mechanics, output contract, concurrency, and failure meaning.
4. Pipeline per-item dependencies. Add a barrier only for global dedupe, ranking, joins, convergence, or a judge. Document why the barrier is necessary.
5. Give parallel agents a charter and anti-charter. Use deterministic code for counting, slicing, stable-key dedupe, vote tallies, and cap enforcement. Use agents for reading and judgment.
6. Put a structured schema at each cross-agent boundary. Treat child results as nullable. Return uncertainty, failed stages, stop reason, caps, and unprocessed remainder.
7. Give every loop a convergence signal, hard cap, budget guard, and honest non-converged result. Default destructive behavior to report-only. Use one owner when edits overlap. Verify destructive behavior globally afterward.
8. Review workflow source statically. Do not import, compile, evaluate, or run an untrusted script just to inspect or diagram it. Pin trusted source and revision before execution.
9. Test direct, staged, delegated, approval, fallback, failed-child, interrupted-resume, cap, no-progress, and adversarial cases. Compare useful quality with the simplest direct baseline.

## Trusted refinement
1. Keep trusted base doctrine immutable during ordinary task execution.
2. Record the recurring failure, smallest proposed correction, and evidence that the correction should generalize. Before retuning, repeat the unchanged version to estimate noise. Pre-register the improvement bar.
3. Compare the proposed version with the current version or a no-skill baseline. Use original, negative, held-out, and adversarial cases.
4. Before writing trusted state, review the exact diff, permission impact, trigger changes, and rollback.
5. Apply changes only with explicit authorization. Measure the result, then keep or roll back the change. A skill MUST NOT approve its own promotion from the same task reward.

## Packaging and compatibility
1. Keep one vendor-neutral `SKILL.md` as the authority. Add optional host adapters and plugin manifests without duplicate behavior.
2. Bundle required references and assets in the skill directory. Test the skill inside the collection and as a standalone copy.
3. Validate frontmatter, names, descriptions, invocation policy, products, references, relative paths, required assets, and declared dependencies.
4. Test cold discovery, explicit invocation, intended implicit invocation, anti-trigger cases, missing tools, malformed input, interruption, and graceful degradation.
5. Check archives for traversal, duplicates, case collisions, symlinks, executable payloads, broken references, and secrets.
6. Rebuild deterministically when practical. Extract into a clean directory. Compare extracted bytes with the source tree.
