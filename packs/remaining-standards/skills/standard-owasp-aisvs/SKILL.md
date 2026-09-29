---
name: standard-owasp-aisvs
description: "Verify scoped AI controls against AISVS 1.0."
---
# OWASP AISVS

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
- Assess AI-specific security controls using an explicitly selected AISVS 1.0 scope and level.
- Do not substitute AISVS for application, infrastructure or organisational controls that lie outside its scope.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Adopt conditionally. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify the AI system, data/model revisions, deployment context, actors and selected verification level.
2. Read the official 1.0 requirements and use version-qualified control IDs in the evidence map.
3. Select relevant controls for training data, input validation, model lifecycle, infrastructure and access management.
4. Include model supply chain, output handling, retrieval/memory and agent orchestration where those components exist.
5. Assess MCP integration, adversarial evaluation and monitoring requirements when those boundaries are in scope.
6. Verify controls at the actual enforcement point; a prompt rule is not a substitute for a missing permission check.
7. Use authorised, bounded negative tests and protect credentials, personal data and production systems.
8. Record not-applicable decisions with architectural reasons; unsupported or untested requirements stay visible.
9. Recheck evidence after model, data, tool, permission or orchestration changes that affect validity.
10. Report the supported control set and residual gaps without implying an OWASP-issued certification or universal AI safety.

## Verify and recover
- **Worked check (illustrative, not executed):** An agent prompt forbids deleting data, but its tool can delete any tenant's records.
- **Expected:** Assess the tool's actual authorization boundary; the prompt restriction alone does not satisfy enforcement.
- **If blocked:** Required model, tool-permission or audit evidence is inaccessible. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
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
