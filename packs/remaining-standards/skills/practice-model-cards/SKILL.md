---
name: practice-model-cards
description: "Document a model's intended use and measured limits."
---
# Model Cards

## Task and boundary
- Create or review a model card for a specific model and deployment context.
- Do not invent evaluation results, convert a dataset card into model evidence or claim the card certifies safety.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: Adopt template. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify the model, version, developer or accountable party, architecture type and relevant release information.
2. State intended users, intended uses and out-of-scope uses clearly.
3. Describe relevant factors that can affect performance, including deployment conditions and affected groups.
4. Record evaluation data, training-data information that can be disclosed, metrics and evaluation procedures.
5. Report quantitative results with their conditions, uncertainty and disaggregation appropriate to the use case.
6. Explain ethical considerations, known limitations, caveats and recommendations supported by evidence.
7. Distinguish measured behaviour from expectations, hypotheses and upstream claims.
8. Link evidence and reproducible configurations without leaking restricted data or confidential details.
9. Update the card after material model, data, evaluation or intended-use changes.
10. Return a versioned model card with unresolved fields explicitly marked; absence of a result is not a favourable result.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** A card claims equal performance across groups but contains only one aggregate score.
- **Expected:** Mark the group-level claim unverified and request the relevant disaggregated evaluation.
- **Missing-evidence case:** The model identity or evaluation evidence cannot be confirmed.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
