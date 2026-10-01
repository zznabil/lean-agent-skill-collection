---
name: guidance-safety-messages
description: "Write safety messages for documents and digital media."
---
# Safety messages

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If trusted root `AGENTS.md` is loaded, its policy governs this skill. Skill-specific rules refine the kernel. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active, direct technical sentences. Lead with the main point. Use familiar words. Keep simple replies short.
- Use ISO 704-inspired stable concepts and terminology. Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits.
- Use Diátaxis organization when helpful. Separate how-to, reference and explanation.
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. Preserve requirement force. State one actor, action and observable verification target.
- For critical or risky work only, place warnings before hazards. Put hold points before critical or irreversible steps.
- Before destructive or hazardous work, verify the actual state. When failure is plausible, state the expected result, failure sign and recovery action.
- When a mechanism is difficult, explain it from simple foundations. When useful, contrast noncompliant and compliant code or configuration.
- For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful. Add contrast or TL;DR only when helpful.
- Report observed results. Missing or stale evidence is not success. For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.
- These execution rules do not transfer ANSI, WHO, OSHA, FDA or NASA legal or organisational authority. Use other domain standards only when the task requires them. They are not default communication drivers.

## Purpose and boundary
Use this routine when a document or digital interface must warn an affected actor about a material hazard before commitment. Give the hazard, credible consequence and avoidance action at the place and time the actor needs them. Do not invent a signal word, severity class, colour rule or layout claim without an authorised scheme. This routine does not provide ANSI Z535 conformity guidance. It includes no licensed ANSI text.

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
Confirm the hazard, consequence, avoidance, timing and placement in the rendered journey. If the safe action is missing or the message appears after commitment, stop using the message. Move or revise it, then retest. Return the rendered message and the accompanying stronger controls.

For source details and access limits, see [SOURCES.md](SOURCES.md).
