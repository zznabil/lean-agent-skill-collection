---
name: standard-nist-incident-response
description: "Structure authorised incident response with NIST guidance."
---
# NIST SP 800-61r3 incident response

## Lean communication kernel fallback (standalone)
- If trusted root `AGENTS.md` is loaded, its policy governs this skill. Otherwise MUST apply this lean communication kernel fallback; skill-specific rules refine it.
- Lead with the main point and familiar words (CDC Clear Communication Index). Use short, active, direct technical sentences (ASD-STE100).
- Separate how-to, reference and explanation when useful (Diátaxis). Keep simple replies short.
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. Use NASA-style one actor, action and observable verification target.
- For critical or risky work only, put ANSI-style warnings before hazards and WHO-style hold points before critical or irreversible steps.
- Before destructive or hazardous work, verify actual state (OSHA-style). When failure is plausible, state expected result, failure sign and recovery (FDA human-factors style).
- Explain difficult mechanisms from simple foundations (Feynman). Contrast noncompliant and compliant code or configuration when useful (SEI CERT).
- For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful; add contrast or TL;DR only when helpful.
- Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits. Report observed results; missing or stale evidence is not success.
- These are communication/control patterns, not transferred ANSI, WHO, OSHA, FDA or NASA legal or organisational authority. Use other domain standards only when the task requires them.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.

## Task and boundary
- Prepare for or respond to a suspected cybersecurity incident within an assigned scope.
- Do not treat every error as an incident or perform destructive containment without the responsible authority.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
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

## Verify and recover
- **Worked check (illustrative, not executed):** A suspicious login is observed, but no evidence yet shows data exfiltration.
- **Expected:** Report the suspicious event and investigation status without claiming confirmed exfiltration.
- **If blocked:** Containment would affect production but the incident owner has not authorised it. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
