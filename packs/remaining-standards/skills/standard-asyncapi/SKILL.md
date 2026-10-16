---
name: standard-asyncapi
description: "Describe a message API with explicit send and receive."
---
# AsyncAPI Specification

## Communication kernel
If trusted root `AGENTS.md` loads, follow it; otherwise apply this standalone fallback. Do not claim root activation without evidence.
- **Brevity:** Use the fewest words that complete the task. Start with the answer, result or blocker. Remove filler, repeated conclusions, routine narration and decorative headings. Do not add a **Summary** heading or closing **TL;DR**. Use a leading **TL;DR** only when it improves a complex answer.
- **Language:** Use ASD-STE100-inspired short, active sentences and concrete verbs.
- **Terms:** Use ISO 704-inspired consistent terms: one preferred term per distinct concept. Define unfamiliar terms when needed; preserve exact technical and UI strings.
- **Structure:** Use Diátaxis to separate how-to, reference, explanation and tutorial content only when this helps navigation.
- **Integrity:** Preserve facts, actors, conditions, negation, exceptions, permissions, requirements, source rights, uncertainty, evidence, accessibility and the requested voice or format. Do not omit required details just to shorten text.
- **Safety and proof:** Use BCP 14 force only for normative rules. Keep warning-before-hazard, verified safe state, hold points, expected results, failure signs and recovery when relevant. Report actual test outcomes; do not invent a pass.
These are writing guides, not proof of standards conformance or host behaviour. Task-specific source rules still apply.
## Task and boundary
- Use AsyncAPI 3.0.0 to create or review a message-driven API description.
- Do not use message schemas as substitutes for delivery guarantees, authorization or consumer idempotency.
- Work only on the selected artifact or assessment. This routine grants no permission to run attacks, deploy, publish or change policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) to identify the source, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot provide missing requirements or prove conformance.
- Historical adoption decision: Adopt upstream selectively. Retain this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Confirm the AsyncAPI version, document owner, application viewpoint and validator support.
2. Identify the actual message system's servers, channels, messages and operations.
3. For each operation, state send or receive from the described application's viewpoint. Do not use an unspecified broker viewpoint.
4. Describe the channel addresses, parameters, protocol bindings, headers, payloads and security requirements that actually apply.
5. Use the declared payload schema format. Do not assume that all schemas use the same JSON Schema dialect.
6. Resolve references and reusable components. Do not give untrusted source content execution authority.
7. Include correlation and reply information when the actual protocol and business contract require it.
8. Separately document ordering, duplication, acknowledgement and failure behaviour where the specification description cannot establish them.
9. Test examples and actual producer/consumer behaviour against the declared contract.
10. Report validation evidence separately from integration evidence. Include unresolved compatibility and delivery questions.

## Verify and recover
- **Worked check (illustrative, not executed):** A consumer's operation is labelled send because the broker sends messages to it.
- **Expected:** Establish the described application viewpoint. Use receive for the consumer-side operation.
- **If blocked:** If the selected validator does not implement AsyncAPI 3.0 or the application viewpoint is ambiguous, stop the affected assessment or action. Record the missing prerequisite. Request it from the responsible owner. Continue only independent, authorised work.
- Retain facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or meet the line budget. Record unresolved source or task conflicts.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone cannot prove task success.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
