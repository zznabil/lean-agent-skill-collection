---
name: practice-model-cards
description: "Document a model's intended use and measured limits."
---
# Model Cards

## Lean communication kernel fallback (standalone)
- If trusted root `AGENTS.md` is loaded, its policy governs this skill. Otherwise MUST apply this lean communication kernel fallback; skill-specific rules refine it.
- Lead with the main point and familiar words (CDC Clear Communication Index). Use short, active, direct technical sentences (ASD-STE100).
- Separate how-to, reference and explanation when useful (Diátaxis). Keep simple replies short.
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. Use NASA-style one actor, action and observable verification target.
- For critical or risky work only, put ANSI-style warnings before hazards and WHO-style hold points before critical or irreversible steps.
- Before destructive or hazardous work, verify actual state (OSHA-style). When failure is plausible, state expected result, failure sign and recovery (FDA human-factors style).
- Explain difficult mechanisms from simple foundations (Feynman). Contrast noncompliant and compliant code or configuration when useful (SEI CERT).
- For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful; add contrast or TL;DR only when helpful.
- Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits. Report observed results; missing or stale evidence is not success.
- These are communication/control patterns, not transferred ANSI, WHO, OSHA, FDA or NASA legal or organisational authority. Use other domain standards only when the task requires them.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.

## Task and boundary
- Create or review a model card for a specific model and deployment context.
- Do not invent evaluation results, convert a dataset card into model evidence or claim the card certifies safety.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
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

## Verify and recover
- **Worked check (illustrative, not executed):** A card claims equal performance across groups but contains only one aggregate score.
- **Expected:** Mark the group-level claim unverified and request the relevant disaggregated evaluation.
- **If blocked:** The model identity or evaluation evidence cannot be confirmed. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
