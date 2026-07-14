#!/bin/bash
set -e

REPO_DIR="$(cd "$(dirname "$0")/.." && pwd)"

cd "$REPO_DIR"

for dir in linux/.config/*/; do
  app=$(basename "$dir")
  src="$HOME/.config/$app"
  [ -d "$src" ] && rsync -a --ignore-existing "$src/" "$dir"
done

git add -A

echo "Staged new files. Review with: git diff --cached"
echo "Then: git commit -m \"...\" && ./scripts/deploy.sh"
