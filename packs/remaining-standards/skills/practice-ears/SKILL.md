---
name: practice-ears
description: "Write EARS requirements without inventing decisions."
---
# EARS

## Task and boundary
- Express an agreed system requirement using EARS sentence patterns.
- Do not turn unresolved product choices or recommendations into mandatory behaviour.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: Adopt syntax. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify the system, observable response, triggering event, state condition and optional feature from the source requirement.
2. For an unconditional requirement, use the ubiquitous shape: `The <system> shall <response>.`
3. For an event-driven requirement, use: `When <event>, the <system> shall <response>.`
4. For a state-driven requirement, use: `While <state>, the <system> shall <response>.`
5. For an optional feature, use: `Where <feature exists>, the <system> shall <response>.`
6. For unwanted behaviour, use: `If <unwanted condition>, then the <system> shall <response>.`
7. Combine necessary preconditions before the event trigger, followed by the system and response; do not invent a condition to fill
   a slot.
8. Keep the response testable. Resolve missing quantities or referents with the source owner rather than assuming values.
9. The pattern's shall is not permission to strengthen an existing SHOULD or MAY. Flag a normative-strength conflict.
10. Check the normal, triggering, non-triggering and unwanted conditions against the original requirement and acceptance method.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** A source requires the controller to record an alarm when its approved temperature threshold is exceeded.
- **Expected:** Use the event and existing threshold; do not invent a temperature or change a recommendation into an obligation.
- **Missing-evidence case:** The threshold, response or mandatory strength is unresolved.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
