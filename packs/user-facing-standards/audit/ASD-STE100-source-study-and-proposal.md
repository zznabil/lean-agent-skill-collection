# ASD-STE100 single-purpose skill: source study and proposal

Status: local approval prototype, 13 September 2026. No repository, release, installed skill, hook, or account setting was changed.

## Scope of the study

I studied the episode's written page and kit, the full skill as rendered on the author's site, the recurring-errors reference, the experiment reports and runner, and the linter and four hook implementations. Repository inspection was pinned to `39ff89ec096936f15a6883f63939f771ec9dae46`. I checked the important language rules against the official ASD-STE100 Issue 9 document and the STE Maintenance Group's June 2026 AI white paper. This is not a claim that I watched or transcribed the audiovisual episode, independently reproduced its model experiment, or audited the installation stack on a live host.

## What the comprehensive attempt actually builds

The author's version 2 combines two different policies. Layer 1 applies a controlled-English writing discipline. Layer 2 controls the organisation of replies for the author's intended reader. The author expressly states that Layer 2 is not part of ASD-STE100.

The implementation goes beyond a skill file. An output style and per-turn injection establish a standing rule. A refresh hook repeats guidance every 12 tool calls and can score written Markdown. A pre-tool hook checks certain commit and tracker text. A Stop hook checks replies after they have appeared.

The Stop hook documents an important failure: rejecting a reply after display caused a second visible answer. Its revision warns in a middle band and blocks at most once per user turn above the ceiling. The pre-tool hook avoids that particular duplicate-display cost, but its scope, minimum length, parser coverage and fail-open handling mean it is not a universal semantic guarantee.

For this pilot, I retain the concrete writing rules, explicit exceptions, preservation of technical meaning, and checking before delivery. I do not import the always-on reply policy, assumptions about the reader, platform hooks, installation machinery, thresholds or automatic retries.

## What the reported experiment supports

The author reports six engineering-writing tasks, four prompt conditions and two model families. The metric is heuristic violations per 100 words, not factual accuracy, task completion, readability measured with readers, or complete STE conformance.

| Condition | Claude sonnet | GPT-5.5 |
|---|---:|---:|
| Baseline | 4.36 | 3.54 |
| Banned-words list | 4.21 | 2.14 |
| Orwell rules | 2.48 | 1.69 |
| STE skill | 1.12 | 1.76 |

STE has the lowest reported Claude score. Orwell has a slightly lower GPT score than STE. The study supplies no basis for declaring those GPT scores statistically equivalent. The OpenAI runner does not specify a repetition scheme or a dated model snapshot, and it skips failed calls before aggregation. That last point is a possible evaluation failure mode, not evidence that calls actually failed in the reported experiment.

Reproduction is incomplete from the published kit: the runner explicitly says that the six task prompts and four condition prompts were not published. The current linter is score version 2, while the headline results used version 1. These results do not establish an improvement for this new prototype, GPT-5.6, GPT-6, or any user's installed host.

## Important distinctions checked against the standard

The official source describes 53 rules in nine sections plus a controlled dictionary and permitted technical terminology. The prototype is not a replacement for those materials.

The review preserves details that a slogan can lose: spelling follows Rule 1.14's directive exception; descriptive passive voice has an unknown-actor exception, not an unrestricted convenience exception; information-only notes have a different length limit from procedural sentences; and formal word counting has special conventions.

The biggest contract risk is mechanical replacement of modal words. A recommendation, an obligation, a prohibition, an uncertain outcome and permission are different meanings. An instruction such as `SHOULD retry` must not silently become `MUST retry`. The prototype's explicit preservation guard is a Lean integration rule, not a claim that uppercase RFC-style language is dictionary-approved STE.

Similarly, consistency does not justify calling distinct operations by one name. A project can legitimately distinguish verification from validation. A writing pass must first establish whether words refer to the same operation.

## Limited executable probes

The container could not resolve `raw.githubusercontent.com` to download the complete linter. I therefore executed isolated expressions transcribed from the inspected, pinned source, not the entire linter or its hooks. The relevant source blob is `fcf15d28ff9296ff1bba6856051670eecb7f9541`.

Results are recorded in `linter-expression-probes.json`:

| Probe | Observed result | Meaning |
|---|---|---|
| One 21-word descriptive sentence | One over-20-word flag | The generic threshold alone does not distinguish the 25-word descriptive allowance. |
| The same sentence with a newline after word 10 | No over-20-word flag | Its sentence splitting treats physical lines as separate units. |
| `The operator's screen shows the result.` | One contraction flag | The apostrophe expression also matches a possessive. |

