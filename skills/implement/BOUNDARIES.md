# Changed-boundary checks

Load only the section matching the changed behaviour. Use the project's selected version and controls; do not introduce another framework, format or dependency just to name a standard. These checks are independently usable without other Lean skills or root policy.

## Contracts

When changing an HTTP endpoint, data schema or event contract, update the adopted contract and exercise accepted, rejected and compatibility examples. OpenAPI describes HTTP operations; JSON Schema constrains data; AsyncAPI describes message interfaces; CloudEvents applies only to an adopted event envelope. A local JSON file does not require all four.

For HTTP errors using RFC 9457 Problem Details, retain a stable problem type, align any body status with the HTTP status, and keep internal traces or secrets out of detail. Do not silently replace an established error contract. At input boundaries, accept documented representations, normalise once and reject ambiguity rather than silently guessing. (OpenAPI; JSON Schema; AsyncAPI; CloudEvents; RFC 9457; RFC 9413).

## Security and privacy

When changing authentication, authorisation, recovery, secrets or personal data, identify the protected asset and abuse case; test both permitted and denied access. Keep server-side authorisation and safe defaults; minimise collection and exposure, and implement required retention/deletion. Use the project's identity assurance requirements, not a custom authentication scheme or an invented compliance level. (NIST SSDF; OWASP ASVS; NIST SP 800-63-4; ISO 31700-1; CISA Secure by Design).

## User journeys

For interactive UI or user instructions, preserve native semantics, keyboard operation, focus, accessible names/roles/states and predictable feedback. Put prerequisites and consequences before commitment; show the next action, data state and recovery. Trace a stated accessibility need to its barrier and testable requirement; test the rendered journey, including interruption, with intended users when risk warrants. Do not claim conformance from a checklist. (WCAG 2.2; WAI-ARIA APG; ISO 9241-110/210; ISO 21801-1; ISO 9241-171; ISO/IEC 29138; ISO/IEC 23859; IEC/IEEE 82079-1; ISO/IEC/IEEE 26514/26513; ISO 704).

## AI and data

When changing model, retrieval, prompt, memory or tool authority, separate instructions from untrusted content, validate tool arguments and permissions, and test a relevant injection, leakage or unintended-action case. Record the affected people, foreseeable harm and recovery owner before consequential deployment. Keep data provenance, permitted uses, splits and leakage checks with the change; invalidate evaluation evidence affected by it. Select relevant threats rather than launching a whole assurance campaign. (NIST AI RMF/GenAI Profile; NIST SP 800-218A; NIST AI 100-2e2025; OWASP LLMSVS/AISVS; OWASP Agentic Top 10; MITRE ATLAS; ISO/IEC 5338/42005/5259/25012/25024).

## State and delivery

For shared-state, migration or lifecycle changes, preserve invariants across concurrency, cancellation and restart; reconcile unknown side-effect outcomes before retry. Expand compatibility before destructive contraction and verify recovery. For a consequential design choice, record the smallest viable alternative, quality scenario, trade-off, owner and revisit condition; tie the claim to an observable check. A full plan is unnecessary when the local decision is clear. (ISO/IEC/IEEE 12207/42010/15026-2; ISO/IEC 25010; ADR; ATAM).

When operational evidence is required, use the existing user-facing SLI, objective, window and error-budget action; preserve trace correlation and bounded telemetry attributes. Do not add an observability stack for an unrelated edit. (Google SRE; W3C Trace Context; OpenTelemetry).

For regulated or safety-critical changes, stop short of assurance claims until applicable authoritative sources, qualified review and required evidence are available. Lean is not a substitute for those domain standards.
