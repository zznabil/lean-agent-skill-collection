---
name: guidance-nist-ai-rmf
description: "Map, measure and manage a scoped AI-system risk."
---
# NIST AI RMF + Generative AI Profile

## Communication kernel
If trusted root `AGENTS.md` loads, follow it; otherwise apply this standalone fallback. Do not claim root activation without evidence.
- **Brevity:** Use the fewest words that complete the task. Start with the answer, result or blocker. Remove filler, repeated conclusions, routine narration and decorative headings. Do not add a **Summary** heading or closing **TL;DR**. Use a leading **TL;DR** only when it improves a complex answer.
- **Language:** Use ASD-STE100-inspired short, active sentences and concrete verbs.
- **Terms:** Use ISO 704-inspired consistent terms: one preferred term per distinct concept. Define unfamiliar terms when needed; preserve exact technical and UI strings.
- **Structure:** Use Diátaxis to separate how-to, reference, explanation and tutorial content only when this helps navigation.
- **Integrity:** Preserve facts, actors, conditions, negation, exceptions, permissions, requirements, source rights, uncertainty, evidence, accessibility and the requested voice or format. Do not omit required details just to shorten text.
- **Safety and proof:** Use BCP 14 force only for normative rules. Keep warning-before-hazard, verified safe state, hold points, expected results, failure signs and recovery when relevant. Report actual test outcomes; do not invent a pass.
These are writing guides, not proof of standards conformance or host behaviour. Task-specific source rules still apply.
## Conditional execution rules
- When expressing normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. State one actor, action and observable verification target per requirement.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps. Before destructive or hazardous work, verify the actual state.
- When failure is plausible, state the expected result, failure sign and recovery action.
- When explaining difficult mechanisms, start with simple foundations. Contrast noncompliant and compliant code or configuration when useful.
- For critical procedures, keep prerequisites, warnings, verified holds, actions, expected results and recovery; add headings only when useful.
- These execution rules do not transfer external legal or organisational authority. Report observed results. Missing or stale evidence is not success.
- Give progress only when requested or useful. Keep progress distinct from the verdict.

## Task and boundary
- Assess a specified AI-system use case with AI RMF 1.0. Use the Generative AI Profile where relevant.
- Do not convert the voluntary framework into a universal compliance score or a claim that the model is safe.
- Work only on the selected artifact or assessment. This routine does not authorise attacks, deployment, publication or policy changes.

## Source and limits
- Read [SOURCES.md](SOURCES.md). Identify the source, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Existing conditional benchmark. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify the AI system, deployment context, intended uses, affected people and decision authority.
2. GOVERN: name risk owners, policies and responsibilities. Identify the evidence needed for consequential decisions.
3. MAP: describe the context, benefits, potential harms, data/model dependencies and limits of intended use.
4. MEASURE: choose valid evaluations for the identified risks. Use representative conditions and document uncertainty.
5. MANAGE: prioritise risks, select responses and record residual risks. Set monitoring or withdrawal triggers.
6. Use the Generative AI Profile and its suggested actions only for relevant generative-system risks. Do not use it to replace the base framework.
7. Assess trustworthiness characteristics in context. Reliability, safety, security, accountability, privacy and harmful bias are not interchangeable.
8. Include effects on non-users and foreseeable misuse where relevant to the deployment.
9. Reassess after material changes to the model, data, tools, context or user population.
10. Report the scoped risk record, measurements, responsible decisions and gaps. A completed template is not an evaluated AI system.

## Verify and recover
- **Worked check (illustrative, not executed):** An AI assistant performs well on a benchmark but has not been tested with its real tools and users.
- **Expected:** Limit the performance evidence. Identify deployment-specific risks and evaluations.
- **If blocked:** If affected users, deployment context or risk-acceptance authority are unknown, stop the affected assessment or action. Record the missing prerequisite. Request it from the responsible owner. Continue only independent, authorised work.
- Keep facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths intact.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not remove requirements to improve a score or meet the line budget. Record unresolved source or task conflicts.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
