# History of Lean Agent Skills

## Summary

The Lean Agent Skills collection began as a workaround for one narrow problem:

> Recreate the useful operating behaviour of GPT-5.6 Sol's Pro mode for OMP, Codex CLI, and other agent hosts where that mode was not available.

That first idea expanded into a large vendor-neutral collection, then into an oversized `get-it-done` superskill with many required dependencies. The collection was reliable, but it was not lean.

The decisive change came from the project owner's dissatisfaction with the bloat and from Matt Pocock's short, dense, pragmatic skill style, especially `wait-what`. The collection was reduced from 139 skills to 29. Most micro-skills were absorbed into clear authorities, and `wait-what` became the communication doctrine for user-facing prose. One later addition—`cli-design`—brought the collection to 30 skills. V8 consolidated seven more overlapping or project-local authorities, leaving the current 23-skill routing surface.

At V8.1.0, the Complete profile contained 11,991 primary-skill words across 808 lines. Those figures are a historical size checkpoint, not the current release inventory.

Since the lean refactor, the governing rule has been:

> Do not add another skill merely because another project has a good workflow. Adopt a distinct missing capability, merge an overlapping workflow, absorb its strongest mechanisms, or reject it.

The collection is not a copy of any one framework. It synthesizes:

- the original Pro-mode and long-horizon requirements;
- Matt Pocock's communication and compact-skill style;
- professional engineering standards;
- official OpenAI, Anthropic, Cursor, Vercel, Cloudflare, and Microsoft skill ecosystems;
- Superpowers, Compound Engineering, Addy Osmani's skills, Ultracode, and other independent projects;
- HORIZON, AVO, ARC-AGI-3 harnesses, and other long-horizon agent research.

> **AI provenance and review warning:** The collection decisions were heavily AI-assisted, including by GPT-5.6 Sol Pro. Model involvement is not evidence of quality or correctness. Treat every skill as untrusted policy until you have reviewed it and tested it in your own host and project.

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

`cli-design` was the only distinct routed capability that survived. The collection moved from 29 skills to 30; V8 later consolidated it to 23.

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

### 13. V7.4.1: global communication overlay hotfix

V7.4.1 keeps the 30-skill collection and adds a global `wait-what` presentation overlay to every specialist path. Each skill carries a local fallback, each OpenAI adapter repeats the prompt, and `wait-what` allows implicit invocation while four control skills remain manual-only.

### 14. V8.0: authority consolidation

V8 reduces the routing surface from 30 skills to 23. It removes project-local design and language authorities, merges prototype work into `experiment`, merges repository mapping into explicit `project-context` modes, and absorbs stable reasoning and interface mechanisms into the authorities that perform the work.

Retired authorities are `brandkit`, `frontend`, `monitor`, `prototype`, `python`, `reasoning`, and `repo-map`. The change removes competing triggers; it does not prohibit project-local skills or host-native scheduling where those capabilities are needed.

### 15. V8.1.0: considerate agency

V8.1.0 keeps the same 23 skills and invocation policies. It adds a global considerate-agency contract, ACT / ASK / DO NOT ACT initiative calibration, explicit remaining-action labels, reconstruct-free handoffs, implementation stewardship, first-use release readiness, a human-friction review lane, and 60 static scenarios. It adds no dependency, service, hook, executable, or automatic trusted-state mutation.

### 16. V8.2.0: explicit standards and adaptive prose

V8.2.0 made the standards lineage visible in `AGENTS.md`, `ENGINEERING-CORE.md`, and the owning skills while keeping simple answers short. It restored the standards register and kept source names as provenance anchors rather than unsupported compliance claims.

### 17. V8.3.0: usable information and cognitive accessibility

V8.3.0 moved beyond readable sentences toward information that intended users can find, understand, act on, and recover with. It added task-ready instructions, cognitive-accessibility rules, interruption recovery, selective UDL, intended-user validation boundaries, and one conditional `USER-INFORMATION.md` reference without adding a routed skill.

### 18. V8.3.1: repository integrity

V8.3.1 added cross-file version, scenario, mirror, text-hygiene, archive, and repository-consistency checks on PowerShell 7 and Windows PowerShell 5.1. It changed repository assurance, not skill behavior.

### 19. V8.3.2: communication-complete task packs

V8.3.2 retained the standalone Communication profile and included its `teach`, `wait-what`, and `writing` authorities in both the Get It Done and Gauntlet packages. The canonical skill count remained 23.

