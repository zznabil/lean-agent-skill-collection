---
name: guard-agent-observability
description: "Keep deferred agent observability outside default work."
---
# OWASP Agent Observability Standard

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. Loaded root policy governs; task-specific rules refine this kernel. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active, direct technical sentences. Lead with the main point and familiar words. Keep simple replies short. Use ISO 704-inspired stable concepts and terminology.
- Use Diátaxis purpose separation when helpful: separate how-to, reference and explanation. Explain difficult mechanisms from simple foundations.
- Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits. Report observed results. Missing or stale evidence is not success.
- For normative requirements, retain BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. State one actor, action and observable verification target.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps. Before destructive or hazardous work, verify actual state.
- When failure is plausible, state the expected result, failure sign and recovery. When useful, contrast noncompliant and compliant code or configuration.
- For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful. Add contrast or TL;DR only when helpful.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.
- These execution rules transfer no legal or organisational authority from ANSI, WHO, OSHA, FDA or NASA. They are not default prose frameworks or formal standards conformance. Use other domain standards only when the task requires them.

## Task and boundary
- Review a specific project's proposal to adopt the Agent Observability Standard.
- Do not install an observability runtime. Do not treat trace collection alone as trustworthiness.
- Work only on the selected artifact or assessment. This routine does not permit attacks, deployment, publication or policy changes.
- OFF-DEFAULT GUARD: use only for the stated selection or review request. Do not install it as an always-on workflow.

## Source and limits
- Read [SOURCES.md](SOURCES.md). Check source identity, applicable edition or part, available originals, access limits and copying terms.
- Before a source-specific finding, check the relevant source sections. This routine cannot provide missing requirements or prove conformance.
- Historical adoption decision: Defer. Retain this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Read the historical decision. The Agent Observability Standard remains deferred.
2. Check the official project's current version, maturity and implementation evidence. Retain any work-in-progress label.
3. Identify the project's concrete instrumentation, traceability or inspectability need.
4. Compare that need with existing telemetry and controls before adding another runtime dependency.
5. Assess compatibility, maintenance, data handling, permissions and operating overhead.
6. Separate instrumentability, trace records and component inventories from enforcement and correct agent behaviour.
7. Before introducing hooks, collectors or persistent state, require a scoped proposal and explicit project adoption.
8. Exclude production installation and external data transfer from a source-review-only task.
9. If a pilot is authorised, record measurable pilot criteria, rollback and ownership.
10. Report adoption or deferral questions and missing evidence. Do not silently make this register entry a global mandate.

## Verify and recover
- **Worked check (illustrative, not executed):** A trace schema exists, so an agent claims that instrumented agents are trustworthy.
- **Expected:** Distinguish observable records from verified enforcement and actual behavioural outcomes.
- **If blocked:** If the specification remains unstable or no supported implementation fits the project, stop the affected assessment or action. Record the missing prerequisite. Request it from the responsible owner. Continue only independent, authorised work.
- Retain facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Distinguish planned work, actual evidence and unknown results. Do not count missing or stale evidence as a pass.
- Do not delete requirements to improve a score or meet the line budget. Record unresolved source or task conflicts.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone cannot prove task success.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
