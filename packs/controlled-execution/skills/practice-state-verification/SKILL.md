---
name: practice-state-verification
description: "Gate risky work on verified state transitions."
---
# State verification

## Use and boundary
- Use for a risky operation whose safety or correctness depends on the system being in a known state.
- Treat “the step ran” and “the required state exists” as different claims.
- Do not use this routine as a substitute for a legally required lockout/tagout programme or qualified procedure.

## State sequence
`PREPARE → CHANGE OR ISOLATE → SECURE → VERIFY → HOLD → WORK → INSPECT → RESTORE → VERIFY RESTORATION`

## Procedure
1. Define the initial state, authorised actor, affected scope and expected safe or controlled state.
2. Prepare required tools, permissions, backups and communication.
3. Change or isolate the state using the authorised mechanism.
4. Secure the state against unintended reversal, concurrent change or reaccumulation.
5. Verify the actual state with an independent observation or test.
6. Hold progression until the verification result satisfies the stated criterion.
7. Perform only the bounded work authorised for that state.
8. Inspect the work and the surrounding scope before restoration.
9. Restore service or normal state in the defined order.
10. Verify the restored state and record any remaining restriction.

## Failure and recovery
- A failed, missing or stale verification MUST stop progression.
- If the controlled state can change during the work, repeat verification at the defined interval or trigger.
- Recovery MUST return the system to a known state before retry.
- Do not improvise restoration when ownership or system state is uncertain.

## Worked distinction
**Insufficient:** Apply a patch and continue because the command returned no visible error.

**Controlled:** Apply the patch, read the modified file, run the required test, inspect the result, stop on failure, repair, and repeat verification before progression.

## Finish and stop
- Return the observed state at each hold point, the verifier, evidence and restoration result.
- Stop if the true state cannot be established safely.

Source details and access limits: [SOURCES.md](SOURCES.md).