### 20. V8.4.0: Unlazy re-audit and proof integrity

Lean had already reviewed the original Unlazy project during V5. The later Unlazy source at commit `473d4b80421c36d733042434cd4b938f81a19ef1` added materially stronger proof and orchestration mechanisms: executable acceptance ledgers, parent re-verification, gate-quality linting, scoped ownership, launch waves, rolling dispatch, leaf-versus-branch gate placement, semantic no-progress detection, and explicit command approval boundaries.

The re-audit again rejected a separate `unlazy` skill and runtime. The Node checker, approval store, dispatcher, installer, hooks, host adapters, and platform process management remain upstream and project-local. Lean absorbed only the stable behavioral rules into `ENGINEERING-CORE`, `plan`, `test`, `get-it-done`, `gauntlet-loop`, `review`, and `skill-design`. See [`UNLAZY-REVIEW-v8.4.0.md`](UNLAZY-REVIEW-v8.4.0.md).

## Current state: V8.4.0

### Profiles

| Profile | Skills | Purpose |
|---|---:|---|
| Core | 8 | Research, planning, review, skill design, communication, and long-horizon ownership |
| Engineering | 19 | Core plus implementation, testing, debugging, architecture, release, CLI, browser work, and experiments |
| Complete | 23 | Engineering plus grilling, documents, teaching, and writing |
| Communication | 3 | Adaptive communication, teaching, writing, and human-usable information |
| Get It Done | 5 | Long-horizon execution, Gauntlet, and the complete Communication trio |
| Gauntlet | 4 | Adversarial acceptance and the complete Communication trio |

### Current architecture

```text
AGENTS.md
→ global communication, initiative, routing, trust, and proof-integrity policy

ENGINEERING-CORE.md
→ conditional cross-cutting engineering doctrine

23 SKILL.md authorities
→ one leading action each

agents/openai.yaml
→ thin ChatGPT and Codex adapters

release-profiles.json
→ six deterministic package inventories
```

The collection still follows the lean rule: do not add a routed skill when an existing authority can absorb the distinct useful mechanism.

### 19. V8.5.0: minimum sufficient scrutiny and momentum

V8.5.0 studied the opposite failure mode from Gauntlet bloat: small work becoming a ceremony of plans, agents, critics, state files, broad tests, and repeated status narration. Ponytail, Quickflow, do-it, Small Correct Diff, Scalpel, Just Do It, Plow Ahead, Requirement Zero, Ralph, GSD Pi, and Caveman were compared as subtraction-first, speed-first, or low-ceremony approaches.

No new route survived. Lean retained four evidence-selected modes—DIRECT, STANDARD, DEEP, and ADVERSARIAL—plus a necessity/reuse/stdlib/native ladder, one decisive-check rule, one-question maximum for unresolved consequential choices, strategy shifts after repeated same-class failure, and `ALREADY LEAN` as a valid review outcome. It rejected unsafe underbuilding, blanket test skipping, personas, duplicate controllers, runtimes, hooks, commercial surfaces, and benchmark promises that did not transfer across harnesses.

## V8.6.0 — Outcome-First Communication & Quiet Execution

V8.6.0 reviewed `NousResearch/hermes-agent` at commit `18a76be124d7c16ed98b629a358b23fef76a7f46`. It retained portable behavior rather than runtime machinery.

Absorbed:

- response length and structure matched to the task;
- deep enough internal inspection with concise external reporting;
- outcome, fresh verification, and remaining action for completed work;
- explicit anti-filler, anti-restatement, anti-process-replay, and anti-sycophancy rules;
- tool-intent closure and conditional batching of independent lookups;
- user or host presentation precedence without weakening the truth contract.

Rejected:

- copying the full system prompt;
- bundling Hermes profiles, memory, caching, continuation, computer-use, or automatic skill mutation;
- claiming equivalent live enforcement;
- adding a new routed style skill.

The release kept 23 skills and six profiles and added 48 static delivery scenarios.

## V8.7.0 — Direct Claims & Accountable Reporting

On 6 September 2026, the user's anti-litotes candidate was absorbed as scoped anti-evasion guidance across the existing profiles. The implementation preserves genuine uncertainty, semantic strength, exact sources, and permission boundaries. It adds no route or runtime. See the [decision record](DIRECT-CLAIMS-REVIEW-v8.7.0.md); the supplied Astra documentation view failed retrieval and supports no model-specific claim.
