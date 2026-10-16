---
name: practice-ears
description: "Write EARS requirements without inventing decisions."
---
# EARS

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
- Use EARS sentence patterns to express an agreed system requirement.
- Do not make unresolved product choices or recommendations mandatory behaviour.
- Work only on the selected artifact or assessment. This routine grants no permission to run attacks, deploy, publish or change policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md). Identify the source, applicable edition or part, available originals, access limits and copying terms.
- Before a source-specific finding, check the relevant source sections. This routine cannot provide missing requirements or prove conformance.
- Historical adoption decision: Adopt syntax. Retain this boundary unless an authorised decision explicitly changes it.

## Procedure
1. From the source requirement, identify the system, observable response, triggering event, state condition and optional feature.
2. For an unconditional requirement, use the ubiquitous pattern: `The <system> shall <response>.`
3. For an event-driven requirement, use: `When <event>, the <system> shall <response>.`
4. For a state-driven requirement, use: `While <state>, the <system> shall <response>.`
5. For an optional feature, use: `Where <feature exists>, the <system> shall <response>.`
6. For unwanted behaviour, use: `If <unwanted condition>, then the <system> shall <response>.`
7. Put necessary preconditions before the event trigger. Follow them with the system and response. Do not invent a condition to fill a slot.
8. Keep the response testable. Ask the source owner to resolve missing quantities or referents. Do not assume values.
9. The pattern's shall does not permit you to strengthen an existing SHOULD or MAY. Flag a normative-strength conflict.
10. Check normal, triggering, non-triggering and unwanted conditions against the original requirement and acceptance method.

## Verify and recover
- **Worked check (illustrative, not executed):** A source requires the controller to record an alarm when its approved temperature threshold is exceeded.
- **Expected:** Use the event and the existing threshold. Do not invent a temperature or make a recommendation an obligation.
- **If blocked:** If the threshold, response or mandatory strength is unresolved, stop the affected assessment or action. Record the missing prerequisite. Request it from the responsible owner. Continue only independent, authorised work.
- Retain facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or meet the line budget. Record any unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not establish task success.

## Finish and stop
- Return the result for the selected scope, its evidence, unresolved requirements and the next permitted action.
- Make one correction pass. Recheck the affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- State the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
