---
name: guidance-safety-messages
description: "Write safety messages for documents and digital media."
---
# Safety messages

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim activation without evidence.
- Use ASD-STE100-inspired short, active sentences and concrete words. Lead with the answer or action. Keep simple replies short.
- Use ISO 704-inspired stable terms. Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits.
- Use Diátaxis to separate information types when useful, not to force headings. Do not require an opening Summary or closing recap. Optional TL;DR belongs first.
- For normative requirements, use BCP 14 (RFC 2119/8174) MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. Name one actor, action and observable verification target.
- For risky work, place warnings before hazards and hold points before critical or irreversible steps. Verify actual state before destructive or hazardous work.
- When failure is plausible, give the expected result, failure sign and recovery. Explain difficult mechanisms from simple foundations; contrast code or configuration when useful.
- For critical procedures, include needed prerequisites, warnings, steps, verification, results and recovery without a fixed section template.
- Report observed results; missing or stale evidence is not success. Where applicable, show measurable multi-step progress with a truthful named 20-cell ASCII format.
- These practices imply neither formal conformance nor ANSI, WHO, OSHA, FDA or NASA authority. Apply other domain standards only when the task requires them.

## Purpose and boundary
Use this routine when documents or digital interfaces must warn an affected actor before a material hazard. State the hazard, credible consequence and avoidance action where and when needed. Do not invent signal words, severity classes, colour rules or layout claims without an authorised scheme. This routine provides neither ANSI Z535 conformity guidance nor licensed ANSI text.

## Steps
1. Identify the precise hazardous condition. Identify the actor and action at risk.
2. State the possible consequence. State the action that avoids or reduces the hazard. Use short, direct wording.
3. Place the message immediately before the hazardous step and beside the control it qualifies. The safe action must come before commitment.
4. For digital media, keep the message available across relevant state changes, input modes, zoom, focus and error recovery. Where supported, use an accessible name, readable text and a non-colour cue.
5. Test the rendered context. Confirm that the message stays visible long enough for the actor to act and does not obscure the safe action. Record any authorised terminology or severity scheme.

## Worked distinction
**Weak:** “Warning: dangerous operation.”

**Controlled:**
- Hazard: The command rewrites published history.
- Consequence: Existing references and collaborators' branches can diverge.
- Avoidance: Stop and obtain explicit repository-owner approval before execution.

The workflow should still restrict the command where possible. The message does not replace that control.

## Verify and recover
Verify hazard, consequence, avoidance, timing and placement in the rendered journey. Stop using a message with a missing safe action or post-commitment warning. Revise or move it, then retest. Return the rendered message and stronger controls.

For source details and access limits, see [SOURCES.md](SOURCES.md).
