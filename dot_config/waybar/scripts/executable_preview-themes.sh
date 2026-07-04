#!/usr/bin/env bash

# Waybar Theme Preview - Cycle between themes for comparison
# Usage: preview-themes.sh [delay_seconds]

WAYBAR_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/waybar"
SCRIPT_DIR="$WAYBAR_DIR/scripts"
DELAY="${1:-3}"

themes=("tokyonight" "dracula")

echo "🎨 Waybar Theme Preview"
echo "======================="
echo ""
echo "Cycling between themes every $DELAY seconds"
echo "Press Ctrl+C to stop"
echo ""

cycle=1
while true; do
    for theme in "${themes[@]}"; do
        echo "[$cycle] Showing: $theme"
        "$SCRIPT_DIR/executable_waybar-theme.sh" "$theme" > /dev/null 2>&1
        sleep "$DELAY"
    done
    ((cycle++))
done
