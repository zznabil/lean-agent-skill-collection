---
name: guard-agent-observability
description: "Keep deferred agent observability outside default work."
---
# OWASP Agent Observability Standard

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
- Review a proposal to adopt the Agent Observability Standard for a specific project.
- Do not install an observability runtime or treat trace collection as trustworthiness by itself.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.
- OFF-DEFAULT GUARD: use only for the stated selection or review request; do not install as an always-on workflow.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Defer. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Read the historical decision: Agent Observability Standard remains deferred.
2. Check the official project's current version, maturity and implementation evidence; preserve any work-in-progress label.
3. Identify the project's concrete need for instrumentation, traceability or inspectability.
4. Compare that need with existing telemetry and controls before adding another runtime dependency.
5. Assess compatibility, maintenance, data handling, permissions and operating overhead.
6. Distinguish instrumentability, trace records and component inventories from enforcement and correct agent behaviour.
7. Require a scoped proposal and explicit project adoption before introducing hooks, collectors or persistent state.
8. Keep production installation and external data transfer outside a source-review-only task.
9. Record measurable pilot criteria, rollback and ownership if a pilot is authorised.
10. Report adopt/defer questions and missing evidence; do not silently promote this register entry to a global mandate.

## Verify and recover
- **Worked check (illustrative, not executed):** A trace schema exists, so an agent claims that instrumented agents are trustworthy.
- **Expected:** Separate observable records from verified enforcement and actual behavioural outcomes.
- **If blocked:** The specification remains unstable or no supported implementation fits the project. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
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
