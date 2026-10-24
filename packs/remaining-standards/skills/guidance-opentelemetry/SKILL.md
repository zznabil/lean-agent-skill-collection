---
name: guidance-opentelemetry
description: "Instrument a named operator question with OpenTelemetry."
---
# OpenTelemetry specifications and semantic conventions

## Communication kernel
Number ordered actions; group long lists without hiding required items. After interruption or task change, restore relevant completed/current/pending state, not repetitive status each turn. Preserve language, exact tokens, formats, permissions and evidence. Never invent estimates or diagnose readers. Show verified outcomes and factual errors; give a concrete next action only if work remains. - If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
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
- Add or review telemetry that answers a concrete diagnostic or operational question.
- Do not add every signal, high-cardinality attribute or collector just because OpenTelemetry supports it.
- Limit work to the selected artefact or assessment. This routine does not permit attacks, deployment, publication or policy changes.

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
- Keep planned work, observed evidence and unknown results separate. Missing or stale evidence is not a pass.
- Do not remove requirements for a score or line budget. Record unresolved source or task conflicts.
- Use the smallest check that detects the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Make one correction pass and recheck affected evidence. If a required issue remains, report it; do not loop or claim completion.
- Return the scoped result, source edition, evidence, limits, unresolved requirements and next permitted action. Do not claim formal conformance or model-behaviour improvement from this routine.
