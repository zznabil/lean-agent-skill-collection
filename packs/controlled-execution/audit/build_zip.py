#!/usr/bin/env python3
"""Create a deterministic validated review ZIP; never install it."""

from __future__ import annotations

import argparse
import os
import sys
import tempfile
import zipfile
from pathlib import Path

sys.dont_write_bytecode = True

from validate_pack import InvalidPack, inventory, require, validate


def build(root: Path, output: Path) -> None:
    root = root.resolve()
    output = output.resolve()
    require(not output.is_relative_to(root), "ZIP output must be outside the pack")
    require(not output.exists(), "refusing to overwrite an existing file")
    validate(root)
    source = inventory(root)
    output.parent.mkdir(parents=True, exist_ok=True)
    handle, temp_name = tempfile.mkstemp(
        prefix=output.name + ".",
        suffix=".tmp",
        dir=output.parent,
    )
    os.close(handle)
    temp_path = Path(temp_name)
    linked = False
    try:
        with zipfile.ZipFile(
            temp_path,
            "w",
            compression=zipfile.ZIP_DEFLATED,
            compresslevel=9,
        ) as archive:
            for relative, path in sorted(source.items()):
                item = zipfile.ZipInfo(
                    "lean-controlled-execution/" + relative,
                    (2026, 9, 19, 0, 0, 0),
                )
                item.create_system = 3
                item.external_attr = 0o100644 << 16
                item.compress_type = zipfile.ZIP_DEFLATED
                archive.writestr(item, path.read_bytes(), compresslevel=9)

        with zipfile.ZipFile(temp_path) as archive:
            require(archive.testzip() is None, "ZIP CRC failure")
            expected = {"lean-controlled-execution/" + name for name in source}
            require(
                set(archive.namelist()) == expected
                and len(archive.namelist()) == len(expected),
                "ZIP inventory mismatch",
            )
            for relative, path in source.items():
                member = "lean-controlled-execution/" + relative
                require(
                    archive.read(member) == path.read_bytes(),
                    f"ZIP source mismatch: {relative}",
                )

        # A same-directory hard link publishes the fully verified temp file
        # atomically and exclusively; it never exposes a partially copied ZIP.
        try:
            os.link(temp_path, output)
        except FileExistsError as exc:
            raise InvalidPack("refusing to overwrite an existing file") from exc
        linked = True
        temp_path.unlink()
        linked = False
    except BaseException:
        if linked:
            try:
                output.unlink()
            except OSError:
                pass
        raise
    finally:
        temp_path.unlink(missing_ok=True)
    print(f"PASS: validated review ZIP: {output}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("output", type=Path)
    args = parser.parse_args()
    build(Path(__file__).resolve().parents[1], args.output)
