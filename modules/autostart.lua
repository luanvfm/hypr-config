-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
 hl.on("hyprland.start", function () 
    hl.exec_cmd("waybar")
    hl.exec_cmd("swaync")
    hl.exec_cmd("awww-daemon")
    -- Historico de clipboard: apenas texto, limitado a 50 entradas.
    hl.exec_cmd("wl-paste --type text --watch /home/linho/.config/hypr/scripts/cliphist-store.sh")
    hl.exec_cmd("xrandr --output [HDMI-A-1] --primary")
    -- Inicia cada monitor no grupo 1 e deixa o foco no monitor central.
    hl.dispatch(hl.dsp.focus({ workspace = 101 }))
    hl.dispatch(hl.dsp.focus({ workspace = 301 }))
    hl.dispatch(hl.dsp.focus({ workspace = 201 }))
    --Pros monitores funcionarem
    hl.exec_cmd("sleep 10 && hyprctl reload")
    end)
