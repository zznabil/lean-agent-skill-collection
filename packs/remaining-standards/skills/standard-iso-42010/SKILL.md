---
name: standard-iso-42010
description: "Describe architecture through stakeholder concerns."
---
# ISO/IEC/IEEE 42010 architecture descriptions

## Task and boundary
- Create or review an architecture description for a specified entity of interest.
- Do not replace the architecture with a diagram collection or mandate a modelling notation.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: Absorb. Keep this boundary unless an authorised decision explicitly changes it.
- Full licensed text was not obtained. This is a Lean application routine grounded in public scope and existing Lean guidance, not a
  clause transcript.
- Obtain the authorised full text before a clause-level assessment. Do not invent definitions, thresholds or conformity results.

## Procedure
1. Name the entity of interest, its environment, stakeholders and architecturally significant concerns.
2. Select viewpoints that define how the relevant concerns will be addressed.
3. Distinguish a viewpoint's conventions from a view of the actual system made using those conventions.
4. Choose models and representations that answer stakeholder questions, using existing project methods where suitable.
5. Record decisions and rationale for important structural choices and rejected alternatives.
6. Identify relationships and consistency rules between views; expose contradictions rather than smoothing them away.
7. Connect architecture descriptions to requirements, interfaces, deployment constraints and evidence.
8. Make missing information, assumptions and unknown states explicit.
9. Review with the relevant stakeholders and update the description when the architecture changes.
10. Use the licensed 42010 edition for required content and conformance; this procedure is not a clause inventory.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** Two diagrams assign the same state to different owning services.
- **Expected:** Record and resolve the ownership inconsistency; do not call the architecture consistent because both diagrams
  render.
- **Missing-evidence case:** The stakeholders, system boundary or authoritative ownership decision is unknown.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
