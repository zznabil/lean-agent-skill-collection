---
name: guidance-safety-messages
description: "Write safety messages for documents and digital media."
---
# Safety messages

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

## Purpose and boundary
Use when a document or digital interface must warn an affected actor of a material hazard before commitment. Give the hazard, credible consequence and avoidance action where and when the actor needs them. Do not invent a signal word, severity class, colour rule or layout claim without an authorised scheme. This routine is not ANSI Z535 conformity guidance; it bundles no licensed ANSI text.

## Steps
1. Identify the precise hazardous condition, actor and action at risk.
2. State what can happen and the action that avoids or reduces the hazard in short, direct wording.
3. Place the message immediately before the hazardous step and beside the control it qualifies. The safe action must precede commitment.
4. For digital media, keep the message available across relevant state changes, input modes, zoom, focus and error recovery. Use an accessible name, readable text and a non-colour cue where supported.
5. Test the rendered context: the message remains visible long enough to act on and does not obscure the safe action. Record any authorised terminology or severity scheme.

## Worked distinction
**Weak:** “Warning: dangerous operation.”

**Controlled:**
- Hazard: The command rewrites published history.
- Consequence: Existing references and collaborators' branches can diverge.
- Avoidance: Stop and obtain explicit repository-owner approval before execution.

The workflow should still restrict the command where possible; a message does not replace that control.

## Verify and recover
Confirm hazard, consequence, avoidance, timing and placement in the rendered journey. If the safe action is missing or the message appears after commitment, stop use of the message, move or revise it and retest. Return the rendered message and accompanying stronger controls.

Source details and access limits: [SOURCES.md](SOURCES.md).
