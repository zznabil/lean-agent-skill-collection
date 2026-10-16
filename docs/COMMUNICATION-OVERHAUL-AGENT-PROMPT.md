# Agent mission: complete communication-kernel overhaul

Repository: https://github.com/zznabil/lean-agent-skill-collection
Working branch: refactor/compact-communication-kernel-20261016
PR: the draft PR containing this file
Authority: implement and revise this PR, run tests, push corrections. Do not merge, tag, publish, or deploy.

## Objective

Overhaul all active agent-facing and user-facing prose so the shortest **complete and correct** response is the normal result. This is a substantive rewrite of the entire authored instruction corpus, not a new style heading pasted into each file.

Three always-on communication drivers:

1. **ASD-STE100-inspired language:** Use direct, short, active sentences, clear verbs, and concrete words. Prefer one main action per sentence. Retain exact domain and machine-sensitive terminology.
2. **ISO 704-inspired terminology:** Use one preferred term per concept in its scope. Distinguish different concepts. Define an unfamiliar term only when comprehension requires it.
3. **Diátaxis organisation:** Separate tutorial, how-to, reference, and explanation by user need when that separation helps. Do not force categories or section headings into short answers.

**Concision is a primary quality objective, not an afterthought.** Prefer fewer words, sentences, sections, lists, examples, headings and repeated qualifications. Every extra unit of text must earn its place. For equal correctness and utility, shorter wins. Do not optimise mere brevity by hiding necessary conditions, evidence, exceptions or the action the user needs.

### New default response policy

- Do **not** begin routine responses with "Summary".
- Do **not** require any "Summary" section in substantial responses or procedures.
- Lead with the answer, result, action or decision.
- Include **TL;DR** only if it materially lowers reading effort for a long, dense or multi-part response. When included, place it **at the beginning**, not at the end.
- Do not append a closing TL;DR or repeat the same conclusion at both ends.
- For a simple question, acknowledgement or direct artefact, omit TL;DR and unnecessary headings.
- Give as much detail as required by the user's actual task, audience, risk and explicit length request, and no more.
- Match the requested voice and format in copy-ready artefacts. Do not inject unsolicited Summary, TL;DR, standards names or meta-commentary into emails, UI strings, code, quoted text, legal wording or data.
- Use British spelling in project-authored prose unless a source, API, quoted string or requested locale requires otherwise.
- Never turn uncertainty into certainty, absence of evidence into proof, "not proven safe" into "unsafe", or failed / blocked / not run into passed.
- Do not remove prerequisites, stop conditions, permissions, warnings, security, accessibility, required compatibility, data integrity, requirement strength, source rights, needed recovery or real verification.
- Apply BCP 14, NASA-inspired atomic requirements, safety hold points and specialist accessibility/teaching procedures only when applicable. They are not additional always-on writing frameworks.
- Do not assert formal ASD-STE100, ISO 704, Diátaxis or other standards conformance from inspired prose alone.

## Verify the live baseline first

Fetch current main, active branches and PRs, release version, source integrity controls, and complete package inventories before editing. The last observed main was 3aa04c9c2820af263ce28fa61e2fe39a6a437f62 with release metadata v8.19.1; these facts may have changed.

Important: PR #34, "feat: make Writing accessible by default", was open when this brief was created. Read its actual latest patch, reviews and status. Preserve its accessibility improvements. Avoid silently overwriting or duplicating its work. Reconcile current main and that PR through normal review and rebasing rather than copying obsolete code.

