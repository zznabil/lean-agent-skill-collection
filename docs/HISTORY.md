# History of Lean Agent Skills

## Summary

The Lean Agent Skills collection began as a workaround for one narrow problem:

> Recreate the useful operating behaviour of GPT-5.6 Sol's Pro mode for OMP, Codex CLI, and other agent hosts where that mode was not available.

That first idea expanded into a large vendor-neutral collection, then into an oversized `get-it-done` superskill with many required dependencies. The collection was reliable, but it was not lean.

The decisive change came from the project owner's dissatisfaction with the bloat and from Matt Pocock's short, dense, pragmatic skill style, especially `wait-what`. The collection was reduced from 139 skills to 29. Most micro-skills were absorbed into clear authorities, and `wait-what` became the communication doctrine for user-facing prose. One later addition—`cli-design`—brought the collection to its current 30 skills.

The Complete V7.2 profile contains 9,684 primary-skill words across 762 lines. No primary `SKILL.md` exceeds 67 lines.

Since the lean refactor, the governing rule has been:

> Do not add another skill merely because another project has a good workflow. Adopt a distinct missing capability, merge an overlapping workflow, absorb its strongest mechanisms, or reject it.

The collection is not a copy of any one framework. It synthesizes:

- the original Pro-mode and long-horizon requirements;
- Matt Pocock's communication and compact-skill style;
- professional engineering standards;
- official OpenAI, Anthropic, Cursor, Vercel, Cloudflare, and Microsoft skill ecosystems;
- Superpowers, Compound Engineering, Addy Osmani's skills, Ultracode, and other independent projects;
- HORIZON, AVO, ARC-AGI-3 harnesses, and other long-horizon agent research.

> **AI provenance and review warning:** GPT-5.6 Sol Pro assisted most major design and synthesis decisions in this collection. Model involvement is not evidence of quality or correctness. Treat every skill as untrusted policy until you have reviewed it and tested it in your own host and project.

## Decision vocabulary

| Decision | Meaning |
|---|---|
| **Adopt** | Keep a capability or format as a distinct component because it owns a genuinely different job. |
| **Merge** | Move a largely complete overlapping workflow into the existing skill that already owns its leading action. |
| **Absorb** | Retain a few high-value rules or mechanisms without importing the source workflow. |
| **Adopt upstream selectively** | Keep fast-changing, platform-specific knowledge in its original project and install it only where relevant. |
| **Reject** | Do not import it because overlap, cost, complexity, safety risk, licensing, or provider coupling exceeds its value. |

This decision model was formalized during the external-project audits.

## Chronological development

### 0. The seed: bring Pro mode to other agents

The project began with a request for a reusable behavioural contract that reproduced the practical discipline of GPT-5.6 Sol's Pro setting across OMP, Codex, ChatGPT, and other agent hosts:

```text
think deliberately
→ examine assumptions
→ use evidence
→ inspect relevant documentation
→ challenge the first answer
→ verify before completion
```

The request expanded into a vendor-neutral audit of an existing skill library. The target qualities were commercial cleanliness, no promotional funnels, bounded autonomy, long-running execution, and portability across hosts.

The first `get-it-done` superskill combined ideas represented by many smaller skills, including `pro-mode`, `efficient-frontier`, `stay-within-limits`, `kaizen`, `bro`, `i-have-adhd`, quality audits, combined reasoning, durable goals, facts, documentation-first research, TDD, and orchestration.

The philosophy at that point was: compose many good skills into one strict execution stack. It worked, but created too many moving parts.

### 1. The first vendor-neutral collection

The original archive contained 143 source skill directories and 255 files. The first major audit produced 138 vendor-neutral skills and removed:

- host-specific manifests and provider assumptions;
- proprietary invocation syntax;
- promotional links and funnels;
- unnecessary remote dependencies;
- duplicate wrappers and branded aliases;
- unsafe assumptions that invocation authorized commits, pushes, tracker writes, or tool installation;
- restricted office-skill text that could not safely be reused.

