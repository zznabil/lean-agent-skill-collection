---
name: practice-fair
description: "Make research data reusable without forcing it open."
---
# FAIR principles

## Task and boundary
- Review data and metadata against the FAIR principles for a specified research or reuse context.
- Do not equate FAIR with unrestricted public access, a particular repository or a universal certification score.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
- Historical adoption decision: Absorb selectively. Keep this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Findable: use persistent identifiers and sufficiently rich metadata, with metadata explicitly identifying the described data.
2. Ensure data or metadata can be located through an appropriate searchable resource.
3. Accessible: describe a standard retrieval protocol, including authentication or authorization where necessary.
4. Preserve accessible metadata when the underlying data cannot remain available.
5. Interoperable: use shared, formal representations and applicable community vocabularies.
6. Use qualified references to related data and metadata rather than ambiguous undocumented links.
7. Reusable: state clear usage terms, detailed provenance and the relevant community standards.
8. Keep privacy, consent, contractual restrictions and legitimate access controls intact.
9. Test the intended user's discovery, access and interpretation journey; record barriers and missing evidence.
10. Report which principles are supported and which remain unresolved; do not claim that open access alone makes data FAIR.

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** A restricted health dataset exposes rich metadata and a documented controlled-access process.
- **Expected:** Assess its FAIR properties without requiring removal of legitimate privacy restrictions.
- **Missing-evidence case:** A persistent identifier resolves but the associated data and provenance are not described.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
