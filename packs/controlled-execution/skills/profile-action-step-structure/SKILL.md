---
name: profile-action-step-structure
description: "Order prerequisites and action-bearing procedure steps."
---
# Action-step structure profile

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
Use after the procedure's technical content is known. Put prerequisites first and an action in every numbered step. Never hide a required action behind ambiguous modal wording.

## Steps
1. State access, role, tools, starting state and other prerequisites before the numbered procedure.
2. Put warnings and irreversible consequences before the step that commits the actor.
3. Give each numbered step one action or tightly coupled group. Within a step, order optional status, reason or expected result, location, then action when those parts apply.
4. Use MUST or a direct imperative when the adopted contract requires the action. Use MAY or `Optionally` only for a genuine choice.
5. State the observable result after a consequential action. Put its failure sign and recovery beside that step.
6. Move background-only text outside numbered steps. Run the procedure from its stated prerequisites.

## Worked distinction
**Weak step:** You may need to configure branch protection.

**Required action:** To prevent direct changes, in **Settings → Branches**, select **Add branch protection rule**.

**Optional action:** Optionally, to require signed commits, under **Rules**, select **Require signed commits**.

Optionality, purpose, location and action are explicit.

## Verify and recover
Confirm every step advances the task and every required action is present. If a prerequisite or action strength is unresolved, hold publication; resolve it against the governing contract and rerun the procedure. Return steps with expected results and recovery paths.

Source details and access limits: [SOURCES.md](SOURCES.md).
