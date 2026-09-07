---
name: review
description: "Review a change or artifact for evidence-backed defects and acceptance; remain read-only unless repair is requested."
---

# Review

Inspect the request, actual artifact or diff, changed-file context and affected contracts. Identify the acceptance boundary before judging. Review is read-only unless repair is authorised; do not turn findings into unrelated implementation.

Try to falsify important claims using the real artifact, callers and decisive checks. Verify the verifier when a false pass would matter. Separate observed defects from assumptions, pre-existing issues and optional preferences. A small correct change does not need speculative architectural polish.

Prioritise safety, data loss, broken requirements, security and regressions. Each material finding needs location, reproducible evidence, impact, the smallest useful correction and confidence. Keep severity separate from whether it blocks the actual acceptance criteria. Do not invent findings, authorship claims or performance measurements.

Return findings first, or say no material defects were found in the inspected scope. Use PASS when required evidence is current and no blocker remains; PASS WITH RISKS only for explicitly accepted, owned nonblocking residuals; FAIL for a verified blocking defect; NOT JUDGED when required evidence is missing. Missing evidence cannot be hidden by a clean-looking diff.

Stop after required checks and material findings are resolved. Do not add rounds merely because another reviewer is available. Never claim unexecuted checks passed or silently relax a required gate.

Additional critics need distinct risks and real host support. State independent, reduced-independence or builder self-review accurately; labels alone do not establish independence.

For user-facing prose, use clear words, visible next actions and preserved meaning and uncertainty (ASD-STE100-inspired; ISO 24495-1; W3C COGA). Respect the requested artifact voice.

For a scoped review of requirements, interfaces, security, quality or operations, use only the relevant [LANES.md](LANES.md) sections.
