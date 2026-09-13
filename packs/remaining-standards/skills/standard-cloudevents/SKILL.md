---
name: standard-cloudevents
description: "Validate an event envelope without inventing delivery."
---
# CloudEvents

## Task and boundary
- Create or review a CloudEvents envelope for a specified event flow.
- Do not treat CloudEvents as an exactly-once transport, authorization system or payload schema.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: Adopt upstream selectively. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Pin the CloudEvents spec version and the protocol binding used by the producer and consumer.
2. Require the defined core context attributes: specversion, id, source and type.
3. Check context attribute types and constraints; extensions must not redefine a standard attribute's meaning.
4. Use the combination of source and id to identify an event; define separately how consumers handle re-delivery.
5. Use subject, time, datacontenttype and dataschema only with their defined meanings and actual values.
6. Distinguish structured and binary content modes according to the selected binding.
7. Preserve payload bytes, encoding and schema identity; a valid envelope does not prove a valid or authorised payload.
8. Treat event context and payload as untrusted input at the appropriate boundary.
9. Test envelope validation, duplicate delivery, missing attributes and producer/consumer compatibility.
10. Report envelope compliance separately from transport ordering, retry, retention and delivery guarantees.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** A consumer assumes a valid CloudEvent can never arrive twice.
- **Expected:** Require a separate deduplication/idempotency decision; the envelope does not guarantee exactly-once processing.
- **Missing-evidence case:** The binding, source identity or payload encoding contract is unavailable.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