Four office workflows were independently rewritten because the source bundles prohibited derivative use.

The resulting `get-it-done` controller had 23 ordered calls, 19 unique skill dependencies, durable goal state, bounded improvement waves, usage and cost controls, quality audits, and completion proof.

This phase solved portability, vendor neutrality, safety boundaries, durable execution, dependency closure, and completion honesty. It did not solve routing burden, context overhead, duplicated doctrine, repeated instructions, or maintenance complexity.

### 2. `gauntlet-loop`: independent acceptance

The Gauntlet Loop introduced a separate quality cycle:

```text
Build
→ Inspect
→ Attack
→ Measure
→ Repair
→ Retest
```

The central architectural choice was to keep it separate from `get-it-done`:

- `get-it-done` owns the outcome, permissions, resources, state, implementation, and handoff.
- `gauntlet-loop` owns frozen benchmarks, baselines, independent critics, evidence and defect ledgers, bounded repair rounds, and final acceptance.

Gauntlet remained standalone, manually invokable, conditionally callable, and expensive only when justified. Its original framework used roughly 601 lines across ten files. The lean refactor reduced its primary skill to 66–67 lines while preserving the benchmark, independence, budget, repair, state, and judge contracts.

### 3. The decisive lean refactor: 139 skills became 29

The project owner described the collection as bloated, too long, too large, and full of concepts that should be consolidated, absorbed, or removed. Matt Pocock's compact skill style became the model.

`wait-what` absorbed `bro`, `i-have-adhd`, ASD-STE100-inspired clarity, summary-first communication, a closing TL;DR, and Feynman-style explanation. It governs direct replies, explanations, summaries, progress, and visible next actions. It does not rewrite source code, commands, logs, schemas, quotations, citations, legal language, or artifacts that require another voice.

The first Lean audit reduced:

- 139 skills to 29;
- 36,436 primary-skill words to 5,945;
- 5,099 primary-skill lines to 631.

| Area | Consolidation |
|---|---|
| Communication | `bro` + `i-have-adhd` → `wait-what` |
| Long-horizon work | Ten workflow skills → `get-it-done` |
| Reasoning | 55 mental-model and thinking skills → `reasoning` |
| Quality | Seven audit and review skills → `review` |
| Frontend | Eleven visual and UI skills → `frontend` |
| Planning | Seven planning and specification skills → `plan` |
| Office artifacts | Five format skills → `office-files` |
| Python | Four Python skills → `python` |
| Gauntlet | 601-line framework → compact independent acceptance skill |

The Communication Mini profile later separated three clear authorities: `wait-what` for normal communication, `teach` for durable learning and practice, and `writing` for prose artifacts.

### 4. V2: professional standards without one skill per standard

V2 integrated stable engineering doctrine without rebuilding the catalog. Its influences included ASD-STE100, RFC 2119/8174, ISO/IEC/IEEE 29148, ISO/IEC 25010, ISO/IEC/IEEE 29119 and 12207, NIST SSDF, OWASP ASVS, WCAG 2.2, ADR practice, OpenAPI, JSON Schema, SemVer, Conventional Commits, NIST AI RMF, and OWASP LLM guidance.

It did not create an `engineering-core` routed skill. Instead:

```text
ENGINEERING-CORE.md
→ conditional cross-cutting doctrine

AGENTS.md
→ normative requirement words and collection policy

existing specialist skills
→ only action-specific rules
```

The collection remained at 29 skills and did not claim formal standards certification.

### 5. V3: OpenAI-native packaging

V3 kept `SKILL.md` vendor-neutral while adding optional OpenAI adapters:

```text
SKILL.md
→ portable behavioural source of truth

agents/openai.yaml
→ OpenAI display, prompt, product, and invocation metadata

.codex-plugin/plugin.json
→ collection packaging
```

