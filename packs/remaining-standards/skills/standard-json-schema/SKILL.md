---
name: standard-json-schema
description: "Validate JSON with an explicit schema dialect."
---
# JSON Schema

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If trusted root `AGENTS.md` is loaded, its policy governs this skill. Otherwise, MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active, direct technical sentences. Lead with the main point and familiar words. Use ISO 704-inspired stable concepts and terminology. Use Diátaxis to separate instructions, reference and explanation when helpful. Keep simple replies short.
- Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits. Report observed results. Missing or stale evidence is not success.
- Apply other domain standards only when the task requires them. These communication and control rules do not transfer legal or organisational authority from other frameworks.

## Conditional execution rules
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. State one actor, action and observable verification target.
- For critical or risky work only, put warnings before hazards and hold points before critical or irreversible steps. Verify actual state before destructive or hazardous work.
- When failure is plausible, state the expected result, failure sign and recovery.
- Explain difficult mechanisms from simple foundations. Contrast noncompliant and compliant code or configuration when useful.
- For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful. Add contrast or TL;DR only when helpful.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.

## Task and boundary
- Author, review or test a JSON Schema contract for a specified family of JSON instances.
- Do not use schema validation as authorization, proof of data truth or a complete business-rule check.
- Work only on the selected artifact or assessment. This routine gives no permission to run attacks, deploy, publish or change policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot provide missing requirements or prove conformance.
- Historical adoption decision: Existing conditional contract. Preserve this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify intended instances, dialect and validator support. Declare $schema when the contract requires it.
2. Resolve $id and references against their actual base URIs. Control external resolution. Do not fetch arbitrary locations.
3. Derive types, required properties, numeric/string limits and array constraints from the real requirement.
4. Distinguish a missing property from a property with a null value.
5. Apply the 2020-12 array and reference semantics when that dialect is selected. Do not silently mix older-draft keywords.
6. Check additionalProperties and unevaluatedProperties within composed schemas. Do not treat them as interchangeable slogans.
7. Distinguish default and other annotations from validation or value insertion.
8. Verify whether the validator uses format as annotation or assertion under the selected vocabulary and configuration.
9. Test valid, invalid, boundary, missing, null and composition cases that can distinguish the intended constraint.
10. Report unsupported vocabularies, reference failures and unchecked business rules. Parser acceptance of the schema is not enough.

## Verify and recover
- **Worked check (illustrative, not executed):** A property appears under properties but is omitted from required.
- **Expected:** Do not claim the schema requires it; test an instance where that property is absent.
- **If blocked:** If the validator silently ignores an unsupported vocabulary or cannot resolve a required reference, stop the affected assessment or action. Record the missing prerequisite and request it from the responsible owner. Continue only independent, authorised work.
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not remove requirements to improve a score or meet the line budget. Record any unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
