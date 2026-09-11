# V8.8.0 — Explicit Instructions, Clearer Prose

## Decision and scope

Start from restored V8.7.0 at commit `b55974b291218862c26b36c6d9d6682a3db097d4`, tree `e31c085a149438668815e00155359af5e596707d`. Preserve 23 skills, six profiles, routing descriptions, adapter policies, explicit mandates, reference files, standards decisions, workflow states and user-facing fallbacks. V9 is not the starting point. Its historical commits and releases are not rewritten.

The requested change is instruction clarity for both people and agents. It is not another skill consolidation, standards refresh, framework migration or runtime installation. No instruction-length ceiling is imposed. Required detail is not expendable because it takes words.

## What changed

All 23 skill roots, AGENTS.md and ENGINEERING-CORE.md are segmented into smaller coherent instruction blocks. Dense steps retain their original number and conditions; related actions and exceptions remain within that step. Existing headings, code examples, literal values, resource names, source order and wording are preserved except for the four declared authoring corrections below. Navigation labels identify the purpose of the steps where a single numbered procedure benefits from them. The complete local delivery overlay remains inside each independently loaded specialist.

Writing and skill-design gain a local INSTRUCTION-EDITING.md reference. The two copies are intentionally byte-identical so Communication, Core and individual-skill installations do not depend on a missing sibling skill. Each root names the authoring trigger before its link. Teach and wait-what explain how their principles apply to instructions without forcing a lesson, quiz or additional skill load into ordinary execution. The global/core additions constrain authoring, not the existing permission or completion model.

This applies the existing writing procedure's audience, information need, terminology, actions and source verification; wait-what's direct meaning, uncertainty and proportional structure; and teach's segmentation, mechanism and worked examples. Human-learning practices remain conditional on a learning goal. Examples explain a difficult rule and do not substitute for its other branches.

## Four explicit authoring corrections

### 1. Do not merge on superficial similarity

**Original:**

> Merge skills that always run together or differ only by tone, depth, style, checklist, standard, or orchestration branding.

**Replacement:**

> Treat a proposed skill merge as a behavioural change. Before merging skills that appear to run together or differ only by tone, depth, style, checklist, standard, or orchestration branding, compare their triggers, mandates, references, standalone entry points, authority and completion rules. Merge only within the authorised scope and after the required preservation checks pass.

### 2. Keep the execution contract complete

**Original:**

> Keep `SKILL.md` executable and short. Move conditional detail to a small reference only when it saves repeated context.

**Replacement:**

> Keep `SKILL.md` complete and easy to execute. Reduce avoidable wording, not required decisions. Move conditional detail to a local reference only when the task's trigger reliably loads it before it is needed; measure any claimed context saving in the actual loaded task.

### 3. Do not discard required resources

**Original:**

> Remove wrappers, aliases, promotion, reading lists, fake tools, and facts the environment can reveal directly.

**Replacement:**

> Remove promotional filler, fake-tool claims, and facts the environment can reveal directly. Before removing a wrapper, alias, or reading-list entry, establish why it exists and what depends on it. Retain every entry that carries a required rule, supported capability, source reference, or standalone loading path; propose any behavioural removal separately.

### 4. Optimise words within the contract

**Original:**

> A good skill changes behavior with the fewest durable words.

**Replacement:**

> A good skill uses the fewest durable words that preserve its complete behavioural contract, including triggers, required actions, exceptions, evidence and recovery.

These four changes resolve blanket or underspecified instruction-authoring advice in response to the user's preservation requirement. They do not merge a skill, move an existing reference, weaken an execution mandate or remove a workflow. They are the only registered replacements of original prose; other edits are layout, navigation or disclosed authoring additions.

## What is kept unchanged

The standards register remains byte-identical, including all 97 historical entries, source links, versions, adoption decisions and review dates. Existing support references, all 23 OpenAI adapters, licensing, historical evaluation fixtures and release/dist records also remain byte-identical. Description text is unchanged to avoid mixing discovery changes into a prose comparison. The four scrutiny modes, state schemas, exact permission boundaries, anti-sycophancy, standing Definition of Done, bounded ready-to-use pass and infeasibility checks remain explicit.

