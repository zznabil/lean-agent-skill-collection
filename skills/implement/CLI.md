# Command-line contracts

Use existing parser and conventions. Required inputs need a noninteractive path; document defaults, prerequisites, examples and exit codes. Keep results on stdout and diagnostics on stderr. Machine output must be stable and independent of colour, TTY presence and progress messages.

Validate inputs and report useful failures. Do not return exit zero after partial failure. Cover empty input, invalid options, cancellation, broken pipes and required retry/recovery behaviour. Destructive operations need the agreed confirmation or dry-run boundary, not an invented blanket exemption.

Keep secrets out of command arguments when a safer input channel exists. Clean temporary resources and propagate meaningful failures. Verify the documented invocation in a clean noninteractive environment, including an expected failure, before claiming it works.
