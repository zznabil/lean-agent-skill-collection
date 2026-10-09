# V8.16.0 — Hermes Pack Installers

## Changes

- Add `install-hermes.ps1` and `install-hermes.bat` to all six generated profiles and all three standalone source packs.
- Install skills and their companion resources into one user's Hermes home. No administrator access or machine execution-policy change is needed.
- Default Global mode appends the pack AGENTS policy to Hermes `SOUL.md` after confirmation. Preserve existing persona text and create a byte-preserving backup.
- Project mode creates `AGENTS.md` in an explicit existing project. None installs skills only. Refuse existing project instructions, duplicate packs and overlapping skill names before writing.
- Keep the 24 base skills, 27 integrated supplemental routines, six profile memberships, standalone pack boundaries and source-rights limits unchanged. Exclude off-default gated routines from installation.
- Pin BAT checkout line endings to LF so Windows preserves installer checksum bytes.
- Add installer boundary checks to both PowerShell CI jobs. Keep exact canonical installer bytes in archive validation; other executable payloads remain rejected.

## Install

Choose one profile ZIP and extract the entire archive before running its installer. Review the pack instructions and source-rights notices before trusting or redistributing them.

```bat
install-hermes.bat -WhatIf
install-hermes.bat
```

The terminal confirmation shows the skill count and destinations. `A` means Yes to All for this invocation, not administrator access or installation for all Windows users. Keep an existing terminal open to read success or failure output.

Optional modes:

```bat
install-hermes.bat -PolicyScope Project -ProjectDirectory "C:\your-project"
install-hermes.bat -PolicyScope None
install-hermes.bat -HermesHome "C:\your-hermes-home"
```

HermesHome follows `HERMES_HOME` when set, then `%LOCALAPPDATA%\hermes` on Windows or `~/.hermes` elsewhere. Global policy belongs in `SOUL.md`; Hermes does not load a user-global `AGENTS.md`. Project mode still installs skills in the selected user's Hermes home.

After `INSTALLED:` appears, restart Hermes and run `hermes skills list` in the same Hermes home. Do not rerun the installer to diagnose a closed window; first check whether the skills are installed. Choose one profile per Hermes home because profiles overlap. Standalone packs remain separate assets, not added profile membership. Their bundled references, adoption conditions and redistribution limits still apply.

## Recovery and limitations

Existing packs and project instructions are not overwritten. Collision checks include declared skill names. Plain names and single- or double-quoted literal names are supported; ambiguous metadata fails closed. Policy is checked again after confirmation under an exclusive file handle. Concurrent policy changes abort without overwriting them or creating a stale backup. Installation failures remove installer-owned payload changes and partial new policy files, and restore an existing persona from its backup when available. For manual rollback, stop Hermes, restore the reported `SOUL.md.lean-backup-*` file and remove only the matching installer-owned pack directory. Review installed companion paths before removing another pack. Do not delete unrelated skills or instructions.

Hermes limits loaded SOUL text to 20,000 characters. Engineering policy links the installed ENGINEERING-CORE.md companion rather than embedding it. A very large preexisting persona can still exceed that limit; the installer does not change Hermes configuration.

This is a terminal installer, not a graphical wizard. BAT selects PowerShell 7 when available and otherwise Windows PowerShell 5.1. It does not pause after completion. Run it from an open terminal to retain output. The release does not repair an existing broken Hermes launcher.

To return to the previous collection version, use v8.15.0 and restore its reviewed policy. Published history and release assets are not rewritten.

## Verification and evidence limits

Source identity is the Git tag v8.16.0. Generated profile artifacts use scripts/build-release.ps1 with fixed ZIP order and timestamps. Standalone packs use their existing audit/build_zip.py entrypoints. CHECKSUMS.sha256 and RELEASE-MANIFEST.json describe generated profile archives; standalone assets have a separate STANDALONE-CHECKSUMS.sha256. These are integrity inventories, not signed provenance, an SBOM or a security certification.

Installer checks cover preview, global policy, persona backup bytes, duplicate installation, skill collisions, protected project instructions, skills-only mode and missing payloads. The nine-pack smoke executes extracted BAT wrappers from paths with spaces and checks exact skill discovery and complete policy text with actual installed Hermes Python loader modules in isolated homes. No credentials or live-user Hermes home are changed by these checks.

A native full-text oracle caught and rejected SOUL truncation when the entire engineering companion was embedded. The final companion-path policy passes the untruncated loader check. The locally installed Hermes launcher was unusable; loader-module verification is not an interactive agent-session test or proof that a model obeys policy.

Release gates rebuild packages, compare artifact bytes, exercise broken archive and source controls, validate inventories and rights, inspect packaged instructions and check authored terminology. PowerShell 7 and Windows PowerShell 5.1 are supported build/test runtimes. Static checks and native loader results do not prove model performance, accessibility or formal standards conformance.
