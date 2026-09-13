---
name: standard-iso-5055
description: "Scope automated source-quality measurements honestly."
---
# ISO/IEC 5055 source-code quality measures

## Task and boundary
- Evaluate a source-code quality measurement based on an explicitly selected ISO 5055 tool or method.
- Do not treat a generic linter count or maintainability score as an ISO 5055 measurement.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: Project-local benchmark. Keep this boundary unless an authorised decision explicitly changes it.
- Full licensed text was not obtained. This is a Lean application routine grounded in public scope and existing Lean guidance, not a
  clause transcript.
- Obtain the authorised full text before a clause-level assessment. Do not invent definitions, thresholds or conformity results.

## Procedure
1. Identify the software boundary, languages, source revision and quality question.
2. Establish which standard-defined measures the selected tool actually implements and which languages it supports.
3. Record exclusions, generated code, dependency coverage and incomplete analysis paths.
4. Run the tool using a reproducible configuration and retain its raw evidence.
5. Inspect representative findings and false positives rather than accepting aggregate numbers blindly.
6. Keep detected structural weaknesses separate from demonstrated runtime failures or exploitability.
7. Compare results only when definitions, scope, tool versions and configurations are compatible.
8. Trace proposed fixes to actual risk and verify the affected behavior after change.
9. Report missing coverage and tool limitations alongside scores.
10. Obtain the licensed measure definitions before asserting standard conformity; public scope alone is insufficient.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** A file-length linter is described as an ISO 5055 security assessment.
- **Expected:** Reject the unsupported equivalence and state exactly what the linter measured.
- **Missing-evidence case:** The tool does not disclose measure definitions or supported analysis coverage.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
