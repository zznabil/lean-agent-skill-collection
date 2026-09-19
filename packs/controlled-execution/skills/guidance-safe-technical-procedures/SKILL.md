---
name: guidance-safe-technical-procedures
description: "Write safe procedures, not warning-only fixes."
---
# Safe technical procedures

## Use and boundary
- Use for destructive commands, firmware, permissions, storage, production changes or other technically hazardous work.
- Design the procedure so that correct execution controls the hazard.
- Use a warning to support the safe procedure, not to replace it.
- This routine does not claim conformance with a military technical-manual standard.

## Procedure
1. State scope, prerequisites, authorised role, required tools and the known starting state.
2. Put irreversible effects, cost, data-loss risk and service impact before the commitment step.
3. Remove or restrict hazardous capability where feasible.
4. Sequence one action or tightly coupled action group per step.
5. Put a warning immediately before the step to which it applies.
6. State the expected result after each state-changing step.
7. State the observable failure condition and the safe response.
8. Provide recovery or rollback before the first irreversible action.
9. Require verification before progression and after restoration.
10. Keep domain-specific limits, values and terminology exact; do not simplify away a safety condition.

## Warning test
A warning is inadequate when:
- the procedure still invites the unsafe action;
- the safe action is absent or appears later;
- the actor lacks the means to verify the state;
- the warning uses severity language without an authorised scheme;
- recovery begins from an unknown state.

## Worked distinction
**Warning-only:** “CAUTION: This command may erase data. Run the command.”

**Controlled procedure:** Confirm the target, display the resolved device identifier, verify the backup, restrict the command to that identifier, obtain the required approval, execute, inspect the result and restore only through the defined recovery path.

## Finish and stop
- Walk the procedure from prerequisite to restoration using the stated evidence.
- Stop if a warning carries a control that belongs in the procedure itself.
- Return the safe procedure, warnings, verification points and recovery path.

Source details and access limits: [SOURCES.md](SOURCES.md).
