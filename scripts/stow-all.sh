#!/bin/bash

DOTFILES_DIR="$(dirname "$(dirname "$(readlink -f "$0")")")"
TARGET_DIR="$HOME"

# List of dotfile directories to manage (excluding .git and scripts)
MODULES=$(find "$DOTFILES_DIR" -maxdepth 1 -mindepth 1 -type d \( ! -name ".git" -a ! -name "scripts" \) -printf "%f\n")

echo "Stowing all dotfiles..."
for module in $MODULES; do
    echo "Stowing $module..."
    stow -t "$TARGET_DIR" -d "$DOTFILES_DIR" "$module"
done
echo "All dotfiles stowed."