Control-oriented or expensive skills remained manual-only: `gauntlet-loop`, `get-it-done`, `grilling`, `handoff`, and `wait-what`.

### 6. V4: the Cursor plugin deep-dive

Five official Cursor plugins were reviewed.

| Source | Decision | Retained | Rejected |
|---|---|---|---|
| `thermos` | Absorb | Independent correctness/security and maintainability passes; full changed-file inspection | Duplicate review skill and arbitrary size rules |
| `continual-learning` | Absorb safe explicit mode | Deduplicated durable preferences and workspace facts | Automatic hooks and unattended trusted-file mutation |
| `cli-for-agent` | Adopt as `cli-design` | Headless inputs, help, stream and exit contracts, idempotency, dry-run, actionable errors | Branding and implementation-specific wording |
| `pstack` | Selective absorb | Falsifiable completion, risky unknown first, verification harness, keep/revert experiments | Competing skill matrix and arbitrary gates |
| `orchestrate` | Conditional absorb | Shallow task graphs, isolated workers, one owner, handoffs, read-only verification | Cursor SDK, cloud-only workers, external chat integration |

`cli-design` was the only distinct routed capability that survived. The collection moved from 29 skills to 30 and has remained there.

### 7. V5: the 14-repository synthesis

V5 studied 14 influential skill and agent repositories. It absorbed general methods, merged overlap, kept fast-changing specialists upstream, and rejected catalogs, wrappers, hooks, binaries, commercial scaffolding, and provider-only orchestration.

Sources included Unlazy, How, Superpowers, Agentic Awesome Skills, Vercel Agent Skills, Cloudflare Skills, Microsoft Windows Development Skills, OpenAI Plugins, Anthropic Skills, Cursor Plugins, Awesome Cursor Skills, Builder.io Agent Native, Taste Skill, and Ray Fernando Skills.

No new routed skill survived. This phase established a durable policy: platform-specific knowledge should normally remain project-local and current; the generic collection should retain only stable principles.

### 8. V6: Addy Osmani's engineering lifecycle

Addy Osmani's `agent-skills` offered 24 production-oriented skills plus personas, commands, hooks, references, and evaluations. It was strong but overlapped almost completely with Lean's lifecycle, so V6 added zero routed skills and refined 17 existing directories.

V6 absorbed two-layer completion, brownfield characterization before change, explicit `success`/`failure`/`unknown` states for consequential effects, idempotency and reconciliation, supply-chain review, operator-first observability, comparable performance baselines, and structural/routing/behavioural skill evaluation.

It rejected a session-start meta-router, duplicate personas, command aliases, source-cache hooks, in-place ignore-file mutation, mandatory multi-model review, and context-free fixed thresholds.

### 9. V7: Ultracode and workflow topology

V7 reviewed `plugin-ultracode`, `ultracode-workflows`, and `ultracode-skill`.

The executable Ultracode runtime remained optional and external. Individual workflows could be adopted only after review. General topology rules were absorbed: pipeline by default, barriers only for whole-set decisions, charters and anti-charters, finder–verifier separation, evidence before hypotheses, one falsifier per causal story, countable coverage, explicit caps, and honest non-convergence.

`ultracode-skill` was merged into `get-it-done`, contributing Direct, Staged, and Delegated execution modes; `none`, `inline`, and `full` contract levels; bounded sidecars; structured handoffs; and evaluation cases for normal, fallback, failure, cap, and resume paths.

A separate `ultracode` trigger was rejected because it would compete with `get-it-done` and `gauntlet-loop`.

### 10. HORIZON and AVO: why `omp-evolve` was not built

NVIDIA's HORIZON contributed the idea that the model proposes, an executable evaluator measures, and code accepts or rejects. AVO contributed trajectory-wide review and mechanism-level redirection after stagnation.

An `omp-evolve` plugin was designed around Goal Mode, autoresearch, frozen acceptance, candidate lineage, holdout validation, and trajectory audit. The runtime was rejected because its complexity exceeded its unproven benefit. No `evolve` skill was added.

