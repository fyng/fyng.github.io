#!/usr/bin/env bash
# Copy a rendered graphical abstract into the website's assets.
#   ./publish.sh precision-safety
# Then reference it from a bib entry: graphical_abstract={precision-safety}
set -euo pipefail
cd "$(dirname "$0")"
slug="$1"
dest=../assets/img/graphical_abstracts
mkdir -p "$dest"
for ext in png mp4 webm; do
  cp "out/$slug.$ext" "$dest/$slug.$ext"
done
# small poster for the publication preview slot
ff=${FFMPEG:-$(command -v ffmpeg || python3 -c "import imageio_ffmpeg;print(imageio_ffmpeg.get_ffmpeg_exe())")}
"$ff" -loglevel error -y -i "out/$slug.png" -vf "scale=640:-1:flags=lanczos" "$dest/$slug-thumb.png"
echo "published $slug -> $dest"
