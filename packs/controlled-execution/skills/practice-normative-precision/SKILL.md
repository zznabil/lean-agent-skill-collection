---
name: practice-normative-precision
description: "Classify and write precise normative statements."
---
# Normative precision

## Communication kernel
Number ordered actions; group long lists without hiding required items. After interruption or task change, restore relevant completed/current/pending state, not repetitive status each turn. Preserve language, exact tokens, formats, permissions and evidence. Never invent estimates or diagnose readers. Show verified outcomes and factual errors; give a concrete next action only if work remains. - If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim activation without evidence.
- Use ASD-STE100-inspired short, active sentences and concrete words. Lead with the answer or action. Keep simple replies short.
- Use ISO 704-inspired stable terms. Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits.
- Use Diátaxis to separate information types when useful, not to force headings. Do not require an opening Summary or closing recap. Optional TL;DR belongs first.
- For normative requirements, use BCP 14 (RFC 2119/8174) MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. Name one actor, action and observable verification target.
- For risky work, place warnings before hazards and hold points before critical or irreversible steps. Verify actual state before destructive or hazardous work.
- When failure is plausible, give the expected result, failure sign and recovery. Explain difficult mechanisms from simple foundations; contrast code or configuration when useful.
- For critical procedures, include needed prerequisites, warnings, steps, verification, results and recovery without a fixed section template.
- Report observed results; missing or stale evidence is not success. Where applicable, show measurable multi-step progress with a truthful named 20-cell ASCII format.
- These practices imply neither formal conformance nor legal or organisational authority. Apply other domain standards only when the task requires them.

## Purpose and boundary
Use this routine to draft or review requirements, recommendations, permissions, capabilities and external constraints. Make force traceable and criteria observable. Use Lean's BCP 14 words: MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. Do not equate source “shall” with house-style MUST. This is not an ISO/IEC conformity assessment.

## Steps
1. Read the governing source. Classify each statement as a requirement, recommendation, permission, possibility/capability or external constraint. Mark unclear authority as unresolved. Do not assign stronger force.
2. Identify the actor, trigger, action, object, scope, expected result and any authorised exception.
3. Put one independently testable obligation or prohibition in each requirement.
4. Specify objective criteria for each requirement. Provide evidence that a named verifier can inspect.
5. Put explanation in rationale, notes or examples. Move any hidden obligation in that material into its own requirement.
6. Preserve the original strength. A wording edit MUST NOT upgrade, weaken or invent authority.
7. Check that a permission is not a capability. Check that an external constraint is not presented as an authored rule.

## Required record
Record each statement's type and authority for its strength. For requirements, record the observable completion condition. Record unresolved ambiguity; do not guess.

## Worked distinction
**Hidden requirement:** “NOTE: Run the tests before continuing.”

**Controlled form:**
- `REQ-1`: The worker MUST run the specified tests before continuing.
- `RATIONALE`: The tests detect regressions caused by the edit.

The rationale explains the requirement. It adds no obligation.

## Verify and recover
Compare old and new obligations, permissions, prohibitions and exceptions in both directions. Restore any changed force or exception. Hold publication until actor, authority and verification criteria are resolved. Return revised statements with conflicts marked.

See [SOURCES.md](SOURCES.md) for source details and access limits.
