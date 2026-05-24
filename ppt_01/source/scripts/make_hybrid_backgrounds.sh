#!/usr/bin/env bash
set -euo pipefail

text_ref_dir="reference/百态冬韵"
blank_ref_dir="reference/百态冬韵_无文字"
out_dir="assets/hybrid"

mkdir -p "$out_dir"

require_blank_exports() {
  if [[ ! -d "$blank_ref_dir" ]]; then
    echo "Missing $blank_ref_dir. Export the no-text PPT pages there first." >&2
    exit 1
  fi
}

copy_blank_slide() {
  local slide="$1"
  local out="$2"
  cp "$blank_ref_dir/幻灯片${slide}.png" "$out_dir/$out"
}

copy_region_from_text_ref() {
  local slide="$1"
  local dst="$2"
  local geom="$3"
  local offset="$4"
  local tmp
  tmp="$(mktemp --suffix=.png)"
  convert "$text_ref_dir/幻灯片${slide}.png" -crop "$geom" +repage "$tmp"
  composite -geometry "$offset" "$tmp" "$dst" "$dst"
  rm -f "$tmp"
}

require_blank_exports

# Full-slide no-text backgrounds exported from WPS. This avoids the visible
# white rectangles caused by erasing placeholder text from rendered slides.
copy_blank_slide 1 cover_bg.png
copy_blank_slide 2 toc_bg.png
copy_blank_slide 3 section01_bg.png
copy_blank_slide 4 slide04_bg.png
copy_blank_slide 5 slide05_bg.png
copy_blank_slide 6 section02_bg.png
copy_blank_slide 7 slide07_bg.png
copy_blank_slide 8 slide08_bg.png
copy_blank_slide 9 slide09_bg.png
copy_blank_slide 10 section03_bg.png
copy_blank_slide 11 slide11_bg.png
copy_blank_slide 12 slide12_bg.png
copy_blank_slide 13 section04_bg.png
copy_blank_slide 14 slide14_bg.png
copy_blank_slide 15 slide15_bg.png
copy_blank_slide 16 thanks_bg.png

# The large hollow section numbers are custom PPT shapes. Keep them as
# rendered image regions, while all ordinary titles/body text are LaTeX.
copy_region_from_text_ref 2 "$out_dir/toc_bg.png" 190x125+190+340 +190+340
copy_region_from_text_ref 2 "$out_dir/toc_bg.png" 190x125+190+620 +190+620
copy_region_from_text_ref 2 "$out_dir/toc_bg.png" 190x125+1035+340 +1035+340
copy_region_from_text_ref 2 "$out_dir/toc_bg.png" 190x125+1035+615 +1035+615

copy_region_from_text_ref 3 "$out_dir/section01_bg.png" 180x125+190+325 +190+325
copy_region_from_text_ref 6 "$out_dir/section02_bg.png" 180x125+190+325 +190+325
copy_region_from_text_ref 10 "$out_dir/section03_bg.png" 180x125+190+325 +190+325
copy_region_from_text_ref 13 "$out_dir/section04_bg.png" 180x125+190+325 +190+325
