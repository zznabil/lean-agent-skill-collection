---
name: practice-normative-precision
description: "Classify and write precise normative statements."
---
# Normative precision

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If trusted root `AGENTS.md` is loaded, its policy governs this skill. Otherwise, you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active, direct technical sentences. Lead with the main point and use familiar words.
- Use ISO 704-inspired stable concepts and terminology. Use the same term for the same concept.
- Use Diátaxis organization to separate how-to, reference and explanation when useful. Keep simple replies short.
- These three drivers guide communication; they do not claim formal standards conformance. Use other domain standards only when the task requires them.

## Conditional execution rules
- When writing normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. Preserve force. Give each requirement one actor, action and observable verification target.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps. Before destructive or hazardous work, verify the actual state.
- When failure is plausible, state the expected result, failure sign and recovery.
- When explaining difficult mechanisms, start from simple foundations. When useful, contrast noncompliant and compliant code or configuration.
- For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful. Add contrast or TL;DR only when helpful.
- Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits. Report observed results. Missing or stale evidence does not establish success.
- These execution rules do not transfer legal or organisational authority from communication or control patterns.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.

## Purpose and boundary
Use this routine when drafting or reviewing requirements, recommendations, permissions, capabilities or external constraints. Produce statements with traceable force and observable criteria. Use Lean's BCP 14 output words: MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. Do not equate source “shall” with house-style MUST. This routine is not an ISO/IEC conformity assessment.

## Steps
1. Read the governing source. Classify each statement as a requirement, recommendation, permission, possibility/capability or external constraint. Mark unclear authority as unresolved. Do not assign stronger force.
2. Identify the actor, trigger, action, object, scope, expected result and any authorised exception.
3. Put one independently testable obligation or prohibition in each requirement.
4. Specify objective criteria for each requirement. Provide evidence that a named verifier can inspect.
5. Put explanation in rationale, notes or examples. Move any hidden obligation in that material into its own requirement.
6. Preserve the original strength. A wording edit MUST NOT upgrade, weaken or invent authority.
7. Check that a permission is not a capability. Check that an external constraint is not presented as an authored rule.

## Required record
Record each statement's type and the source or authority for its strength. Record each requirement's observable completion condition. Record unresolved ambiguity. Do not guess.

## Worked distinction
**Hidden requirement:** “NOTE: Run the tests before continuing.”

**Controlled form:**
- `REQ-1`: The worker MUST run the specified tests before continuing.
- `RATIONALE`: The tests detect regressions caused by the edit.

The rationale explains the requirement. It adds no obligation.

## Verify and recover
Compare the old and new obligations, permissions, prohibitions and exceptions in both directions. Restore the original meaning if force or an exception changed. Hold publication if the actor, authority or verification criterion remains unresolved. Return the revised statements and mark the conflict.

See [SOURCES.md](SOURCES.md) for source details and access limits.
