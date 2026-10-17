---
name: standard-owasp-asvs
description: "Verify selected application controls with ASVS 5.0."
---
# OWASP ASVS

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active sentences, direct verbs and familiar, concrete words. Use ISO 704-inspired stable terms for distinct concepts.
- Use Diátaxis to separate tutorial, how-to, reference and explanation when useful. Do not force sections into short replies.
- Lead with the answer, result or next action. Omit routine Summary headings. Use TL;DR only when helpful for complex material, first, without a closing recap. Preserve requested detail and format.
- Preserve actors, facts, negation, conditions, exceptions, permissions, requirement force, safety, source scope and evidence limits.
- These drivers do not establish formal conformance or transfer legal or organisational authority. Apply other domain standards only when the task requires them.

## Execution controls
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. Specify one actor, action and observable verification target.
- For critical or risky work, place warnings before hazards and hold points before critical or irreversible steps. Verify actual state before destructive or hazardous work.
- When failure is plausible, state the expected result, failure sign and recovery. Keep prerequisites and ordered steps clear; use WARNING and PAUSE/VERIFY labels when useful.
- Explain difficult mechanisms from simple foundations. Contrast noncompliant and compliant code or configuration when useful.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable. Report observed results, not assumed success.

## Task and boundary
- Design or verify application security against an explicitly selected ASVS 5.0.0 scope and level.
- Do not impose one verification level on all projects. Do not equate ASVS with an automated scanner score.
- Work only on the selected artefact or assessment. This routine grants no permission to run attacks, deploy, publish or change policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot provide missing requirements or prove conformance.
- Historical adoption decision: Existing conditional benchmark. Retain this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify application boundaries, threat assumptions, sensitive data, users and the selected verification level.
2. Use official 5.0.0 requirements and version-qualified identifiers for the assessment.
3. Map requirements to evidence for the selected level and applicable application functions.
4. Use actual architecture to justify not-applicable requirements. Missing evidence does not make a requirement inapplicable.
5. Inspect security decisions, implementation and configuration. Then test required controls at the real trust boundary.
6. Test authorisation separately from authentication. Include object and tenant boundaries where applicable.
7. Examine input handling, output encoding, sessions, cryptography, communications and data protection as the selected requirements demand.
8. Run only authorised, bounded negative tests. Never target systems outside the approved scope.
9. Record exact revisions, test context, findings and rechecks after remediation.
10. Report verified, failed, unrun and inapplicable requirements separately. Do not claim an OWASP-issued certification or complete assurance from partial checks.

## Verify and recover
- **Worked check (illustrative, not executed):** A UI hides another tenant's record, but its API returns the record to an unauthorised caller.
- **Expected:** Record the server-side authorisation failure. The hidden UI control does not provide adequate evidence.
- **If blocked:** If required authenticated test roles or the intended verification scope are missing, stop the affected assessment or action. Record the missing prerequisite and request it from the responsible owner. Continue only independent, authorised work.
- Keep planned work, observed evidence and unknown results separate. Missing or stale evidence is not a pass.
- Do not remove requirements for a score or line budget. Record unresolved source or task conflicts.
- Use the smallest check that detects the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Make one correction pass and recheck affected evidence. If a required issue remains, report it; do not loop or claim completion.
- Return the scoped result, source edition, evidence, limits, unresolved requirements and next permitted action. Do not claim formal conformance or model-behaviour improvement from this routine.
