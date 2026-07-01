---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local app               = "app2unit -- "
local terminal          = app .. "ghostty"
local fileManager       = app .. "thunar"
local browser           = app .. "zen-browser"
local appLauncherRofi   = "~/.config/rofi/launchers/type-4/launcher.sh" --"rofi -show drun"
-- local walker            = app .. "walker --width 644 --maxheight 300 --minheight 300"
local walker            = "launch-walker"
local appLauncherWalker = walker
-- local clipboardHistory  = walker .. " -m clipboard -N -H"
local clipboardHistory  = "launch-or-focus-tui clipse"

local systemMenu        = walker .. " -m menus:system"
-- local wallpaperPicker   = walker ..
--     " -t wallpaper-picker -m menus:wallpapers --width 900 --maxheight 600 --minheight 500"
-- local wallpaperPicker   = "matuwall --toggle"
local wallpaperPicker   = "launch-or-focus-tui walt"
local scriptsFolder     = os.getenv("HOME") .. "/.config/hypr/modules/scripts"
local screenshot        = scriptsFolder .. "/screenshots.sh"

---------------------
---- Apps ----
---------------------

local mainMod           = "SUPER" -- Sets "Windows" key as main modifier

-- hl.bind(mainMod .. " + X", hl.dsp.exec_cmd("echo $PATH > /tmp/hypr-path.txt"))
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd("which launch-walker > /tmp/hypr-path.txt"))


hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + M",
    hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("hyprlock"))
-- hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(appLauncherRofi))  -- reemplazado por system menu
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(appLauncherWalker))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(clipboardHistory))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(systemMenu))              -- System / main menu
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd(wallpaperPicker)) -- Wallpaper picker

---------------------
------ Motions ------
---------------------

-- Window size
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized" }), { description = "Full width" })
hl.bind(mainMod .. " + Minus", hl.dsp.layout("splitratio -0.1"))
hl.bind(mainMod .. " + Equal", hl.dsp.layout("splitratio 0.1"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Move windows with mainMod + arrow keys
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
package.path = package.path .. ";/home/gazzd/Projects/split-monitor-workspaces/lua/?.lua"
local smw = require("split-monitor-workspaces")
smw.setup({
    workspace_count = 5, -- This will create 5 persistent workspaces on each monitor at startup
})

-- Switch workspaces with mainMod + [1-0]
for i = 1, smw.get_amount_of_workspaces() do
    local n = tostring(i)
    if n == "10" then n = "0" end -- Optional if you configured 10 workspaces: bind workspace 10 to SUPER + 0
    -- Switch to the Nth workspace on the currently focused monitor.
    hl.bind(mainMod .. " +" .. n, smw.workspace(n))
    -- Move the active window to the Nth workspace on the currently focused monitor.
    hl.bind(mainMod .. " + SHIFT +" .. n, smw.move_to_workspace(n))
end
-- for i = 1, 10 do
--     local key = i == 10 and "0" or tostring(i)
--     hl.bind(mainMod .. " + " .. key, function() return smw.workspace(i) end)
--     hl.bind(mainMod .. " + SHIFT + " .. key, function() return smw.move_to_workspace(i) end)
-- end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

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


hl.bind(mainMod .. "+ PERIOD", hl.dsp.exec_cmd("launch-walker -m symbols"))

-- Screenshot
hl.bind(mainMod .. "+ PRINT", hl.dsp.exec_cmd(screenshot))

-- Capturar un área seleccionada (equivalente a Flameshot gui)
-- # bind = , Print, exec, grim -g "$(slurp)" - |   --filename -
-- bind = , Print, exec, $screenshot

-- # Capturar toda la pantalla y editar
-- bind = CTRL, Print, exec, grim - | satty --filename -

-- # Capturar la ventana activa (requiere hyprctl)
-- bind = ALT, Print, exec, grim -g "$(hyprctl activewindow -j | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"') " - | satty --filename -