These are counterexamples to treating the relevant heuristics as exact checks. They do not establish full STE compliance of the examples or invalidate every use of the linter. No model had to generate any of these examples.

## Prototype design

The one deliverable skill is `standard-asd-ste100/SKILL.md`. The distinct name avoids a same-name collision with the author's `asd-ste100` skill. It has one purpose: apply STE to the language of a bounded technical passage, whether its reader is a person or an executing agent. Draft, edit and review are modes of that purpose, not separate orchestration workflows.

The file contains concrete language instructions across the nine sections, explicit preservation guards, source and terminology lookup requirements, a bounded correction pass, and honest reporting of the checked scope. It has no secondary support files containing hidden instructions. The official standard and a project's terminology source remain explicit data dependencies for full assessment.

A partial edit can still be useful when terminology cannot be verified, but its report must identify the unchecked scope. A full STE assessment must consider all 53 rules for applicability and examine vocabulary in context. Neither a short skill nor a score authorises a conformance claim.

There is no platform-specific activation flag in this one-file pilot. Its instructions request explicit selection by the user or current task. That is intended scope, not a claim that every host mechanically enforces manual-only invocation.

## Authored acceptance cases, not executed model evaluations

| Case | Required behaviour |
|---|---|
| Technical sentence uses a needlessly complex expression | Simplify it without changing the operation, its actor or timing. |
| Requirements use SHOULD, MUST NOT and an exception | Preserve their distinct strengths and conditions; flag any STE-language conflict. |
| A description has an unknown actor | Do not invent a person or causal explanation to force active voice. |
| A governing style guide requires British spelling | Apply the actual spelling exception instead of imposing US spelling blindly. |
| Technical noun is absent from the dictionary | Establish whether it qualifies under the relevant terminology category; do not invent approval. |
| A procedure contains concurrent actions | Do not change them into sequential steps merely to shorten sentences. |
| Text contains code, a command, an exact quotation or mandated warning | Preserve literal content and report any required exception. |
| Required dictionary or source is unavailable | State what cannot be checked; do not claim full conformance. |
| Casual conversation or a creative-voice request | Do not activate this technical-language pass without a relevant request. |

These cases define what an eventual controlled trial should observe. They are not pass rates, independent judgements, or proof of host routing.

## Recommendation

Approve one pilot before converting the register into a skill library. Keep existing task skills as the owners of work. A standard skill supplies a specific writing or verification rule set when needed; it must not take over the task or replace existing safeguards. Preserve watched, deferred and excluded adoption decisions rather than converting every register row into a mandatory active skill.

Do not remove the existing Lean communication baseline as part of this pilot. There is no evidence yet that hosts load this new skill wherever that baseline is needed.

## Primary sources inspected

- Episode and kit index: https://www.chele.bi/videos/the-cure-for-ai-slop
- Written kit guide: https://www.chele.bi/videos/the-cure-for-ai-slop/kit/README
- Rendered skill: https://www.chele.bi/videos/the-cure-for-ai-slop/kit/asd-ste100/SKILL
- Kit license and separation from the ASD standard: https://www.chele.bi/videos/the-cure-for-ai-slop/kit/asd-ste100/LICENSE
- Pinned repository directory: https://github.com/woosal1337/blog/tree/39ff89ec096936f15a6883f63939f771ec9dae46/videos/ep01-the-cure-for-ai-slop
- Experiment: `experiment/results-cross-model.md`, `results-openai.md`, `before-after-samples.md`, `run-openai.py` at that revision.
- Implementation: `asd-ste100/SKILL.md`, `references/ste-recurring-errors.md`, `scripts/ste-lint.py`, and `hooks/ste-inject.py`, `ste-refresh.py`, `ste-pregate.py`, `ste-gate.py` at that revision.
- ASD overview: https://www.asd-ste100.org/about_STE.html
- Official Issue 9: https://www.asd-ste100.org/assets/files/ASD-STE100_ISSUE9.pdf
- Official access: https://www.asd-ste100.org/STE_downloads.html
- STEMG AI position: https://www.asd-ste100.org/assets/files/WhitePaper-ASD-STE100_and_AI.pdf
- Checker developer's documented coverage and limitations: https://www.simplified-english.co.uk/rules-ste9.html
- Existing Lean authoring guard: https://github.com/zznabil/lean-agent-skill-collection/blob/58b4369205d7689b2c46cdf4b4ac3801164e95ed/skills/writing/INSTRUCTION-EDITING.md

The prototype is an original synthesis with source credit. It does not include the copyrighted ASD PDF or its dictionary, nor does it redistribute the third-party linter or hooks.
