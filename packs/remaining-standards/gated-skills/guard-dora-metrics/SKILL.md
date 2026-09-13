---
name: guard-dora-metrics
description: "Use DORA for delivery systems, not individual scores."
---
# DORA delivery metrics

## Task and boundary
- Scope a requested DORA measurement to a team or service delivery system.
- Do not rank individual developers or agents with DORA metrics or equate tool-call speed with delivery performance.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.
- OFF-DEFAULT GUARD: use only for the stated selection or review request; do not install as an always-on workflow.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: Reject as individual-agent score. Keep this boundary unless an authorised decision explicitly
  changes it.

## Procedure
1. Read the register decision: reject DORA as an individual-agent score.
2. Identify the service/team, production delivery process and improvement question.
3. Use the selected five-metric definitions rather than silently mixing historical four-key terminology.
4. Record change lead time, deployment frequency and failed deployment recovery time under their defined boundaries.
5. Record change fail rate and deployment rework rate with explicit populations and denominators.
6. Use production delivery events and evidence, not local commits, test runs or chat turns as automatic substitutes.
7. Keep throughput and instability visible together instead of maximising one metric at the expense of the other.
8. Compare like contexts and periods; avoid incentives that game metrics or punish necessary engineering work.
9. Treat the results as system-level learning evidence, with missing data and causal uncertainty explicit.
10. Report the scoped delivery findings without changing the global rejection of individual-agent scoring.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** An agent scores itself highly because it creates many commits in one hour.
- **Expected:** Reject commit count as a DORA deployment-frequency measurement and preserve the system-level scope.
- **Missing-evidence case:** Production events or valid deployment/failure denominators are unavailable.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
