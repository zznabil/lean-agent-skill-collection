---
name: profile-ui-procedure-writing
description: "Render concise, input-neutral UI procedures."
---
# UI procedure writing profile

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
Use this profile to render an already-correct UI procedure. Preserve prerequisites, warnings, exact labels, conditions, results and recovery. Prefer input-neutral verbs such as `Select`, `Open` and `Enter` when accurate. Do not invent product behavior or accessibility conformance.

## Steps
1. Put prerequisites and material warnings before numbered actions. Put them especially before a consequential commitment.
2. Start each step with an imperative. When the user must navigate, name the interface location and exact visible control label.
3. Include every required action. Combine actions only when they occur together naturally and cannot fail independently.
4. State the expected result after a consequential action. Put the failure sign and recovery beside the step.
5. Avoid mouse-only words when keyboard, touch or assistive technology can perform the same action.
6. Walk the rendered journey in order. Use the actual interface and supported input modes.

## Step form
`In LOCATION, ACTION. EXPECTED RESULT.` Use a separate sentence for `If FAILURE, RECOVERY.`

## Worked distinction
**Device-specific:** Click the Advanced button on the right.

**Input-neutral:** On the **Security** tab, select **Advanced**.

The second form names the location and control. It does not assume a mouse. You must still verify the rendered interface.

## Verify and recover
If a label, location or expected result is unverified, hold publication. Inspect the interface and correct the step. Return the ready-to-use procedure and any unresolved product uncertainty. Do not claim that an unwalked task finished.

See source details and access limits in [SOURCES.md](SOURCES.md).
