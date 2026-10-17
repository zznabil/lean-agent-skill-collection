---
name: standard-rfc9457
description: "Design safe HTTP Problem Details responses."
---
# RFC 9457 Problem Details
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
- Define, implement or review HTTP API errors with RFC 9457 Problem Details.
- Do not convert every error to HTTP 200. Do not disclose internal diagnostics to provide a richer error format.
- Work only on the selected artefact or assessment. This routine gives no permission to run attacks, deploy, publish or change policy.
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
- Keep planned work, observed evidence and unknown results separate. Missing or stale evidence is not a pass.
- Do not remove requirements for a score or line budget. Record unresolved source or task conflicts.
- Use the smallest check that detects the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Make one correction pass and recheck affected evidence. If a required issue remains, report it; do not loop or claim completion.
- Return the scoped result, source edition, evidence, limits, unresolved requirements and next permitted action. Do not claim formal conformance or model-behaviour improvement from this routine.
