# AI asset cards

These compact records draw on **ISO/IEC 5259**, **ISO/IEC 25012/25024**, **Model Cards**, **Data Cards**, **Datasheets for Datasets**, and **FAIR principles**. They also draw on **ISO/IEC 42005** when impact assessment is warranted. The records provide transparency and evidence. They do not provide certification.

Use this compact card for a consequential model, dataset, prompt, evaluator, agent, or retrieval asset. Keep one card per independently versioned asset when practical.

## Identity

- Record the asset type, name, owner, version or revision, date, licence, and authoritative location.
- Record the provider or serving identity when relevant. Include fallback or routing behavior.

## Intended use

- Record supported tasks, users, environments, inputs, outputs, and decision authority.
- State which uses are out of scope, unsafe, untested, or prohibited.

## Provenance and data

- Record the source, collection or generation method, transformations, filtering, annotation, and approval.
- Record data composition, splits, exclusions, duplicates, leakage controls, sensitive attributes, access, retention, and deletion.
- For retrieved data, record authority, freshness, licence, citation, and the embedded-instruction boundary.

## Evaluation

- Record the goal, questions, metrics, thresholds, datasets and revisions, public or holdout class, and evaluator identity. Include prompts or rubrics, randomness, repeated runs, variance, cost, and actual results.
- Record known gaps in subgroup, language, domain, long-context, tool-use, safety, or recovery coverage.
- Record evidence that would invalidate the current result. This can include a change to the model, data, prompt, tool, environment, or evaluator.

## Limitations and impact

- Record known failure modes, uncertainty, affected users or groups, foreseeable misuse, human recourse, and residual risk.
- Record assumptions, mitigations, monitoring signals, the incident trigger, rollback, and the retirement condition.

## Change control

Update the card when the asset, provider, prompt, data, evaluator, tool permissions, or deployment context changes materially. Preserve prior versions. Do not promote an undocumented asset into a consequential workflow. Do not claim that the card itself proves safety, fairness, quality, or compliance.
