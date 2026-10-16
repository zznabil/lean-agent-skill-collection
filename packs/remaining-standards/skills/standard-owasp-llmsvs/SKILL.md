---
name: standard-owasp-llmsvs
description: "Verify selected LLM-system security requirements."
---
# OWASP LLMSVS

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
- For normative requirements, preserve requirement force. Use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. State one actor, action and observable verification target.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps. Before destructive or hazardous work, verify actual state.
- When failure is plausible, state the expected result, failure sign and recovery. For critical procedures, keep prerequisites, warnings, verified holds, actions, expected results and recovery; add headings only when useful.
- When explaining difficult mechanisms, start with simple foundations. Contrast noncompliant and compliant code or configuration when useful. These execution rules do not transfer legal or organisational authority from other frameworks.
- Give progress only when requested or useful. Keep progress distinct from the verdict.

## Task and boundary
- Review an LLM-enabled system against the explicitly selected LLMSVS 2.0 requirement set.
- Do not treat an LLM refusal, a filtered prompt or a generic OWASP label as complete verification.
- Work only on the selected artifact or assessment. This routine grants no permission to run attacks, deploy, publish or change policy.

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
- **Expected:** Verify retrieval authorization and data separation. The prompt does not provide a sufficient enforcement boundary.
- **If blocked:** If the selected requirement version or real integration evidence is unavailable, stop the affected assessment or action. Record the missing prerequisite and request it from the responsible owner. Continue only independent, authorised work.
- Keep facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths intact.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or meet the line budget. Record any unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
