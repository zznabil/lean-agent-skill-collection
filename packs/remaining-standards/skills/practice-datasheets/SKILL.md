---
name: practice-datasheets
description: "Answer dataset lifecycle questions with evidence."
---
# Datasheets for Datasets

## Communication kernel
If trusted root `AGENTS.md` loads, follow it; otherwise apply this standalone fallback. Do not claim root activation without evidence.
- **Brevity:** Use the fewest words that complete the task. Start with the answer, result or blocker. Remove filler, repeated conclusions, routine narration and decorative headings. Do not add a **Summary** heading or closing **TL;DR**. Use a leading **TL;DR** only when it improves a complex answer.
- **Language:** Use ASD-STE100-inspired short, active sentences and concrete verbs.
- **Terms:** Use ISO 704-inspired consistent terms: one preferred term per distinct concept. Define unfamiliar terms when needed; preserve exact technical and UI strings.
- **Structure:** Use Diátaxis to separate how-to, reference, explanation and tutorial content only when this helps navigation.
- **Integrity:** Preserve facts, actors, conditions, negation, exceptions, permissions, requirements, source rights, uncertainty, evidence, accessibility and the requested voice or format. Do not omit required details just to shorten text.
- **Safety and proof:** Use BCP 14 force only for normative rules. Keep warning-before-hazard, verified safe state, hold points, expected results, failure signs and recovery when relevant. Report actual test outcomes; do not invent a pass.
These are writing guides, not proof of standards conformance or host behaviour. Task-specific source rules still apply.
## Task and boundary
- Prepare a dataset datasheet with the Datasheets for Datasets question framework.
- Do not force answers that lack support. A completed datasheet does not establish ethical clearance.
- Work only on the selected artifact or assessment. This routine grants no permission to run attacks, deploy, publish or change policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md). Identify the source, applicable edition or part, available originals, access limits and copying terms.
- Before a source-specific finding, check the relevant source sections. This routine cannot provide missing requirements or prove conformance.
- Historical adoption decision: Absorb. Retain this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify the dataset version, accountable owner and intended downstream users.
2. State why the dataset was created, who created it and what support they had.
3. Describe the composition: instances, populations, labels, relationships, missingness and, where relevant, sensitive content.
4. Describe collection sources, sampling, procedures and people involved. Include applicable evidence of consent or notice.
5. Describe preprocessing, cleaning, labelling and transformations that affect interpretation.
6. Describe prior uses, intended uses, unsuitable uses and limitations supported by the dataset's history.
7. Describe distribution, access restrictions, licences and third-party dependencies. Do not invent permission.
8. Describe maintenance, update plans, error reporting and responsible parties.
9. Mark each unanswered or inapplicable question and give the reason. Missing documentation does not prove that no issue exists.
10. Check answer consistency. Keep evidence links and protect sensitive data.

## Verify and recover
- **Worked check (illustrative, not executed):** A datasheet says no personal data is present because nobody documented a privacy review.
- **Expected:** Mark the privacy question as unresolved. Seek evidence. Do not treat a missing review as evidence that no personal data exists.
- **If blocked:** If consent, distribution rights or maintenance ownership cannot be confirmed, stop the affected assessment or action. Record the missing prerequisite. Request it from the responsible owner. Continue only independent, authorised work.
- Retain facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or meet the line budget. Record any unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not establish task success.

## Finish and stop
- Return the result for the selected scope, its evidence, unresolved requirements and the next permitted action.
- Make one correction pass. Recheck the affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- State the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
