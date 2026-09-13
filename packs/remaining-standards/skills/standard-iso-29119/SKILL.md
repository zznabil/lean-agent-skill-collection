---
name: standard-iso-29119
description: "Plan and trace testing with the applicable 29119 part."
---
# ISO/IEC/IEEE 29119 series

## Task and boundary
- Plan, specify or review software testing when the project selects the 29119 series.
- Do not treat the series as one document or require every test technique for every change.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: Existing foundation. Keep this boundary unless an authorised decision explicitly changes it.
- Full licensed text was not obtained. This is a Lean application routine grounded in public scope and existing Lean guidance, not a
  clause transcript.
- Obtain the authorised full text before a clause-level assessment. Do not invent definitions, thresholds or conformity results.

## Procedure
1. Identify the tested item, revision, risk, test level, environment and project test obligations.
2. Select the applicable series parts and editions explicitly; concepts, processes, documentation and techniques are different
   sources.
3. Read the selected part before assigning a clause number or asserting a requirement from it.
4. Link each test condition to a requirement or risk, then define inputs, expected results and a credible oracle.
5. Choose techniques that address the named risk; do not select a method only to populate a checklist.
6. Specify test data, environment, execution order, entry/exit conditions and incident handling appropriate to the scope.
7. Record actual results, deviations, defects and reproducible evidence separately from the planned cases.
8. Preserve traceability when the tested item, test or environment changes; rerun affected checks.
9. Report passed, failed, blocked and unrun cases separately. An unexecuted case is not test evidence.
10. For formal process/documentation conformance, assess the licensed applicable parts rather than this compact routine.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** A test plan contains expected results but no executions.
- **Expected:** Report a completed plan and unrun tests, not a passed test campaign.
- **Missing-evidence case:** The applicable series part, oracle or test environment is unavailable.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
