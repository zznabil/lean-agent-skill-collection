---
name: standard-w3c-trace-context
description: "Propagate valid trace context across trust boundaries."
---
# W3C Trace Context

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
- Implement or review W3C Trace Context propagation between services.
- Do not use a trace identifier, sampling flag or received context as authentication or authorization.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Adopt conditionally. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Pin the Trace Context version and the project's propagation policy.
2. Validate traceparent structure, field sizes, hexadecimal encoding and invalid all-zero identifiers using the normative rules.
3. Handle invalid or unsupported context as the specification requires; do not propagate malformed values unchanged.
4. Apply the version and trace-flags rules without assuming every future flag has the current meaning.
5. Parse and update tracestate while preserving defined ordering, member and length constraints.
6. Create or propagate context at the correct boundary; use the project library rather than inventing a new trace-ID scheme.
7. Treat incoming context as untrusted metadata and define what crosses external or tenant boundaries.
8. Keep personal data and secrets out of trace identifiers and vendor state; consider correlation and privacy risks.
9. Test round trips, invalid headers, version handling and real multi-service propagation.
10. Report which headers, environments and propagation paths were checked; a syntactically valid header does not prove a complete
    trace.

## Verify and recover
- **Worked check (illustrative, not executed):** A request carries an all-zero trace ID and a sampled flag.
- **Expected:** Handle the invalid parent context according to the spec; the sampled flag grants no authority.
- **If blocked:** The chosen library or downstream service does not support the selected propagation rules. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
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
