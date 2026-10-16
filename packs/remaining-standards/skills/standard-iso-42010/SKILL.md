---
name: standard-iso-42010
description: "Describe architecture through stakeholder concerns."
---
# ISO/IEC/IEEE 42010 architecture descriptions

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
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. Preserve requirement force. State one actor, action and observable verification target.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps. Verify actual state before destructive or hazardous work.
- When failure is plausible, state the expected result, failure sign and recovery action.
- Explain difficult mechanisms from simple foundations. When useful, contrast noncompliant and compliant code or configuration.
- For critical procedures, keep prerequisites, warnings, verified holds, actions, expected results and recovery; add headings only when useful.
- Report observed results. Missing or stale evidence is not success. These controls do not transfer legal or organisational authority from external frameworks.
- Give progress only when requested or useful. Keep progress distinct from the verdict.

## Task and boundary
- Create or review an architecture description for a specified entity of interest.
- Do not replace the architecture with a collection of diagrams. Do not mandate a modelling notation.
- Work only on the selected artifact or assessment. This routine does not permit attacks, deployment, publication or policy changes.

## Source and limits
- Read [SOURCES.md](SOURCES.md). Check source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot provide missing requirements or prove conformance.
- Historical adoption decision: Absorb. Preserve this boundary unless an authorised decision explicitly changes it.
- The full licensed text was not obtained. This Lean application routine uses public scope and existing Lean guidance. It is not a clause transcript.
- Obtain the authorised full text before a clause-level assessment. Do not invent definitions, thresholds or conformity results.

## Procedure
1. Name the entity of interest, its environment, stakeholders and architecturally significant concerns.
2. Select viewpoints that define how to address the relevant concerns.
3. Distinguish a viewpoint's conventions from a view of the actual system that uses those conventions.
4. Choose models and representations that answer stakeholder questions. Use existing project methods where suitable.
5. Record decisions and rationale for important structural choices and rejected alternatives.
6. Identify relationships and consistency rules between views. Expose contradictions; do not hide them.
7. Connect architecture descriptions to requirements, interfaces, deployment constraints and evidence.
8. State missing information, assumptions and unknown states explicitly.
9. Review the description with relevant stakeholders. Update it when the architecture changes.
10. Use the licensed 42010 edition for required content and conformance. This procedure is not a clause inventory.

## Verify and recover
- **Worked check (illustrative, not executed):** Two diagrams assign the same state to different owning services.
- **Expected:** Record and resolve the ownership inconsistency; do not call the architecture consistent because both diagrams
  render.
- **If blocked:** If the stakeholders, system boundary or authoritative ownership decision is unknown, stop the affected assessment or action. Record the missing prerequisite. Request it from the responsible owner. Continue only independent, authorised work.
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or meet the line budget. Record any unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the result for the checked scope, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
