---
name: standard-cloudevents
description: "Validate an event envelope without inventing delivery."
---
# CloudEvents

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If trusted root `AGENTS.md` is loaded, its policy governs this skill. Otherwise you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active technical sentences. Lead with the main point and familiar words. Keep simple replies short.
- Use ISO 704-inspired stable concepts and terminology. Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits.
- Use Diátaxis organization. Separate how-to, reference and explanation when useful.
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. Preserve requirement force. State one actor, action and observable verification target per requirement.
- For critical or risky work only, place warnings before hazards. Place hold points before critical or irreversible steps. Before destructive or hazardous work, verify actual state.
- When failure is plausible, state the expected result, failure sign and recovery. When explaining difficult mechanisms, start from simple foundations. When useful, contrast noncompliant and compliant code or configuration.
- For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful. Add contrast or TL;DR only when helpful.
- Report observed results. Missing or stale evidence is not success. For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.
- These communication and control rules transfer no legal or organisational authority from ANSI, WHO, OSHA, FDA or NASA. Use other domain standards only when the task requires them; they are not default prose drivers.

## Task and boundary
- Create or review a CloudEvents envelope for a specified event flow.
- Do not treat CloudEvents as an exactly-once transport, authorization system or payload schema.
- Work only on the selected artifact or assessment. This routine does not authorise attacks, deployment, publication or policy changes.

## Source and limits
- Read [SOURCES.md](SOURCES.md). Identify the source, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot provide missing requirements or prove conformance.
- Historical adoption decision: Adopt upstream selectively. Retain this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Fix the CloudEvents specification version and the protocol binding that the producer and consumer use.
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
- Retain facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not remove requirements to improve a score or meet the line budget. Record any unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the result for the selected scope, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
