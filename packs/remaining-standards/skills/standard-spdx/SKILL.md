---
name: standard-spdx
description: "Describe scoped BOM facts with the selected SPDX model."
---
# SPDX

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If trusted root `AGENTS.md` loads, its policy governs this skill. Otherwise you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active technical sentences. State the main point first. Use familiar words and keep simple replies short.
- Use ISO 704-inspired stable concepts and terminology. Keep each actor, action, and observable verification target clear. Preserve requirement force, facts, negation, conditions, exceptions, permissions, safety, source scope, and evidence limits.
- Use Diátaxis organization when helpful. Separate instructions, reference, and explanation. These three approaches guide default communication; they do not establish formal standards conformance or transfer legal or organisational authority. Use other domain standards only when the task requires them.

## Conditional execution rules
- For normative requirements, retain uppercase MUST, MUST NOT, SHOULD, SHOULD NOT, and MAY with their existing force.
- For critical or risky work only, put warnings before hazards. Put hold points before critical or irreversible steps. Before destructive or hazardous work, verify actual state.
- When failure is plausible, state the expected result, failure sign, and recovery action.
- When a mechanism is difficult, explain it from simple foundations. When useful, contrast noncompliant and compliant code or configuration.
- For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result, and Recovery where useful. Add contrast or TL;DR only when helpful.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable. Report observed results. Missing or stale evidence is not success.

## Task and boundary
- Create or verify SPDX bill-of-materials data for a named artifact or system.
- An SPDX document does not establish a complete inventory, legal clearance, or the absence of vulnerabilities. Do not claim that it does.
- Work only on the selected artifact or assessment. This routine does not permit attacks, deployment, publication, or policy changes.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits, and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot provide missing requirements or prove conformance.
- Historical adoption decision: Adopt conditionally. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Select the exact SPDX version, profiles, serialization, and consumer capabilities. Do not mix 2.x fields into a 3.x model.
2. Define the inventory boundary, creation method, source revision, and unobserved scope.
3. Identify elements, creators, creation information, and relationships as the selected model requires.
4. Use stable element identities and artifact digests where available. Do not invent package versions or suppliers.
5. Distinguish declared licensing, detected evidence, and conclusions as the chosen licensing profile requires.
6. Retain unknowns and disagreements. Do not convert them into a permissive license.
7. Describe dependencies and other relationships with the correct direction and semantics.
8. Validate the serialized document. Test its import into the actual consumer.
9. Check representative entries against the artifact and build inputs. Schema validity alone does not establish completeness.
10. Report scope, version, profiles, license-evidence limits, and unresolved elements. Any legal conclusion needs appropriate review.

## Verify and recover
- **Worked check (illustrative, not executed):** A generated BOM omits vendored code but claims complete coverage.
- **Expected:** Record the unobserved boundary and correct the completeness claim before acceptance.
- **If blocked:** If the target tool supports SPDX 2.3 but the document uses 3.0.1 profiles, stop the affected assessment or action. Record the missing prerequisite. Request it from the responsible owner. Continue only independent, authorised work.
- Retain facts, identifiers, links, required checks, permissions, negation, exceptions, and failure and recovery paths.
- Distinguish planned work, actual evidence, and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or meet the line budget. Record unresolved source or task conflicts.
- Use the smallest check that can detect the relevant defect. A schema, linter, or inventory alone does not prove task success.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements, and next permitted action.
- Make one correction pass. Recheck affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence, and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
