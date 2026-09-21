---
name: practice-verifiable-requirements
description: "Write atomic requirements with accountable evidence."
---
# Verifiable requirements

## Use and boundary
- Use when a director, worker, reviewer or system must demonstrate completion of a requirement.
- Apply one independently testable obligation at a time.
- Do not turn a broad responsibility into an unverifiable requirement.
- This routine borrows a requirements pattern; it does not make a generic workflow a NASA requirement.

## Requirement record
For each requirement, record:
- `ID`
- `ACTOR`
- `TRIGGER / TIMING`
- `REQUIRED ACTION OR INFORMATION`
- `EXPECTED RESULT`
- `EVIDENCE`
- `VERIFIER`
- `HOLD POINT`
- `FAILURE CONDITION`
- `RECOVERY`
- `EXCEPTION`, when authorised

## Procedure
1. Name one accountable actor or organisation.
2. State one required action or information product in active voice.
3. State when the requirement applies and when it must be complete.
4. Define the observable result separately from the activity.
5. Define evidence that demonstrates the result.
6. Name who or what evaluates that evidence.
7. Set a hold point when progression would make an undetected defect costly.
8. Define the failure condition and the permitted recovery.
9. Split combined obligations until each can pass or fail independently.
10. Remove vague modifiers such as “properly” or “thoroughly” unless measurable criteria define them.

## Worked distinction
**Weak:** The worker MUST thoroughly test the change.

**Controlled:**
- The worker MUST run the repository's relevant test command after the edit.
- The worker MUST report the command, exit code, passed count and failed count.
- The director MUST inspect that evidence.
- The director MUST NOT accept the task while a required test is failed or unrun.

## Finish and stop
- Trace every completion claim to observed evidence.
- Stop if the actor, test method or acceptance threshold is missing.
- Report verified, failed and unrun obligations separately.

Source details and access limits: [SOURCES.md](SOURCES.md).
