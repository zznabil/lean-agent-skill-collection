# V9 evaluation protocol

The JSON scenarios are authored test inputs and expected outcomes, not executed model results. CI checks their schema, unique IDs and live skill references. It does not ask a model to perform the tasks. `behavioural_evaluation: not_run` is deliberate.

## Controlled host evaluation

Use the same task, repository revision, files, tools, permissions, context and host configuration for V8.7, V9, and a no-skill control that retains essential trusted project policy. Evaluate GPT-5.6 and GPT-6 Astra separately. Record the actual model identifier and reasoning setting, not merely the requested alias. Keep model-specific settings fixed within each comparison.

Use a fresh context per case and randomise condition order. Repeat enough to report variability rather than select a lucky run. Freeze acceptance criteria before execution. Include positive routing, near-neighbour negatives, no-skill tasks, explicit manual calls, blocked tools, interrupted work and changed evidence. Keep some cases held out from prompt editing; disclose that the supplied scenario set is public.

Judge actual artifacts and tool traces. Measure completion of required behaviour, preserved behaviour, safety/authority errors, false completion, skipped required checks, needless questions, unnecessary test repeats, unneeded skill activation and user effort. Record input/output/total tokens, latency and cost only when the host actually exposes them. Report failures, cancellations, unavailable environments and excluded cases.

Use objective checks first. For clarity or usefulness, use a fixed rubric and blinded review when possible; disclose reviewer independence. A deterministic linter is not a model judge. Source size reductions are exact bytes and whitespace-delimited words, not token savings.

Promote individual extra instructions only when they address a repeatable material failure. Remove or merge a skill when a no-skill or neighbouring-owner condition performs as well with less avoidable cost. Do not tune on all held-out cases and continue calling them held out.

## Structural release evidence

The release gate separately checks the 17-skill/six-profile contract, tight description/root/adapter budgets, local standalone references, exact packaged bytes, checksums, unsafe archive members and intentionally damaged controls. Both PowerShell hosts build twice and compare all outputs. Those results establish the tested structural properties only.

Before calling the release complete, also verify PR and exact-main CI, the annotated tag target, draft and public downloaded assets and scoped branch cleanup. Current execution URLs belong in the final delivery record, not fabricated into a pre-build manifest.
