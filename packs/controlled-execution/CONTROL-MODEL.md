# Controlled-execution rule object

This shared reference records a high-consequence instruction without hiding its authority, evidence or recovery. It is not a fourteenth skill and does not require every field for a low-risk task.

## Control hierarchy

### 1. PREVENT THE ERROR
Restrict capability, remove the hazard, redesign the workflow or add an interlock.

### 2. DETECT AND CONTAIN THE ERROR
Verify state, test the result, use a hold point, stop on failure and recover to a known state.

### 3. EXPLAIN THE ERROR
State the requirement, prohibition, warning, rationale and contrasting examples.

Use the strongest feasible control. Information can support prevention and containment, but it does not automatically replace them.

## Rule fields

### ID
Use a unique, versioned identifier that remains traceable across reviews.

### TYPE
Classify the statement as `Requirement`, `Recommendation`, `Permission` or `Information`.

### ACTOR
Name exactly who or what performs the action.

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
Name who or what evaluates the evidence. Separate production of evidence from acceptance when independence matters.

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

A completed activity is not the same as a verified resulting state.
