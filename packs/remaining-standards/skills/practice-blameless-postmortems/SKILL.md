---
name: practice-blameless-postmortems
description: "Turn an incident into evidence-backed systemic learning."
---
# Google SRE blameless postmortems

## Task and boundary
- Write or review a postmortem for a real incident that meets the project's review criteria.
- Do not blame individuals, invent a single root cause or use a retrospective to silently change production.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: No major change; lineage. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. State incident scope, impact, detection, duration and the evidence supporting the timeline.
2. Separate confirmed events from recollections, estimates and unresolved hypotheses.
3. Describe the conditions, information and constraints under which people and systems acted.
4. Analyse contributing technical and organisational factors rather than stopping at human error.
5. Record what went well, what failed and where luck limited the outcome.
6. Connect proposed actions to specific observed failure modes or missing safeguards.
7. Give each action an owner, verification method and appropriate prioritisation or due condition.
8. Review the draft with relevant participants and preserve disagreements that remain unresolved.
9. Track whether corrective actions changed the system or process; a published document alone does not close the risk.
10. Share within the authorised audience, protecting sensitive information and preserving a blameless learning purpose.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** A report concludes that an operator should have been more careful.
- **Expected:** Investigate the system conditions and safeguards that made the error consequential, then define a verifiable
  improvement.
- **Missing-evidence case:** The timeline or claimed contributing cause is not supported by available evidence.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
