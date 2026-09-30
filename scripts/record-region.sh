#!/usr/bin/env bash
set -euo pipefail

runtime_dir="${XDG_RUNTIME_DIR:?XDG_RUNTIME_DIR nao definido}"
pid_file="$runtime_dir/hyprland-region-recording.pid"
path_file="$runtime_dir/hyprland-region-recording.path"

if test -s "$pid_file" && kill -0 "$(<"$pid_file")" 2>/dev/null; then
    video_file="$(<"$path_file")"
    kill -INT "$(<"$pid_file")"

    for _ in {1..100}; do
        kill -0 "$(<"$pid_file")" 2>/dev/null || break
        sleep 0.1
    done

    if kill -0 "$(<"$pid_file")" 2>/dev/null; then
        notify-send -u critical 'Gravacao ainda esta finalizando' 'Aguarde alguns segundos e tente parar novamente.'
        exit 1
    fi

    rm -f "$pid_file"
    rm -f "$path_file"
    notify-send 'Gravacao salva' "$video_file"
    exit 0
fi

rm -f "$pid_file"
rm -f "$path_file"
geometry="$(slurp)" || exit 0
video_dir="$(xdg-user-dir VIDEOS)"
mkdir -p "$video_dir"
video_file="$video_dir/gravação-$(date +%Y-%m-%d_%H-%M-%S).mp4"

wf-recorder -g "$geometry" -f "$video_file" &
printf '%s\n' "$!" > "$pid_file"
printf '%s\n' "$video_file" > "$path_file"
notify-send 'Gravacao iniciada' "Indicador ● REC na Waybar. Super + Ctrl + R para parar."
