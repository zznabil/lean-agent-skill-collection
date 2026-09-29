---
name: practice-ears
description: "Write EARS requirements without inventing decisions."
---
# EARS

## Lean communication kernel fallback (standalone)
- If trusted root `AGENTS.md` is loaded, its policy governs this skill. Otherwise MUST apply this lean communication kernel fallback; skill-specific rules refine it.
- Lead with the main point and familiar words (CDC Clear Communication Index). Use short, active, direct technical sentences (ASD-STE100).
- Separate how-to, reference and explanation when useful (Diátaxis). Keep simple replies short.
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. Use NASA-style one actor, action and observable verification target.
- For critical or risky work only, put ANSI-style warnings before hazards and WHO-style hold points before critical or irreversible steps.
- Before destructive or hazardous work, verify actual state (OSHA-style). When failure is plausible, state expected result, failure sign and recovery (FDA human-factors style).
- Explain difficult mechanisms from simple foundations (Feynman). Contrast noncompliant and compliant code or configuration when useful (SEI CERT).
- For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful; add contrast or TL;DR only when helpful.
- Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits. Report observed results; missing or stale evidence is not success.
- These are communication/control patterns, not transferred ANSI, WHO, OSHA, FDA or NASA legal or organisational authority. Use other domain standards only when the task requires them.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.

## Task and boundary
- Express an agreed system requirement using EARS sentence patterns.
- Do not turn unresolved product choices or recommendations into mandatory behaviour.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
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

## Verify and recover
- **Worked check (illustrative, not executed):** A source requires the controller to record an alarm when its approved temperature threshold is exceeded.
- **Expected:** Use the event and existing threshold; do not invent a temperature or change a recommendation into an obligation.
- **If blocked:** The threshold, response or mandatory strength is unresolved. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
