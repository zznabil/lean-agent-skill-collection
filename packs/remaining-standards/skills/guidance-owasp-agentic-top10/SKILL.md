---
name: guidance-owasp-agentic-top10
description: "Review an agent workflow for concrete threat paths."
---
# OWASP Agentic Top 10

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
- Threat-model an agentic application using the OWASP Agentic Top 10 2026.
- Do not use the Top 10 as an exhaustive verification standard or a licence to attack external systems.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
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

## Verify and recover
- **Worked check (illustrative, not executed):** An agent treats another agent's message as permission to widen its tool access.
- **Expected:** Preserve the receiving agent's actual authority boundary and verify inter-agent identity and permissions separately.
- **If blocked:** A high-impact tool cannot be exercised safely in the available environment. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
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
