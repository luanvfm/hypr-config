-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
------------------
---- MONITORS ----
------------------

-- Notebook
hl.monitor({
    output   = "eDP-1",
    mode     = "1920x1080@60",
    position = "0x0",
    scale    = "1.25",
})

-- Monitor
 hl.monitor({
    output = "HDMI-A-1",
    mode = "1360x768@60",
    position = "1536x0",
    scale = "1",
})

-- Workspaces 1-5 on main monitor
hl.workspace_rule({ workspace = "1", monitor = "eDP-1", persistent = true})
hl.workspace_rule({ workspace = "2", monitor = "eDP-1", persistent = true})
hl.workspace_rule({ workspace = "3", monitor = "eDP-1", persistent = true})
hl.workspace_rule({ workspace = "4", monitor = "eDP-1", persistent = true})
hl.workspace_rule({ workspace = "5", monitor = "eDP-1", persistent = true})