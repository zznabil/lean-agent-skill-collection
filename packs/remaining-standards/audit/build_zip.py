"""Build a deterministic archive after directly validating the actual source."""
import os
from pathlib import Path
import sys
sys.dont_write_bytecode = True
import tempfile
import zipfile
from validate_bundle import validate

def build(root: Path, target: Path) -> None:
    root = root.resolve(); target = target.resolve()
    if target.is_relative_to(root):
        raise ValueError('Write the ZIP outside the source pack')
    validate(root)
    fd, temporary_name = tempfile.mkstemp(prefix=target.name + '.', suffix='.tmp', dir=target.parent)
    os.close(fd)
    temporary = Path(temporary_name)
    try:
        with zipfile.ZipFile(temporary, 'w', compression=zipfile.ZIP_DEFLATED, compresslevel=9) as z:
            for path in sorted(p for p in root.rglob('*') if p.is_file()):
                info = zipfile.ZipInfo('lean-remaining-standards/' + path.relative_to(root).as_posix(), (2026, 9, 13, 0, 0, 0))
                info.create_system = 3
                info.external_attr = 0o100644 << 16
                info.compress_type = zipfile.ZIP_DEFLATED
                z.writestr(info, path.read_bytes(), compress_type=zipfile.ZIP_DEFLATED, compresslevel=9)
        with zipfile.ZipFile(temporary) as z:
            if z.testzip() is not None:
                raise ValueError('Archive integrity check failed')
            for member in z.infolist():
                relative = member.filename.removeprefix('lean-remaining-standards/')
                if z.read(member) != (root / relative).read_bytes():
                    raise ValueError('Archive/source bytes differ')
        os.replace(temporary, target)
    finally:
        temporary.unlink(missing_ok=True)

if __name__ == '__main__':
    root = Path(__file__).resolve().parents[1]
    if len(sys.argv) != 2:
        raise SystemExit('Usage: python audit/build_zip.py /path/outside/source/output.zip')
    build(root, Path(sys.argv[1]))
    print('Built and read back: ' + sys.argv[1])
