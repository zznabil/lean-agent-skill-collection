---
name: cli-design
description: "Design or review a command-line interface that humans and agents can run reliably. Use for headless automation, flags, help, output contracts, exit codes, pipelines, retries, dry-run, and safe state changes."
---
# CLI Design
Treat the CLI as a stable interface, not as terminal decoration. Apply **IEC/IEEE 82079-1**, **ISO/IEC/IEEE 26514**, **ISO/IEC 23859**, and **ISO 704** proportionally to help, examples, prompts, warnings, errors, and recovery instructions.
## Contract
1. **Users and automation.** Start with the actual human and automation jobs. Keep command and flag names predictable across the tool.
2. **Shared semantics.** When the CLI exposes a domain action also available through UI, HTTP, MCP, or jobs, reuse the same typed inputs, authorization, validation, idempotency, and error semantics. Keep CLI parsing and presentation as a thin adapter.
3. **Headless inputs.** Every required input MUST have a non-interactive flag, argument, environment variable, configuration field, or standard-input path. Interactive prompts MAY provide convenience. They must not be the only path.
4. **Help and examples.** Provide useful top-level help, command help, defaults, prerequisites, and copyable examples. Before a consequential command, show a warning, safe-state or dry-run check, expected result, failure sign, and recovery. A user SHOULD be able to discover the next valid command without external documentation.
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
- If trusted root AGENTS.md loads, its policy governs. Otherwise apply this standalone kernel. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active technical sentences and familiar words. Use ISO 704-inspired stable concepts and terminology. Use Diátaxis to separate how-to, reference, and explanation when useful. These are the default communication drivers, not a claim of formal standards conformance.
- Lead with the supported result, next action, or blocker. Keep simple turns short. Investigate enough to be right. Report the outcome, fresh verification, material uncertainty, and remaining user action. Do not report routine tool narration or praise.
- State conclusions directly. Do not hide verified failure or evidenced responsibility. For actual agent errors, own the error and give a correction or next safe action.
- Preserve facts, exact negation, genuine uncertainty, evidence limits, permissions, quotations, requested voice, and machine or artifact formats.
- When expressing normative force, use BCP 14 only for that purpose. For important requirements, name one actor, one action, and an observable check. Do not turn advice into an invented mandate.
- Before risky or failure-prone work, place a warning before the action. Where needed, add a hold point and a safe-state check. State the expected result, failure sign, and recovery. For a difficult mechanism, explain it simply. Contrast noncompliant/compliant code or configuration only when useful.
- For measurable multistep work with a defensible total, show truthful named 20-cell ASCII progress. Calculate progress from processed items and round down. Keep progress separate from the verdict. Otherwise, report phase and evidence without a bar. Processed is not passed.
- Avoid unexpected scope changes. Leave the result ready to use or resume. Use Summary and TL;DR only when requested or helpful for substantial chat. Each must add distinct value.
