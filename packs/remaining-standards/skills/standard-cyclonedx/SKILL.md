---
name: standard-cyclonedx
description: "Validate a scoped CycloneDX bill of materials."
---
# CycloneDX

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active sentences, direct verbs and familiar, concrete words. Use ISO 704-inspired stable terms for distinct concepts.
- Use Diátaxis to separate tutorial, how-to, reference and explanation when useful. Do not force sections into short replies.
- Lead with the answer, result or next action. Omit routine Summary headings. Use TL;DR only when helpful for complex material, first, without a closing recap. Preserve requested detail and format.
- Preserve actors, facts, negation, conditions, exceptions, permissions, requirement force, safety, source scope and evidence limits.
- These drivers do not establish formal conformance or transfer legal or organisational authority. Apply other domain standards only when the task requires them.

## Execution controls
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. Specify one actor, action and observable verification target.
- For critical or risky work, place warnings before hazards and hold points before critical or irreversible steps. Verify actual state before destructive or hazardous work.
- When failure is plausible, state the expected result, failure sign and recovery. Keep prerequisites and ordered steps clear; use WARNING and PAUSE/VERIFY labels when useful.
- Explain difficult mechanisms from simple foundations. Contrast noncompliant and compliant code or configuration when useful.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable. Report observed results, not assumed success.

## Task and boundary
- Create or review a CycloneDX BOM. Use the format and version selected by the project.
- A valid BOM does not prove complete dependency discovery or application security.
- Limit work to the selected artefact or assessment. This routine grants no permission to run attacks, deploy, publish or change policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md). Check source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot provide missing requirements or prove conformance.
- Historical adoption decision: Adopt conditionally. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Pin the CycloneDX specification version, serialisation, generator and consumer.
2. Define the system/artefact boundary, data sources, exclusions and inventory timestamp or revision.
3. Use actual evidence to represent the root component and relevant components, services and relationships.
4. Assign unique bom-ref identities within the BOM. Verify that relationships reference existing objects.
5. Record versions, hashes, licences and external references only when evidence supports them.
6. Separate direct dependency observations from transitive dependency observations. State where discovery is incomplete.
7. Add vulnerability or VEX information only when status, context and evidence justify it. Do not use not-affected as an empty default.
8. Validate against the exact versioned schema. Test the actual downstream consumer.
9. Compare representative entries and dependencies with the artefact, lockfiles and build sources.
10. Report validated scope separately from unresolved inventory, licensing or vulnerability information.

## Verify and recover
- **Worked check (illustrative, not executed):** Two components share a bom-ref and dependencies point ambiguously to them.
- **Expected:** Reject the identity collision and repair references before accepting the BOM.
- **If blocked:** If the generator cannot discover dynamic or vendored dependencies in the requested scope, stop the affected assessment or action. Record the missing prerequisite. Request it from the responsible owner. Continue only independent, authorised work.
- Keep planned work, observed evidence and unknown results separate. Missing or stale evidence is not a pass.
- Do not remove requirements for a score or line budget. Record unresolved source or task conflicts.
- Use the smallest check that detects the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Make one correction pass and recheck affected evidence. If a required issue remains, report it; do not loop or claim completion.
- Return the scoped result, source edition, evidence, limits, unresolved requirements and next permitted action. Do not claim formal conformance or model-behaviour improvement from this routine.
