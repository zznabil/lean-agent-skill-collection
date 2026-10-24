---
name: practice-model-cards
description: "Document a model's intended use and measured limits."
---
# Model Cards

## Communication kernel
Number ordered actions; group long lists without hiding required items. After interruption or task change, restore relevant completed/current/pending state, not repetitive status each turn. Preserve language, exact tokens, formats, permissions and evidence. Never invent estimates or diagnose readers. Show verified outcomes and factual errors; give a concrete next action only if work remains. - If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active sentences, direct verbs and familiar, concrete words. Use ISO 704-inspired stable terms for distinct concepts.
- Use Diátaxis to separate tutorial, how-to, reference and explanation when useful. Do not force sections into short replies.
- Lead with the answer, result or next action. Omit routine Summary headings. Use TL;DR only when helpful for complex material, first, without a closing recap. Preserve requested detail and format.
- Preserve actors, facts, negation, conditions, exceptions, permissions, requirement force, safety, source scope and evidence limits.
- These drivers do not establish formal conformance or transfer legal or organisational authority. Apply other domain standards only when the task requires them.

## Execution controls
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. Specify one actor, action and observable verification target.
- For critical or risky work, place warnings before hazards and hold points before critical or irreversible steps. Verify actual state before destructive or hazardous work.
- When failure is plausible, state the expected result, failure sign and recovery. Keep prerequisites and ordered steps clear; use WARNING and PAUSE/VERIFY labels when useful.
- Explain difficult mechanisms from simple foundations. Contrast noncompliant and compliant code or configuration when useful.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable. Report observed results, not assumed success.

## Task and boundary
- Create or review a model card for a specific model and deployment context.
- Do not invent evaluation results. Do not treat a dataset card as model evidence or claim that the card certifies safety.
- Work only on the selected artefact or assessment. This routine gives no permission to run attacks, deploy, publish or change policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) to identify the source, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Adopt template. Retain this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify the model, version, developer or accountable party, architecture type and relevant release information.
2. State the intended users, intended uses and out-of-scope uses clearly.
3. Describe relevant performance factors, including deployment conditions and affected groups.
4. Record evaluation data, disclosable training-data information, metrics and evaluation procedures.
5. Report quantitative results and their conditions and uncertainty. Disaggregate results as appropriate to the use case.
6. Explain ethical considerations, known limitations, caveats and recommendations that evidence supports.
7. Distinguish measured behaviour from expectations, hypotheses and upstream claims.
8. Link evidence and reproducible configurations. Do not leak restricted data or confidential details.
9. Update the card after material changes to the model, data, evaluation or intended use.
10. Return a versioned model card. Explicitly mark unresolved fields. An absent result is not a favourable result.

## Verify and recover
- **Worked check (illustrative, not executed):** A card claims equal performance across groups but contains only one aggregate score.
- **Expected:** Mark the group-level claim unverified and request the relevant disaggregated evaluation.
- **If blocked:** If you cannot confirm the model identity or evaluation evidence, stop the affected assessment or action. Record the missing prerequisite and request it from the responsible owner. Continue only independent, authorised work.
- Keep planned work, observed evidence and unknown results separate. Missing or stale evidence is not a pass.
- Do not remove requirements for a score or line budget. Record unresolved source or task conflicts.
- Use the smallest check that detects the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Make one correction pass and recheck affected evidence. If a required issue remains, report it; do not loop or claim completion.
- Return the scoped result, source edition, evidence, limits, unresolved requirements and next permitted action. Do not claim formal conformance or model-behaviour improvement from this routine.
