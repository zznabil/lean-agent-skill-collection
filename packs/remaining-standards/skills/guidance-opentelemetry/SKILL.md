---
name: guidance-opentelemetry
description: "Instrument a named operator question with OpenTelemetry."
---
# OpenTelemetry specifications and semantic conventions

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If trusted root `AGENTS.md` loads, its policy governs this skill. Otherwise, you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active technical sentences. Lead with the main point and familiar words. Use ISO 704-inspired stable concepts and terminology. Use Diátaxis to separate how-to, reference and explanation when useful. Keep simple replies short.
- Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits. Report observed results. Missing or stale evidence is not success.
- When writing normative requirements, preserve their force. Use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. Identify one actor, action and observable verification target for each requirement.
- For critical or risky work, place warnings before hazards. Place hold points before critical or irreversible steps. Before destructive or hazardous work, verify actual state.
- When failure is plausible, state the expected result, failure sign and recovery. For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful.
- When mechanisms are difficult, explain them from simple foundations. Contrast noncompliant and compliant code or configuration when useful. Add a contrast or TL;DR only when helpful.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.
- These execution rules do not transfer legal or organisational authority from other frameworks. Use domain standards only when the task requires them. They are not default communication drivers.

## Task and boundary
- Add or review telemetry that answers a concrete diagnostic or operational question.
- Do not add every signal, high-cardinality attribute or collector just because OpenTelemetry supports it.
- Limit work to the selected artifact or assessment. This routine does not permit attacks, deployment, publication or policy changes.

## Source and limits
- Read [SOURCES.md](SOURCES.md) to identify the source, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot provide missing requirements or prove conformance.
- Historical adoption decision: Adopt upstream selectively. Preserve this boundary unless an authorised decision explicitly changes it.

## Procedure
1. State the operator question. Select the traces, metrics or logs that answer it.
2. Pin the API/SDK, exporter, protocol and semantic-convention versions that apply to the implementation.
3. Distinguish stable and experimental conventions. Record migration implications before changing names or units.
4. Prefer existing instrumentation and propagation mechanisms over duplicate providers or manual parallel pipelines.
5. Select resource, instrumentation-scope and event attributes for their defined roles.
6. Control cardinality, sampling, retention and sensitive fields to meet the project's evidence and privacy needs.
7. Preserve context across asynchronous boundaries. Validate correlation at actual producer/consumer boundaries.
8. Test exporter failures, buffering, shutdown and overhead where they can affect application behaviour.
9. Verify that the intended backend receives useful data with correct units and semantics. A successful API call alone is not sufficient.
10. Report observed coverage and gaps. Instrumenting a signal does not prove that an SLO, alert or incident response works.

## Verify and recover
- **Worked check (illustrative, not executed):** A counter uses a per-user token as an attribute to simplify debugging.
- **Expected:** Flag the sensitive, high-cardinality label. Select a bounded dimension that preserves privacy.
- **If blocked:** If the backend cannot confirm receipt or the semantic-convention version is unknown, stop the affected assessment or action. Record the missing prerequisite. Request it from the responsible owner. Continue only independent, authorised work.
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or meet the line budget. Record any unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck the affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