The retained pattern was simpler:

```text
OMP supplies execution tools.
Lean skills supply discipline.
Git, tests, and the real artifact supply truth.
```

This became an important negative result: not every useful architecture deserves to become another plugin or skill.

### 11. V7.1: ARC-AGI-3 harness lessons

V7.1 reviewed ten public ARC-AGI-3 systems. Their scores were not treated as controlled comparisons because models, retries, costs, and public-set selection differed. Methods—not headline scores—were integrated.

Tycho, VISTA, NVIDIA AVO, arc-skill, OpenWorld, Retrodict, baseline1/`ewma_sv`, Schema, arc-code, and Prime Agent contributed variants of adaptive abstraction, lossless evidence, trajectory review, prediction before action, model/reality gate separation, retrodiction, scheduled simplification, cheap separating experiments, and controlled refinement.

The resulting doctrine was:

```text
preserve raw evidence
→ maintain a compact revisable playbook
→ label belief state
→ predict before consequential action
→ run the cheapest separating probe
→ stop dependent work on mismatch
→ challenge the representation at a plateau
→ verify the internal model and the real artifact separately
```

Material beliefs can be `VERIFIED`, `ASSUMED`, `REFUTED`, or `UNKNOWN`. Trusted doctrine cannot rewrite itself during ordinary execution. V7.1 added zero skills.

### 12. V7.2: Compound Engineering

V7.2 examined Every Inc.'s Compound Engineering Plugin at release 3.23.3. Its complete lifecycle would have duplicated Lean's planning, execution, review, and learning authorities, so seven existing skills were refined without adding an integration or routed skill.

| Lean authority | Contribution retained |
|---|---|
| `plan` | Direct, Brief, and Durable depth; stable IDs; settled decisions; plans as guardrails |
| `skill-design` | Outcome spine; invariant/default/heuristic classification; live cross-host evaluation; noise-floor measurement |
| `project-context` | Verified solution learning with overlap checks and one durable sink |
| `review` | Severity separate from repair class; reviewer identity receipts |
| `gauntlet-loop` | Critic and judge identity receipts; live-topology evidence |
| `experiment` | Degenerate gates and staged confirmation for expensive or noisy scoring |
| `get-it-done` | Durable ownership and revisit triggers for accepted residual issues |

Rejected elements included competing lifecycle aliases, the `lfg` controller, automatic push and PR behaviour, automatic cross-provider review, phrase-triggered learning, automatic trusted-instruction mutation, and connector-specific publishing or promotional workflows.

The complete source decision map is retained in [`dist/v7.2/compound-engineering-integration-v7.2-decisions.csv`](../dist/v7.2/compound-engineering-integration-v7.2-decisions.csv).

## Current state: V7.2

### Profiles

| Profile | Skills | Purpose |
|---|---:|---|
| Core | 9 | Reasoning, research, planning, review, skill design, and long-horizon ownership |
| Engineering | 22 | Core plus implementation, testing, debugging, architecture, release, CLI, and browser work |
| Complete | 30 | Engineering plus frontend, experiments, grilling, documents, monitoring, teaching, writing, and branding |
| Communication Mini | 3 | `wait-what`, `teach`, and `writing` |
| Get It Done Pack | 3 | `wait-what`, `get-it-done`, and `gauntlet-loop` |
| Gauntlet Pack | 1 | Independent adversarial acceptance |

The V7.2 validation records:

```text
30 unique skills
0 new routed skills
0 new external integrations
0 new automatic mutations
0 new provider requirements

Complete profile:
762 primary lines
9,684 primary words
67-line largest SKILL.md
```

### The 30 current skills

```text
architecture
brandkit
browser-automation
cli-design
debug
experiment
frontend
gauntlet-loop
get-it-done
grilling
handoff
implement
merge-conflicts
monitor
office-files
plan
project-context
prototype
python
reasoning
release
repo-map
research
review
skill-design
teach
test
triage
wait-what
writing
```

