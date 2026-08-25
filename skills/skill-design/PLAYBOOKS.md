# Skill design playbooks

Load only the section required by the task.

## Stack selection

1. Inspect the project and name the capability areas that matter.
2. Search several plausible candidates per area when available; read the actual skill, not only its title.
3. Select exact non-redundant IDs. Record gaps instead of choosing a poor fit.
4. Create a small manifest: collection identity, source revision or digest, target host and scope, project constraints, selected IDs, and why each is needed.
5. Audit permissions, executable files, workflow source, hooks, installers, network calls, auto-update behavior, trusted-state mutation, licenses, dependencies, and trigger collisions.
6. Validate and preview the installation plan before applying it. Do not install a full catalog merely because it is available.

## Evaluation

Use three layers. A lower layer cannot prove a higher one.

1. **Structural:** frontmatter, names, paths, adapters, references, declared dependencies, package shape, and command or manifest parity.
2. **Trigger and routing:** realistic positive prompts, negative prompts owned by another skill, anti-trigger cases, and description-collision checks. Lexical ranking is a cheap approximation, not semantic proof.
3. **Behavioral:** fresh-context candidate versus no skill, or new version versus previous version, using the real artifact and tool trace when execution matters. When delegation or cross-host behavior matters, run a live topology cell and record host, requested and actual model or verified family, tool trace, Git or filesystem artifacts, and failures. A simulated prompt proves routing only.

For each skill, include several natural positive prompts, several negative prompts, one edge or pressure case, and at least one behavioral case when the skill can materially change execution. Use objective assertions for verifiable outcomes and human or blinded review for subjective quality. Distinguish execution artifacts from conversation-only deliverables; do not use dialogue as an escape from testing a workflow that should act.

Record pass rate, failures, token use, duration, and variance when exposed. Inspect non-discriminating tests, flaky cases, and quality gained per extra context. Revise the smallest material weakness, rerun the same cases, then expand the suite.

## Workflow authoring and review

1. First decide whether a reusable workflow is justified. Keep an ordinary prompt or one agent when work is short, tightly sequential, or cannot be partitioned without duplicated context.
2. Frame `input → work or judgment → structured trustworthy result`. Record population, dependence, trust asymmetry, mutation, and the highest-cost failure before choosing agent count.
3. Design the dataflow before prompts. For every stage, name input, judgment versus mechanics, output contract, concurrency, and failure meaning.
4. Pipeline per-item dependencies. Add a barrier only for global dedupe, ranking, joins, convergence, or a judge; document why it is required.
5. Give parallel agents a charter and anti-charter. Keep counting, slicing, stable-key dedupe, vote tallies, and cap enforcement in deterministic code; use agents for reading and judgment.
6. Put a structured schema at every cross-agent boundary. Treat child results as nullable. Return uncertainty, failed stages, stop reason, caps, and unprocessed remainder.
7. Every loop needs a convergence signal, hard cap, budget guard, and honest non-converged result. Destructive behavior defaults to report-only, uses one owner when edits overlap, and is verified globally afterward.
8. Review workflow source statically. Do not import, compile, evaluate, or run an untrusted script merely to inspect or diagram it. Pin trusted source and revision before execution.
9. Test direct, staged, delegated, approval, fallback, failed-child, interrupted-resume, cap, no-progress, and adversarial cases. Compare useful quality against the simplest direct baseline.

## Trusted refinement

1. Keep the trusted base doctrine immutable during ordinary task execution.
2. Capture the recurring failure, the smallest proposed correction, and the evidence that it should generalize. Before retuning, repeat the unchanged version to estimate noise and pre-register the improvement bar.
3. Compare the proposed version with the current version or a no-skill baseline on original, negative, held-out, and adversarial cases.
4. Review the exact diff, permission impact, trigger changes, and rollback before writing trusted state.
5. Apply only with explicit authorization. Measure the result, then keep or roll back. A skill MUST NOT approve its own promotion from the same task reward.

## Packaging and compatibility

1. Keep one vendor-neutral `SKILL.md` as the authority. Add optional host adapters and plugin manifests without duplicating behavior.
2. Bundle required references and assets inside the skill directory. Test the skill both inside the collection and as a standalone copy.
3. Validate frontmatter, names, descriptions, invocation policy, products, references, relative paths, required assets, and declared dependencies.
4. Test cold discovery, explicit invocation, intended implicit invocation, anti-trigger cases, missing tools, malformed input, interruption, and graceful degradation.
5. Check archives for traversal, duplicates, case collisions, symlinks, executable payloads, broken references, and secrets.
6. Rebuild deterministically when practical, extract into a clean directory, and compare the extracted bytes to the source tree.
