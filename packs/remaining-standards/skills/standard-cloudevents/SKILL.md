---
name: standard-cloudevents
description: "Validate an event envelope without inventing delivery."
---
# CloudEvents

## Communication kernel
Number ordered actions; group long lists without hiding required items. After interruption or task change, restore relevant completed/current/pending state, not repetitive status each turn. Preserve language, exact tokens, formats, permissions and evidence. Never invent estimates or diagnose readers. Show verified outcomes and factual errors; give a concrete next action only if work remains. - If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
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
- Create or review a CloudEvents envelope for a specified event flow.
- Do not treat CloudEvents as an exactly-once transport, authorisation system or payload schema.
- Work only on the selected artefact or assessment. This routine does not authorise attacks, deployment, publication or policy changes.

## Source and limits
- Read [SOURCES.md](SOURCES.md). Identify the source, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot provide missing requirements or prove conformance.
- Historical adoption decision: Adopt upstream selectively. Retain this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Pin the CloudEvents specification version and the producer/consumer protocol binding.
2. Require the defined core context attributes: specversion, id, source and type.
3. Check context attribute types and constraints. Extensions must not redefine a standard attribute's meaning.
4. Identify an event by the combination of source and id. Define consumer handling of re-delivery separately.
5. Use subject, time, datacontenttype and dataschema only with their defined meanings and actual values.
6. Distinguish structured and binary content modes under the selected binding.
7. Retain payload bytes, encoding and schema identity. A valid envelope does not prove that a payload is valid or authorised.
8. Treat event context and payload as untrusted input at the appropriate boundary.
9. Test envelope validation, duplicate delivery, missing attributes and producer/consumer compatibility.
10. Report envelope compliance separately from transport ordering, retry, retention and delivery guarantees.

## Verify and recover
- **Worked check (illustrative, not executed):** A consumer assumes a valid CloudEvent can never arrive twice.
- **Expected:** Require a separate deduplication/idempotency decision; the envelope does not guarantee exactly-once processing.
- **If blocked:** If the binding, source identity or payload encoding contract is unavailable, stop the affected assessment or action. Record the missing prerequisite. Request it from the responsible owner. Continue only independent, authorised work.
- Keep planned work, observed evidence and unknown results separate. Missing or stale evidence is not a pass.
- Do not remove requirements for a score or line budget. Record unresolved source or task conflicts.
- Use the smallest check that detects the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Make one correction pass and recheck affected evidence. If a required issue remains, report it; do not loop or claim completion.
- Return the scoped result, source edition, evidence, limits, unresolved requirements and next permitted action. Do not claim formal conformance or model-behaviour improvement from this routine.
