#!/usr/bin/env bash
set -euo pipefail

runtime_dir="${XDG_RUNTIME_DIR:?XDG_RUNTIME_DIR nao definido}"
pid_file="$runtime_dir/hyprland-region-recording.pid"
path_file="$runtime_dir/hyprland-region-recording.path"

if test -s "$pid_file" && kill -0 "$(<"$pid_file")" 2>/dev/null; then
    video_file="$(<"$path_file")"
    jq -cn \
        --arg text '● REC' \
        --arg tooltip "Gravando: $video_file\nSuper + Ctrl + R para parar." \
        '{text: $text, tooltip: $tooltip, class: "recording"}'
else
    printf '%s\n' '{"text":"","class":"idle"}'
fi
