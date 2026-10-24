---
name: guidance-nist-ai-rmf
description: "Map, measure and manage a scoped AI-system risk."
---
# NIST AI RMF + Generative AI Profile

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
- Assess a specified AI-system use case with AI RMF 1.0. Use the Generative AI Profile where relevant.
- Do not convert the voluntary framework into a universal compliance score or a claim that the model is safe.
- Work only on the selected artefact or assessment. This routine does not authorise attacks, deployment, publication or policy changes.

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
- Keep planned work, observed evidence and unknown results separate. Missing or stale evidence is not a pass.
- Do not remove requirements for a score or line budget. Record unresolved source or task conflicts.
- Use the smallest check that detects the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Make one correction pass and recheck affected evidence. If a required issue remains, report it; do not loop or claim completion.
- Return the scoped result, source edition, evidence, limits, unresolved requirements and next permitted action. Do not claim formal conformance or model-behaviour improvement from this routine.
