------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "HDMI-A-1",
    mode     = "highres",
    position = "0x0",
    scale    = "auto",
})
hl.monitor({
    output   = "DP-1",
    mode     = "highres",
    position = "auto-right",
    scale    = "auto",
})
