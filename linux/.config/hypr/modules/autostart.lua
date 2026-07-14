-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function()
    hl.exec_cmd("gnome-keyring-daemon --start --daemonize --components=secrets")
    hl.exec_cmd("app2unit -- waybar")
    hl.exec_cmd("app2unit -- swaync")
    hl.exec_cmd("app2unit -- hypridle")
    hl.exec_cmd("app2unit -- awww-daemon")
    hl.exec_cmd("app2unit -- walker --gapplication-service")
    hl.exec_cmd("app2unit -- clipse -listen")
    -- hl.exec_cmd("app2unit -- matuwall --daemon")
    hl.exec_cmd("hyprpm reload -n")
    hl.exec_cmd("fcitx5 -d")
    hl.exec_cmd("qs -c overview") -- Workspace overview quickshell 
    
end)
