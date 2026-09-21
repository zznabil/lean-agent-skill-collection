---
name: standard-nist-incident-response
description: "Structure authorised incident response with NIST guidance."
---
# NIST SP 800-61r3 incident response

## Task and boundary
- Prepare for or respond to a suspected cybersecurity incident within an assigned scope.
- Do not treat every error as an incident or perform destructive containment without the responsible authority.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: No major change; lineage. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Confirm the event, affected assets, potential impact and incident-response authority using available evidence.
2. Distinguish observations, hypotheses and confirmed compromise; preserve uncertainty in the initial classification.
3. Use SP 800-61r3's CSF 2.0 context: Govern, Identify and Protect support preparation; Detect, Respond and Recover support incident
   handling.
4. Establish incident ownership, communication channels, escalation criteria and evidence-handling requirements.
5. Preserve relevant logs, volatile evidence and timestamps before actions that could destroy them, where feasible and authorised.
6. Prioritise containment using impact, safety, evidence and business constraints; do not widen access or scope automatically.
7. Coordinate eradication and recovery with the responsible system owners and verify the recovery outcome.
8. Record required notifications and reporting decisions without inventing legal deadlines or contacting third parties without
   permission.
9. Feed lessons and unresolved risks back into preparation and risk management.
10. Report current incident state, evidence, actions taken, remaining risk and the next authorised step; this routine is not an
    incident-response service.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** A suspicious login is observed, but no evidence yet shows data exfiltration.
- **Expected:** Report the suspicious event and investigation status without claiming confirmed exfiltration.
- **Missing-evidence case:** Containment would affect production but the incident owner has not authorised it.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
