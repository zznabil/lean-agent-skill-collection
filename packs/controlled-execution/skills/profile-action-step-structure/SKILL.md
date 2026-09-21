---
name: profile-action-step-structure
description: "Order prerequisites and action-bearing procedure steps."
---
# Action-step structure profile

## Use and boundary
- Use to structure a procedure after its technical content is known.
- Put prerequisites before the numbered procedure.
- Require an action in every numbered step.
- Do not hide a required action behind ambiguous modal wording.

## Procedure
1. State access, role, tools, starting state and other prerequisites.
2. Put warnings and irreversible consequences before the commitment step.
3. Give each numbered step one action or a tightly coupled action group.
4. Within a step, order information as:
   - optional status, when applicable;
   - reason or expected result;
   - location;
   - action.
5. Use `MUST` or a direct imperative when the action is required by the adopted contract.
6. Use `MAY` or `Optionally` only for a genuine choice.
7. State the observable result after a consequential action.
8. Put failure and recovery next to the step that can fail.
9. Remove steps that contain background information but no action; move that information before the relevant step.
10. Run the procedure from its stated prerequisites.

## Worked distinction
**Weak step:** You may need to configure branch protection.

**Required action:** To prevent direct changes, in **Settings → Branches**, select **Add branch protection rule**.

**Optional action:** Optionally, to require signed commits, under **Rules**, select **Require signed commits**.

Optionality, purpose, location and action are explicit.

## Finish and stop
- Confirm that every step advances the task and that all required actions are present.
- Stop if a prerequisite or action strength is unresolved.
- Return the procedure, expected results and recovery paths.

Source details and access limits: [SOURCES.md](SOURCES.md).
