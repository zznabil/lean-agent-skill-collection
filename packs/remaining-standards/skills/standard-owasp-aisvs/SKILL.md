---
name: standard-owasp-aisvs
description: "Verify scoped AI controls against AISVS 1.0."
---
# OWASP AISVS

## Task and boundary
- Assess AI-specific security controls using an explicitly selected AISVS 1.0 scope and level.
- Do not substitute AISVS for application, infrastructure or organisational controls that lie outside its scope.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
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

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** An agent prompt forbids deleting data, but its tool can delete any tenant's records.
- **Expected:** Assess the tool's actual authorization boundary; the prompt restriction alone does not satisfy enforcement.
- **Missing-evidence case:** Required model, tool-permission or audit evidence is inaccessible.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
