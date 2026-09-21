---
name: standard-owasp-llmsvs
description: "Verify selected LLM-system security requirements."
---
# OWASP LLMSVS

## Task and boundary
- Review an LLM-enabled system against the explicitly selected LLMSVS 2.0 requirement set.
- Do not treat an LLM refusal, a filtered prompt or a generic OWASP label as complete verification.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: Existing conditional benchmark. Keep this boundary unless an authorised decision explicitly changes
  it.

## Procedure
1. Identify the application, model, prompts, retrieval sources, tools, users and deployment boundaries.
2. Pin the LLMSVS 2.0 source and the selected requirement scope before using requirement identifiers.
3. Map applicable requirements to implemented controls and current verification evidence.
4. Trace untrusted input through prompts, retrieval, tool use and output consumption.
5. Verify authority and data-access controls at the actual application/tool boundary, not only in model instructions.
6. Assess sensitive-data exposure and downstream handling of generated output where relevant to the selected requirements.
7. Use adversarial and failure cases only within an authorised, bounded test environment.
8. Justify exclusions from architecture and intended use; missing tests do not make a requirement inapplicable.
9. Recheck after changes to models, prompts, retrieval, permissions or tool integrations that invalidate the evidence.
10. Report requirement-level results and residual gaps without claiming universal protection against prompt injection or other LLM
    threats.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** A prompt says never reveal secrets while a retrieval tool can return every tenant's private records.
- **Expected:** Verify retrieval authorization and data separation; the prompt is not a sufficient enforcement boundary.
- **Missing-evidence case:** The selected requirement version or real integration evidence is unavailable.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
