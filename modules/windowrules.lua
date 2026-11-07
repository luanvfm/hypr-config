--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Cada grupo possui um workspace em cada monitor:
-- 101-105 no notebook, 201-205 no monitor central e 301-305 na TV.
for group = 1, 5 do
    hl.workspace_rule({ workspace = 100 + group, monitor = "eDP-1", persistent = true })
    hl.workspace_rule({ workspace = 200 + group, monitor = "HDMI-A-1", persistent = true })
    hl.workspace_rule({ workspace = 300 + group, monitor = "DVI-I-2", persistent = true })
end

-- Abre Sally Face no monitor central sem interferir nas transicoes do jogo.
hl.window_rule({
    name      = "sally-face-center",
    match     = { class = "^Sally Face\\.x86_64$" },
    workspace = 203,
})

-- Workspaces temporarios usados pelo atalho Super + D para mostrar o wallpaper.
-- Eles nao sao persistentes para nao virarem abas permanentes na Waybar.
hl.workspace_rule({ workspace = 901, monitor = "eDP-1" })
hl.workspace_rule({ workspace = 902, monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = 903, monitor = "DVI-I-2" })

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- O Hyprland, e nao o CSS da Waybar, anima a camada ao ocultar/mostrar.
hl.layer_rule({
    name      = "waybar-slide",
    match     = { namespace = "^waybar$" },
    animation = "slide top",
})

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})
