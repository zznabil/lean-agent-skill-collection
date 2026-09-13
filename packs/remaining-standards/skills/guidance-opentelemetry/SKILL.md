---
name: guidance-opentelemetry
description: "Instrument a named operator question with OpenTelemetry."
---
# OpenTelemetry specifications and semantic conventions

## Task and boundary
- Add or review telemetry needed to answer a concrete diagnostic or operational question.
- Do not add every signal, high-cardinality attribute or collector merely because OpenTelemetry supports it.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: Adopt upstream selectively. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. State the operator question and choose the traces, metrics or logs needed to answer it.
2. Pin the API/SDK, exporter, protocol and semantic-convention versions relevant to the implementation.
3. Separate stable from experimental conventions and record migration implications before changing names or units.
4. Prefer existing instrumentation and propagation mechanisms instead of duplicate providers or manual parallel pipelines.
5. Choose resource, instrumentation-scope and event attributes for their defined roles.
6. Control cardinality, sampling, retention and sensitive fields according to the project's evidence and privacy needs.
7. Preserve context across asynchronous boundaries, and validate correlation at real producer/consumer boundaries.
8. Test exporter failures, buffering, shutdown and overhead where they can affect application behaviour.
9. Verify that the intended backend receives useful data with correct units and semantics, not only that an API call succeeds.
10. Report the observed coverage and gaps; instrumenting a signal does not prove an SLO, alert or incident response works.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** A counter uses a per-user token as an attribute to simplify debugging.
- **Expected:** Flag the sensitive, high-cardinality label and select a bounded, privacy-preserving dimension.
- **Missing-evidence case:** The backend cannot confirm receipt or the semantic-convention version is unknown.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
