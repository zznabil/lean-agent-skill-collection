---
name: standard-owasp-llmsvs
description: "Verify selected LLM-system security requirements."
---
# OWASP LLMSVS

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
- Review an LLM-enabled system against the explicitly selected LLMSVS 2.0 requirement set.
- Do not treat an LLM refusal, a filtered prompt or a generic OWASP label as complete verification.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
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

## Verify and recover
- **Worked check (illustrative, not executed):** A prompt says never reveal secrets while a retrieval tool can return every tenant's private records.
- **Expected:** Verify retrieval authorization and data separation; the prompt is not a sufficient enforcement boundary.
- **If blocked:** The selected requirement version or real integration evidence is unavailable. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
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
