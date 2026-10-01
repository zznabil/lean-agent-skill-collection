# Controlled-execution rule object

Use this reference to record the authority, expected state, evidence and recovery for a high-consequence instruction. This reference is not a fourteenth skill. For low-risk tasks, use only fields that change execution.

## Control hierarchy
### 1. PREVENT THE ERROR
Restrict capability, remove the hazard, redesign the workflow or add an interlock.

### 2. DETECT AND CONTAIN THE ERROR
Verify state and test the result. Pause at a hold point. Stop on failure and recover to a known state.

### 3. EXPLAIN THE ERROR
State the requirement, prohibition, warning, rationale or contrasting example.

Select the strongest feasible control. Information can support stronger controls. It cannot silently replace them.

## Execution order
1. Name the actor, scope, authority and trigger. Put prerequisites before the action they constrain. Put material hazard warnings before that action too.
2. Select prevention and containment controls. Before a costly or irreversible step, state the expected result, evidence, verifier and failure condition.
3. PAUSE at the hold point. Advance only when fresh evidence meets the criterion. False, unknown or stale evidence blocks progression.
4. If a gate blocks progression, contain the failure. Use the authorised recovery to return to a known state before retry. Record each bounded exception and its approver. Missing evidence is not an exception.
5. Report the observed state and remaining uncertainty. Completing an activity does not verify its result.

## Rule fields
### ID
Assign a unique, versioned identifier. Keep it traceable across reviews.

### TYPE
Classify the rule as `Requirement`, `Recommendation`, `Permission` or `Information`.

### ACTOR
Identify who or what performs the action.

### TRIGGER / PRECONDITION
State when the rule applies. State what must already be true.

### REQUIREMENT
Write one atomic MUST obligation.

### PROHIBITION
When a distinct prohibited action exists, write one atomic MUST NOT obligation.

### EXPECTED RESULT
State the observable state that follows correct execution.

### EVIDENCE
Specify the data, command result, inspection or artefact that demonstrates the result.

### VERIFIER
Identify who or what evaluates the evidence. When independence matters, separate production from acceptance.

### HOLD POINT
Specify what must be verified before progression.

### FAILURE CONDITION
Specify the observable result that stops progression.

### RECOVERY
Define how to return to a known safe or controlled state before retry.

### EXCEPTION
Define the trigger, scope, approver and evidence for an authorised exception. Missing evidence is not an exception.

### RATIONALE
State why the rule exists. Rationale is informative. It MUST NOT conceal another obligation.

### REFERENCES
Identify the governing source, version and local authority.

## Compact example
- `ID`: CE-1.0-003
- `TYPE`: Requirement
- `ACTOR`: Worker
- `TRIGGER / PRECONDITION`: After modifying a tracked source file
- `REQUIREMENT`: The worker MUST run the named relevant test.
- `EXPECTED RESULT`: The test completes with the accepted result.
- `EVIDENCE`: Exact command, environment, exit code, passed count and failed count
- `VERIFIER`: Director
- `HOLD POINT`: Before task acceptance
- `FAILURE CONDITION`: Required test failed or was not run
- `RECOVERY`: Correct the defect, rerun the test and replace stale evidence
- `EXCEPTION`: Only an explicitly authorised scope change can remove the test
- `RATIONALE`: The gate prevents an unverified edit from being accepted
- `REFERENCES`: Project Definition of Done, version or revision
