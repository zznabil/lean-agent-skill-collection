---
name: standard-rfc9457
description: "Design safe HTTP Problem Details responses."
---
# RFC 9457 Problem Details

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
- Define, implement or review HTTP API errors using RFC 9457 Problem Details.
- Do not change every error into HTTP 200 or disclose internal diagnostics to satisfy a richer error format.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Adopt conditionally. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify the actual HTTP failure, audience and existing client compatibility requirements.
2. Choose the appropriate Problem Details representation and media type, such as application/problem+json.
3. Use type as the problem-type identifier; when omitted, understand the about:blank default rather than inventing a custom meaning.
4. Keep title a short problem-type summary and detail specific to the occurrence; clients should not parse detail as a machine
   protocol.
5. When status is included, keep it consistent with the actual response status and explain any intermediary limitations.
6. Use instance to identify the occurrence when useful without leaking secrets or sensitive identifiers.
7. Define extension members and their semantics in the problem-type contract; consumers must tolerate unknown extension members.
8. Keep actionable information while withholding stack traces, tokens, internal paths and sensitive implementation details.
9. Test media type, status, omitted/default members, extension handling and representative client errors.
10. Document the type and recovery information; distinguish conformance of the representation from correctness of the underlying
    service.

## Verify and recover
- **Worked check (illustrative, not executed):** An API returns a detailed problem body with status 400 but sends an HTTP 200 response.
- **Expected:** Flag the status inconsistency and test the actual client-visible HTTP response.
- **If blocked:** The intended problem type or client compatibility expectations are unknown. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
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
