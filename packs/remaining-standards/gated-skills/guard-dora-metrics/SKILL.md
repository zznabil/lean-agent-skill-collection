---
name: guard-dora-metrics
description: "Use DORA for delivery systems, not individual scores."
---
# DORA delivery metrics
## Communication kernel
If trusted root `AGENTS.md` loads, follow it; otherwise apply this standalone fallback. Do not claim root activation without evidence.
- **Brevity:** Use the fewest words that complete the task. Start with the answer, result or blocker. Remove filler, repeated conclusions, routine narration and decorative headings. Do not add a **Summary** heading or closing **TL;DR**. Use a leading **TL;DR** only when it improves a complex answer.
- **Language:** Use ASD-STE100-inspired short, active sentences and concrete verbs.
- **Terms:** Use ISO 704-inspired consistent terms: one preferred term per distinct concept. Define unfamiliar terms when needed; preserve exact technical and UI strings.
- **Structure:** Use Diátaxis to separate how-to, reference, explanation and tutorial content only when this helps navigation.
- **Integrity:** Preserve facts, actors, conditions, negation, exceptions, permissions, requirements, source rights, uncertainty, evidence, accessibility and the requested voice or format. Do not omit required details just to shorten text.
- **Safety and proof:** Use BCP 14 force only for normative rules. Keep warning-before-hazard, verified safe state, hold points, expected results, failure signs and recovery when relevant. Report actual test outcomes; do not invent a pass.
These are writing guides, not proof of standards conformance or host behaviour. Task-specific source rules still apply.
## Conditional execution rules
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. Preserve requirement force. State one actor, action and observable verification target.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps.
- Before destructive or hazardous work, verify actual state. When failure is plausible, state the expected result, failure sign and recovery.
- When explaining difficult mechanisms, start from simple foundations. When useful, contrast noncompliant and compliant code or configuration.
- For critical procedures, keep prerequisites, warnings, verified holds, actions, expected results and recovery; add headings only when useful.
- Report observed results. Missing or stale evidence is not success. These execution rules transfer no legal or organisational authority from external frameworks. Use other domain standards only when the task requires them.
- Give progress only when requested or useful. Keep progress distinct from the verdict.
## Task and boundary
- Scope the requested DORA measurement to a team or service delivery system.
- Do not use DORA metrics to rank individual developers or agents. Do not equate tool-call speed with delivery performance.
- Work only on the selected artifact or assessment. This routine grants no permission to run attacks, deploy, publish or change policy.
- OFF-DEFAULT GUARD: use this routine only for the stated selection or review request. Do not install it as an always-on workflow.
## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check the relevant source sections before making a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Reject as individual-agent score. Keep this boundary unless an authorised decision explicitly changes it.
## Procedure
1. Read the register decision: reject DORA as an individual-agent score.
2. Identify the service/team, production delivery process and improvement question.
3. Use the selected five-metric definitions. Do not silently mix them with historical four-key terminology.
4. Record change lead time, deployment frequency and failed deployment recovery time within their defined boundaries.
5. Record change fail rate and deployment rework rate. State their populations and denominators explicitly.
6. Use production delivery events and evidence. Do not automatically substitute local commits, test runs or chat turns.
7. Show throughput and instability together. Do not maximise one metric at the expense of the other.
8. Compare like contexts and periods. Avoid incentives that game metrics or punish necessary engineering work.
9. Treat results as system-level learning evidence. State missing data and causal uncertainty explicitly.
10. Report scoped delivery findings. Do not change the global rejection of individual-agent scoring.
## Verify and recover
- **Worked check (illustrative, not executed):** An agent scores itself highly because it creates many commits in one hour.
- **Expected:** Reject commit count as a DORA deployment-frequency measurement. Keep the system-level scope.
- **If blocked:** If production events or valid deployment/failure denominators are unavailable, stop the affected assessment or action. Record the missing prerequisite. Request it from the responsible owner. Continue only independent, authorised work.
- Keep facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths intact.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or meet the line budget. Record any unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.
## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck the affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
