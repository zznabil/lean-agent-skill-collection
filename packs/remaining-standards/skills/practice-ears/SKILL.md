---
name: practice-ears
description: "Write EARS requirements without inventing decisions."
---
# EARS

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If trusted root `AGENTS.md` is loaded, its policy governs this skill. Otherwise, you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active technical sentences. Lead with the main point and familiar words. Use ISO 704-inspired stable concepts and terminology. Use Diátaxis organization to separate how-to, reference and explanation when useful. Keep simple replies short.
- For normative requirements, preserve BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY and their force. Give each requirement one actor, one action and an observable verification target.
- For critical or risky work, put warnings before hazards and hold points before critical or irreversible steps. Before destructive or hazardous work, verify actual state. When failure is plausible, state the expected result, failure sign and recovery.
- When a mechanism is difficult, explain it from simple foundations. When useful, contrast noncompliant and compliant code or configuration. For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful. Add contrast or TL;DR only when helpful.
- Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits. Report observed results. Missing or stale evidence is not success.
- These execution rules transfer no legal or organisational authority from ANSI, WHO, OSHA, FDA or NASA. Use other domain standards only when the task requires them; they are not default communication drivers.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.

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