## Design principles that survived every revision

### 1. One primary skill by default

Do not activate an entire stack merely because several skills might be relevant. Add another only for a distinct phase, specialist operation, or independent review.

### 2. One authority per leading action

```text
plan the work              → plan
own the outcome            → get-it-done
implement a bounded change → implement
test behaviour             → test
review independently       → review
attack final acceptance    → gauntlet-loop
```

Aliases should not compete for the same job.

### 3. Builders do not approve themselves

Builders can run local checks. Final high-risk acceptance belongs to an independent critic or fresh-context judge.

### 4. Evidence outranks prose

```text
claim
→ check
→ actual result
→ evidence
```

A confident summary is not proof.

### 5. Raw evidence is not memory

```text
raw evidence → ground truth
playbook     → compact, revisable interpretation
scratchpad   → temporary reasoning
```

### 6. Formalize only when it pays

```text
prose
→ structured notes
→ small task-local script
→ executable model
```

Do not start with the most complicated representation.

### 7. External specialists stay upstream

Fast-changing React, Cloudflare, WinUI, and similar platform knowledge should normally be installed only in projects that use those platforms.

### 8. Trusted doctrine does not silently rewrite itself

Refinement requires evidence, comparison with the current version, negative and held-out tests, review, authorization, and rollback.

### 9. Consequential actions require authorization and recovery

A generic request is not automatic permission to push, publish, deploy, buy, delete, change production, alter machine configuration, or send private material to another provider.

### 10. Bloat is a reliability defect

Every permanent instruction consumes routing attention, context, maintenance effort, conflict surface, and debugging capacity. A new rule or file must earn that cost.

## Lineage in one diagram

```text
GPT-5.6 Sol Pro-mode idea
        ↓
vendor-neutral pro-mode
        ↓
large 138-skill ecosystem
        ↓
get-it-done superskill
        ↓
separate gauntlet-loop
        ↓
Matt Pocock-inspired lean overhaul
        ↓
29 authoritative skills
        ↓
professional engineering doctrine
        ↓
OpenAI-native adapters and plugin packages
        ↓
cli-design added from Cursor research
        ↓
30-skill stable architecture
        ↓
external-project deep-dives
        ↓
mechanisms absorbed without adding triggers
        ↓
HORIZON/AVO plugin deliberately rejected
        ↓
ARC evidence-guided action doctrine
        ↓
Compound Engineering planning and evaluation refinements
        ↓
Lean Agent Skills V7.2
```

## Primary internal project records

- *Eight-pass comprehensive audit—Vendor-neutral agent skills* (2026).
- *Gauntlet Loop eight-pass audit* (2026).
- *Lean Agent Skills—Eight-pass audit* (2026).
- *Lean Agent Skills V2—Standards integration audit* (2026).
- *OpenAI-native skill collections V3—Eight-pass audit* (2026).
- *Fourteen-repository deep-dive and V5 integration audit* (2026).
- *Addy Osmani Agent Skills deep-dive and V6 integration audit* (2026).
- *ARC top scorers V7.1 integration audit* (2026).
- [*Compound Engineering integration—V7.2 eight-pass audit*](../dist/v7.2/compound-engineering-integration-v7.2-8pass-audit.md) (2026).

The earlier internal audits are historical project records and are not all included in this repository snapshot.

## External sources

Repositories and living specifications change over time. The historical review used versions available by August 25, 2026.

### Communication, standards, and professional doctrine

