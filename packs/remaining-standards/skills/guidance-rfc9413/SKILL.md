---
name: guidance-rfc9413
description: "Maintain protocol clarity instead of hidden tolerance."
---
# RFC 9413 protocol robustness

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
- Review a parser or protocol change where tolerance, ambiguity or interoperability affects maintenance.
- Do not interpret this guidance as a universal instruction to reject every extension field.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Absorb. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify the actual protocol specification, extension points, implementations and interoperability evidence.
2. Distinguish permitted extensibility from undocumented acceptance of malformed or ambiguous inputs.
3. Find tolerance that hides sender defects, creates divergent interpretations or makes future changes harder.
4. Prefer correcting the specification or sender when that resolves the problem rather than accumulating invisible parser
   exceptions.
5. Define explicit handling for malformed, unknown and future-version input using the actual protocol rules.
6. Preserve required unknown-field tolerance where the protocol defines it; generic strictness must not override the contract.
7. Where compatibility requires a temporary exception, document the exact case, reason, owner and retirement condition.
8. Test independent implementations and relevant negative cases; happy-path parsing alone does not prove interoperability.
9. Collect only necessary diagnostic evidence and avoid logging sensitive input.
10. Report the long-term maintenance trade-off and remaining ambiguity. RFC 9413 is IAB guidance, not an Internet Standards Track
    protocol.

## Verify and recover
- **Worked check (illustrative, not executed):** A parser silently accepts two contradictory spellings of a field without a documented compatibility need.
- **Expected:** Identify the ambiguity and define explicit compatibility or rejection behaviour from the maintained contract.
- **If blocked:** The protocol owner or normative rule for unknown fields is unavailable. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
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
