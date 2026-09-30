---
name: standard-cyclonedx
description: "Validate a scoped CycloneDX bill of materials."
---
# CycloneDX

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If trusted root `AGENTS.md` is loaded, its policy governs this skill. Otherwise you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active technical sentences. State the main point first. Use familiar words and keep simple replies short.
- Use ISO 704-inspired stable concepts and terminology. Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits.
- Use Diátaxis organization to separate how-to, reference and explanation when useful. These three approaches are the default communication drivers, not a claim of formal standards conformance.
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. State one actor, action and observable verification target.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps. Before destructive or hazardous work, verify actual state.
- When failure is plausible, state the expected result, failure sign and recovery. For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful.
- When a mechanism is difficult, explain it from simple foundations. Contrast noncompliant and compliant code or configuration when useful. Add contrast or TL;DR only when helpful.
- Report observed results. Missing or stale evidence is not success. For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.
- These execution rules do not transfer legal or organisational authority from other frameworks. Use other domain standards only when the task requires them.

## Task and boundary
- Create or review a CycloneDX BOM. Use the format and version selected by the project.
- A valid BOM does not prove complete dependency discovery or application security.
- Limit work to the selected artifact or assessment. This routine grants no permission to run attacks, deploy, publish or change policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md). Check source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot provide missing requirements or prove conformance.
- Historical adoption decision: Adopt conditionally. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Pin the CycloneDX specification version, serialization, generator and consumer.
2. Define the system/artifact boundary, data sources, exclusions and inventory timestamp or revision.
3. Use actual evidence to represent the root component and relevant components, services and relationships.
4. Assign unique bom-ref identities within the BOM. Verify that relationships reference existing objects.
5. Record versions, hashes, licenses and external references only when evidence supports them.
6. Separate direct dependency observations from transitive dependency observations. State where discovery is incomplete.
7. Add vulnerability or VEX information only when status, context and evidence justify it. Do not use not-affected as an empty default.
8. Validate against the exact versioned schema. Test the actual downstream consumer.
9. Compare representative entries and dependencies with the artifact, lockfiles and build sources.
10. Report validated scope separately from unresolved inventory, licensing or vulnerability information.

## Verify and recover
- **Worked check (illustrative, not executed):** Two components share a bom-ref and dependencies point ambiguously to them.
- **Expected:** Reject the identity collision and repair references before accepting the BOM.
- **If blocked:** If the generator cannot discover dynamic or vendored dependencies in the requested scope, stop the affected assessment or action. Record the missing prerequisite. Request it from the responsible owner. Continue only independent, authorised work.
- Keep facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths intact.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not remove requirements to improve a score or meet the line budget. Record any unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the result for the selected scope, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck the affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
