#!/bin/bash

# Exit on error
set -e

# Update package list
sudo apt-get update

# Install packages
sudo apt-get install -y fzf fd-find imagemagick stow

# Install ast-grep
cargo install ast-grep

# Install mermaid-cli
npm install -g @mermaid-js/mermaid-cli

# Upgrade pynvim
pipx install --upgrade pynvim

# Install Yazi
cargo install --locked yazi-fm yazi-cli

echo "Installation complete!"
