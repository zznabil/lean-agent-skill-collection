---
name: guidance-nist-ai-rmf
description: "Map, measure and manage a scoped AI-system risk."
---
# NIST AI RMF + Generative AI Profile

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
- Assess a specified AI-system use case using AI RMF 1.0 and, where relevant, the Generative AI Profile.
- Do not turn the voluntary framework into a universal compliance score or an assertion that the model is safe.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Existing conditional benchmark. Keep this boundary unless an authorised decision explicitly changes
  it.

## Procedure
1. Identify the AI system, deployment context, intended uses, affected people and decision authority.
2. GOVERN: name risk owners, policies, responsibilities and the evidence needed for consequential decisions.
3. MAP: describe context, benefits, potential harms, data/model dependencies and limits of intended use.
4. MEASURE: choose valid evaluations for the identified risks, with representative conditions and documented uncertainty.
5. MANAGE: prioritise risks, select responses, record residual risks and set monitoring or withdrawal triggers.
6. Use the Generative AI Profile only for relevant generative-system risks and its suggested actions, not as a replacement for the
   base framework.
7. Assess trustworthiness characteristics in context; reliability, safety, security, accountability, privacy and harmful bias are
   not interchangeable.
8. Include effects on non-users and foreseeable misuse where these are relevant to the deployment.
9. Reassess after material model, data, tool, context or user-population changes.
10. Report the scoped risk record, measurements, responsible decisions and gaps; a completed template is not an evaluated AI system.

## Verify and recover
- **Worked check (illustrative, not executed):** An AI assistant performs well on a benchmark but has not been tested with its real tools and users.
- **Expected:** Limit the performance evidence and identify deployment-specific risks and evaluations.
- **If blocked:** Affected users, deployment context or risk-acceptance authority are unknown. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
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
