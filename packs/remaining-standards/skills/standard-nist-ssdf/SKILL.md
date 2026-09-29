---
name: standard-nist-ssdf
description: "Map a software change to applicable SSDF practices."
---
# NIST SP 800-218 SSDF

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
- Apply NIST SSDF 1.1 to a specified software-development or acquisition risk.
- Do not treat the framework as a prescribed toolchain or claim every practice was implemented from a short review.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Existing foundation. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify the software boundary, lifecycle activity, producer/acquirer role and security risks.
2. Use the four practice groups: Prepare the Organization, Protect the Software, Produce Well-Secured Software and Respond to
   Vulnerabilities.
3. Select the applicable practices and tasks from the official document and retain their identifiers in the evidence map.
4. Treat implementation examples as options, not universal mandatory technologies.
5. Record roles, security criteria and supporting development environments relevant to the change.
6. Protect source and release artifacts from unauthorised access and tampering; verify the integrity evidence actually used by
   consumers.
7. Review design, reused components, source and executable behaviour using checks that address the identified risks.
8. Use secure defaults and preserve security-relevant assumptions across interfaces and deployment configuration.
9. For discovered vulnerabilities, record prioritisation, remediation, root-cause learning and a responsible owner.
10. Report task-by-task evidence and gaps without claiming that process documentation alone establishes secure software.

## Verify and recover
- **Worked check (illustrative, not executed):** A dependency scanner passes, so a team claims the complete SSDF is satisfied.
- **Expected:** Limit the evidence to the observed dependency check and assess other applicable practices separately.
- **If blocked:** The release artifact cannot be bound to its reviewed source or responsible producer. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
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
