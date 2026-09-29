---
name: guard-dora-metrics
description: "Use DORA for delivery systems, not individual scores."
---
# DORA delivery metrics

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
- Scope a requested DORA measurement to a team or service delivery system.
- Do not rank individual developers or agents with DORA metrics or equate tool-call speed with delivery performance.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.
- OFF-DEFAULT GUARD: use only for the stated selection or review request; do not install as an always-on workflow.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Reject as individual-agent score. Keep this boundary unless an authorised decision explicitly
  changes it.

## Procedure
1. Read the register decision: reject DORA as an individual-agent score.
2. Identify the service/team, production delivery process and improvement question.
3. Use the selected five-metric definitions rather than silently mixing historical four-key terminology.
4. Record change lead time, deployment frequency and failed deployment recovery time under their defined boundaries.
5. Record change fail rate and deployment rework rate with explicit populations and denominators.
6. Use production delivery events and evidence, not local commits, test runs or chat turns as automatic substitutes.
7. Keep throughput and instability visible together instead of maximising one metric at the expense of the other.
8. Compare like contexts and periods; avoid incentives that game metrics or punish necessary engineering work.
9. Treat the results as system-level learning evidence, with missing data and causal uncertainty explicit.
10. Report the scoped delivery findings without changing the global rejection of individual-agent scoring.

## Verify and recover
- **Worked check (illustrative, not executed):** An agent scores itself highly because it creates many commits in one hour.
- **Expected:** Reject commit count as a DORA deployment-frequency measurement and preserve the system-level scope.
- **If blocked:** Production events or valid deployment/failure denominators are unavailable. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
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
