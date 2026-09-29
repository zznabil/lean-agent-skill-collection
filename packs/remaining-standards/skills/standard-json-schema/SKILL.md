---
name: standard-json-schema
description: "Validate JSON with an explicit schema dialect."
---
# JSON Schema

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
- Author, review or test a JSON Schema contract for a specified JSON instance family.
- Do not treat schema validation as authorization, data truth or a complete business-rule check.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Existing conditional contract. Keep this boundary unless an authorised decision explicitly changes
  it.

## Procedure
1. Identify the intended instances, dialect and validator support; declare $schema where the contract requires it.
2. Resolve $id and references against their actual base URIs. Control external resolution rather than fetching arbitrary locations.
3. Describe types, required properties, numeric/string limits and array constraints from the real requirement.
4. Do not confuse a missing property with a property whose value is null.
5. Use the 2020-12 array and reference semantics when that dialect is selected; do not silently mix older-draft keywords.
6. Check additionalProperties and unevaluatedProperties in the context of composed schemas, not as interchangeable slogans.
7. Treat default and other annotations separately from validation or value insertion.
8. Verify whether the validator treats format as annotation or assertion under the chosen vocabulary and configuration.
9. Test valid, invalid, boundary, missing, null and composition cases that can distinguish the intended constraint.
10. Report unsupported vocabularies, reference failures and unchecked business rules; a parser accepting the schema is not enough.

## Verify and recover
- **Worked check (illustrative, not executed):** A property appears under properties but is omitted from required.
- **Expected:** Do not claim the schema requires it; test an instance where that property is absent.
- **If blocked:** The validator silently ignores an unsupported vocabulary or cannot resolve a required reference. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
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
