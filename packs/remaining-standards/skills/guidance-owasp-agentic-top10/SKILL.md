---
name: guidance-owasp-agentic-top10
description: "Review an agent workflow for concrete threat paths."
---
# OWASP Agentic Top 10

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If trusted root `AGENTS.md` loads, its policy governs this skill. Otherwise, you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active technical sentences. Lead with the main point and familiar words. Use ISO 704-inspired stable concepts and terminology. Use Diátaxis to separate how-to, reference and explanation when useful. Keep simple replies short.
- Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits. Report observed results. Missing or stale evidence is not success.
- When writing normative requirements, preserve their force. Use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. Identify one actor, action and observable verification target for each requirement.
- For critical or risky work, place warnings before hazards. Place hold points before critical or irreversible steps. Before destructive or hazardous work, verify actual state.
- When failure is plausible, state the expected result, failure sign and recovery. For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful.
- When mechanisms are difficult, explain them from simple foundations. Contrast noncompliant and compliant code or configuration when useful. Add a contrast or TL;DR only when helpful.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.
- These execution rules do not transfer legal or organisational authority from other frameworks. Use domain standards only when the task requires them. They are not default communication drivers.

## Task and boundary
- Use the OWASP Agentic Top 10 2026 to threat-model an agentic application.
- Do not treat the Top 10 as an exhaustive verification standard or permission to attack external systems.
- Limit work to the selected artifact or assessment. This routine does not permit attacks, deployment, publication or policy changes.

## Source and limits
- Read [SOURCES.md](SOURCES.md) to identify the source, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot provide missing requirements or prove conformance.
- Historical adoption decision: Conditional threat source. Preserve this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Map goals, identities, tools, memory, communications and consequential actions in the actual workflow.
2. Review goal hijacking, tool misuse and privilege abuse against the corresponding source categories.
3. Use the actual dependency and tool boundaries to review supply-chain exposure and unexpected code execution.
4. Where the channels exist, assess memory/context poisoning and insecure inter-agent communications.
5. Use realistic bounded scenarios to examine cascading failures, exploitation of human trust and rogue-agent behaviour.
6. For each applicable category, identify the attacker-controlled input, targeted asset and missing or existing control.
7. Distinguish preventive enforcement, detection, recovery and human approval. None automatically proves the others.
8. Test only authorised paths. Use reversible fixtures. Do not use real secrets or cause unintended external side effects.
9. Record expected results, observed results and controls that you did not test.
10. Report a prioritised threat-to-control map and its limitations. Ten categories do not represent ten probabilities or a complete assurance claim.

## Verify and recover
- **Worked check (illustrative, not executed):** An agent treats another agent's message as permission to widen its tool access.
- **Expected:** Preserve the receiving agent's actual authority boundary. Verify inter-agent identity and permissions separately.
- **If blocked:** If you cannot safely exercise a high-impact tool in the available environment, stop the affected assessment or action. Record the missing prerequisite. Request it from the responsible owner. Continue only independent, authorised work.
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or meet the line budget. Record any unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck the affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
