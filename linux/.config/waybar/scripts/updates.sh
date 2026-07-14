#!/usr/bin/env bash

# Package updates module for Waybar (TUI style)
# Supports: pacman, yay, paru

# Try to detect which AUR helper is installed
if command -v paru &> /dev/null; then
    AUR_HELPER="paru"
elif command -v yay &> /dev/null; then
    AUR_HELPER="yay"
else
    AUR_HELPER="pacman"
fi

# Count updates
if [[ "$AUR_HELPER" == "pacman" ]]; then
    updates=$(checkupdates 2>/dev/null | wc -l)
else
    updates=$($AUR_HELPER -Qu 2>/dev/null | wc -l)
fi

# Output - always show something so drawer works
if [[ $updates -gt 0 ]]; then
    echo "[UPD $updates]"
else
    echo "[UPD ✓]"
fi