Read at least:
- AGENTS.md; ENGINEERING-CORE.md; README.md.
- skills/*/SKILL.md and all authored companions and agents/openai.yaml adapters.
- packs/user-facing-standards/skills/*/SKILL.md and their live authored companions.
- packs/remaining-standards/skills/* and gated-skills/* authored instruction files.
- packs/controlled-execution/skills/* authored instruction files.
- docs/SKILL-CATALOG.md; docs/SKILL-COMPOSITION.md; docs/HISTORY.md.
- release-profiles.json, all SOURCE-MANIFEST.json, CHECKSUMS.sha256, SOURCE-BASELINE.sha256 and UPSTREAM-CHECKSUMS.sha256.
- package builders, validators, Vale configurations and test/evaluation corpora.
- Previous communication decisions and protected task/standalone contracts.

Expect 24 canonical base skills, 27 integrated supplemental routines, 70 optional remaining-standards entries including gated guards, and 13 controlled-execution routines. Verify rather than assume this count. Enumerate all 134 current skill roots and authored companion files; record exact paths and types. Count only real source files, not generated ZIP contents or upstream reference documents.

## Implementation scope

1. **AGENTS.md**: Replace the existing communication-kernel block and incompatible response templates. Make the new brevity and response policy the operative default. Preserve normative precedence, permissions, skill composition, evidence and the full base/supplemental inventory. The root policy currently has a strict under-100-line limit; consolidate rather than append.
2. **ENGINEERING-CORE.md and root-adjacent policy**: Remove conflicting mandatory section structures and redundant prose guidance. Retain engineering acceptance requirements and task-selected safety controls.
3. **All canonical base skills**: Review and rewrite every SKILL.md for economical, operational language and correct trigger, actor, action, boundary, verification, and recovery. Keep all existing skill identities and route semantics.
4. **All integrated user-facing routines**: Apply the same communication rules to every authored SKILL.md and live companion. Retain source-specific requirements, actual source limitations and accessibility boundaries. Never dilute Easy-to-Read intended-reader validation.
5. **Both source-only packs**: Rewrite every authored SKILL.md and applicable live authored companion. Keep source-only status and gated selection, rights and provenance intact. Do not modify original bundled standards, official reference documents, scans, licensed material or licence texts merely for stylistic consistency.
6. **Writing and communication**: Thoroughly refactor writing, wait-what, teach and their companion guidance. Remove routine Summary/TL;DR boilerplate. Replace verbose instructional repetition with the smallest locally complete contract.
7. **Adapters and packaging**: Update source adapters, reusable prompts and package-generation inputs that currently carry conflicting communication instructions. Preserve profile membership, installation behaviour, standalone fallback operation and Hermes compatibility.
8. **Companions**: Review all live instruction Markdown, schemas/examples and agents/openai.yaml prompts; edit when prose policy or examples conflict. Preserve exact machine contracts, code samples, labels, test strings, source citations, archival facts and tracked formats.
9. **Documentation**: Update active guidance, architecture references, version-relevant release preparation and examples. Do not rewrite historical records to pretend past releases used the new policy.
10. **Tests and checksums**: Update all legitimately affected manifests, hashes, fixture mirrors and source inventories using existing maintainers' tools. Preserve canonical-byte integrity, LF handling, strict Boolean typing, zip safety and source rights.

Do not introduce a 25th base skill, new runtime, universal helper agent, mandatory external service or duplicative communication overlay.

### Rewrite method

Work in coherent batches. For each file:
- Read it and relevant callers before changing.
- Identify task-specific requirements versus style text.
- Eliminate duplicated style boilerplate, throat-clearing, repeated conclusions, unnecessary examples and arbitrary headings.
- Rewrite remaining prose with direct verbs and consistent concepts; preserve specific technical content, evidence and execution sequence.
- Where a skill can run without trusted root AGENTS.md, retain its **short standalone kernel fallback**. Do not assume loading of another skill or root instructions.
- Maintain full independence of selected skills and other hosts.
- Verify preservation of triggers, manual/implicit selection, role ownership, safety and acceptance.
- Where a file legitimately needs detailed technical reference, keep the detail. Do not force a word cap at the expense of correctness.
- Record any file that cannot safely be shortened and why. Do not count a no-op as a rewrite.

Do not use a blind global search-and-replace as the sole method. Use source-aware review and scoped updates.

## Required behavioural examples

The default response to a one-sentence factual question is a short answer, not a Summary and TL;DR sandwich.
An acknowledgement remains one short line.
A user-requested standalone email remains the email only.
An API requirement retains MUST/SHOULD/MAY and the offline exception.
A technician procedure places isolation and safe-state verification before hazardous work, including stop and recovery.
A partially verified service update does not claim complete recovery.
A release with required missing security gates remains NO-GO.
A difficult multi-part technical comparison MAY start with TL;DR when it helps navigation; it MUST NOT close by repeating that TL;DR.
A reference table or command must retain exact syntax even if the row or command looks wordy.
A working-slice or composition report retains its owner, evidence, tests and failure status despite concise prose.
A long user-requested explanation must not be artificially truncated.

Include negative and counterfactual cases: wrong section order, pointless TL;DR, mandatory Summary, lost exception, lost qualifier, false PASS, softened prohibition, skipped warning, changed command, hallucinated citation and accidental source-only pack inclusion.

## Acceptance and verification

Add or revise tests with explicit positive and negative oracles:
- Every enumerated active SKILL.md and authored companion is inspected and has the intended final communication contract.
- No active default policy insists on an opening Summary or a closing TL;DR. Historical files and literal quoted fixtures are exempt.
- Only cognitively helpful TL;DR appears, first, with no redundant final recap.
- No response-length metric rewards omission of material required facts, evidence or safety.
- All 24 base routes, 27 integrated supplemental routes, 70 optional entries and 13 controlled-execution entries remain correctly classified unless current inventory proves a legitimate difference.
- Preserved standalone fallbacks work without root AGENTS.md.
- Root AGENTS.md stays under 100 lines.
- Composition ownership, permission and evidence contracts remain intact.
- Checksum, manifest, archive and licensing validations pass; no accidental source/reference modifications.
- Run existing tests on PowerShell 7 and Windows PowerShell 5.1 where available; do not claim tests that were not run.
- Run Vale on the existing complete source selection. Error-level checks MUST pass. Explain advisory warnings rather than hiding them.
- Calibrate the evaluation harness with deliberately broken fixtures so that it rejects overlong, incomplete and unsafe examples as intended.
- Run fixed live OMP communication evaluations with current model/harness, recording prompts, loaded skills, traces, verdicts and output word counts. Compare against a frozen baseline on matched tasks where possible. Do not claim that shorter text is better unless correctness and task utility remain intact.
- Run packaging and source-integrity checks after final edits. Keep source hashes and release mirrors consistent.

Report PASS, FAIL, NOT RUN and BLOCKED separately. Structural checks alone do not prove host activation, actual model behaviour, intended-user comprehension or cross-host equivalence.

## PR and work boundaries

This PR should ultimately contain **the implemented overhaul**, not only this mission file. Continue on the existing branch. Commit small coherent changes, push, inspect the final diff, address CI and review findings, and bring the PR out of Draft only after its full Definition of Done passes.

Coordinate rather than overwrite PR #34. Do not combine unrelated changes from the separate upstream skill-repository re-audit into this PR. That research may inform design decisions, but new skills and workflow integrations require distinct evidence and scope.

Do not merge the PR, move main, tag or publish any release without a separate explicit request. Do not modify credentials, host configurations, active OMP runs or unrelated repositories.

## Required final PR evidence

Provide:
- Actual base and final commits.
- All skill roots and companion files audited; changed, exempted and unmodified counts with reasons.
- Before/after communication-kernel text.
- Before/after sample outputs for simple, complex, procedural, user-facing and safety-critical tasks, including word counts and requirement preservation.
- Complete diff coverage and exact routes/profile memberships.
- Tests run with commands and PASS/FAIL/NOT RUN/BLOCKED.
- Vale results, packaging hashes and cross-platform status.
- Accessibility, provenance and licence limitations.
- Live model-evaluation results without universal claims.
- Current PR URL, unresolved issues and merge-readiness state.

**Done means:** the entire current authored source corpus has been carefully refactored, source/rights and functional invariants survive, required tests pass, and the new concise response behaviour has executable evidence. A prompt-only commit is a starting point, NOT a completed overhaul.

Execute: inspect → inventory → compare → rewrite → verify → repair → evaluate → review → prepare PR for approval.
