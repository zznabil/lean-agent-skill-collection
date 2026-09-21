---
name: standard-w3c-trace-context
description: "Propagate valid trace context across trust boundaries."
---
# W3C Trace Context

## Task and boundary
- Implement or review W3C Trace Context propagation between services.
- Do not use a trace identifier, sampling flag or received context as authentication or authorization.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: Adopt conditionally. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Pin the Trace Context version and the project's propagation policy.
2. Validate traceparent structure, field sizes, hexadecimal encoding and invalid all-zero identifiers using the normative rules.
3. Handle invalid or unsupported context as the specification requires; do not propagate malformed values unchanged.
4. Apply the version and trace-flags rules without assuming every future flag has the current meaning.
5. Parse and update tracestate while preserving defined ordering, member and length constraints.
6. Create or propagate context at the correct boundary; use the project library rather than inventing a new trace-ID scheme.
7. Treat incoming context as untrusted metadata and define what crosses external or tenant boundaries.
8. Keep personal data and secrets out of trace identifiers and vendor state; consider correlation and privacy risks.
9. Test round trips, invalid headers, version handling and real multi-service propagation.
10. Report which headers, environments and propagation paths were checked; a syntactically valid header does not prove a complete
    trace.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** A request carries an all-zero trace ID and a sampled flag.
- **Expected:** Handle the invalid parent context according to the spec; the sampled flag grants no authority.
- **Missing-evidence case:** The chosen library or downstream service does not support the selected propagation rules.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
