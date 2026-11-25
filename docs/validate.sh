#!/usr/bin/env bash
# Extrahiert alle inline <script>-Blöcke (ohne src, ohne JSON-LD) aus HTML-Dateien
# und prüft sie mit `node --check`. Aufruf: docs/validate.sh [datei.html ...]
# Ohne Argumente werden alle *.html im Repo-Root geprüft.
set -u
cd "$(dirname "$0")/.."
files=("$@")
[ ${#files[@]} -eq 0 ] && files=(*.html)
tmp=$(mktemp -d)
fail=0
for f in "${files[@]}"; do
  [ -f "$f" ] || continue
  node -e '
    const fs=require("fs");const [file,out]=process.argv.slice(1);
    const html=fs.readFileSync(file,"utf8");
    const re=/<script(\s[^>]*)?>([\s\S]*?)<\/script>/gi;let m,i=0;
    while((m=re.exec(html))){const a=m[1]||"";
      if(/\bsrc=/.test(a)||/type=["\x27]?(application\/ld\+json|application\/json)/i.test(a))continue;
      const ext=/type=["\x27]?module/i.test(a)?"mjs":"js";
      fs.writeFileSync(`${out}/${i++}.${ext}`,m[2]);}
    console.log(i);' "$f" "$tmp" >/dev/null
  for s in "$tmp"/*; do
    [ -e "$s" ] || continue
    if ! out=$(node --check "$s" 2>&1); then
      echo "FEHLER in $f (Script-Block $(basename "$s")):"; echo "$out"; fail=1
    fi
    rm -f "$s"
  done
  [ $fail -eq 0 ] && echo "OK  $f"
done
rm -rf "$tmp"
exit $fail
