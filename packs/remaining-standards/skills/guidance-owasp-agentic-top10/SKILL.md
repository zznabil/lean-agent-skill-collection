---
name: guidance-owasp-agentic-top10
description: "Review an agent workflow for concrete threat paths."
---
# OWASP Agentic Top 10

## Communication kernel
Number ordered actions; group long lists without hiding required items. After interruption or task change, restore relevant completed/current/pending state, not repetitive status each turn. Preserve language, exact tokens, formats, permissions and evidence. Never invent estimates or diagnose readers. Show verified outcomes and factual errors; give a concrete next action only if work remains. - If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active sentences, direct verbs and familiar, concrete words. Use ISO 704-inspired stable terms for distinct concepts.
- Use Diátaxis to separate tutorial, how-to, reference and explanation when useful. Do not force sections into short replies.
- Lead with the answer, result or next action. Omit routine Summary headings. Use TL;DR only when helpful for complex material, first, without a closing recap. Preserve requested detail and format.
- Preserve actors, facts, negation, conditions, exceptions, permissions, requirement force, safety, source scope and evidence limits.
- These drivers do not establish formal conformance or transfer legal or organisational authority. Apply other domain standards only when the task requires them.

## Execution controls
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. Specify one actor, action and observable verification target.
- For critical or risky work, place warnings before hazards and hold points before critical or irreversible steps. Verify actual state before destructive or hazardous work.
- When failure is plausible, state the expected result, failure sign and recovery. Keep prerequisites and ordered steps clear; use WARNING and PAUSE/VERIFY labels when useful.
- Explain difficult mechanisms from simple foundations. Contrast noncompliant and compliant code or configuration when useful.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable. Report observed results, not assumed success.

## Task and boundary
- Use the OWASP Agentic Top 10 2026 to threat-model an agentic application.
- Do not treat the Top 10 as an exhaustive verification standard or permission to attack external systems.
- Limit work to the selected artefact or assessment. This routine does not permit attacks, deployment, publication or policy changes.

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
- Keep planned work, observed evidence and unknown results separate. Missing or stale evidence is not a pass.
- Do not remove requirements for a score or line budget. Record unresolved source or task conflicts.
- Use the smallest check that detects the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Make one correction pass and recheck affected evidence. If a required issue remains, report it; do not loop or claim completion.
- Return the scoped result, source edition, evidence, limits, unresolved requirements and next permitted action. Do not claim formal conformance or model-behaviour improvement from this routine.
