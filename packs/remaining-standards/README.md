# Lean remaining-standards prototype pack

## Start here

This ZIP provides **70 source-specific routines**. With the previous 27 user-facing routines, they complete the historical register. This optional prototype library does not replace canonical release profiles. It does not claim adoption of all 97 entries.

Read [CATALOG.md](CATALOG.md). Select the routine for the actual task. Then read its `SKILL.md` and `SOURCES.md`. The existing task skill retains ownership of the work. Do not install every routine just because it is available.

- `skills/` contains **63** optional application routines. Each has a task-specific trigger. Some require explicit project adoption.
- `gated-skills/` contains **7** off-default guard/watch/selection routines. Keep this directory outside automatic discovery unless you deliberately test that specific guard.
- Each `SKILL.md` contains **57–62 physical lines**, including frontmatter and blank lines. Each description has at most 60 characters.
- A skill's `official/` directory contains available original publisher/author references and their notices. Some sources have no available or redistributable PDF.

This pack adds opt-in Hermes installers and scoped `AGENTS.md`, but no hook, runtime or automatic prompt injection before installation. A prose description and trigger do not guarantee that a host enforces selection policy. When a host loads trusted root `AGENTS.md`, its communication policy governs every selected skill. Each `SKILL.md` also contains a standalone communication kernel. Use ASD-STE100-inspired short active technical sentences, ISO 704-inspired stable concepts and terminology, and Diátaxis purpose separation when helpful. This kernel applies with or without root policy, including direct standalone installs. Each routine retains its scoped steps, worked check and missing-evidence recovery. Do not claim that a host loaded root policy without evidence. Loading a language or standard routine does not permit an attack, release publication, production mutation or edits to trusted instructions.

## PDF and source coverage

The pack contains **26 PDF files representing 24 unique documents** across **20 entries**. The unique originals contain **1984 pages** in total. Repeated copies keep required sources local to skills that users can use independently. These files contain original bytes, not web-to-PDF conversions. The set contains formal publications, guidance, an author research draft, a NASA workshop record and a potential-errata sheet. Not all are normative standards.

### Source-byte safety
Bundled PDFs retain their source bytes. They may contain active-content markers. Do not execute embedded content. Open PDFs only in a patched, sandboxed viewer, or inspect them offline. This pack does not sanitize the bytes or claim that they are safe.

The NIST digital-identity routine contains the overview and the proofing, authentication and federation volumes. The AI SSDF routine contains its base SSDF publication. Adversarial-ML potential updates stay in a separate file. SARIF's PDF names its DOCX version as authoritative.

**Nineteen ISO/IEC/IEEE entries are source-gated.** The pack did not obtain full licensed standards. These compact routines apply Lean procedures using public scopes and existing Lean procedures. They do not provide complete clauses or reconstruct unavailable text. Obtain the exact authorised full source before a formal assessment. Do not substitute a similarly named standard or an outdated part.

Where appropriate, the pack bundles native OpenAPI, JSON Schema, SLSA, LLMSVS, AsyncAPI, CloudEvents and other permitted references in their actual formats. Labels identify partial indexes and schemas as partial. Links or images in native HTML snapshots may need online access. For unavailable or restricted PDFs, the pack retains official links and records the reason. It does not label an empty or unofficial substitute as an official standard.

Read [SOURCE-OBSERVATIONS.md](SOURCE-OBSERVATIONS.md) for source-identity corrections and access gaps. `provenance/` preserves the original 97-row register byte for byte. Observing a new or corrected source does not silently change adoption.

## Rights

This aggregation has mixed rights. CC BY-SA 4.0 covers new prose. MIT covers audit utility code. Original documents retain their own rights. Before redistribution, read [LICENSE.md](LICENSE.md), [THIRD-PARTY-NOTICES.md](THIRD-PARTY-NOTICES.md) and the individual source notes. A free download does not automatically grant a public redistribution licence.

## Verification

Use an extracted copy and Python 3.10 or newer. Run:

```sh
python audit/validate_bundle.py
python audit/test_validate_bundle.py
```

These read-only checks use the Python standard library. They mutate only temporary copies. `CHECKSUMS.sha256` lists every pack file except itself. The embedded `SOURCE-BASELINE.sha256` covers every file except the mutable ledgers and `audit/validate_bundle.py`. The validator pins that baseline. Refreshing only a checksum inventory cannot redefine content, rights or controls. A standalone extraction still needs trusted validator bytes.
The repository's `UPSTREAM-CHECKSUMS.sha256` separately pins this pack's checksum ledger. Pack-local validation does not prove that the root integration pin is current. After pack changes, update that root pin only through its authorised owner. `build_zip.py` excludes generated bytecode. It verifies a temporary archive before it atomically replaces the destination.
`audit/EXECUTED-RESULTS.json` records observed structural checks. The 210 cases in `audit/acceptance-cases.json` are authored cases, not executed model evaluations. The pack claims no invocation probability, semantic equivalence, comprehension gain or formal conformance.

## Preservation and use

Installing this optional pack does not itself change canonical task skills, release-profile membership, root safeguards, user-facing release packs or trusted user instructions. Check the host's discovery rules. Copy only selected skill folders into its documented directory. Keep skill-local source files with their owner. Repository changes outside this pack are separate from this installation boundary.

The companion all-97 ZIP keeps this pack separate from the PR16-derived user-facing standards pack. That user-facing pack is now the integrated pack with its documented CAST repair. The companion ZIP does not install 97 active skills as one profile.

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

Use `-PolicyScope None` for skills only. Use `-WhatIf` to inspect the action without writing. Existing skill names, installed pack directories and project `AGENTS.md` files cause a failure before installation; they are never replaced. Use a separate home for overlapping profiles.

The home defaults to `HERMES_HOME` when set; otherwise `%LOCALAPPDATA%\hermes` on Windows and `~/.hermes` elsewhere. Pass `-HermesHome` for another profile or a host version with a different default. Skills and resources remain under `skills/lean-<pack>/`; Hermes discovers their nested `SKILL.md` files. Root `AGENTS.md` remains with the installed pack. That copy is not a global prompt: global policy uses `SOUL.md`, while project policy uses the selected project's `AGENTS.md`. When present, the engineering companion stays in the installed pack. The policy names its exact installed path so it can be read for material engineering work without bloating the global prompt. Hermes can truncate oversized context files; a large existing persona may require project policy or an explicit context-file limit in Hermes configuration.

The installer excludes `gated-skills/`. Installation does not adopt every standard or enforce OpenAI adapter routing in Hermes. Restart Hermes and run `hermes skills list` for the same home/profile. Discovery proves visibility, not model obedience.

To remove a trial, stop Hermes and remove only the printed installed-pack directory after review. Remove only that pack's marked policy block from `SOUL.md`, or restore the printed backup if no later persona edits need preservation. For project scope, remove only the project instructions created by this installer.
