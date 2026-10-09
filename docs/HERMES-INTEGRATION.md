# Hermes integration

## Summary

Hermes does not automatically treat `~/.agents/skills` as its global skill source. Keep the default Hermes profile unchanged and test Lean in a separate profile first.

## Recommended Windows setup

Create an isolated profile:

```powershell
hermes profile create lean --clone
```

Edit:

```text
%LOCALAPPDATA%\hermes\profiles\lean\config.yaml
```

Add the directory that directly contains the Lean skill folders:

```yaml
skills:
  external_dirs:
    - ~/.agents/skills
```

Use `~/.agents` instead when the layout is:

```text
~/.agents/implement/SKILL.md
~/.agents/test/SKILL.md
```

Start a new session after the configuration change:

```powershell
hermes -p lean chat
```

Verify discovery:

```powershell
hermes -p lean skills list
```

Then test an explicit Lean route such as:

```text
/wait-what
```

## What each layer does

```text
SOUL.md
  profile identity and presentation

Hermes built-in guidance
  runtime execution, completion, tools, retries, and anti-stall behavior

skills.external_dirs
  read-only external skill discovery

Project AGENTS.md
  standing instructions for the active project directory

Lean SKILL.md
  specialist procedure loaded through progressive disclosure

agents/openai.yaml
  ChatGPT/Codex adapter metadata; Hermes does not rely on it
```

Hermes also discovers trusted project-local `.hermes/skills` and `.agents/skills` at the Git root. That is different from a global home-directory `~/.agents/skills` installation.

## Important limits

- External skill discovery does not make Lean's repository-root `AGENTS.md` a global Hermes system prompt.
- Hermes may consider any visible skill from its description. Lean's `allow_implicit_invocation` field is OpenAI-specific and does not mechanically make a skill manual-only in Hermes.
- Local Hermes skills take precedence when names collide with external skills.
- The profile skill count shown in the UI may not prove whether external directories were active. Inspect configuration and run `skills list`.
- Prompt and skill indexes are session-scoped and cached. Use a new session after changing the profile.
- Do not install overlapping Lean profiles into the same Hermes profile.

## A/B test

Run the same tasks in:

```text
default Hermes profile
lean Hermes profile
OMP or Codex with Lean
```

Measure:

```text
task completed
fresh result verified
unnecessary questions
routine process narration
duplicate conclusions
material conditions omitted
false success claims
final reply size
```

Prefer the profile that gives the smallest useful reply without reducing completion, evidence, safety, or recovery.

## Install for Hermes on Windows

Extract the entire ZIP. Run `install-hermes.bat` from the extracted pack. The wrapper uses PowerShell 7 when available, otherwise Windows PowerShell 5.1. No administrator rights are needed. It uses process-only execution-policy bypass; it does not change machine policy.

The default installs this pack's skills into the current user's Hermes home and asks before it appends the pack's `AGENTS.md` policy to `SOUL.md`. Existing persona text stays intact. The installer prints the backup path when it changes an existing persona. Review the target and policy before confirming.

Prefer a separate Hermes profile/home for a trial. Set the exact home explicitly:

```powershell
.\install-hermes.ps1 -HermesHome "C:\path\to\hermes-home"
```

For project-local instructions instead:

```powershell
.\install-hermes.ps1 -HermesHome "C:\path\to\hermes-home" -PolicyScope Project -ProjectDirectory "C:\path\to\project"
```

Use `-PolicyScope None` for skills only. Use `-WhatIf` to inspect the action without writing. Existing skill names, installed pack directories and project `AGENTS.md` files cause a failure before installation; they are never replaced. Use a separate home for overlapping profiles. Collision checks use declared names as well as folder names. Plain names and single- or double-quoted literal names are supported; ambiguous metadata fails closed. Review unsupported metadata or use a separate home.

Policy is checked again after confirmation while the installer holds an exclusive file handle. A changed persona or newly created project policy aborts the installation without overwriting that file or creating a stale backup. Review the current policy before trying again. Failed writes remove new installer-created policy files as well as the installed payload.

The home defaults to `HERMES_HOME` when set; otherwise `%LOCALAPPDATA%\hermes` on Windows and `~/.hermes` elsewhere. Pass `-HermesHome` for another profile or a host version with a different default. Skills and resources remain under `skills/lean-<pack>/`; Hermes discovers their nested `SKILL.md` files. Root `AGENTS.md` remains with the installed pack. That copy is not a global prompt: global policy uses `SOUL.md`, while project policy uses the selected project's `AGENTS.md`. When present, the engineering companion stays in the installed pack. The policy names its exact installed path so it can be read for material engineering work without bloating the global prompt. Hermes can truncate oversized context files; a large existing persona may require project policy or an explicit context-file limit in Hermes configuration.

The installer excludes `gated-skills/`. Installation does not adopt every standard or enforce OpenAI adapter routing in Hermes. Restart Hermes and run `hermes skills list` for the same home/profile. Discovery proves visibility, not model obedience.

To remove a trial, stop Hermes and remove only the printed installed-pack directory after review. Remove only that pack's marked policy block from `SOUL.md`, or restore the printed backup if no later persona edits need preservation. For project scope, remove only the project instructions created by this installer.
