"""Reject an altered publisher reference even after normal inventories are regenerated."""
import hashlib,json,shutil,tempfile
from pathlib import Path
from validate_bundle import validate,InvalidPack
ROOT=Path(__file__).resolve().parents[1]
def rehash(root):
    (root/'CHECKSUMS.sha256').write_bytes(''.join(f'{hashlib.sha256(p.read_bytes()).hexdigest()}  {p.relative_to(root).as_posix()}\n' for p in sorted(root.rglob('*')) if p.is_file() and p.name!='CHECKSUMS.sha256').encode())
assert validate(ROOT)['skills']==70
with tempfile.TemporaryDirectory() as temp:
    root=Path(temp)/'pack';shutil.copytree(ROOT,root)
    path=root/'SOURCE-MANIFEST.json'; data=json.loads(path.read_text())
    entry=next(x for x in data if x['skill']=='standard-owasp-asvs' and x['path'].endswith('.pdf'))
    ref=root/entry['path']; raw=ref.read_bytes().replace(b'%PDF-',b'%PDF-',1)+b'\nAltered source\n'
    ref.write_bytes(raw);entry['sha256']=hashlib.sha256(raw).hexdigest();entry['bytes']=len(raw)
    path.write_text(json.dumps(data),encoding='utf-8');rehash(root)
    try:validate(root)
    except InvalidPack as exc:
        assert 'Independent publisher baseline changed' in str(exc),str(exc)
    else:raise AssertionError('Modified publisher reference accepted')
assert validate(ROOT)['skills']==70
print('PASS: independent publisher baseline rejection and restored positives')
