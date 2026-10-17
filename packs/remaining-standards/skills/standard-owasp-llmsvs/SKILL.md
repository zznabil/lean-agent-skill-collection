---
name: standard-owasp-llmsvs
description: "Verify selected LLM-system security requirements."
---
# OWASP LLMSVS

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
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
- Review an LLM-enabled system against the explicitly selected LLMSVS 2.0 requirement set.
- Do not treat an LLM refusal, a filtered prompt or a generic OWASP label as complete verification.
- Work only on the selected artefact or assessment. This routine grants no permission to run attacks, deploy, publish or change policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot provide missing requirements or prove conformance.
- Historical adoption decision: Existing conditional benchmark. Retain this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify the application, model, prompts, retrieval sources, tools, users and deployment boundaries.
2. Pin the LLMSVS 2.0 source and selected requirement scope before using requirement identifiers.
3. Map applicable requirements to implemented controls and current verification evidence.
4. Trace untrusted input through prompts, retrieval, tool use and output consumption.
5. Verify authority and data-access controls at the actual application/tool boundary. Do not verify them only in model instructions.
6. Assess sensitive-data exposure and downstream handling of generated output where the selected requirements make them relevant.
7. Use adversarial and failure cases only in an authorised, bounded test environment.
8. Use architecture and intended use to justify exclusions. Missing tests do not make a requirement inapplicable.
9. Recheck after changes to models, prompts, retrieval, permissions or tool integrations that invalidate the evidence.
10. Report requirement-level results and residual gaps. Do not claim universal protection against prompt injection or other LLM threats.

## Verify and recover
- **Worked check (illustrative, not executed):** A prompt says never reveal secrets while a retrieval tool can return every tenant's private records.
- **Expected:** Verify retrieval authorisation and data separation. The prompt does not provide a sufficient enforcement boundary.
- **If blocked:** If the selected requirement version or real integration evidence is unavailable, stop the affected assessment or action. Record the missing prerequisite and request it from the responsible owner. Continue only independent, authorised work.
- Keep planned work, observed evidence and unknown results separate. Missing or stale evidence is not a pass.
- Do not remove requirements for a score or line budget. Record unresolved source or task conflicts.
- Use the smallest check that detects the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Make one correction pass and recheck affected evidence. If a required issue remains, report it; do not loop or claim completion.
- Return the scoped result, source edition, evidence, limits, unresolved requirements and next permitted action. Do not claim formal conformance or model-behaviour improvement from this routine.
