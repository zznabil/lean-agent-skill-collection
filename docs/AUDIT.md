# V7.2 deep-dive audit

## Decision

**PASS WITH RISKS.** The collection is coherent, compact, internally consistent, and safe to publish as source. All supplied release hashes match. No skill contains bundled executable scripts, runtime network integrations, or automatic trusted-state mutation.

## AI provenance

Major repository and editorial decisions were AI slop chosen by GPT-5.6 Sol Pro. This attribution is a provenance disclosure, not evidence of correctness. The checks and limitations below remain the basis for evaluating the collection.

The two material limits are licensing and runtime evidence:

1. The supplied collection has no project-wide license. The repository therefore makes no broad reuse grant.
2. Static checks cannot prove identical routing behavior across agent hosts. Each host must run live activation tests when routing matters.

## Scope

The audit covered all seven supplied archives:

| Package | Skills | Role | Result |
|---|---:|---|---|
| Core | 9 | General reasoning and execution foundation | PASS |
| Engineering | 22 | Core plus software-delivery workflows | PASS |
| Complete | 30 | Canonical superset | PASS |
| Communication | 3 | Small prose and teaching profile | PASS |
| Get It Done | 3 | Long-horizon execution stack | PASS |
| Gauntlet Loop | 1 | Standalone adversarial QA | PASS |
| V7.1 → V7.2 update | 6 profile overlays | Exact-version migration bundle | PASS |

## What was checked

- 30 canonical skill directories and 30 matching `SKILL.md` frontmatter names.
- 30 OpenAI adapters with Chat and Codex product metadata.
- Plugin and validation JSON structure and version `7.2.0`.
- Every declared inner archive SHA-256 hash and byte size.
- ZIP entry path safety: no rooted paths or parent traversal.
- Overlap design across profiles and standalone packs.
- Permission language for publication, production, destructive work, credentials, and external communication.
- References from primary skill files to their supporting Markdown files.
- Absence of bundled shell scripts, installers, hooks, public runtime URLs, or connector requirements.
- Pinned Compound Engineering provenance and its MIT license terms.

## Architecture

The Complete profile is the source superset. Core and Engineering are curated subsets. The Communication, Get It Done, and Gauntlet packages are convenience slices and deliberately duplicate skills from larger profiles. Installing overlapping profiles would create duplicate routing authorities, so the packaging correctly warns against it.

The collection separates three layers:

1. `SKILL.md`: vendor-neutral trigger and workflow contract.
2. Supporting Markdown: detailed lanes, state schemas, or playbooks for seven complex skills.
3. `agents/openai.yaml`: thin product-specific display and invocation metadata.

This separation is simple and portable. It also makes review easier because operational policy remains readable text rather than hidden code.

## Coverage analysis

The 30 skills form six practical groups:

- **Control and quality:** `get-it-done`, `gauntlet-loop`, `review`, `test`, `triage`, `handoff`.
- **Engineering:** `architecture`, `implement`, `debug`, `python`, `cli-design`, `merge-conflicts`, `release`, `repo-map`.
- **Product and interface:** `frontend`, `browser-automation`, `prototype`, `experiment`, `monitor`.
- **Thinking and planning:** `reasoning`, `research`, `plan`, `grilling`, `project-context`.
- **Content and artifacts:** `writing`, `teach`, `wait-what`, `office-files`, `brandkit`.
- **Meta:** `skill-design`.

The main overlap is intentional and routed by scale: `implement` owns bounded changes, while `get-it-done` owns long-horizon work; `review` is a direct read-only review, while `gauntlet-loop` is a costly iterative adversarial loop; `plan` creates an execution artifact, while `architecture` owns durable structural choices.

## Strong points

- Permission boundaries are repeated where mistakes would be costly.
- Completion claims require fresh evidence and disclose skipped work.
- High-risk operations use prediction, read-back, rollback, and stop-on-mismatch rules.
- The skills avoid provider lock-in in their primary instructions.
- The largest primary skill stays at 67 lines, which limits context cost.
- State-heavy workflows define schemas instead of relying on hidden conversation memory.
- The update pack pins its source influence to an exact repository commit.

## Risks and limitations

| ID | Severity | Finding | Disposition |
|---|---|---|---|
| R1 | P1 | No project-wide license was included. | Documented. Do not imply open-source rights until the owner chooses a license. |
| R2 | P2 | Static metadata cannot prove live host routing or cross-model independence. | Run host-specific activation tests after installation. |
| R3 | P2 | Overlapping profiles duplicate authorities and can cause ambiguous routing. | Install one primary profile only. |
| R4 | P3 | Package READMEs repeat two differently capitalized “v7.2 focus” headings. | Preserved to keep release bytes unchanged; repair in a future source release. |
| R5 | P3 | Distribution archives contain validation results but no reusable build recipe. | The repository adds a read-only validator; deterministic rebuild tooling remains future work. |

## V7.2 change analysis

V7.2 changes seven existing authorities without adding routed skills. It absorbs selected planning, evaluation, review-identity, experiment-stability, solution-learning, and residual-work controls from the pinned Compound Engineering source. It explicitly rejects broad autonomous push/PR behavior, automatic cross-provider review, phrase-triggered learning, connector-heavy workflows, and external publishing integrations.

The change is conservative: 30 skills remain 30; 762 primary lines and 9,684 primary words are reported; the largest skill remains 67 lines; and changed neutral runtime documents add 348 net words.

## Verification boundary

This audit is a static source and package audit. It does not claim that any particular model will invoke a skill correctly, obey every rule, or produce equal results across ChatGPT, Codex, or another host. Those are runtime properties and need host-specific tests.
