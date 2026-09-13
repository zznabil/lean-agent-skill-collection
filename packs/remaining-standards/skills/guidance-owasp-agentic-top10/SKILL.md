---
name: guidance-owasp-agentic-top10
description: "Review an agent workflow for concrete threat paths."
---
# OWASP Agentic Top 10

## Task and boundary
- Threat-model an agentic application using the OWASP Agentic Top 10 2026.
- Do not use the Top 10 as an exhaustive verification standard or a licence to attack external systems.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: Conditional threat source. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Map goals, identities, tools, memory, communications and consequential actions in the actual workflow.
2. Review goal hijacking, tool misuse and privilege abuse against the corresponding source categories.
3. Review supply-chain exposure and unexpected code execution using the real dependency and tool boundaries.
4. Assess memory/context poisoning and insecure inter-agent communications where those channels exist.
5. Examine cascading failures, exploitation of human trust and rogue-agent behaviour using realistic bounded scenarios.
6. For each applicable category, name the attacker-controlled input, targeted asset and missing or existing control.
7. Separate preventive enforcement, detection, recovery and human approval; none automatically proves the others.
8. Test only authorised paths, using reversible fixtures and no real secrets or unintended external side effects.
9. Record expected and observed results plus controls that were not tested.
10. Report a prioritised threat-to-control map and limitations; ten categories are not ten probabilities or a complete assurance
    claim.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** An agent treats another agent's message as permission to widen its tool access.
- **Expected:** Preserve the receiving agent's actual authority boundary and verify inter-agent identity and permissions separately.
- **Missing-evidence case:** A high-impact tool cannot be exercised safely in the available environment.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
