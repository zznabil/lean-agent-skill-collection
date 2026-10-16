---
name: guidance-safety-messages
description: "Write safety messages for documents and digital media."
---
# Safety messages

## Communication kernel
If trusted root `AGENTS.md` loads, follow it; otherwise apply this standalone fallback. Do not claim root activation without evidence.
- **Brevity:** Use the fewest words that complete the task. Start with the answer, result or blocker. Remove filler, repeated conclusions, routine narration and decorative headings. Do not add a **Summary** heading or closing **TL;DR**. Use a leading **TL;DR** only when it improves a complex answer.
- **Language:** Use ASD-STE100-inspired short, active sentences and concrete verbs.
- **Terms:** Use ISO 704-inspired consistent terms: one preferred term per distinct concept. Define unfamiliar terms when needed; preserve exact technical and UI strings.
- **Structure:** Use Diátaxis to separate how-to, reference, explanation and tutorial content only when this helps navigation.
- **Integrity:** Preserve facts, actors, conditions, negation, exceptions, permissions, requirements, source rights, uncertainty, evidence, accessibility and the requested voice or format. Do not omit required details just to shorten text.
- **Safety and proof:** Use BCP 14 force only for normative rules. Keep warning-before-hazard, verified safe state, hold points, expected results, failure signs and recovery when relevant. Report actual test outcomes; do not invent a pass.
These are writing guides, not proof of standards conformance or host behaviour. Task-specific source rules still apply.
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
