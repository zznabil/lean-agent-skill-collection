---
name: standard-spdx
description: "Describe scoped BOM facts with the selected SPDX model."
---
# SPDX

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
- For normative requirements, retain uppercase MUST, MUST NOT, SHOULD, SHOULD NOT, and MAY with their existing force.
- For critical or risky work only, put warnings before hazards. Put hold points before critical or irreversible steps. Before destructive or hazardous work, verify actual state.
- When failure is plausible, state the expected result, failure sign, and recovery action.
- When a mechanism is difficult, explain it from simple foundations. When useful, contrast noncompliant and compliant code or configuration.
- For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result, and Recovery where useful. Add contrast or TL;DR only when helpful.
- Give progress only when requested or useful. Keep progress distinct from the verdict.

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
