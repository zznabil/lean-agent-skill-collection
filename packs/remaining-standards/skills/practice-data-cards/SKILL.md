---
name: practice-data-cards
description: "Document dataset decisions throughout its lifecycle."
---
# Data Cards

## Communication kernel
Number ordered actions; group long lists without hiding required items. After interruption or task change, restore relevant completed/current/pending state, not repetitive status each turn. Preserve language, exact tokens, formats, permissions and evidence. Never invent estimates or diagnose readers. Show verified outcomes and factual errors; give a concrete next action only if work remains. - If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
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
- Create or review a Data Card for a specified dataset and its intended applications.
- Do not fill template gaps with invented provenance, stakeholder consultation or collection decisions.
- Limit work to the selected artefact or assessment. This routine gives no permission to run attacks, deploy, publish or change policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md). Identify the source, applicable edition or part, available originals, access limits and copying terms.
- Before making a source-specific finding, check the relevant source sections. This routine cannot replace missing requirements or prove conformance.
- Historical adoption decision: Adopt template. Retain this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Identify the dataset, version, accountable parties, intended applications and prohibited or unsuitable uses.
2. Describe the data's origins and the decisions that shaped collection and inclusion.
3. Record composition, features, labels, sampling and missingness. Include relevant population or subgroup information.
4. Explain preprocessing, annotation and transformations. Explain their assumptions or known effects.
5. State evidence-supported constraints on access, licensing, privacy, retention and distribution.
6. Record known quality issues, evaluation limits and gaps that downstream users must understand.
7. Show decisions and trade-offs in the Data Card. Do not merely repeat a schema.
8. Link evidence and responsible owners. Protect restricted information.
9. Where the task requires review, review the card with relevant contributors or users. Distinguish planned review from completed review.
10. Version the card with the dataset. Record responsibilities for updates and maintenance.

## Verify and recover
- **Worked check (illustrative, not executed):** A dataset description lists columns but omits that one population was excluded during collection.
- **Expected:** Document the exclusion and its implications for intended use; a column list is not a sufficient Data Card.
- **If blocked:** If collection or transformation decisions have no reliable record, stop the affected assessment or action. Record the missing prerequisite and request it from the responsible owner. Continue only independent, authorised work.
- Keep planned work, observed evidence and unknown results separate. Missing or stale evidence is not a pass.
- Do not remove requirements for a score or line budget. Record unresolved source or task conflicts.
- Use the smallest check that detects the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Make one correction pass and recheck affected evidence. If a required issue remains, report it; do not loop or claim completion.
- Return the scoped result, source edition, evidence, limits, unresolved requirements and next permitted action. Do not claim formal conformance or model-behaviour improvement from this routine.
