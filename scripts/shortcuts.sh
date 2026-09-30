#!/usr/bin/env bash
set -euo pipefail

printf '%s\n' \
  'GERAL' \
  'Super + D             Abrir aplicativos (Rofi)' \
  'Super + Tab           Trocar para uma janela aberta' \
  'Super + Shift + /      Abrir esta guia de atalhos' \
  'Super + Q             Abrir terminal' \
  'Super + Shift + Q     Abrir navegador' \
  'Super + E             Abrir arquivos' \
  'Super + R             Mostrar/esconder Waybar' \
  'Super + .             Abrir VS Code' \
  'JANELAS' \
  'Super + C             Fechar janela ativa' \
  'Super + V             Alternar janela flutuante' \
  'Super + F             Tela cheia' \
  'Super + setas         Mover o foco entre telas/janelas' \
  'Super + Shift + setas Mover a janela ativa de lugar pela direcao' \
  'Super + Shift + R     Entrar no modo de redimensionamento' \
  '  setas               Redimensionar em passos de 30 pixels' \
  '  Escape              Sair do modo de redimensionamento' \
  'Super + Shift + D     Mostrar/esconder janelas (wallpaper)' \
  'WORKSPACES' \
  'Super + F1...F5       Trocar o grupo nas tres telas' \
  'Super + 1...5         Trocar somente a tela em foco' \
  'Super + Shift + 1...5 Mover janela para esse numero na tela atual' \
  'Super + S             Mostrar/esconder janela magica' \
  'Super + Shift + S     Enviar janela para a janela magica' \
  'FERRAMENTAS' \
  'Print                 Capturar uma area e copiar' \
  'Super + Shift + I     Selecionar cor e copiar' \
  'Super + N             Abrir notificacoes' \
  'Super + Shift + V     Abrir historico de clipboard (50 textos)' \
  'Super + Ctrl + R      Iniciar/parar gravacao de uma area' \
  | rofi -dmenu -i -no-custom -p 'Atalhos Hyprland'
