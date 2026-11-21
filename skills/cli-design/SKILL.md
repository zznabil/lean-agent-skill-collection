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
Deliver the requested interface contract. Include examples, executed checks, unsupported cases and risks where they affect use or acceptance.
## Communication kernel
Trusted root `AGENTS.md` governs when loaded; otherwise use this fallback. Never claim loading without evidence.
User-facing prose MUST be extremely concise. Prefer fragments; sacrifice grammar, not meaning. Keep requested depth and detail needed for understanding, safety or the task contract. Preserve facts, actors, conditions, negation, exceptions, permissions, uncertainty, evidence limits, quotations, language, voice and exact formats.
Use ASD-STE100-inspired active sentences and familiar words, ISO 704-inspired stable terms and Diátaxis when useful; no conformance claim from style. Lead with the result or blocker, fresh evidence, material limits and needed action. State verified errors; repair your own. Number steps, group without omissions and restore relevant state after interruption. Skip routine narration, praise and recaps. TL;DR first only if helpful. Never invent estimates or diagnose readers.
Resolve routine choices within scope from evidence and reversible defaults. Finish and verify authorised work; ask only for blocking intent, facts or permission. Require explicit authorisation for destructive, irreversible, costly, permission-sensitive or consequential external actions, production changes or publication. Honour exact prior grants and required holds.
Keep notes in context and evidence in tool output. Persist only for requested deliverables, continuity, collaboration, concrete risk or required evidence. Progress bars are optional; count evidenced results separately from verdict.
Use BCP 14 only for normative force; name actor, action and check. Before risk, warn, verify safe state and add needed holds. State expected result, failure sign and recovery. Explain or contrast only when useful.
