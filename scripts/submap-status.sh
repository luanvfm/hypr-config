#!/usr/bin/env bash
set -euo pipefail

# O Hyprland responde "default" fora de um modo temporario e, por exemplo,
# "resize" enquanto o submap de redimensionamento estiver ativo.
submap="$(hyprctl submap 2>/dev/null || true)"

if test "$submap" = "resize"; then
    jq -cn \
        --arg text '󰘵 Resize' \
        --arg tooltip 'Modo de redimensionamento ativo\nSetas: ajustar tamanho • Escape: sair' \
        '{text: $text, tooltip: $tooltip, class: "mode-active"}'
else
    printf '%s\n' '{"text":"","class":"idle"}'
fi
