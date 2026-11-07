-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
------------------
---- MONITORS ----
------------------

-- Notebook: esquerda
hl.monitor({
    output        = "eDP-1",
    mode          = "1920x1080@60",
    position      = "-1536x248", -- 1920 / 1.25 = 1536 de largura lógica
    scale         = "1.25",
    cm            = "edid",
})

-- Monitor 180 Hz: centro
hl.monitor({
    output   = "HDMI-A-1",
    mode     = "1920x1080@180",
    position = "0x140",
    scale    = "1",
})

-- TV: direita
hl.monitor({
    output    = "DVI-I-2",
    mode      = "preferred",
    position  = "1920x0",
    scale     = "1",
    transform = 1,
})
