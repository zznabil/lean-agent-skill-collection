---
name: standard-openapi
description: "Describe and verify an HTTP API with OpenAPI."
---
# OpenAPI Specification

## Task and boundary
- Create or review an HTTP API description using the project-selected OpenAPI version.
- Do not substitute OpenAPI for an event contract or assume a schema proves endpoint behaviour.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: Existing conditional contract. Keep this boundary unless an authorised decision explicitly changes
  it.

## Procedure
1. Pin the OpenAPI version and the capabilities of the actual parser, validator and generator.
2. Inspect existing paths, operations, servers, parameters, request bodies, responses and security requirements.
3. Describe the real contract, including required fields, media types, errors and compatibility obligations.
4. Distinguish absent values, null values and empty values using the selected schema dialect.
5. Resolve references safely and retain stable component identities; do not fetch or execute untrusted external content
   automatically.
6. Keep request and response examples valid against their actual schemas and serialization rules.
7. Check per-operation security against root security and intentional overrides; an empty override can change authentication
   expectations.
8. Compare the description with representative endpoint requests, responses and errors in the authorised environment.
9. Review consumer impact before changing required fields, types, status codes, parameter encoding or operation semantics.
10. Report syntax validation, contract tests and untested runtime behaviour as separate evidence.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** The document declares a required request field, but the endpoint accepts requests without it.
- **Expected:** Report description/runtime disagreement and resolve the intended contract before editing either side.
- **Missing-evidence case:** The selected tooling does not support the document's declared OpenAPI version.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
