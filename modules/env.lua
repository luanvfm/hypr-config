-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Cursor themes (hypercursor for Hyprland, xcursor for GTK fallback)
hl.env("HYPRCURSOR_THEME", "catppuccin-mocha-dark-cursors")
hl.env("XCURSOR_THEME", "catppuccin-mocha-dark-cursors")

-- Toolkit Backend

hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")

-- GTK Theme (force GTK apps to use Catppuccin Mocha)
hl.env("GTK_THEME", "catppuccin-mocha-mauve-standard+default")
hl.env("GTK_ICON_THEME", "Papirus-Dark")
hl.env("GTK_CURSOR_THEME", "catppuccin-mocha-dark-cursors")
hl.env("GTK_CURSOR_SIZE", "24")


-- XDG Specifications

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- QT
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")


