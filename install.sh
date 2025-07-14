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

# Install eza
cargo install eza

# Install zoxide
cargo install zoxide

# Install lazygit
'''go install github.com/jesseduffield/lazygit@latest

# Install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Installation complete!"
''
