---
name: standard-asyncapi
description: "Describe a message API with explicit send and receive."
---
# AsyncAPI Specification

## Task and boundary
- Create or review a message-driven API description using AsyncAPI 3.0.0.
- Do not substitute message schemas for delivery guarantees, authorization or consumer idempotency.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: Adopt upstream selectively. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Confirm the AsyncAPI version, document owner, application viewpoint and validator support.
2. Identify servers, channels, messages and operations in the actual message system.
3. For each operation, state send or receive relative to the application described, not an unspecified broker viewpoint.
4. Describe channel addresses, parameters, protocol bindings, headers, payloads and security requirements that actually apply.
5. Use the declared payload schema format; do not assume every schema follows the same JSON Schema dialect.
6. Resolve references and reusable components without giving untrusted source content execution authority.
7. Include correlation and reply information when required by the actual protocol and business contract.
8. Document ordering, duplication, acknowledgement and failure behaviour separately where the specification description cannot
   establish them.
9. Test examples and actual producer/consumer behaviour against the declared contract.
10. Report validation and integration evidence separately, with unresolved compatibility and delivery questions.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** A consumer's operation is labelled send because the broker sends messages to it.
- **Expected:** Resolve the described application viewpoint and use receive for the consumer-side operation.
- **Missing-evidence case:** The selected validator does not implement AsyncAPI 3.0 or the application viewpoint is ambiguous.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
