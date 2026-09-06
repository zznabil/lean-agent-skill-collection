# V8.7 direct-claims review

## Decision

Absorb anti-litotes and anti-evasive-hedging behaviour into the existing delivery overlay. Reject a blanket ban on negation, uncertainty, passive constructions, literary understatement, or words such as may and could. Add no routed skill or runtime.

The user's screenshot supplies examples and motivation. Its term *litotes-adjacent hedging* is treated here as an informal descriptive label, not a recognised engineering standard or an AI-authorship detector. Litotes can serve legitimate rhetorical purposes. The operational defect is obscuring what happened, what the evidence supports, who acted, or what must happen next.

## Scope and ownership

AGENTS.md and wait-what own the global rule. All six profiles contain both. The 22 specialist fallbacks and 23 adapter prompts preserve the same rule when a host loads a specialist directly. ENGINEERING-CORE and the get-it-done, gauntlet-loop, and handoff procedures apply it to internal status and handover. Review checks for concealed material conclusions rather than mechanically counting negative words.

A discovered skill is not necessarily loaded. A loaded policy is not necessarily followed. This release establishes package and source coverage, not activation frequency or live adherence in OMP, Codex, Hermes, or ChatGPT.

## Primary sources checked on 6 September 2026

| Source | Support | Boundary |
|---|---|---|
| [BYU Silva Rhetoricae: litotes](https://rhetoric.byu.edu/Figures/L/litotes.htm) | Rhetorical understatement, often through denying an opposite | Definition, not evidence that every instance is defective |
| [W3C COGA: Avoid Double Negatives](https://www.w3.org/WAI/WCAG2/supplemental/patterns/o3p03-double-negatives/) | Simple sentence structures and avoiding unnecessary negated positives | Supplemental guidance, not an additional WCAG conformance criterion |
| [W3C COGA: Use Literal Language](https://www.w3.org/WAI/WCAG2/supplemental/patterns/o3p04-literal-language/) | Literal wording where users need clear meaning | Does not authorise changing quotations or precise findings |
| [OpenAI GPT-5.6 model guidance](https://developers.openai.com/api/docs/guides/latest-model?model=gpt-5.6) | Concrete response-style instructions, direct conclusions, and preservation of material caveats | No explicit litotes prohibition was found in the retrieved page |
| [OpenAI Model Spec, 18 December 2025](https://model-spec.openai.com/2025-12-18.html) | Forthright reporting of actions, capabilities, and confidence; calibrated uncertainty | Referenced snapshot, not a claim about every deployed model |
| [User-supplied Astra guide URL](https://developers.openai.com/api/docs/guides/latest-model?model=gpt-6-astra) | Retrieval failed | No Astra-specific instruction is attributed to this inaccessible view |

The policy is an independent Lean synthesis, not a quoted OpenAI mandate or formal standards adoption. Earlier Lean work already established plain language, cognitive accessibility, evidence scope, and separate test statuses. This release makes one failure mode explicit instead of adding another style framework.

## Semantic safety

Directness must preserve certainty, scope, degree, and logical meaning. Not proven safe does not imply unsafe; not useless does not imply good; a non-significant result does not prove no difference. A known crash may have an unknown cause. Report both facts separately. Name an actor only when supported by evidence; own the agent's actual error rather than assigning generic blame.

For actual agent mistakes, report the mistaken action or claim, known impact, correction and fresh verification, or the next safe step. Drop irrelevant fields. Do not replace a fix with repeated apologies, promise unavailable work, or exceed permission in the name of accountability. The user-facing wording preference does not silently rewrite code, logs, legal text, scientific conclusions, quotations, translations, or requested creative voice.

## Premortem and safeguards

- Overconfidence: retain evidential qualifiers and missing-evidence states.
- Meaning drift: compare logical strength and degree, not just sentence length.
- False blame: distinguish observed actor from unknown cause.
- Host conflict: preserve valid presentation preferences while keeping material truth.
- Over-processing: use the rule during drafting; no automatic extra reviewer or prose blacklist.
- False evaluation claim: distinguish authored fixtures, structural guard tests, and live behaviour.

## Evaluation and limits

The [32 scenario fixtures](evals/direct-claims-scenarios-v8.7.0.csv) contain observations, expected responses, counterexamples, and reasons. There are eight examples each for direct reporting, uncertainty, ownership, and protected meaning. They are authored hypothetical cases, not recorded model outputs and not a measured pass rate.

Source and ZIP guards check that the directness, uncertainty, semantic-preservation, ownership, and permission clauses survived packaging. The validator tests a positive control plus fourteen deliberately damaged policy/metadata controls. These tests establish guard sensitivity to those mutations; they do not prove semantic interpretation or detect all contradictory instructions.

A future live comparison should hold task, tools, model, and evidence constant across V8.6 and V8.7. Score supported conclusions, preserved qualifiers, correct status and actor, useful recovery, unnecessary wording, and task outcome. Reject reductions in wording that increase false certainty or conceal failure. No token-saving, reliability, satisfaction, or activation-rate improvement is claimed without that measurement.
