---
name: standard-w3c-trace-context
description: "Propagate valid trace context across trust boundaries."
---
# W3C Trace Context

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
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
- Implement or review W3C Trace Context propagation between services.
- Do not treat a trace identifier, sampling flag or received context as authentication or authorisation.
- Work only on the selected artefact or assessment. This routine does not permit attacks, deployment, publication or policy changes.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot provide missing requirements or prove conformance.
- Historical adoption decision: Adopt conditionally. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Pin the Trace Context version and the project's propagation policy.
2. Use the normative rules to validate traceparent structure, field sizes, hexadecimal encoding and invalid all-zero identifiers.
3. Handle invalid or unsupported context as the specification requires. Do not propagate malformed values unchanged.
4. Apply the version and trace-flags rules. Do not assume that every future flag has its current meaning.
5. Parse and update tracestate. Preserve the defined ordering, member and length constraints.
6. Create or propagate context at the correct boundary. Use the project library; do not invent a new trace-ID scheme.
7. Treat incoming context as untrusted metadata. Define what crosses external or tenant boundaries.
8. Keep personal data and secrets out of trace identifiers and vendor state. Consider correlation and privacy risks.
9. Test round trips, invalid headers, version handling and actual multi-service propagation.
10. Report the headers, environments and propagation paths checked. A syntactically valid header does not prove a complete trace.

## Verify and recover
- **Worked check (illustrative, not executed):** A request carries an all-zero trace ID and a sampled flag.
- **Expected:** Handle the invalid parent context according to the spec; the sampled flag grants no authority.
- **If blocked:** If the chosen library or downstream service does not support the selected propagation rules, stop the affected assessment or action. Record the missing prerequisite. Request it from the responsible owner. Continue only independent, authorised work.
- Keep planned work, observed evidence and unknown results separate. Missing or stale evidence is not a pass.
- Do not remove requirements for a score or line budget. Record unresolved source or task conflicts.
- Use the smallest check that detects the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Make one correction pass and recheck affected evidence. If a required issue remains, report it; do not loop or claim completion.
- Return the scoped result, source edition, evidence, limits, unresolved requirements and next permitted action. Do not claim formal conformance or model-behaviour improvement from this routine.
