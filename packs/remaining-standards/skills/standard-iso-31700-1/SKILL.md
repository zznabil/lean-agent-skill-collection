---
name: standard-iso-31700-1
description: "Review consumer privacy across a product lifecycle."
---
# ISO 31700-1 privacy by design

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If trusted root policy loads, it governs this skill; skill-specific rules refine it. Without trusted root policy, you MUST apply this standalone kernel. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active technical sentences. State the main point first. Use familiar words. Keep simple replies short.
- Use ISO 704-inspired stable concepts and terminology. Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits.
- Use Diátaxis organization when helpful. Separate instructions, reference and explanation. Explain difficult mechanisms from simple foundations.
- For normative requirements, preserve force and use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. Identify one actor, action and observable verification target.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps. Verify actual state before destructive or hazardous work.
- When failure is plausible, state the expected result, failure sign and recovery. For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful. Add contrast or TL;DR only when helpful. Contrast noncompliant and compliant code or configuration when useful.
- Report observed results. Missing or stale evidence is not success. For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.
- These execution rules do not transfer legal or organisational authority from external frameworks. Use other domain standards only when the task requires them; they are not default communication drivers.

## Task and boundary
- Apply privacy-by-design considerations to a named consumer product or service change.
- Do not treat this routine as legal advice, a universal lawful basis or proof of compliance with privacy legislation.
- Work only on the selected artifact or assessment. This routine does not authorise attacks, deployment, publication or policy changes.

## Source and limits
- Read [SOURCES.md](SOURCES.md). Check source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot provide missing requirements or prove conformance.
- Historical adoption decision: Strongly absorb. Retain this boundary unless an authorised decision explicitly changes it.
- The full licensed text was not obtained. This Lean application routine uses public scope and existing Lean guidance. It is not a clause transcript.
- Obtain the authorised full text before a clause-level assessment. Do not invent definitions, thresholds or conformity results.

## Procedure
1. Identify the product, affected consumers, personal-data flows and processing purposes.
2. Collect applicable project privacy requirements. Obtain legal interpretation from the responsible authority where needed.
3. Review collection, use, access, transfer, retention and deletion across the product lifecycle.
4. Challenge data collection and defaults that the stated purpose does not require.
5. Check user information, meaningful choices, controls and recovery paths against the actual context.
6. Consider privacy consequences for people who do not operate the product directly.
7. Assign owners for privacy risks and decisions. Include supplier and downstream responsibilities.
8. Verify implemented controls and deletion/retention behaviour. Do not rely only on notices or design intentions.
9. Record residual risks, unresolved requirements and changes that require re-assessment.
10. Use the full licensed ISO 31700-1 requirements for a formal assessment. Do not invent missing clauses or legal obligations.

## Verify and recover
- **Worked check (illustrative, not executed):** A feature collects precise location indefinitely although its purpose requires only a country code.
- **Expected:** Question unnecessary collection and retention. Then verify the approved minimisation design.
- **If blocked:** If processing purpose, retention authority or legal/privacy decision ownership is unclear, stop the affected assessment or action. Record the missing prerequisite. Request it from the responsible owner. Continue only independent, authorised work.
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or meet the line budget. Record unresolved source or task conflicts.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
