---
name: standard-iso-29148
description: "Trace requirements to sources and acceptance evidence."
---
# ISO/IEC/IEEE 29148

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
- Create or review requirements for a named system, change or procurement.
- Do not invent a requirements programme for an already clear, tiny edit.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Existing foundation. Keep this boundary unless an authorised decision explicitly changes it.
- Full licensed text was not obtained. This is a Lean application routine grounded in public scope and existing Lean guidance, not a
  clause transcript.
- Obtain the authorised full text before a clause-level assessment. Do not invent definitions, thresholds or conformity results.

## Procedure
1. Identify the stakeholders, system boundary, operating context and authoritative requirement sources.
2. Separate stakeholder needs, system requirements and implementation choices; do not make a proposed solution a user need.
3. Give each requirement a stable identifier, a source, an accountable owner and a verification method.
4. State the observable condition, required response, limits and exceptions. Resolve unclear terms from evidence or record the open
   decision.
5. Preserve obligations, prohibitions and permissions. Do not add numerical acceptance limits that no stakeholder approved.
6. Check that requirements are necessary, mutually consistent, feasible and verifiable within the stated context.
7. Trace each requirement to its parent need and planned evidence; trace each proposed acceptance check back to a requirement.
8. Record assumptions, dependencies and conflicts instead of selecting a convenient interpretation silently.
9. When a requirement changes, identify affected design, tests, documentation and approvals before accepting the new baseline.
10. If a formal 29148 assessment is required, map the licensed edition's applicable clauses to actual work products and evidence.

## Verify and recover
- **Worked check (illustrative, not executed):** A requirement says that the service must respond quickly.
- **Expected:** Record the unresolved workload and response-time criterion; do not fabricate a 100 ms limit.
- **If blocked:** The target workload, acceptance authority or full standard is unavailable. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
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
