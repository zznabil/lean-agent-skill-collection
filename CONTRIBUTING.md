# Contributing

Contributions should keep skills small, vendor-neutral, and evidence-driven.

## Before opening a pull request

1. Explain the problem and why an existing skill cannot own it.
2. Keep trigger and anti-trigger boundaries precise.
3. Preserve explicit permission checks for consequential actions.
4. Update the OpenAI adapter when skill metadata changes.
5. Run `./scripts/validate.ps1`.
6. Report runtime tests separately from static checks.

Do not add dependencies, installers, hooks, automatic updates, external integrations, or trusted-state mutation without an explicit design and security review.

## Licensing note

This repository does not yet include a project-wide contribution license. Discuss material contributions with the owner before submitting them.
