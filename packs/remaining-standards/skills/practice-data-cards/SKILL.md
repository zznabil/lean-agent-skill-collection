---
name: practice-data-cards
description: "Document dataset decisions throughout its lifecycle."
---
# Data Cards

## Communication kernel
If trusted root `AGENTS.md` loads, follow it; otherwise apply this standalone fallback. Do not claim root activation without evidence.
- **Brevity:** Use the fewest words that complete the task. Start with the answer, result or blocker. Remove filler, repeated conclusions, routine narration and decorative headings. Do not add a **Summary** heading or closing **TL;DR**. Use a leading **TL;DR** only when it improves a complex answer.
- **Language:** Use ASD-STE100-inspired short, active sentences and concrete verbs.
- **Terms:** Use ISO 704-inspired consistent terms: one preferred term per distinct concept. Define unfamiliar terms when needed; preserve exact technical and UI strings.
- **Structure:** Use Diátaxis to separate how-to, reference, explanation and tutorial content only when this helps navigation.
- **Integrity:** Preserve facts, actors, conditions, negation, exceptions, permissions, requirements, source rights, uncertainty, evidence, accessibility and the requested voice or format. Do not omit required details just to shorten text.
- **Safety and proof:** Use BCP 14 force only for normative rules. Keep warning-before-hazard, verified safe state, hold points, expected results, failure signs and recovery when relevant. Report actual test outcomes; do not invent a pass.
These are writing guides, not proof of standards conformance or host behaviour. Task-specific source rules still apply.
## Execution controls
- When stating normative requirements, retain BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY with unchanged force. Specify one actor, action and observable verification target.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps. Before destructive or hazardous work, verify the actual state.
- When failure is plausible, state the expected result, failure sign and recovery action. For critical procedures, keep prerequisites, warnings, verified holds, actions, expected results and recovery; add headings only when useful.
- When explaining difficult mechanisms, start from simple foundations. Contrast noncompliant and compliant code or configuration when useful.
- Give progress only when requested or useful. Keep progress distinct from the verdict.

## Task and boundary
- Create or review a Data Card for a specified dataset and its intended applications.
- Do not fill template gaps with invented provenance, stakeholder consultation or collection decisions.
- Limit work to the selected artifact or assessment. This routine gives no permission to run attacks, deploy, publish or change policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md). Identify the source, applicable edition or part, available originals, access limits and copying terms.
- Before making a source-specific finding, check the relevant source sections. This routine cannot replace missing requirements or prove conformance.
- Historical adoption decision: Adopt template. Retain this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify the dataset, version, accountable parties and intended applications. Identify prohibited or unsuitable uses.
2. Describe the data's origins and the decisions that shaped collection and inclusion.
3. Record composition, features, labels, sampling and missingness. Include relevant population or subgroup information.
4. Explain preprocessing, annotation and transformations. Explain their assumptions or known effects.
5. State evidence-supported constraints on access, licensing, privacy, retention and distribution.
6. Record known quality issues, evaluation limits and gaps that downstream users must understand.
7. Show decisions and trade-offs in the Data Card. Do not merely repeat a schema.
8. Link evidence and responsible owners. Protect restricted information.
9. Where the task requires review, review the card with relevant contributors or users. Distinguish planned review from completed review.
10. Version the card with the dataset. Record responsibilities for updates and maintenance.

## Verify and recover
- **Worked check (illustrative, not executed):** A dataset description lists columns but omits that one population was excluded during collection.
- **Expected:** Document the exclusion and its implications for intended use; a column list is not a sufficient Data Card.
- **If blocked:** If collection or transformation decisions have no reliable record, stop the affected assessment or action. Record the missing prerequisite and request it from the responsible owner. Continue only independent, authorised work.
- Retain facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Distinguish planned work, actual evidence and unknown results. Do not treat missing or stale evidence as a pass.
- Do not remove requirements to improve a score or meet the line budget. Record any unresolved source or task conflict.
- Select the smallest check that can detect the relevant defect. A schema, linter or inventory alone cannot prove task success.

## Finish and stop
- Return the result for the selected scope, its evidence, unresolved requirements and the next permitted action.
- Perform one correction pass. Recheck the affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
