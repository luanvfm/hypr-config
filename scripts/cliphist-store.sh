#!/usr/bin/env bash
set -euo pipefail

# Recebe texto do wl-paste pela entrada padrao e mantem apenas 50 itens.
cliphist store -max-items 50 -min-store-length 3
