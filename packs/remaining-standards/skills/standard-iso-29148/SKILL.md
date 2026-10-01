---
name: standard-iso-29148
description: "Trace requirements to sources and acceptance evidence."
---
# ISO/IEC/IEEE 29148
## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If trusted root `AGENTS.md` loads, its policy governs this skill. Otherwise, you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active technical sentences. Lead with the main point and familiar words. Use ISO 704-inspired stable concepts and terminology. Use Diátaxis to separate how-to, reference and explanation when useful. Keep simple replies short.
- Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits. Report observed results. Missing or stale evidence is not success.
- These communication and control patterns do not transfer legal or organisational authority from ANSI, WHO, OSHA, FDA or NASA. Apply other domain standards only when the task requires them.
## Conditional execution rules
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. State one actor, action and observable verification target.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps. Before destructive or hazardous work, verify actual state.
- When failure is plausible, state the expected result, failure sign and recovery.
- For difficult mechanisms, explain from simple foundations. When useful, contrast noncompliant and compliant code or configuration.
- For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful. Add contrast or TL;DR only when helpful.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.
## Task and boundary
- Create or review requirements for a named system, change or procurement.
- Do not create a requirements programme for an already clear, tiny edit.
- Work only on the selected artifact or assessment. This routine does not permit attacks, deployment, publication or policy changes.
## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Existing foundation. Preserve this boundary unless an authorised decision explicitly changes it.
- Full licensed text was not obtained. This Lean application routine uses public scope and existing Lean guidance. It is not a clause transcript.
- Obtain authorised full text before a clause-level assessment. Do not invent definitions, thresholds or conformity results.
## Procedure
1. Identify stakeholders, system boundary, operating context and authoritative requirement sources.
2. Separate stakeholder needs, system requirements and implementation choices. Do not turn a proposed solution into a user need.
3. Assign each requirement a stable identifier, source, accountable owner and verification method.
4. State the observable condition, required response, limits and exceptions. Resolve unclear terms from evidence or record the open decision.
5. Preserve obligations, prohibitions and permissions. Do not add numerical acceptance limits without stakeholder approval.
6. Check that requirements are necessary, mutually consistent, feasible and verifiable in the stated context.
7. Trace each requirement to its parent need and planned evidence. Trace each proposed acceptance check back to a requirement.
8. Record assumptions, dependencies and conflicts. Do not silently choose a convenient interpretation.
9. When a requirement changes, identify affected design, tests, documentation and approvals before accepting the new baseline.
10. If a formal 29148 assessment is required, map the licensed edition's applicable clauses to actual work products and evidence.
## Verify and recover
- **Worked check (illustrative, not executed):** A requirement says that the service must respond quickly.
- **Expected:** Record the unresolved workload and response-time criterion; do not fabricate a 100 ms limit.
- **If blocked:** If the target workload, acceptance authority or full standard is unavailable, stop the affected assessment or action. Record the missing prerequisite. Request it from the responsible owner. Continue only independent, authorised work.
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Keep planned work, actual evidence and unknown results separate. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or meet the line budget. Record unresolved source or task conflicts.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.
## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
