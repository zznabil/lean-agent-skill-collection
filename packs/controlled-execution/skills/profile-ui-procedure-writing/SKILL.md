---
name: profile-ui-procedure-writing
description: "Render concise, input-neutral UI procedures."
---
# UI procedure writing profile

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
