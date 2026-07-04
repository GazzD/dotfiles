#!/usr/bin/env bash

# Waybar Theme Switcher - TokyoNight / Dracula
# Usage: waybar-theme.sh [tokyonight|dracula]

WAYBAR_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/waybar"
COLORS_FILE="$WAYBAR_DIR/tokens/colors.css"
TOKYONIGHT_FILE="$WAYBAR_DIR/tokens/colors-tokyonight.css"
DRACULA_FILE="$WAYBAR_DIR/tokens/colors-dracula.css"

theme="${1:-tokyonight}"

case "$theme" in
    tokyonight|tokyo)
        echo "Switching to TokyoNight Storm theme..."
        cp "$TOKYONIGHT_FILE" "$COLORS_FILE" 2>/dev/null || {
            echo "Error: TokyoNight theme file not found!"
            exit 1
        }
        ;;
    dracula|drac)
        echo "Switching to Dracula theme..."
        cp "$DRACULA_FILE" "$COLORS_FILE" 2>/dev/null || {
            echo "Error: Dracula theme file not found!"
            exit 1
        }
        ;;
    *)
        echo "Usage: $0 [tokyonight|dracula]"
        echo ""
        echo "Available themes:"
        echo "  tokyonight (default) - TokyoNight Storm retro hacker theme"
        echo "  dracula              - Dracula retro hacker theme"
        exit 1
        ;;
esac

# Reload waybar
if pgrep -x waybar > /dev/null; then
    echo "Reloading waybar..."
    killall -SIGUSR2 waybar 2>/dev/null || {
        killall waybar
        waybar &
    }
    echo "Theme switched to: $theme"
else
    echo "Waybar is not running. Start it to see the new theme."
fi
