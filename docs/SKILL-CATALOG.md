# Lean Agent Skills V8.1.0 catalog

## Considerate agency

V8.1 keeps the 23-skill routing surface and adds a global rule: inspect before asking, recommend defaults, complete obvious safe follow-through, close loops, avoid surprises, and stop before initiative becomes scope creep.

## Canonical skills

- **`architecture`** — Design module boundaries, data ownership, interfaces, domain models, migrations, refactors, and architecture decision records from real constraints. Use for structural choices with lasting change cost. _OpenAI policy: implicit._
- **`browser-automation`** — Build or run authorized browser automation, real-user QA, data entry, or extraction with stable locators, explicit state, bounded retries, and evidence of the user-visible result. _OpenAI policy: implicit._
- **`cli-design`** — Design or review a command-line interface that humans and agents can run reliably. Use for headless automation, flags, help, output contracts, exit codes, pipelines, retries, dry-run, and safe state changes. _OpenAI policy: implicit._
- **`debug`** — Diagnose a hard defect or performance regression through a tight reproducible feedback loop, evidence-first investigation, falsifiable competing hypotheses, targeted instrumentation, and verified regression coverage. _OpenAI policy: implicit._
- **`experiment`** — Design a controlled product, performance, or engineering experiment—or a disposable prototype—with a falsifiable hypothesis, comparable baseline, guardrails, and stopping rule. _OpenAI policy: implicit._
- **`gauntlet-loop`** — Run a bounded adversarial quality loop with independent critics, frozen benchmarks, repair, and retest over a real artifact. Use only when hidden-defect risk makes one direct check insufficient. _OpenAI policy: manual._
- **`get-it-done`** — Take ownership of a complex, multi-session, or long-running task until verified completion. Use when the user wants durable execution, program-scale orchestration, and evidence rather than advice or a plan alone. _OpenAI policy: manual._
- **`grilling`** — Interview the user one decision at a time to stress-test a plan or requirement. Use only when an important choice is unresolved and the answer is not already available. _OpenAI policy: manual._
- **`handoff`** — Create a concise status recap or durable handoff. Use after substantial work, before interruption, or when another session needs the exact current state and next action. _OpenAI policy: manual._
- **`implement`** — Implement a bounded change from a clear request, spec, or ticket. Use when the work fits a focused session; use get-it-done for long-horizon ownership and gauntlet-loop for costly adversarial acceptance. _OpenAI policy: implicit._
- **`merge-conflicts`** — Resolve merge, rebase, or cherry-pick conflicts by preserving intended behavior from both sides and verifying the integrated result. Use when conflict markers or semantic integration failures exist. _OpenAI policy: implicit._
- **`office-files`** — Create, edit, inspect, convert, or repair DOCX, PDF, PPTX, and spreadsheet files while preserving structure and validating the final artifact with the available file tools. _OpenAI policy: implicit._
- **`plan`** — Turn evidence and resolved decisions into an executable proposal, spec, ticket set, workflow, refactor plan, or comparison of competing plans. Use for planning artifacts, not implementation unless also requested. _OpenAI policy: implicit._
- **`project-context`** — Create or update durable project context; map or explain verified repository structure and flows; record approved lessons, AI asset cards, or retrospectives. Use only when the user explicitly requests one of these artifacts. _OpenAI policy: manual._
- **`release`** — Prepare and verify a software or artifact release, including version, changelog, build, package, checksums, migration notes, staged rollout, operations evidence, and rollback. Publish only with explicit authorization. _OpenAI policy: implicit._
- **`research`** — Investigate a question using current primary sources and produce a source-backed briefing. Use for documentation, factual checks, literature or product research, and source-faithful transcript or video summaries. _OpenAI policy: implicit._
- **`review`** — Independently review code, interfaces, writing, data, architecture, repository agent-operability, or another agent’s work against the real contract and artifact. Default to read-only; repair only when explicitly requested. _OpenAI policy: implicit._
- **`skill-design`** — Create, refactor, evaluate, package, import, or route portable agent skills, workflow instructions, and skill stacks. Use for SKILL.md, plugin compatibility, benchmark design, third-party audits, trigger quality, executable workflow review, or reducing skill-set bloat. _OpenAI policy: implicit._
- **`teach`** — Teach a concept or skill through a plain explanation, worked example, active recall, and bounded practice. Use when the user asks to learn, understand, practise, study, or be quizzed—not for a quick reference answer alone. _OpenAI policy: implicit._
- **`test`** — Design or improve automated tests and test-first feedback loops. Use for TDD, regression coverage, characterization, integration, end-to-end, property, fuzz, concurrency, compatibility, performance, or agent-trajectory testing. _OpenAI policy: implicit._
- **`triage`** — Triage a bug, request, alert, work item, or live incident by verifying evidence, classifying impact, stabilizing risk, and naming the next owner or action. Use when the report or operational state is uncertain. _OpenAI policy: implicit._
- **`wait-what`** — Re-pitch a confusing, dense, or context-poor response in friendly ASD-STE100-inspired prose. Use when the user explicitly asks for a clearer restatement. _OpenAI policy: manual._
- **`writing`** — Draft or edit emails, messages, documentation, articles, reports, and other prose for purpose, evidence, structure, clarity, and audience fit while preserving the requested voice. _OpenAI policy: implicit._

## Retired in V8

- **`brandkit`** — REMOVE; project-local design add-on.
- **`frontend`** — REMOVE + ABSORB; architecture + implement + browser-automation + review.
- **`monitor`** — REMOVE; native scheduler + triage/release/architecture.
- **`prototype`** — MERGE + REMOVE; experiment + implement.
- **`python`** — REMOVE; project-local toolchain guidance.
- **`reasoning`** — ABSORB + REMOVE; AGENTS.md + ENGINEERING-CORE.md + active specialist.
- **`repo-map`** — MERGE + REMOVE; project-context Map / Explain mode.
