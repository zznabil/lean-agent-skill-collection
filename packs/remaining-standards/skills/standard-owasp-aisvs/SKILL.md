---
name: standard-owasp-aisvs
description: "Verify scoped AI controls against AISVS 1.0."
---
# OWASP AISVS

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If trusted root `AGENTS.md` is loaded, its policy governs this skill. Otherwise, you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active technical sentences. Lead with the main point. Use familiar words and keep simple replies short.
- Use ISO 704-inspired stable concepts and terminology. Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits.
- Use Diátaxis organization. Separate how-to, reference and explanation when useful. Explain difficult mechanisms from simple foundations. Compare noncompliant and compliant code or configuration when useful.
- When stating normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. Preserve their force. State one actor, action and observable verification target per requirement.
- For critical or risky work, place warnings before hazards and hold points before critical or irreversible steps. Before destructive or hazardous work, verify the actual state.
- When failure is plausible, state the expected result, failure sign and recovery action. For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful. Add a comparison or TL;DR only when helpful.
- Report observed results. Missing or stale evidence is not success. For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.
- These communication and execution rules transfer no legal or organisational authority from other frameworks. Use other domain standards only when the task requires them.

## Task and boundary
- Assess AI-specific security controls against an explicitly selected AISVS 1.0 scope and level.
- Do not use AISVS as a substitute for application, infrastructure or organisational controls outside its scope.
- Limit work to the selected artifact or assessment. This routine gives no permission to run attacks, deploy, publish or change policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md). Identify the source, applicable edition or part, available originals, access limits and copying terms.
- Check the relevant source sections before making a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Adopt conditionally. Retain this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify the AI system, data/model revisions, deployment context, actors and selected verification level.
2. Read the official 1.0 requirements. Use version-qualified control IDs in the evidence map.
3. Select relevant controls for training data, input validation, model lifecycle, infrastructure and access management.
4. Where the components exist, include model supply chain, output handling, retrieval/memory and agent orchestration.
5. When the boundaries are in scope, assess MCP integration, adversarial evaluation and monitoring requirements.
6. Verify controls at the actual enforcement point. A prompt rule cannot replace a missing permission check.
7. Use authorised, bounded negative tests. Protect credentials, personal data and production systems.
8. Record architectural reasons for not-applicable decisions. Keep unsupported or untested requirements visible.
9. Recheck evidence after model, data, tool, permission or orchestration changes that affect its validity.
10. Report the supported control set and residual gaps. Do not imply an OWASP-issued certification or universal AI safety.

## Verify and recover
- **Worked check (illustrative, not executed):** An agent prompt forbids deleting data, but its tool can delete any tenant's records.
- **Expected:** Assess the tool's actual authorization boundary; the prompt restriction alone does not satisfy enforcement.
- **If blocked:** If required model, tool-permission or audit evidence is inaccessible, stop the affected assessment or action. Record the missing prerequisite. Request it from the responsible owner. Continue only independent, authorised work.
- Keep facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths intact.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or meet the line budget. Record unresolved source or task conflicts.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the result for the selected scope, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck the affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
