---
name: profile-ui-procedure-writing
description: "Render concise, input-neutral UI procedures."
---
# UI procedure writing profile

## Use and boundary
- Use to render an already-correct user-interface procedure.
- Preserve prerequisites, warnings, exact labels, conditions, results and recovery.
- Prefer input-neutral verbs such as `Select`, `Open` and `Enter` when they describe the control accurately.
- Do not use this profile to invent product behaviour or accessibility conformance.

## Procedure
1. Put prerequisites and material warnings before the numbered steps.
2. Start each step with an imperative action.
3. Identify the interface location before the action when the user must navigate.
4. Use the exact visible control label.
5. Include every action needed to complete the task.
6. Combine actions only when they occur together naturally and cannot fail independently.
7. State the expected result after a consequential action.
8. Put failure and recovery beside the action that can fail.
9. Avoid mouse-only words when the same instruction applies to keyboard, touch or assistive technology.
10. Verify the rendered journey with the actual interface and supported input modes.

## Step form
`In LOCATION, ACTION. EXPECTED RESULT.`

Use a separate sentence for recovery:
`If FAILURE, RECOVERY.`

## Worked distinction
**Device-specific:** Click the Advanced button on the right.

**Input-neutral:** On the **Security** tab, select **Advanced**.

The second form names the location and control without assuming a mouse. It still requires rendered-interface verification.

## Finish and stop
- Walk every step in order and confirm that the operation finishes.
- Stop if a label, location or expected result is unverified.
- Return the ready-to-use procedure and any product uncertainty.

Source details and access limits: [SOURCES.md](SOURCES.md).
