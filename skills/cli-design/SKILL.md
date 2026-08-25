---
name: cli-design
description: "Design or review a command-line interface that humans and agents can run reliably. Use for headless automation, flags, help, output contracts, exit codes, pipelines, retries, dry-run, and safe state changes."
---

# CLI Design

Treat the CLI as a stable interface, not terminal decoration.

## Contract

1. Start from the real human and automation jobs. Keep command and flag names predictable across the tool.
2. When the CLI exposes a domain action also available through UI, HTTP, MCP, or jobs, reuse the same typed inputs, authorization, validation, idempotency, and error semantics. Keep CLI parsing and presentation as a thin adapter.
3. Every required input MUST have a non-interactive flag, argument, environment variable, configuration field, or standard-input path. Interactive prompts MAY be a convenience, not the only path.
4. Provide useful top-level help, command help, defaults, and copyable examples. A user SHOULD be able to discover the next valid command without external documentation.
5. Write primary results to standard output and diagnostics to standard error. Use stable, documented exit codes.
6. When tools consume the result, provide a structured output mode or a deliberately stable line format. Do not require color, cursor control, or a TTY.
7. Support standard input and pipelines where they fit the job. Bound or paginate large output.
8. Fail fast with an actionable error that names the invalid input and shows a correct invocation. MUST NOT hide partial failure behind exit code zero.
9. Make retryable operations idempotent where practical. For consequential external mutations, support an idempotency mechanism or read-back check.
10. Provide `--dry-run` for risky or broad changes when practical. Require an explicit confirmation flag such as `--yes` or `--force` for destructive actions; default to safety.
11. Handle timeout, cancellation, interruption, cleanup, and partial state. Never print secrets or accept them through a command-line argument when a safer channel exists.

## Verify

Run the CLI from a clean non-interactive environment and check:

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
