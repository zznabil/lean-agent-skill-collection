---
name: profile-ui-procedure-writing
description: "Render concise, input-neutral UI procedures."
---
# UI procedure writing profile

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
- These practices imply neither formal conformance nor legal or organisational authority. Apply other domain standards only when the task requires them.

## Purpose and boundary
Use this profile to render a technically correct UI procedure. Preserve prerequisites, warnings, exact labels, conditions, results and recovery. Prefer accurate input-neutral verbs: `Select`, `Open` and `Enter`. Do not invent product behaviour or accessibility conformance.

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

The input-neutral form names location and control without assuming a mouse. You must still verify the rendered interface.

## Verify and recover
Hold publication if a label, location or expected result is unverified. Inspect the interface and correct the step. Return the usable procedure and unresolved product uncertainty. Do not claim an unwalked task finished.

See source details and access limits in [SOURCES.md](SOURCES.md).
