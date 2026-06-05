--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name           = "suppress-maximize-events",
    match          = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name     = "fix-xwayland-drags",
    match    = {
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

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})


-- Binds workspaces 1 to 5 to your main monitor (e.g., DP-1)

-- hl.workspace_rule({ workspace = "11", monitor = "DP-1", persistent = true })
-- hl.workspace_rule({ workspace = "12", monitor = "DP-1", persistent = true })
-- hl.workspace_rule({ workspace = "13", monitor = "DP-1", persistent = true })
-- hl.workspace_rule({ workspace = "14", monitor = "DP-1", persistent = true })
-- hl.workspace_rule({ workspace = "15", monitor = "DP-1", persistent = true })

-- Binds workspaces 6 to 10 to your secondary monitor (e.g., HDMI-A-1)
-- for i = 1, 5 do
--     local rightMonitorKey = tostring(i)
--     local leftMonitorKey = tostring(i + 10)
--     hl.workspace_rule({ workspace = rightMonitorKey, monitor = "HDMI-A-1", persistent = true })
--     hl.workspace_rule({ workspace = leftMonitorKey, monitor = "DP-1", persistent = true })
-- end

-- hl.workspace_rule({ workspace = "2", monitor = "HDMI-A-1", persistent = true })
-- hl.workspace_rule({ workspace = "3", monitor = "HDMI-A-1", persistent = true })
-- hl.workspace_rule({ workspace = "4", monitor = "HDMI-A-1", persistent = true })
-- hl.workspace_rule({ workspace = "5", monitor = "HDMI-A-1", persistent = true })

-- Center floating windows
hl.window_rule({
    name   = "Alacritty",
    match  = { class = "Alacritty" },
    float  = true,
    center = true
})

--
-- Matuwall window rules
hl.window_rule({
    name           = "matuwall-rules",
    match          = { class = "com\\.kwimy\\.Matuwall" },
    float          = true,
    animation      = "slide top",
    rounding       = 15,
    border_size    = 0,
    rounding_power = 2,
    no_shadow      = true,
})

hl.layer_rule({
    match        = { namespace = "matuwall" },
    blur         = true,
    ignore_alpha = 0.5,
})

hl.layer_rule({
    match     = { namespace = "matuwall-backdrop" },
    animation = "fade"
})
