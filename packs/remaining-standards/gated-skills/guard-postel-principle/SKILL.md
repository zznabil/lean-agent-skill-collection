---
name: guard-postel-principle
description: "Reject undocumented permissive parsing as a default."
---
# Postel-style permissive parsing

## Communication kernel
If trusted root `AGENTS.md` loads, follow it; otherwise apply this standalone fallback. Do not claim root activation without evidence.
- **Brevity:** Use the fewest words that complete the task. Start with the answer, result or blocker. Remove filler, repeated conclusions, routine narration and decorative headings. Do not add a **Summary** heading or closing **TL;DR**. Use a leading **TL;DR** only when it improves a complex answer.
- **Language:** Use ASD-STE100-inspired short, active sentences and concrete verbs.
- **Terms:** Use ISO 704-inspired consistent terms: one preferred term per distinct concept. Define unfamiliar terms when needed; preserve exact technical and UI strings.
- **Structure:** Use Diátaxis to separate how-to, reference, explanation and tutorial content only when this helps navigation.
- **Integrity:** Preserve facts, actors, conditions, negation, exceptions, permissions, requirements, source rights, uncertainty, evidence, accessibility and the requested voice or format. Do not omit required details just to shorten text.
- **Safety and proof:** Use BCP 14 force only for normative rules. Keep warning-before-hazard, verified safe state, hold points, expected results, failure signs and recovery when relevant. Report actual test outcomes; do not invent a pass.
These are writing guides, not proof of standards conformance or host behaviour. Task-specific source rules still apply.
## Execution controls
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. State one actor, action and observable verification target per requirement.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps. Before destructive or hazardous work, verify the actual state.
- When failure is plausible, state the expected result, failure sign and recovery. Contrast noncompliant and compliant code or configuration when useful.
- For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery when useful. Add contrast or TL;DR only when helpful.
- Give progress only when requested or useful. Keep progress distinct from the verdict.

## Task and boundary
- Review proposed Postel-style tolerance at a protocol or trust boundary.
- Do not replace a protocol's explicitly defined extension tolerance with a blanket reject-unknown rule.
- Work only on the selected artifact or assessment. This routine grants no permission to run attacks, deploy, publish or change policy.
- OFF-DEFAULT GUARD: use this routine only for the stated selection or review request. Do not install it as an always-on workflow.

## Source and limits
- Read [SOURCES.md](SOURCES.md) to identify the source, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Reject as general boundary rule. Retain this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Read the register decision. It rejects permissive parsing as a general boundary policy.
2. Identify the authoritative input contract, supported extensions and actual compatibility requirement.
3. Separate valid extensibility from malformed, contradictory or ambiguous input.
4. Consider the effects of accepting invalid input on interoperability, security and future protocol evolution.
5. Prefer active maintenance of the specification and implementation over undocumented parser accommodation.
6. If an exception is necessary, state exactly what it accepts, why it is needed, who owns it and when it can be removed.
7. Test sender/receiver behaviour across relevant implementations and malformed cases.
8. Keep the specified unknown-field handling when the protocol requires it. This includes ignoring defined extension members where specified.
9. Limit diagnostic data. Exclude sensitive payloads from it.
10. Report the explicit boundary policy and unresolved ambiguity. This guard does not silently change a parser or the register.

## Verify and recover
- **Worked check (illustrative, not executed):** A Problem Details consumer rejects every extension member in the name of strict parsing.
- **Expected:** Keep RFC 9457's extension handling. The register rejects undocumented tolerance, not valid extensibility.
- **If blocked:** If no authoritative contract or evidence justifies the proposed compatibility exception, stop the affected assessment or action. Record the missing prerequisite and request it from the responsible owner. Continue only independent, authorised work.
- Keep facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths intact.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not remove requirements to improve a score or meet the line budget. Record unresolved source or task conflicts.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck the affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
