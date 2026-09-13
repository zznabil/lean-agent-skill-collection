---
name: standard-iso-29148
description: "Trace requirements to sources and acceptance evidence."
---
# ISO/IEC/IEEE 29148

## Task and boundary
- Create or review requirements for a named system, change or procurement.
- Do not invent a requirements programme for an already clear, tiny edit.
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
1. Identify the stakeholders, system boundary, operating context and authoritative requirement sources.
2. Separate stakeholder needs, system requirements and implementation choices; do not make a proposed solution a user need.
3. Give each requirement a stable identifier, a source, an accountable owner and a verification method.
4. State the observable condition, required response, limits and exceptions. Resolve unclear terms from evidence or record the open
   decision.
5. Preserve obligations, prohibitions and permissions. Do not add numerical acceptance limits that no stakeholder approved.
6. Check that requirements are necessary, mutually consistent, feasible and verifiable within the stated context.
7. Trace each requirement to its parent need and planned evidence; trace each proposed acceptance check back to a requirement.
8. Record assumptions, dependencies and conflicts instead of selecting a convenient interpretation silently.
9. When a requirement changes, identify affected design, tests, documentation and approvals before accepting the new baseline.
10. If a formal 29148 assessment is required, map the licensed edition's applicable clauses to actual work products and evidence.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** A requirement says that the service must respond quickly.
- **Expected:** Record the unresolved workload and response-time criterion; do not fabricate a 100 ms limit.
- **Missing-evidence case:** The target workload, acceptance authority or full standard is unavailable.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
