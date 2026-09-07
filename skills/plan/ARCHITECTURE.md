# Architecture decisions

Use for material changes to structure, ownership, shared contracts or lifecycle; not as a precondition for every edit.

Start with stakeholders, constraints, quality scenarios and the existing design's purpose. Trace domain invariants, state owners and trust boundaries. Compare the current system, a minimal reversible change and one credible alternative. Prefer the option that satisfies the requirement with least lasting complexity.

Keep UI, API, CLI, MCP and job entry points consistent for the same domain action: validation, authorisation, idempotency and error semantics.

For consequential retries, distinguish success, failure and unknown. Bind an idempotency key to the intended operation, claim it atomically, retain it for the retry horizon and reconcile an unknown result before repeating side effects. Check concurrent writers and crash/restart behaviour where required.

For migrations, expand compatibility first; backfill or dual-write only as needed, switch consumers, verify old-path use is zero, then contract. Destructive changes come last. Record recovery and the operational signal that decides advance, hold or rollback.

Do not invent future extensibility or a catalogue of diagrams. Select a quality scenario relevant to the decision, such as compatibility, security, reliability, interaction or measured performance; naming ISO/IEC 25010 does not evaluate every quality characteristic.

## Standards in use

- When a structural decision is consequential, compare the current design and smallest viable alternatives using stakeholder concerns and quality scenarios; record the decision, trade-offs, owner and revisit trigger. (ADR; ISO/IEC/IEEE 42010; ATAM (small form)).
- When HTTP, data or event contracts change, use the project-selected schema/specification, accepted and rejected examples and compatibility checks; define errors or event envelopes only where needed. (OpenAPI; JSON Schema; RFC 9457 Problem Details; AsyncAPI; CloudEvents).
  Select by interface: OpenAPI for HTTP operations, JSON Schema for data constraints, AsyncAPI for messages, CloudEvents only for an adopted event envelope. For adopted Problem Details responses, preserve the problem type and HTTP/body status consistency; do not leak internals. Do not introduce a format merely because it appears here.
- At protocol and input boundaries, define accepted representations, normalise once and reject ambiguity; do not use Postel-style silent permissiveness as a general policy. (RFC 9413; Postel-style permissive parsing (rejected default)).
- When operations need a reliability signal, define the user-facing indicator, objective, time window and error-budget action; propagate correlation across boundaries using existing telemetry and bounded attributes. (Google SRE SLO/error-budget practice; W3C Trace Context; OpenTelemetry).
- When designing a user-facing system, ground the design in intended users, tasks and context, then evaluate the critical journey rather than treating a mock-up as proof. (ISO 9241-210).
