---
name: profile-action-step-structure
description: "Order prerequisites and action-bearing procedure steps."
---
# Action-step structure profile

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If trusted root `AGENTS.md` loads, its policy governs this skill. Skill-specific rules refine the kernel. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active, direct technical sentences. Lead with the main point and familiar words. Use ISO 704-inspired stable concepts and terminology. Use Diátaxis to separate how-to, reference and explanation when useful. Keep simple replies short. These are inspired practices, not formal standards conformance.
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. Preserve requirement force. State one actor, action and observable verification target.
- For critical or risky work only, put warnings before hazards. Put hold points before critical or irreversible steps. Verify actual state before destructive or hazardous work.
- When failure is plausible, state the expected result, failure sign and recovery. For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful. Add contrast or TL;DR only when helpful.
- Explain difficult mechanisms from simple foundations. Contrast noncompliant and compliant code or configuration when useful.
- Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits. Report observed results. Missing or stale evidence is not success.
- These execution rules do not transfer legal or organisational authority from a framework. Use other domain standards only when the task requires them. They are not default communication drivers.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.

## Purpose and boundary
Use this profile after the procedure's technical content is known. Put prerequisites first. Put an action in every numbered step. Do not hide a required action behind ambiguous modal wording.

## Steps
1. State access, role, tools, starting state and other prerequisites before the numbered procedure.
2. Put warnings and irreversible consequences before the step that commits the actor.
3. Give each numbered step one action or a tightly coupled group of actions. When applicable, order its parts as optional status, reason or expected result, location, then action.
4. Use MUST or a direct imperative when the adopted contract requires the action. Use MAY or `Optionally` only for a genuine choice.
5. State the observable result after a consequential action. Put the failure sign and recovery beside that step.
6. Put background-only text outside numbered steps. Run the procedure from its stated prerequisites.

## Worked distinction
**Weak step:** You may need to configure branch protection.

**Required action:** To prevent direct changes, in **Settings → Branches**, select **Add branch protection rule**.

**Optional action:** Optionally, to require signed commits, under **Rules**, select **Require signed commits**.

These forms state optionality, purpose, location and action explicitly.

## Verify and recover
Confirm that every step advances the task. Confirm that every required action is present. If a prerequisite or action strength is unresolved, hold publication. Resolve it against the governing contract. Then rerun the procedure. Return steps with expected results and recovery paths.

See source details and access limits in [SOURCES.md](SOURCES.md).
