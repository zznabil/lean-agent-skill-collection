---
name: standard-nist-ssdf
description: "Map a software change to applicable SSDF practices."
---
# NIST SP 800-218 SSDF

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If trusted root `AGENTS.md` loads, its policy governs this skill. Otherwise, you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active technical sentences. Lead with the main point and familiar words. Keep simple replies short.
- Use ISO 704-inspired stable concepts and terminology. Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits.
- Use Diátaxis organization when useful. Separate how-to, reference and explanation. Explain difficult mechanisms from simple foundations. Contrast noncompliant and compliant code or configuration when useful.
- Apply other domain standards only when the task requires them. These patterns do not transfer legal or organisational authority from other frameworks.

## Execution controls
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY. Preserve requirement force. Specify one actor, action and observable verification target.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps. Verify actual state before destructive or hazardous work.
- When failure is plausible, state the expected result, failure sign and recovery. For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful. Add contrast or TL;DR only when helpful.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable. Report observed results. Missing or stale evidence is not success.

## Task and boundary
- Apply NIST SSDF 1.1 to a specified software-development or acquisition risk.
- Do not treat the framework as a prescribed toolchain. Do not claim that a short review shows implementation of every practice.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) to identify the source, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot provide missing requirements or prove conformance.
- Historical adoption decision: Existing foundation. Retain this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify the software boundary, lifecycle activity, producer/acquirer role and security risks.
2. Use the four practice groups: Prepare the Organization, Protect the Software, Produce Well-Secured Software and Respond to Vulnerabilities.
3. Select applicable practices and tasks from the official document. Retain their identifiers in the evidence map.
4. Treat implementation examples as options. Do not treat them as universal mandatory technologies.
5. Record the roles, security criteria and supporting development environments relevant to the change.
6. Protect source and release artifacts from unauthorised access and tampering. Verify the integrity evidence that consumers actually use.
7. Review design, reused components, source and executable behaviour. Use checks that address the identified risks.
8. Use secure defaults. Preserve security-relevant assumptions across interfaces and deployment configuration.
9. For discovered vulnerabilities, record prioritisation, remediation, root-cause learning and a responsible owner.
10. Report evidence and gaps for each task. Do not claim that process documentation alone establishes secure software.

## Verify and recover
- **Worked check (illustrative, not executed):** A dependency scanner passes, so a team claims the complete SSDF is satisfied.
- **Expected:** Limit the evidence to the observed dependency check and assess other applicable practices separately.
- **If blocked:** The release artifact cannot be bound to its reviewed source or responsible producer. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
- Retain facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not remove requirements to improve a score or meet the line budget. Record any unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the result for the selected scope, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck the affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
