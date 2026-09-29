---
name: standard-asyncapi
description: "Describe a message API with explicit send and receive."
---
# AsyncAPI Specification

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
- Create or review a message-driven API description using AsyncAPI 3.0.0.
- Do not substitute message schemas for delivery guarantees, authorization or consumer idempotency.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
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

## Verify and recover
- **Worked check (illustrative, not executed):** A consumer's operation is labelled send because the broker sends messages to it.
- **Expected:** Resolve the described application viewpoint and use receive for the consumer-side operation.
- **If blocked:** The selected validator does not implement AsyncAPI 3.0 or the application viewpoint is ambiguous. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
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
