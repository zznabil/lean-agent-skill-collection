---
name: practice-fair
description: "Make research data reusable without forcing it open."
---
# FAIR principles

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If trusted root `AGENTS.md` loads, its policy governs this skill. Otherwise you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active technical sentences. Lead with the main point and familiar words. Use ISO 704-inspired stable concepts and terminology. Use Diátaxis to separate how-to, reference and explanation when useful. Keep simple replies short.
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. State one actor, action and observable verification target.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps. Before destructive or hazardous work, verify actual state. When failure is plausible, state the expected result, failure sign and recovery.
- When explaining difficult mechanisms, start with simple foundations. When useful, contrast noncompliant and compliant code or configuration.
- For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful. Add contrast or TL;DR only when helpful.
- Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits. Report observed results. Missing or stale evidence is not success.
- These communication and control rules do not transfer legal or organisational authority from ANSI, WHO, OSHA, FDA or NASA. Use other domain standards only when the task requires them; they are not default communication drivers.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.

## Task and boundary
- Review data and metadata against the FAIR principles for a specified research or reuse context.
- Do not equate FAIR with unrestricted public access, a particular repository or a universal certification score.
- Work only on the selected artifact or assessment. This routine does not permit attacks, deployment, publication or policy changes.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot provide missing requirements or prove conformance.
- Historical adoption decision: Absorb selectively. Retain this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Findable: use persistent identifiers and sufficiently rich metadata. Make the metadata explicitly identify the data it describes.
2. Ensure users can locate data or metadata through an appropriate searchable resource.
3. Accessible: describe a standard retrieval protocol. Include authentication or authorization where necessary.
4. Keep metadata accessible when the underlying data cannot remain available.
5. Interoperable: use shared, formal representations and applicable community vocabularies.
6. Use qualified references to related data and metadata. Do not use ambiguous undocumented links instead.
7. Reusable: state clear usage terms, detailed provenance and relevant community standards.
8. Preserve privacy, consent, contractual restrictions and legitimate access controls.
9. Test the intended user's discovery, access and interpretation journey. Record barriers and missing evidence.
10. Report the supported principles and the unresolved principles. Do not claim that open access alone makes data FAIR.

## Verify and recover
- **Worked check (illustrative, not executed):** A restricted health dataset exposes rich metadata and a documented controlled-access process.
- **Expected:** Assess its FAIR properties without requiring removal of legitimate privacy restrictions.
- **If blocked:** A persistent identifier resolves but the associated data and provenance are not described. Stop the affected assessment or action. Record the missing prerequisite. Request it from the responsible owner. Continue only independent, authorised work.
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or meet the line budget. Record any unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
