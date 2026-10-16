---
name: standard-cyclonedx
description: "Validate a scoped CycloneDX bill of materials."
---
# CycloneDX

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
