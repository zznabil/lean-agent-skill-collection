---
name: guard-postel-principle
description: "Reject undocumented permissive parsing as a default."
---
# Postel-style permissive parsing

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
- Review a proposed use of Postel-style tolerance at a protocol or trust boundary.
- Do not override a protocol's explicitly defined extension tolerance with a blanket reject-unknown rule.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.
- OFF-DEFAULT GUARD: use only for the stated selection or review request; do not install as an always-on workflow.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Reject as general boundary rule. Keep this boundary unless an authorised decision explicitly changes
  it.

## Procedure
1. Read the register decision: permissive parsing is rejected as a general boundary policy.
2. Identify the authoritative input contract, supported extensions and actual compatibility requirement.
3. Distinguish valid extensibility from malformed, contradictory or ambiguous input.
4. Consider how accepting invalid input affects interoperability, security and future protocol evolution.
5. Prefer active specification and implementation maintenance over undocumented parser accommodation.
6. If an exception is necessary, describe exactly what is accepted, why, its owner and when it can be removed.
7. Test sender/receiver behaviour across relevant implementations and malformed cases.
8. Preserve specified unknown-field handling, such as ignoring defined extension members, when the protocol requires it.
9. Keep diagnostic data bounded and free of sensitive payloads.
10. Report the explicit boundary policy and unresolved ambiguity; this guard does not silently change a parser or the register.

## Verify and recover
- **Worked check (illustrative, not executed):** A Problem Details consumer rejects every extension member in the name of strict parsing.
- **Expected:** Preserve RFC 9457's extension handling; the register rejects undocumented tolerance, not valid extensibility.
- **If blocked:** No authoritative contract or evidence justifies the proposed compatibility exception. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
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
