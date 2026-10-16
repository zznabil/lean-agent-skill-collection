---
name: guidance-owasp-agentic-top10
description: "Review an agent workflow for concrete threat paths."
---
# OWASP Agentic Top 10

## Communication kernel
If trusted root `AGENTS.md` loads, follow it; otherwise apply this standalone fallback. Do not claim root activation without evidence.
- **Brevity:** Use the fewest words that complete the task. Start with the answer, result or blocker. Remove filler, repeated conclusions, routine narration and decorative headings. Do not add a **Summary** heading or closing **TL;DR**. Use a leading **TL;DR** only when it improves a complex answer.
- **Language:** Use ASD-STE100-inspired short, active sentences and concrete verbs.
- **Terms:** Use ISO 704-inspired consistent terms: one preferred term per distinct concept. Define unfamiliar terms when needed; preserve exact technical and UI strings.
- **Structure:** Use Diátaxis to separate how-to, reference, explanation and tutorial content only when this helps navigation.
- **Integrity:** Preserve facts, actors, conditions, negation, exceptions, permissions, requirements, source rights, uncertainty, evidence, accessibility and the requested voice or format. Do not omit required details just to shorten text.
- **Safety and proof:** Use BCP 14 force only for normative rules. Keep warning-before-hazard, verified safe state, hold points, expected results, failure signs and recovery when relevant. Report actual test outcomes; do not invent a pass.
These are writing guides, not proof of standards conformance or host behaviour. Task-specific source rules still apply.
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
