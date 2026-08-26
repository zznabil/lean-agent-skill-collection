# V7.4.1 release audit

## Decision

**PASS WITH RISKS.** The integrated V7.4.1 source is structurally coherent and safe to package. Static validation covers source and generated archives; runtime host routing remains unverified. No skill contains bundled executable scripts, runtime network integrations, or automatic trusted-state mutation.

## AI provenance

The collection decisions are AI slop chosen by GPT-5.6 Sol Pro. This describes the collection's origin, not its quality or correctness. Treat every skill as untrusted policy until you have reviewed it and tested it in your own host and project.

The two material limits are licensing and runtime evidence:

1. The repository and generated V7.4.1 packages retain the MIT license.
2. Static checks cannot prove identical routing behavior across agent hosts. Each host must run live activation tests when routing matters.

## Scope

The audit covered the supplied V7.4.1 Complete profile archive and the six locally generated profile archives:

| Package | Skills | Role | Result |
|---|---:|---|---|
| Core | 9 | General reasoning and execution foundation | PASS |
| Engineering | 22 | Core plus software-delivery workflows | PASS |
| Complete | 30 | Canonical superset | PASS |
| Communication | 3 | Small prose and teaching profile | PASS |
| Get It Done | 3 | Long-horizon execution stack | PASS |
| Gauntlet Loop | 1 | Standalone adversarial QA | PASS |
| V7.4.1 Complete source | 30 | Supplied canonical source archive | PASS |
| Generated profiles | 6 | Deterministic repository builds | PASS |

## What was checked

- 30 canonical skill directories and 30 matching `SKILL.md` frontmatter names.
- 30 OpenAI adapters with Chat and Codex product metadata.
- Plugin, profile, citation, and package-validation metadata at version `7.4.1`.
- The supplied archive checksum inventory and the generated release checksums.
- ZIP entry path safety: no rooted paths or parent traversal.
- Overlap design across profiles and standalone packs.
- Permission language for publication, production, destructive work, credentials, and external communication.
- References from primary skill files to their supporting Markdown files.
- Absence of bundled shell scripts, installers, hooks, public runtime URLs, or connector requirements.
- Pinned Compound Engineering provenance and its MIT license terms.

## Architecture

The Complete profile is the source superset. Core and Engineering are curated subsets. The Communication, Get It Done, and Gauntlet packages are convenience slices and deliberately duplicate skills from larger profiles. Installing overlapping profiles would create duplicate routing authorities, so the packaging correctly warns against it.

The collection separates three layers:

1. `SKILL.md`: vendor-neutral trigger and workflow contract.
2. Supporting Markdown: detailed assurance, lanes, state schemas, supply-chain guidance, asset cards, or playbooks for complex skills.
3. `agents/openai.yaml`: thin product-specific display and invocation metadata.

This separation is simple and portable. It also makes review easier because operational policy remains readable text rather than hidden code.

## Coverage analysis

The 30 skills form six practical groups:

- **Control and quality:** `get-it-done`, `gauntlet-loop`, `review`, `test`, `triage`, `handoff`.
- **Engineering:** `architecture`, `implement`, `debug`, `python`, `cli-design`, `merge-conflicts`, `release`, `repo-map`.
- **Product and interface:** `frontend`, `browser-automation`, `prototype`, `experiment`, `monitor`.
- **Thinking and planning:** `reasoning`, `research`, `plan`, `grilling`, `project-context`.
- **Content and artifacts:** `writing`, `teach`, `wait-what`, `office-files`, `brandkit`.
- **Meta:** `skill-design`.

The main overlap is intentional and routed by scale: `implement` owns bounded changes, while `get-it-done` owns long-horizon work; `review` is a direct read-only review, while `gauntlet-loop` is a costly iterative adversarial loop; `plan` creates an execution artifact, while `architecture` owns durable structural choices.

## Strong points

- Permission boundaries are repeated where mistakes would be costly.
- Completion claims require fresh evidence and disclose skipped work.
- High-risk operations use prediction, read-back, rollback, and stop-on-mismatch rules.
- The skills avoid provider lock-in in their primary instructions.
- The largest primary skill is 73 lines, which limits context cost.
- State-heavy workflows define schemas instead of relying on hidden conversation memory.
- The supplied archive adds explicit assurance, asset-card, and supply-chain references without adding routed skills.

## Risks and limitations

| ID | Severity | Finding | Disposition |
|---|---|---|---|
| R1 | P2 | Static metadata cannot prove live host routing or cross-model independence. | Run host-specific activation tests after installation. |
| R2 | P2 | Overlapping profiles duplicate authorities and can cause ambiguous routing. | Install one primary profile only. |
| R3 | P2 | Supplied ZIP uses a different archive structure from repository-generated assets. | Record the supplied digest separately; verify generated assets independently and make no byte-reproduction claim. |
| R4 | P3 | Archive metadata is supplied evidence, not runtime behavior proof. | Re-run repository source, package, and reproducibility gates. |

## V7.4.1 change analysis

V7.4.1 changes existing authorities without adding routed skills. It keeps the supplied overlay behavior while repeating the presentation contract in every specialist skill and OpenAI adapter. It also adds targeted AI assurance, asset-card, and supply-chain references without bundling runtimes, hooks, installers, or external integrations.

The change keeps 30 skills: 865 primary lines and 12,056 primary words are reported; the largest skill is 73 lines; 30 local overlay fallbacks and 30 adapter prompts are present.

## Verification boundary

This audit is a static source and package audit. The supplied archive digest is 01696d376b534c386933d7378f60dd9e34ebae210f84f8153d9e2c92f3902269. Repository-generated assets are built by the inspected deterministic builder and may differ in ZIP structure; no byte reproduction is claimed. This audit does not claim that any model will invoke a skill correctly, obey every rule, or produce equal results across ChatGPT, Codex, or another host. Those are runtime properties and need host-specific tests.
