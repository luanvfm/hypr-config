---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal    = "kitty"
local fileManager = "thunar"
local menu        = "rofi -show drun"
local browser     = "flatpak run app.zen_browser.zen"

-- TODO: GRAVAR TELA
-- TODO: CLIPBOARD HISTORY
hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("systemctl suspend"), { locked = true })

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local printScreen = "code:107"

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd(browser))

local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(mainMod .. " + M",
    hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("/home/linho/.config/waybar/scripts/launch.sh"))
hl.bind(mainMod .. " + period", hl.dsp.exec_cmd("code"))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(printScreen, hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy -t image/png'))
hl.bind(mainMod .. " + TAB", hl.dsp.exec_cmd("rofi -show window"))
hl.bind(mainMod .. " + SHIFT + I", hl.dsp.exec_cmd("hyprpicker -a -n"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind(mainMod .. " + SHIFT + slash", hl.dsp.exec_cmd("/home/linho/.config/hypr/scripts/shortcuts.sh"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Super + Shift + D alterna entre seus workspaces atuais e tres workspaces vazios.
-- A lista termina no monitor central para manter o foco nele ao esconder janelas.
local desktopWorkspaces = {
    { monitor = "eDP-1",    workspace = 901 },
    { monitor = "DVI-I-2",  workspace = 903 },
    { monitor = "HDMI-A-1", workspace = 902 },
}

local function toggle_desktop()
    local desktop_is_visible = true

    for _, target in ipairs(desktopWorkspaces) do
        local active = hl.get_active_workspace(target.monitor)
        if not active or active.id ~= target.workspace then
            desktop_is_visible = false
            break
        end
    end

    for _, target in ipairs(desktopWorkspaces) do
        local workspace = target.workspace
        if desktop_is_visible then
            local last = hl.get_last_workspace(target.monitor)
            workspace = last and last.id or workspace
        end
        hl.dispatch(hl.dsp.focus({ workspace = workspace }))
    end
end

hl.bind(mainMod .. " + SHIFT + D", toggle_desktop)

-- Workspaces em grupos: cada numero tem um espaco em cada monitor.
local workspaceBaseByMonitor = {
    ["eDP-1"] = 100,
    ["HDMI-A-1"] = 200,
    ["DVI-I-2"] = 300,
}

local function active_monitor_workspace(group)
    local monitor = hl.get_active_monitor()
    local base = monitor and workspaceBaseByMonitor[monitor.name]
    return base and base + group or nil
end

for group = 1, 5 do
    -- Super + F1-F5 troca o grupo inteiro e termina no monitor central.
    hl.bind(mainMod .. " + F" .. group, function()
        hl.dispatch(hl.dsp.focus({ workspace = 100 + group }))
        hl.dispatch(hl.dsp.focus({ workspace = 300 + group }))
        hl.dispatch(hl.dsp.focus({ workspace = 200 + group }))
    end)

    -- Super + 1-5 altera somente o workspace do monitor em foco.
    hl.bind(mainMod .. " + " .. group, function()
        local workspace = active_monitor_workspace(group)
        if workspace then
            hl.dispatch(hl.dsp.focus({ workspace = workspace }))
        end
    end)

    -- Super + Shift + 1-5 move a janela no monitor em foco para esse numero.
    hl.bind(mainMod .. " + SHIFT + " .. group, function()
        local workspace = active_monitor_workspace(group)
        if workspace then
            hl.dispatch(hl.dsp.window.move({ workspace = workspace }))
        end
    end)
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Open Swaync control center
-- hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd("swaync-client -t -sw"))

hl.config({
    misc = {
        middle_click_paste = false,
    },
})

hl.bind(
    "mouse:274",
    hl.dsp.exec_cmd("wl-copy -pc"),
    { non_consuming = true }
)
