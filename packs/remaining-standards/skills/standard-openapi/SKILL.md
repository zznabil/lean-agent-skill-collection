---
name: standard-openapi
description: "Describe and verify an HTTP API with OpenAPI."
---
# OpenAPI Specification

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
- Create or review an HTTP API description with the OpenAPI version that the project selected.
- Do not use OpenAPI as a substitute for an event contract. Do not assume that a schema proves endpoint behaviour.
- Limit work to the selected artifact or assessment. This routine gives no permission to run attacks, deploy, publish or change policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md). Identify the source, applicable edition or part, available originals, access limits and copying terms.
- Check the relevant source sections before making a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Existing conditional contract. Retain this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Pin the OpenAPI version. Pin the capabilities of the actual parser, validator and generator.
2. Inspect the existing paths, operations, servers, parameters, request bodies, responses and security requirements.
3. Describe the actual contract. Include required fields, media types, errors and compatibility obligations.
4. Use the selected schema dialect to distinguish absent values, null values and empty values.
5. Resolve references safely. Keep component identities stable. Do not automatically fetch or execute untrusted external content.
6. Keep request and response examples valid against their actual schemas and serialization rules.
7. Compare per-operation security with root security and intentional overrides. An empty override can change authentication expectations.
8. Compare the description with representative endpoint requests, responses and errors in the authorised environment.
9. Review consumer impact before changing required fields, types, status codes, parameter encoding or operation semantics.
10. Report syntax validation, contract tests and untested runtime behaviour as separate evidence.

## Verify and recover
- **Worked check (illustrative, not executed):** The document declares a required request field, but the endpoint accepts requests without it.
- **Expected:** Report description/runtime disagreement and resolve the intended contract before editing either side.
- **If blocked:** If the selected tooling does not support the document's declared OpenAPI version, stop the affected assessment or action. Record the missing prerequisite. Request it from the responsible owner. Continue only independent, authorised work.
- Keep facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths intact.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or meet the line budget. Record unresolved source or task conflicts.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the result for the selected scope, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck the affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
