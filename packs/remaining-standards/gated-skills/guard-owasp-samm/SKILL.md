---
name: guard-owasp-samm
description: "Scope SAMM to an explicitly authorised organisation."
---
# OWASP SAMM

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
- Evaluate whether a requested SAMM activity belongs to an authorised organisation-level programme.
- Do not apply SAMM maturity scoring to a single agent, small code change or ordinary repository task.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.
- OFF-DEFAULT GUARD: use only for the stated selection or review request; do not install as an always-on workflow.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Reject globally. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Read the historical adoption decision: SAMM is rejected as a global Lean workflow.
2. Identify the requesting organisation, programme owner, scope and explicit authority for a maturity assessment.
3. If that programme does not exist, retain the exclusion and complete the ordinary task using its actual requirements.
4. If assessment is authorised, obtain the selected SAMM model and assessment guidance before designing the activity.
5. Keep business functions, security practices, objectives and maturity evidence at the organisation/process level.
6. Do not translate a repository checkbox or agent prompt into organisational maturity evidence.
7. Record interviews, artifacts, observations and uncertainty using the approved assessment method.
8. Separate current evidence, target maturity and a prioritised improvement roadmap.
9. Use an organisation-specific process and owner for implementation; do not add runtime hooks or gates globally.
10. Report the scope decision and evidence limits without changing the register's global rejection.

## Verify and recover
- **Worked check (illustrative, not executed):** A single bug-fix task asks the agent to assign itself a SAMM maturity level.
- **Expected:** Decline the invalid unit of assessment and retain the organisation-only boundary.
- **If blocked:** There is no programme owner or authority for organisational assessment. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
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
