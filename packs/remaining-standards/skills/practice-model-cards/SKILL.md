---
name: practice-model-cards
description: "Document a model's intended use and measured limits."
---
# Model Cards

## Communication kernel
If trusted root `AGENTS.md` loads, follow it; otherwise apply this standalone fallback. Do not claim root activation without evidence.
- **Brevity:** Use the fewest words that complete the task. Start with the answer, result or blocker. Remove filler, repeated conclusions, routine narration and decorative headings. Do not add a **Summary** heading or closing **TL;DR**. Use a leading **TL;DR** only when it improves a complex answer.
- **Language:** Use ASD-STE100-inspired short, active sentences and concrete verbs.
- **Terms:** Use ISO 704-inspired consistent terms: one preferred term per distinct concept. Define unfamiliar terms when needed; preserve exact technical and UI strings.
- **Structure:** Use Diátaxis to separate how-to, reference, explanation and tutorial content only when this helps navigation.
- **Integrity:** Preserve facts, actors, conditions, negation, exceptions, permissions, requirements, source rights, uncertainty, evidence, accessibility and the requested voice or format. Do not omit required details just to shorten text.
- **Safety and proof:** Use BCP 14 force only for normative rules. Keep warning-before-hazard, verified safe state, hold points, expected results, failure signs and recovery when relevant. Report actual test outcomes; do not invent a pass.
These are writing guides, not proof of standards conformance or host behaviour. Task-specific source rules still apply.
## Conditional execution rules
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. Preserve requirement force. State one actor, action and observable verification target.
- For critical or risky work only, put warnings before hazards and hold points before critical or irreversible steps.
- Before destructive or hazardous work, verify actual state. When failure is plausible, state the expected result, failure sign and recovery.
- For difficult mechanisms, explain from simple foundations. Contrast noncompliant and compliant code or configuration when useful.
- For critical procedures, keep prerequisites, warnings, verified holds, actions, expected results and recovery; add headings only when useful.
- Give progress only when requested or useful. Keep progress distinct from the verdict.

## Task and boundary
- Create or review a model card for a specific model and deployment context.
- Do not invent evaluation results. Do not treat a dataset card as model evidence or claim that the card certifies safety.
- Work only on the selected artifact or assessment. This routine gives no permission to run attacks, deploy, publish or change policy.

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
- Retain facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not remove requirements to improve a score or meet the line budget. Record any unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the result within the selected scope, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck the affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim that this routine proves formal conformance or improves model behaviour.
