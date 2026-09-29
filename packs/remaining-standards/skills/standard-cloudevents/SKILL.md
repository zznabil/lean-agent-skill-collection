---
name: standard-cloudevents
description: "Validate an event envelope without inventing delivery."
---
# CloudEvents

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
- Create or review a CloudEvents envelope for a specified event flow.
- Do not treat CloudEvents as an exactly-once transport, authorization system or payload schema.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
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

## Verify and recover
- **Worked check (illustrative, not executed):** A consumer assumes a valid CloudEvent can never arrive twice.
- **Expected:** Require a separate deduplication/idempotency decision; the envelope does not guarantee exactly-once processing.
- **If blocked:** The binding, source identity or payload encoding contract is unavailable. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
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
