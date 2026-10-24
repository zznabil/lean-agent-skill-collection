---
name: cli-design
description: "Design or review a command-line interface that humans and agents can run reliably. Use for headless automation, flags, help, output contracts, exit codes, pipelines, retries, dry-run, and safe state changes."
---
# CLI Design
Treat the CLI as a stable interface, not as terminal decoration. Apply **IEC/IEEE 82079-1**, **ISO/IEC/IEEE 26514**, **ISO/IEC 23859**, and **ISO 704** proportionally to help, examples, prompts, warnings, errors, and recovery instructions.
## Contract
1. **Users and automation.** Identify the human and automation jobs. Keep command and flag names predictable across the tool.
2. **Shared semantics.** Reuse typed inputs, authorisation, validation, idempotency and errors for domain actions shared with UI, HTTP, MCP or jobs. Keep CLI parsing and presentation thin.
3. **Headless inputs.** Every required input MUST have a non-interactive flag, argument, environment variable, configuration field or standard-input path. Interactive prompts MAY provide convenience, but cannot be the only path.
4. **Help and examples.** Provide useful top-level and command help, defaults, prerequisites and copyable examples. Before consequential commands, show a warning, safe-state or dry-run check, expected result, failure sign and recovery. Users SHOULD be able to discover the next valid command without external documentation.
5. **Streams and exit codes.** Write primary results to standard output. Write diagnostics to standard error. Use stable, documented exit codes.
6. **Machine-readable output.** When tools consume the result, provide a structured output mode or a deliberately stable line format. Do not require color, cursor control, or a TTY.
7. **Pipelines.** Support standard input and pipelines where they fit the job. Bound or paginate large output.
8. **Strict input boundary.** Apply **RFC 9413-inspired strict boundary behavior**. Accept only documented input variants. Normalize once. Reject ambiguity.
   - Fail fast with an actionable canonical error. Name the invalid input and show the next valid action. When relevant, state the state of partial work or data.
   - The CLI MUST NOT hide partial failure behind exit code zero.
9. **Safe retries.** Make retryable operations idempotent where practical. For consequential external mutations, support an idempotency mechanism or a read-back check.
10. **Destructive-action preview.** Provide `--dry-run` for risky or broad changes when practical. Require an explicit confirmation flag such as `--yes` or `--force` for destructive actions. Default to safety.
11. **Failure and cleanup.** Handle timeout, cancellation, interruption, cleanup, and partial state. Never print secrets. Never accept secrets through a command-line argument when a safer channel exists.
## Verify
Run the CLI from a clean non-interactive environment. Check:
- help and examples;
- missing and malformed input;
- standard input and pipelines;
- human and machine-readable output;
- exit codes and standard-error behavior;
- repeated invocation and retry safety;
- dry-run with no side effect;
- cancellation and cleanup;
- cross-surface contract parity when applicable;
- backwards compatibility for established commands.
Report the interface contract, examples, executed checks, unsupported cases, and remaining risk.
## Communication kernel
Number ordered actions; group long lists without hiding required items. After interruption or task change, restore relevant completed/current/pending state, not repetitive status each turn. Preserve language, exact tokens, formats, permissions and evidence. Never invent estimates or diagnose readers. Show verified outcomes and factual errors; give a concrete next action only if work remains. - If trusted root AGENTS.md loads, its policy governs. Otherwise apply this standalone kernel. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active technical sentences and familiar words. Use ISO 704-inspired stable concepts and terminology. Use Diátaxis to separate how-to, reference, and explanation when useful. These are the default communication drivers, not a claim of formal standards conformance.
- Lead with the supported result, action or blocker. Report fresh verification, material uncertainty and remaining user action. Omit routine tool narration and praise.
- State verified failure and evidenced responsibility directly. Correct actual agent errors or give the next safe action.
- Preserve facts, negation, uncertainty, evidence limits, permissions, quotations, requested voice and exact artefact formats.
- Use BCP 14 only for normative force. Important requirements name one actor, action and observable check; do not turn advice into mandates.
- Before risky or failure-prone work, warn, add any needed hold point and verify the safe state. State the expected result, failure sign and recovery. Explain difficult mechanisms simply; use compliant/noncompliant contrasts only when useful.
- For measurable multi-step work with a defensible total, show named 20-cell ASCII progress, rounded down from processed items, separately from the verdict. Processed does not mean passed. Otherwise report phase and evidence.
- Avoid surprise scope; leave results usable or resumable. Keep simple replies short without truncating needed detail. Omit routine Summary headings and closing recaps. Use TL;DR only when helpful for a complex response, and place it first.
