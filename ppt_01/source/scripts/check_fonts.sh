#!/usr/bin/env bash
set -euo pipefail

project_fonts=(
  "msyh.ttc:Microsoft YaHei regular"
  "msyhbd.ttc:Microsoft YaHei bold"
  "msyhl.ttc:Microsoft YaHei light"
  "seguibl.ttf:Segoe UI Black"
  "ariblk.ttf:Arial Black fallback"
)

echo "Project-local fonts used by LaTeX:"
for item in "${project_fonts[@]}"; do
  file="${item%%:*}"
  label="${item#*:}"
  path="fonts/${file}"
  printf '%-28s -> ' "$label"
  if [[ -f "$path" ]]; then
    fc-scan -f "%{family} | %{style} | $path\n" "$path" | head -n 1
  else
    echo "missing: $path"
  fi
done

echo
echo "System fallbacks, used only if project-local fonts are absent:"
for font in "Noto Sans CJK SC" "Source Han Sans SC" "WenQuanYi Micro Hei"; do
  printf '%-28s -> ' "$font"
  fc-match -f '%{family} | %{style} | %{file}\n' "$font"
done
