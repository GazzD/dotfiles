-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("XCURSOR_SIZE", "24")

-- Fcitx5 input method (fixes dead keys / accents in terminals under Wayland)
-- hl.env("GTK_IM_MODULE", "fcitx")
hl.env("QT_IM_MODULE", "fcitx")
hl.env("XMODIFIERS", "@im=fcitx")
hl.env("SDL_IM_MODULE", "fcitx")
hl.env("GLFW_IM_MODULE", "ibus")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("APP2UNIT_SLICES", "a=app-graphical.slice b=background-graphical.slice s=session-graphical.slice")

-- -- XDG
-- hl.env("XDG_SESSION_DESKTOP", "Hyprland")
-- hl.env("XDG_CONFIG_HOME", "~/.config")
-- hl.env("XDG_DATA_HOME", "~/.local/share")
-- hl.env("XDG_STATE_HOME", "~/.local/state")
-- hl.env("XDG_CACHE_HOME", "~/.cache")

-- Qt Variables
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")         -- (From the Qt documentation) enables automatic scaling, based on the monitor's pixel density
hl.env("QT_QPA_PLATFORM", "wayland;xcb")           -- Tell Qt applications to use the Wayland backend, and fall back to X11 if Wayland is unavailable
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1") -- Disables window decorations on Qt applications
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")            -- Tells Qt based applications to pick your theme from qt5ct, use with Kvantum.
hl.env("GSK_RENDERER", "gl")
local home = os.getenv("HOME")
hl.env("PATH",
    home ..
    "/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl")
