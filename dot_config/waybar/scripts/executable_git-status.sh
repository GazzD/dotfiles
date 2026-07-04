#!/usr/bin/env bash

# Git status module for Waybar (TUI style)
cd ~/Projects/dotfiles
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    # Not in a git repo - show indicator
    echo "[GIT -]"
    exit 0
fi

# Get current branch
branch=$(git branch --show-current 2>/dev/null)
[[ -z "$branch" ]] && branch="detached"

# Count changes
modified=$(git diff --name-only 2>/dev/null | wc -l)
staged=$(git diff --cached --name-only 2>/dev/null | wc -l)
untracked=$(git ls-files --others --exclude-standard 2>/dev/null | wc -l)

# Build status string
status=""
[[ $staged -gt 0 ]] && status+="󰐕$staged "
[[ $modified -gt 0 ]] && status+="󰏬$modified "
[[ $untracked -gt 0 ]] && status+="$untracked"

# Output
if [[ -n "$status" ]]; then
    echo "[GIT:$branch $status]"
else
    echo "[GIT:$branch ✓]"
fi
