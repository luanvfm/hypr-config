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
    -- Inicia no grupo 1 apenas os monitores que estiverem conectados.
    -- A ordem deixa o foco no monitor central quando ele estiver presente.
    local startupWorkspaces = {
        { monitor = "eDP-1",    workspace = 101 },
        { monitor = "DVI-I-2",  workspace = 301 },
        { monitor = "HDMI-A-1", workspace = 201 },
    }

    for _, target in ipairs(startupWorkspaces) do
        if hl.get_active_workspace(target.monitor) then
            hl.dispatch(hl.dsp.focus({ workspace = target.workspace }))
        end
    end
    --Pros monitores funcionarem
    hl.exec_cmd("sleep 10 && hyprctl reload")
    end)
