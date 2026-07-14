#!/bin/bash
set -e

REPO_DIR="$(cd "$(dirname "$0")/.." && pwd)"
SECRETS="$REPO_DIR/secrets/env.sh"

[ -f "$SECRETS" ] && set -a && source "$SECRETS" && set +a

cd "$REPO_DIR"

if [ "$(uname)" = "Linux" ]; then
  STOW_DIR="linux"
elif [ "$(uname -o)" = "Msys" ] || [ -n "$WINDIR" ]; then
  STOW_DIR="windows"
else
  echo "Unknown OS"
  exit 1
fi

find "$STOW_DIR" -name '*.example' -exec sh -c '
  real="${1%.example}"
  if [ ! -f "$real" ]; then
    envsubst < "$1" > "$real"
    echo "  Generated: $real"
  fi
' _ {} \;

# Remove existing files that would conflict with stow symlinks
conflicts=$(stow --no "$STOW_DIR" -t "$HOME" 2>&1 | grep "cannot stow.*over existing" | sed "s/.*target //" | sed "s/ since.*//" || true)
if [ -n "$conflicts" ]; then
  echo "Removing conflicting files..."
  echo "$conflicts" | while read -r target; do
    if [ -f "$HOME/$target" ] && [ ! -L "$HOME/$target" ]; then
      rm "$HOME/$target"
      echo "  Removed: $target"
    fi
  done
fi

stow --restow "$STOW_DIR" -t "$HOME"

echo "Dotfiles deployed from $STOW_DIR"
