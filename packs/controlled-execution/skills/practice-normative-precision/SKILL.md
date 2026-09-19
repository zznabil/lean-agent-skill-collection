---
name: practice-normative-precision
description: "Classify and write precise normative statements."
---
# Normative precision

## Use and boundary
- Use when drafting or reviewing requirements, recommendations, permissions, capabilities or external constraints.
- Use Lean's adopted BCP 14 words for output: MUST, MUST NOT, SHOULD, SHOULD NOT and MAY.
- Do not mix `shall` and `MUST` as if they were interchangeable house style.
- This routine is an independently worded application pattern, not an ISO/IEC conformity assessment.

## Procedure
1. Identify the statement's type: requirement, recommendation, permission, possibility/capability or external constraint.
2. Name the actor, trigger, action, object, scope, expected result and any exception.
3. Put one independently testable obligation or prohibition in each requirement statement.
4. Use objective criteria that a named verifier can inspect.
5. Put informative explanation in rationale, notes or examples.
6. Promote any hidden obligation from a note, example or rationale into its own requirement.
7. Preserve the original obligation strength. A wording edit MUST NOT upgrade, weaken or invent authority.
8. Check that permission is not confused with capability and that an external constraint is not presented as an authored rule.

## Required record
- Record the statement type and the source or authority for its strength.
- For each requirement, record its observable completion condition.
- Record unresolved ambiguity instead of selecting a stronger meaning without authority.

## Worked distinction
**Hidden requirement:** “NOTE: Run the tests before continuing.”

**Controlled form:**
- `REQ-1`: The worker MUST run the specified tests before continuing.
- `RATIONALE`: The tests detect regressions caused by the edit.

The rationale explains the rule. It does not contain another requirement.

## Finish and stop
- Compare the old and new obligation, permission, prohibition and exception sets in both directions.
- Stop if the actor, authority or verification criterion is unresolved.
- Return the revised statements and any unresolved source conflict.

Source details and access limits: [SOURCES.md](SOURCES.md).
