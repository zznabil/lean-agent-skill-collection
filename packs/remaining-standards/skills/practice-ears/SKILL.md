---
name: practice-ears
description: "Write EARS requirements without inventing decisions."
---
# EARS

## Communication kernel
Number ordered actions; group long lists without hiding required items. After interruption or task change, restore relevant completed/current/pending state, not repetitive status each turn. Preserve language, exact tokens, formats, permissions and evidence. Never invent estimates or diagnose readers. Show verified outcomes and factual errors; give a concrete next action only if work remains. - If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
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
- Use EARS sentence patterns to express an agreed system requirement.
- Do not make unresolved product choices or recommendations mandatory behaviour.
- Work only on the selected artefact or assessment. This routine grants no permission to run attacks, deploy, publish or change policy.

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
- Keep planned work, observed evidence and unknown results separate. Missing or stale evidence is not a pass.
- Do not remove requirements for a score or line budget. Record unresolved source or task conflicts.
- Use the smallest check that detects the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Make one correction pass and recheck affected evidence. If a required issue remains, report it; do not loop or claim completion.
- Return the scoped result, source edition, evidence, limits, unresolved requirements and next permitted action. Do not claim formal conformance or model-behaviour improvement from this routine.
