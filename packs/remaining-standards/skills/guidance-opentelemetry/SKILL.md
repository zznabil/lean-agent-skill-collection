---
name: guidance-opentelemetry
description: "Instrument a named operator question with OpenTelemetry."
---
# OpenTelemetry specifications and semantic conventions

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
- Add or review telemetry needed to answer a concrete diagnostic or operational question.
- Do not add every signal, high-cardinality attribute or collector merely because OpenTelemetry supports it.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Adopt upstream selectively. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. State the operator question and choose the traces, metrics or logs needed to answer it.
2. Pin the API/SDK, exporter, protocol and semantic-convention versions relevant to the implementation.
3. Separate stable from experimental conventions and record migration implications before changing names or units.
4. Prefer existing instrumentation and propagation mechanisms instead of duplicate providers or manual parallel pipelines.
5. Choose resource, instrumentation-scope and event attributes for their defined roles.
6. Control cardinality, sampling, retention and sensitive fields according to the project's evidence and privacy needs.
7. Preserve context across asynchronous boundaries, and validate correlation at real producer/consumer boundaries.
8. Test exporter failures, buffering, shutdown and overhead where they can affect application behaviour.
9. Verify that the intended backend receives useful data with correct units and semantics, not only that an API call succeeds.
10. Report the observed coverage and gaps; instrumenting a signal does not prove an SLO, alert or incident response works.

## Verify and recover
- **Worked check (illustrative, not executed):** A counter uses a per-user token as an attribute to simplify debugging.
- **Expected:** Flag the sensitive, high-cardinality label and select a bounded, privacy-preserving dimension.
- **If blocked:** The backend cannot confirm receipt or the semantic-convention version is unknown. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
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
