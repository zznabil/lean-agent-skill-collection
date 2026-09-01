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
