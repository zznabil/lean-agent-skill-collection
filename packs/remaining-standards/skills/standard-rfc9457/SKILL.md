---
name: standard-rfc9457
description: "Design safe HTTP Problem Details responses."
---
# RFC 9457 Problem Details

## Task and boundary
- Define, implement or review HTTP API errors using RFC 9457 Problem Details.
- Do not change every error into HTTP 200 or disclose internal diagnostics to satisfy a richer error format.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
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

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** An API returns a detailed problem body with status 400 but sends an HTTP 200 response.
- **Expected:** Flag the status inconsistency and test the actual client-visible HTTP response.
- **Missing-evidence case:** The intended problem type or client compatibility expectations are unknown.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
