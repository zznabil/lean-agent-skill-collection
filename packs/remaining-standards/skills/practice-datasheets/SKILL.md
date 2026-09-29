---
name: practice-datasheets
description: "Answer dataset lifecycle questions with evidence."
---
# Datasheets for Datasets

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
- Prepare a datasheet for a dataset using the Datasheets for Datasets question framework.
- Do not force unsupported answers or infer ethical clearance from a completed datasheet.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Absorb. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify the dataset version, accountable owner and intended downstream users.
2. Describe motivation: why the dataset was created, by whom and with what support.
3. Describe composition: instances, populations, labels, relationships, missingness and sensitive content where relevant.
4. Describe collection: sources, sampling, procedures, people involved and applicable consent or notice evidence.
5. Describe preprocessing, cleaning, labelling and any transformations that affect interpretation.
6. Describe prior and intended uses, unsuitable uses and limitations evidenced by the dataset's history.
7. Describe distribution, access restrictions, licences and third-party dependencies without inventing permission.
8. Describe maintenance, update plans, error reporting and responsible parties.
9. Mark unanswered or inapplicable questions with reasons; do not treat no documentation as proof that no issue exists.
10. Review answers for consistency and preserve links to evidence while protecting sensitive data.

## Verify and recover
- **Worked check (illustrative, not executed):** A datasheet says no personal data is present because nobody documented a privacy review.
- **Expected:** Mark the privacy question unresolved and seek evidence rather than equating missing review with no personal data.
- **If blocked:** Consent, distribution rights or maintenance ownership cannot be confirmed. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
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
