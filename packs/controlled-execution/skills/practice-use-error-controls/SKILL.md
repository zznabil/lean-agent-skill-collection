---
name: practice-use-error-controls
description: "Derive controls from foreseeable use errors."
---
# Use-error controls

## Use and boundary
- Use for a task where a foreseeable user or agent error can cause material harm, loss or invalid evidence.
- Derive controls from the task and failure mechanism, not from a generic list of warnings.
- Do not claim FDA compliance for a non-medical workflow or from this compact routine.

## Task-risk record
Record:
- intended task and user or actor;
- possible use error;
- circumstances and contributing cause;
- possible consequence or harm;
- prevention;
- detection and containment;
- recovery;
- evidence that the selected control works.

## Control order
Prefer the strongest feasible control:
1. `PREVENT`: remove the hazard, restrict capability or redesign the workflow.
2. `PROTECT`: add an interlock, guard, bounded permission or automatic check.
3. `INFORM`: add instructions, warning or training.

Information MAY support stronger controls. It MUST NOT silently replace an available effective design or protective control.

## Procedure
1. Decompose the task at the point where the actor makes a decision or changes state.
2. Identify plausible errors and the conditions that make each error more likely.
3. State the direct consequence without exaggeration.
4. Select prevention before detection, and detection before warning-only control.
5. Define a stop condition that contains the error before further progression.
6. Define recovery to a known state.
7. Test the control against the actual error path, not only the intended path.
8. Record residual risk and any assumption that remains untested.

## Worked distinction
**Task:** Delete generated build files.

**Error:** Source files are included because the target path is ambiguous.

**Stronger control:** Give the worker delete permission only inside the generated-output directory.

**Additional gate:** Display and inspect the resolved deletion set before deletion.

**Weaker-only control:** “Be careful not to delete source files.”

## Finish and stop
- Stop if a high-consequence error has only a warning while a stronger feasible control remains unexplored.
- Return the task-risk record, selected control level, evidence and residual risk.

Source details and access limits: [SOURCES.md](SOURCES.md).
