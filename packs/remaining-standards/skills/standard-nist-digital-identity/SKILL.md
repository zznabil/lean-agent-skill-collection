---
name: standard-nist-digital-identity
description: "Select and verify identity assurance by actual risk."
---
# NIST SP 800-63-4 Digital Identity Guidelines

## Communication kernel
If trusted root `AGENTS.md` loads, follow it; otherwise apply this standalone fallback. Do not claim root activation without evidence.
- **Brevity:** Use the fewest words that complete the task. Start with the answer, result or blocker. Remove filler, repeated conclusions, routine narration and decorative headings. Do not add a **Summary** heading or closing **TL;DR**. Use a leading **TL;DR** only when it improves a complex answer.
- **Language:** Use ASD-STE100-inspired short, active sentences and concrete verbs.
- **Terms:** Use ISO 704-inspired consistent terms: one preferred term per distinct concept. Define unfamiliar terms when needed; preserve exact technical and UI strings.
- **Structure:** Use Diátaxis to separate how-to, reference, explanation and tutorial content only when this helps navigation.
- **Integrity:** Preserve facts, actors, conditions, negation, exceptions, permissions, requirements, source rights, uncertainty, evidence, accessibility and the requested voice or format. Do not omit required details just to shorten text.
- **Safety and proof:** Use BCP 14 force only for normative rules. Keep warning-before-hazard, verified safe state, hold points, expected results, failure signs and recovery when relevant. Report actual test outcomes; do not invent a pass.
These are writing guides, not proof of standards conformance or host behaviour. Task-specific source rules still apply.
## Task and boundary
- Use the selected NIST SP 800-63-4 assurance requirements to review a digital-identity flow.
- Do not infer identity proofing, authentication or federation assurance from each other or from an MFA checkbox.
- Work only on the selected artifact or assessment. This routine does not permit attacks, deployment, publication or policy changes.

## Source and limits
- Read [SOURCES.md](SOURCES.md). Identify the source, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot provide missing requirements or prove conformance.
- Historical adoption decision: Project-local benchmark. Retain this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify the service, population, impacts of identity failures and project adoption of the guidance.
2. Perform the documented risk assessment. Select IAL, AAL and FAL through separate decisions where applicable.
3. Use 800-63A-4 for proofing/enrolment, 800-63B-4 for authentication/authenticator management, and 800-63C-4 for federation/assertions.
4. Map each selected requirement to implementation and test evidence. Do not select numeric thresholds from memory.
5. Review enrolment, binding, authentication, recovery, revocation, session handling and lifecycle transitions that apply to the flow.
6. Check phishing resistance, replay protection and verifier behaviour against the selected authenticator and assurance requirements.
7. Assess federation audience, issuer, assertion validation and trust relationships under the selected federation model.
8. Retain privacy, usability and equity considerations. Do not silently weaken assurance requirements.
9. Test actual error, recovery and compromised-credential paths within approved accounts and environments.
10. Report selected levels, rationale, actual evidence and unverified requirements. Product marketing is not assurance evidence.

## Verify and recover
- **Worked check (illustrative, not executed):** An application uses MFA but has no evidence for its claimed identity-proofing level.
- **Expected:** Assess IAL separately. The MFA mechanism does not establish who was enrolled.
- **If blocked:** If required proofing records, authenticator configuration or federation trust evidence is unavailable, stop the affected assessment or action. Record the missing prerequisite and request it from the responsible owner. Continue only independent, authorised work.
- Keep facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths intact.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not remove requirements to improve a score or meet the line budget. Record any unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the result for the selected scope, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
