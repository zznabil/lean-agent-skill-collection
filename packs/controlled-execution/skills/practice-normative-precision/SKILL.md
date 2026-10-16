---
name: practice-normative-precision
description: "Classify and write precise normative statements."
---
# Normative precision

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
- When writing normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. Preserve force. Give each requirement one actor, action and observable verification target.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps. Before destructive or hazardous work, verify the actual state.
- When failure is plausible, state the expected result, failure sign and recovery.
- When explaining difficult mechanisms, start from simple foundations. When useful, contrast noncompliant and compliant code or configuration.
- For critical procedures, keep prerequisites, warnings, verified holds, actions, expected results and recovery; add headings only when useful.
- Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits. Report observed results. Missing or stale evidence does not establish success.
- These execution rules do not transfer legal or organisational authority from communication or control patterns.
- Give progress only when requested or useful. Keep progress distinct from the verdict.

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