This does not freshly validate every source edition, activate excluded standards, or claim that every register entry is a universal mandate. It also does not import V9's validator rewrite. All existing V8.7 build, rejection, validation and repository-audit steps remain enabled. Historical text checkout is pinned to LF for `/dist/v7.2/*.txt` so Windows and Linux observe the same frozen Git bytes; the files themselves are unchanged.

## Text preservation test

`scripts/test-prose-preservation.ps1` reads the pinned `docs/evals/prose-preservation-v8.8.0.json` contract. For each of the 25 instruction roots it removes only the exactly declared additions and navigation labels, reverses the four declared authoring corrections, and normalises list markers and whitespace. The reconstructed text must hash to the original baseline's normalised text. Case, punctuation, wording, values and order are not discarded. Frontmatter, numbered-step sequence and fenced examples have separate exact checks.

This comparison is stronger than checking whether a standard's name or a few success phrases survive. A deleted exception, weakened mandate, reordered content, missing reference or unregistered extra instruction cannot pass the reconstruction. The fixture itself is hash-pinned in the test. Updating expected data is an explicit reviewed change, not an automatic refresh on failure.

Frozen-reference checks cover the register, adapters and historical records. Every package's expected file inventory is compared with the actual ZIP; every canonical instruction/reference byte must equal current source. Package checksum inventories must be exact, nonempty and complete, not merely contain some valid lines. Removing the local authoring reference from a Communication ZIP must fail.

Negative controls cover the standing Definition of Done, mandatory wording, the standalone communication fallback, local reference routing, existing resources, numbered steps, literal progress values, unauthorised inserted advice, evidence-based disagreement, the new preservation rule, register drift and fixture tampering. Package controls delete a reference and empty the checksum inventory. Positive controls run before the mutations and the unmodified package is checked again afterwards.

## Source walkthroughs — not live agent runs

| Case | Required interpretation | Checked source |
|---|---|---|
| Direct implementation without AGENTS | Preserve the complete local communication fallback; do not require writing or teach to load | implement/SKILL.md, User-facing |
| Long-running task appears technically finished | Read standing Definition of Done and all required gates before DONE | get-it-done/SKILL.md, Start and Finish |
| A required check is unrun | Keep non-completion and report the actual missing evidence | get-it-done/SKILL.md, Finish |
| External mutation times out | Inspect actual state before a potentially duplicate retry | get-it-done/SKILL.md, Work |
| Simplify a reading list with a required source | Keep the required entry or propose behavioural removal separately | skill-design/SKILL.md, Write or refactor |
| Agent-facing workflow needs clarification | State trigger, actor, action, result, failure and exception from its source | writing/INSTRUCTION-EDITING.md |
| Execution task is not a lesson | Do not impose learner quizzes or an additional routed skill | teach/SKILL.md, Agent reader |
| Source says not proven safe | Preserve uncertainty; do not replace it with unsafe | wait-what/SKILL.md, Direct claims |
| All audit items are processed but one fails | Preserve separate processed progress and FAIL verdict | gauntlet-loop/SKILL.md, Progress |
| User proposes an unsupported conclusion | Disagree when the evidence warrants it; do not merely remove praise | AGENTS.md, Global overlay |

The author reviewed these paths against the source. These are not independent-agent approvals or measured model completions.

## Evidence limits and next acceptance layer

Text reconstruction does not prove semantic equivalence, comprehension, host loading or model obedience. Layout changes can still affect model behaviour. No live model A/B, intended-user study, routing-rate, token-saving or task-success improvement is claimed. The existing historical `passed` metadata remains for schema compatibility; it is not fresh execution evidence. Use the actual CI run and artifact readback for those results.

Before claiming a behavioural improvement, run paired baseline/candidate tasks with the same host, model, reasoning settings, tools, repository fixture and permissions. Capture loaded file identities, tool trajectories and final artifacts. Include root-plus-skill and standalone entry points, failure cases and near misses. Preselect the task-success, verification and avoidable-user-effort criteria; include held-out cases and repetitions. A source or packaging pass must not be relabelled as that experiment's result.

## Delivery and installation

This change is reviewed through a new V8.8.0 PR. Execute both PowerShell CI hosts on its exact head. Any later merge and publication must follow the standing protected release sequence with exact-main checks, an unused annotated tag and downloaded-asset verification; never rewrite V8.7 or V9 release history. Publishing does not update local installations or trusted project instructions. Stage one profile, review the policy diff and verify the actual loaded source before changing a working installation.
