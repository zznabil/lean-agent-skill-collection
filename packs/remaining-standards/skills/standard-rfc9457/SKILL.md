---
name: standard-rfc9457
description: "Design safe HTTP Problem Details responses."
---
# RFC 9457 Problem Details
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
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. Preserve their force. State one actor, action and observable verification target.
- For critical or risky work only, place warnings before hazards. Place hold points before critical or irreversible steps. Before destructive or hazardous work, verify actual state.
- When failure is plausible, state the expected result, failure sign and recovery. For critical procedures, keep prerequisites, warnings, verified holds, actions, expected results and recovery; add headings only when useful.
- For difficult mechanisms, explain from simple foundations. Contrast noncompliant and compliant code or configuration when useful.
- Give progress only when requested or useful. Keep progress distinct from the verdict.
- These execution rules do not transfer legal or organisational authority from ANSI, WHO, OSHA, FDA or NASA. Use other domain standards only when the task requires them; they are not default communication drivers.
## Task and boundary
- Define, implement or review HTTP API errors with RFC 9457 Problem Details.
- Do not convert every error to HTTP 200. Do not disclose internal diagnostics to provide a richer error format.
- Work only on the selected artifact or assessment. This routine gives no permission to run attacks, deploy, publish or change policy.
## Source and limits
- Read [SOURCES.md](SOURCES.md). Check source identity, applicable edition or part, available originals, access limits and copying terms.
- Check the relevant source sections before making a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Adopt conditionally. Preserve this boundary unless an authorised decision explicitly changes it.
## Procedure
1. Identify the actual HTTP failure, audience and existing client compatibility requirements.
2. Select the appropriate Problem Details representation and media type, such as application/problem+json.
3. Use type as the problem-type identifier. If type is omitted, use the about:blank default meaning. Do not invent a custom meaning.
4. Keep title a short summary of the problem type. Make detail specific to the occurrence. Clients should not parse detail as a machine protocol.
5. If status is included, keep it consistent with the actual response status. Explain any intermediary limitations.
6. Use instance to identify the occurrence when useful. Do not leak secrets or sensitive identifiers.
7. Define extension members and their semantics in the problem-type contract. Consumers must tolerate unknown extension members.
8. Retain actionable information. Withhold stack traces, tokens, internal paths and sensitive implementation details.
9. Test the media type, status, omitted/default members, extension handling and representative client errors.
10. Document the type and recovery information. Distinguish representation conformance from correctness of the underlying service.
## Verify and recover
- **Worked check (illustrative, not executed):** An API returns a detailed problem body with status 400 but sends an HTTP 200 response.
- **Expected:** Flag the status inconsistency and test the actual client-visible HTTP response.
- **If blocked:** If the intended problem type or client compatibility expectations are unknown, stop the affected assessment or action. Record the missing prerequisite. Request it from the responsible owner. Continue only independent, authorised work.
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or meet the line budget. Record any unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.
## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck the affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
