# Controlled-execution rule object

Use this reference to record a high-consequence instruction's authority, expected state, evidence and recovery. It is not a fourteenth skill, and low-risk tasks need only fields that change their execution.

## Control hierarchy
### 1. PREVENT THE ERROR
Restrict capability, remove the hazard, redesign the workflow or add an interlock.

### 2. DETECT AND CONTAIN THE ERROR
Verify state, test the result, pause at a hold point, stop on failure and recover to a known state.

### 3. EXPLAIN THE ERROR
State the requirement, prohibition, warning, rationale or contrasting example.

Choose the strongest feasible control. Information can support stronger controls but cannot silently replace them.

## Execution order
1. Name the actor, scope, authority and trigger. Put prerequisites and material hazard warnings before the action they constrain.
2. Select prevention and containment. State the expected result, evidence, verifier and failure condition before a costly or irreversible step.
3. PAUSE at the hold point. Advance only on fresh evidence that meets the criterion; false, unknown or stale evidence blocks progression.
4. If blocked, contain the failure and use the authorised recovery to return to a known state before retry. Record any bounded exception and its approver; missing evidence is not an exception.
5. Report observed state and remaining uncertainty. A completed activity is not a verified result.

## Rule fields
### ID
Use a unique, versioned identifier traceable across reviews.

### TYPE
Classify as `Requirement`, `Recommendation`, `Permission` or `Information`.

### ACTOR
Name who or what performs the action.

### TRIGGER / PRECONDITION
State when the rule applies and what must already be true.

### REQUIREMENT
State one atomic MUST obligation.

### PROHIBITION
State one atomic MUST NOT obligation when a distinct prohibited action exists.

### EXPECTED RESULT
Describe the observable state after correct execution.

### EVIDENCE
Define the data, command result, inspection or artefact that demonstrates the result.

### VERIFIER
Name who or what evaluates evidence. Separate production from acceptance when independence matters.

### HOLD POINT
State what must be verified before progression.

### FAILURE CONDITION
Define the observable result that stops progression.

### RECOVERY
State how to return to a known safe or controlled state before retry.

### EXCEPTION
Bound an authorised exception by trigger, scope, approver and evidence. Absence of evidence is not an exception.

### RATIONALE
Explain why the rule exists. Rationale is informative and MUST NOT hide another obligation.

### REFERENCES
Record the governing source, version and local authority.

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