- [ASD-STE100 Simplified Technical English](https://asd-ste100.org/)
- [RFC 2119](https://doi.org/10.17487/RFC2119) and [RFC 8174](https://doi.org/10.17487/RFC8174)
- [ISO/IEC/IEEE 29148:2018](https://www.iso.org/standard/72089.html)
- [ISO/IEC 25010:2023](https://www.iso.org/standard/78176.html)
- [ISO/IEC/IEEE 29119 series](https://committee.iso.org/sites/jtc1sc7/home/projects/flagship-standards/isoiecieee-29119-series.html)
- [ISO/IEC/IEEE 12207:2026](https://www.iso.org/standard/90219.html)
- [NIST AI RMF 1.0](https://www.nist.gov/itl/ai-risk-management-framework)
- [NIST SSDF 1.1](https://doi.org/10.6028/NIST.SP.800-218)
- [OWASP ASVS](https://owasp.org/www-project-application-security-verification-standard/)
- [OWASP LLMSVS](https://owasp.org/www-project-llm-verification-standard/LLMSVS-v2.0-en.html)
- [WCAG 2.2](https://www.w3.org/TR/WCAG22/)
- [Architectural Decision Records](https://adr.github.io/)
- [OpenAPI Specification](https://spec.openapis.org/oas/v3.2.0.html)
- [JSON Schema](https://json-schema.org/specification)
- [Semantic Versioning](https://semver.org/)
- [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)
- [Matt Pocock's Skills](https://github.com/mattpocock/skills)

### Agent skills and engineering frameworks

- [Anthropic Skills](https://github.com/anthropics/skills)
- [Builder.io Agent Native](https://github.com/BuilderIO/agent-native)
- [Cloudflare Skills](https://github.com/cloudflare/skills)
- [Cursor Plugins](https://github.com/cursor/plugins)
- [Every Inc. Compound Engineering Plugin](https://github.com/EveryInc/compound-engineering-plugin)
- [Ultracode Workflows](https://github.com/hesreallyhim/ultracode-workflows)
- [Plugin Ultracode](https://github.com/just-every/plugin-ultracode)
- [Taste Skill](https://github.com/leonxlnx/taste-skill)
- [Unlazy](https://github.com/Leonxlnx/unlazy)
- [Microsoft Windows Development Skills](https://github.com/microsoft/win-dev-skills)
- [Superpowers](https://github.com/obra/superpowers)
- [OpenAI Build Skills](https://developers.openai.com/codex/build-skills)
- [OpenAI Plugins](https://github.com/openai/plugins)
- [Addy Osmani Agent Skills](https://github.com/addyosmani/agent-skills)
- [Ultracode Skill](https://github.com/PabloNAX/ultracode-skill)
- [How](https://github.com/poteto/how)
- [Ray Fernando Skills](https://github.com/RayFernando1337/rayfernando-skills)
- [Agentic Awesome Skills](https://github.com/sickn33/agentic-awesome-skills)
- [Awesome Cursor Skills](https://github.com/spencerpauly/awesome-cursor-skills)
- [Vercel Agent Skills](https://github.com/vercel-labs/agent-skills)

### Long-horizon and ARC-AGI-3 research

- [ARC-AGI community leaderboard](https://arcprize.org/leaderboard/community)
- [arc-code](https://github.com/jerber/arc-code)
- [Retrodict](https://github.com/ryanbbrown/Retrodict)
- [AVO](https://arxiv.org/abs/2603.24517)
- [arc-skill](https://github.com/pbshgthm/arc-skill)
- [VISTA](https://vista-research.github.io/)
- [Tycho](https://arxiv.org/abs/2607.28287)
- [Prime Agent](https://www.primeintellect.ai/blog/prime-agent)
- [OpenWorld](https://github.com/quome-cloud/openworld)
- [Executable world models, simplification, and verification for ARC-AGI-3](https://arxiv.org/abs/2607.15439)
- [Agentic hardware design as repository-level code evolution](https://arxiv.org/abs/2606.28279)
- [Schema harness](https://schema-harness.github.io/)

## In one sentence

> Keep one authority per job. Prefer evidence over self-report. Absorb mechanisms, not frameworks. Add a skill only when it owns a truly distinct action.
