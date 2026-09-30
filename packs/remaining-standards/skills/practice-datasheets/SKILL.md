---
name: practice-datasheets
description: "Answer dataset lifecycle questions with evidence."
---
# Datasheets for Datasets

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If trusted root `AGENTS.md` is loaded, its policy governs this skill. Otherwise, you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active technical sentences. Lead with the main point and familiar words. Use ISO 704-inspired stable concepts and terminology. Use Diátaxis organization to separate how-to, reference and explanation when useful. Keep simple replies short.
- For normative requirements, preserve BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY and their force. Give each requirement one actor, one action and an observable verification target.
- For critical or risky work, put warnings before hazards and hold points before critical or irreversible steps. Before destructive or hazardous work, verify actual state. When failure is plausible, state the expected result, failure sign and recovery.
- When a mechanism is difficult, explain it from simple foundations. When useful, contrast noncompliant and compliant code or configuration. For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful. Add contrast or TL;DR only when helpful.
- Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits. Report observed results. Missing or stale evidence is not success.
- These execution rules transfer no legal or organisational authority from ANSI, WHO, OSHA, FDA or NASA. Use other domain standards only when the task requires them; they are not default communication drivers.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.

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
