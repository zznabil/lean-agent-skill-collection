---
name: profile-action-step-structure
description: "Order prerequisites and action-bearing procedure steps."
---
# Action-step structure profile

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim activation without evidence.
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
Use this profile once the technical content is known. Put prerequisites first and an action in every numbered step. Do not hide required actions behind ambiguous modal wording.

## Steps
1. State access, role, tools, starting state and other prerequisites before the numbered procedure.
2. Put warnings and irreversible consequences before the step that commits the actor.
3. Give each numbered step one action or a tightly coupled group of actions. When applicable, order its parts as optional status, reason or expected result, location, then action.
4. Use MUST or a direct imperative when the adopted contract requires the action. Use MAY or `Optionally` only for a genuine choice.
5. State the observable result after a consequential action. Put the failure sign and recovery beside that step.
6. Put background-only text outside numbered steps. Run the procedure from its stated prerequisites.

## Worked distinction
**Weak step:** You may need to configure branch protection.

**Required action:** To prevent direct changes, in **Settings → Branches**, select **Add branch protection rule**.

**Optional action:** Optionally, to require signed commits, under **Rules**, select **Require signed commits**.

These forms state optionality, purpose, location and action explicitly.

## Verify and recover
Check that each step advances the task and all required actions remain. Hold publication if a prerequisite or requirement strength is unresolved. Resolve it against the governing contract, then rerun the procedure. Return steps, expected results and recovery paths.

See source details and access limits in [SOURCES.md](SOURCES.md).
