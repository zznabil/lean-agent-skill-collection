# AI asset cards

Use this compact card for a consequential model, dataset, prompt, evaluator, agent, or retrieval asset. Keep one card per independently versioned asset when practical.

## Identity

- Asset type, name, owner, version or revision, date, licence, and authoritative location.
- Provider or serving identity when relevant, including fallback or routing behavior.

## Intended use

- Supported tasks, users, environments, inputs, outputs, and decision authority.
- Explicit out-of-scope, unsafe, untested, or prohibited uses.

## Provenance and data

- Source, collection or generation method, transformations, filtering, annotation, and approval.
- Data composition, splits, exclusions, duplicates, leakage controls, sensitive attributes, access, retention, and deletion.
- For retrieved data, authority, freshness, licence, citation, and embedded-instruction boundary.

## Evaluation

- Goal, questions, metrics, thresholds, datasets and revisions, public or holdout class, evaluator identity, prompts or rubrics, randomness, repeated runs, variance, cost, and actual results.
- Known subgroup, language, domain, long-context, tool-use, safety, or recovery gaps.
- Evidence that would invalidate the current result, such as model, data, prompt, tool, environment, or evaluator change.

## Limitations and impact

- Known failure modes, uncertainty, affected users or groups, foreseeable misuse, human recourse, and residual risk.
- Assumptions, mitigations, monitoring signals, incident trigger, rollback, and retirement condition.

## Change control

Update the card when the asset, provider, prompt, data, evaluator, tool permissions, or deployment context changes materially. Preserve prior versions. Do not promote an undocumented asset into a consequential workflow or claim that the card itself proves safety, fairness, quality, or compliance.
