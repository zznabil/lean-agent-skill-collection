---
name: guard-postel-principle
description: "Reject undocumented permissive parsing as a default."
---
# Postel-style permissive parsing

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If it loads, its policy governs this skill; skill-specific rules refine the kernel. Without it, you MUST apply this standalone kernel. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active technical sentences. Lead with the main point and familiar words. Keep simple replies short.
- Use ISO 704-inspired stable concepts and terminology. Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits.
- Use Diátaxis organization when helpful. Separate instructions, reference and explanation. Explain difficult mechanisms from simple foundations.
- Use other domain standards only when the task requires them. This kernel transfers no legal or organisational authority from other frameworks.

## Execution controls
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. State one actor, action and observable verification target per requirement.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps. Before destructive or hazardous work, verify the actual state.
- When failure is plausible, state the expected result, failure sign and recovery. Contrast noncompliant and compliant code or configuration when useful.
- For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery when useful. Add contrast or TL;DR only when helpful.
- Report observed results. Missing or stale evidence is not success. For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.

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
