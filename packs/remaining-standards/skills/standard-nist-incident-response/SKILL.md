---
name: standard-nist-incident-response
description: "Structure authorised incident response with NIST guidance."
---
# NIST SP 800-61r3 incident response

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If trusted root `AGENTS.md` loads, its policy governs this skill. Otherwise, you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active technical sentences. Lead with the main point and familiar words. Keep simple replies short.
- Use ISO 704-inspired stable concepts and terminology. Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits.
- Use Diátaxis organization when useful. Separate how-to, reference and explanation. Explain difficult mechanisms from simple foundations. Contrast noncompliant and compliant code or configuration when useful.
- Apply other domain standards only when the task requires them. These patterns do not transfer legal or organisational authority from other frameworks.

## Execution controls
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. Preserve requirement force. Specify one actor, action and observable verification target.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps. Verify actual state before destructive or hazardous work.
- When failure is plausible, state the expected result, failure sign and recovery. For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful. Add contrast or TL;DR only when helpful.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable. Report observed results. Missing or stale evidence is not success.

## Task and boundary
- Prepare for or respond to a suspected cybersecurity incident within the assigned scope.
- Do not classify every error as an incident. Do not perform destructive containment without the responsible authority.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) to identify the source, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot provide missing requirements or prove conformance.
- Historical adoption decision: No major change; lineage. Retain this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Use available evidence to confirm the event, affected assets, potential impact and incident-response authority.
2. Separate observations, hypotheses and confirmed compromise. Retain uncertainty in the initial classification.
3. Apply SP 800-61r3's CSF 2.0 context. Govern, Identify and Protect support preparation. Detect, Respond and Recover support incident handling.
4. Define incident ownership, communication channels, escalation criteria and evidence-handling requirements.
5. Where feasible and authorised, preserve relevant logs, volatile evidence and timestamps before actions that could destroy them.
6. Prioritise containment by impact, safety, evidence and business constraints. Do not automatically widen access or scope.
7. Coordinate eradication and recovery with the responsible system owners. Verify the recovery outcome.
8. Record required notifications and reporting decisions. Do not invent legal deadlines or contact third parties without permission.
9. Use lessons and unresolved risks to inform preparation and risk management.
10. Report the current incident state, evidence, actions taken, remaining risk and next authorised step. This routine is not an incident-response service.

## Verify and recover
- **Worked check (illustrative, not executed):** A suspicious login is observed, but no evidence yet shows data exfiltration.
- **Expected:** Report the suspicious event and investigation status without claiming confirmed exfiltration.
- **If blocked:** Containment would affect production but the incident owner has not authorised it. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
- Retain facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not remove requirements to improve a score or meet the line budget. Record any unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the result for the selected scope, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck the affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
