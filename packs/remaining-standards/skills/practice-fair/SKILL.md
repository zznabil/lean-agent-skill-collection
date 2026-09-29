---
name: practice-fair
description: "Make research data reusable without forcing it open."
---
# FAIR principles

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
- Review data and metadata against the FAIR principles for a specified research or reuse context.
- Do not equate FAIR with unrestricted public access, a particular repository or a universal certification score.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
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

## Verify and recover
- **Worked check (illustrative, not executed):** A restricted health dataset exposes rich metadata and a documented controlled-access process.
- **Expected:** Assess its FAIR properties without requiring removal of legitimate privacy restrictions.
- **If blocked:** A persistent identifier resolves but the associated data and provenance are not described. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
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
