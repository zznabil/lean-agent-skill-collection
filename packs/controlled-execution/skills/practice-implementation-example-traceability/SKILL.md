---
name: practice-implementation-example-traceability
description: "Separate required tasks from implementation examples."
---
# Implementation-example traceability

## Use and boundary
- Use when a framework defines practices and tasks but offers non-exclusive implementation examples.
- Keep the required outcome separate from one possible implementation.
- Do not convert a notional example into a universal MUST.
- This routine is not a complete SSDF adoption or NIST conformity assessment.

## Traceability record
Record:
- `PRACTICE`
- `TASK`
- `REQUIRED OUTCOME`
- `NOTIONAL EXAMPLE`
- `CHOSEN IMPLEMENTATION`
- `WHY IT FITS`
- `EVIDENCE`
- `REFERENCES`
- `VERSION / STATUS`

## Procedure
1. Identify the governing practice and selected task.
2. Extract the required outcome without importing optional example details.
3. Label each source example as notional unless the source explicitly makes it required.
4. Select an implementation that fits the system, risk and existing process.
5. Explain how the implementation satisfies the task outcome.
6. Define evidence that can verify the implementation in operation.
7. Retain alternatives when they can satisfy the same outcome.
8. Distinguish final publications from drafts and record the selected version.
9. Re-evaluate the mapping when the framework or system changes.

## Worked distinction
**Framework task:** Protect source code from unauthorised change.

**Notional example:** Require protected branches and review.

**Chosen implementation:** A signed change pipeline with mandatory review and a different protected integration mechanism.

The chosen implementation can satisfy the task if its evidence supports the required outcome. The source example is not automatically the only permitted design.

## Finish and stop
- Confirm that every MUST comes from the task or local authority, not merely from an example.
- Stop if the source status or required outcome is unresolved.
- Return the practice-to-evidence map and any justified alternative.

Source details and access limits: [SOURCES.md](SOURCES.md).
