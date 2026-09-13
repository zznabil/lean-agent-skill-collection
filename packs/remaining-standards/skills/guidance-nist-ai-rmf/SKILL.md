---
name: guidance-nist-ai-rmf
description: "Map, measure and manage a scoped AI-system risk."
---
# NIST AI RMF + Generative AI Profile

## Task and boundary
- Assess a specified AI-system use case using AI RMF 1.0 and, where relevant, the Generative AI Profile.
- Do not turn the voluntary framework into a universal compliance score or an assertion that the model is safe.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
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

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** An AI assistant performs well on a benchmark but has not been tested with its real tools and users.
- **Expected:** Limit the performance evidence and identify deployment-specific risks and evaluations.
- **Missing-evidence case:** Affected users, deployment context or risk-acceptance authority are unknown.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
