---
name: practice-transition-checklists
description: "Place short checklists at costly transitions."
---
# Transition checklists

## Use and boundary
- Use at a phase boundary where an unnoticed error becomes more expensive, destructive or difficult to reverse.
- Use the procedure to explain how to work. Use the checklist to confirm that critical conditions are true.
- Do not copy the full procedure into the checklist.
- This routine does not replace a domain-specific safety checklist.

## Design the gate
1. Name the transition, such as `prepare → change`, `edit → release` or `restore → close`.
2. Name one coordinator or verifier who confirms the gate.
3. Select only critical conditions that can be answered from observation or evidence.
4. Write each item as one condition, not a vague reminder.
5. Define the evidence source and who supplies it.
6. Define which answer stops progression.
7. Keep the list short enough to execute at the actual transition.
8. Review the list after incidents or repeated false confirmations.

## Checklist item form
- `[ ] CONDITION — EVIDENCE — OWNER`
- A checked box means the condition was observed, not merely discussed.
- `Not applicable` requires a recorded reason and authorised scope.

## Worked gate
**EDIT PHASE → RELEASE PHASE**
- `[ ] Intended files only — inspected diff — worker`
- `[ ] Required tests executed — command and exit code — worker`
- `[ ] Required tests passed — result record — verifier`
- `[ ] Recovery path available — rollback reference — release owner`

Any false or unknown required item stops the transition.

## Preserve the distinction
- A checklist MUST NOT become a 40-step duplicate of the procedure.
- A completed checklist does not prove that its evidence was valid; retain the evidence.
- Do not check an item in advance or infer it from role seniority.

## Finish and stop
- Return the transition, checklist result, exceptions and blocking items.
- Stop at the gate while a required condition is false, unknown or unsupported.

Source details and access limits: [SOURCES.md](SOURCES.md).
