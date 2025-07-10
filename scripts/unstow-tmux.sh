#!/bin/bash

DOTFILES_DIR="$(dirname "$(dirname "$(readlink -f "$0")")")"
TARGET_DIR="$HOME"

echo "Unstowing tmux..."
stow -D -t "$TARGET_DIR" -d "$DOTFILES_DIR" tmux
echo "tmux unstowed."
