---
name: guard-agent-observability
description: "Keep deferred agent observability outside default work."
---
# OWASP Agent Observability Standard

## Task and boundary
- Review a proposal to adopt the Agent Observability Standard for a specific project.
- Do not install an observability runtime or treat trace collection as trustworthiness by itself.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.
- OFF-DEFAULT GUARD: use only for the stated selection or review request; do not install as an always-on workflow.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: Defer. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Read the historical decision: Agent Observability Standard remains deferred.
2. Check the official project's current version, maturity and implementation evidence; preserve any work-in-progress label.
3. Identify the project's concrete need for instrumentation, traceability or inspectability.
4. Compare that need with existing telemetry and controls before adding another runtime dependency.
5. Assess compatibility, maintenance, data handling, permissions and operating overhead.
6. Distinguish instrumentability, trace records and component inventories from enforcement and correct agent behaviour.
7. Require a scoped proposal and explicit project adoption before introducing hooks, collectors or persistent state.
8. Keep production installation and external data transfer outside a source-review-only task.
9. Record measurable pilot criteria, rollback and ownership if a pilot is authorised.
10. Report adopt/defer questions and missing evidence; do not silently promote this register entry to a global mandate.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** A trace schema exists, so an agent claims that instrumented agents are trustworthy.
- **Expected:** Separate observable records from verified enforcement and actual behavioural outcomes.
- **Missing-evidence case:** The specification remains unstable or no supported implementation fits the project.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
