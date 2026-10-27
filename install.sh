#!/bin/sh
# Set up these dotfiles on Linux or macOS, no sudo needed:
#   sh install.sh                                                            from a checkout
#   curl -fsSL https://raw.githubusercontent.com/Pedrexus/dotfiles/main/install.sh | sh
# chezmoi is one static binary that needs no git, so a throwaway copy goes first and places the
# files at once. Its toolbox script (run_onchange_after_10-toolbox.sh.tmpl) then installs uv,
# mainboard and the locked toolbox, whose own chezmoi takes over from there.
set -eu

bin=$(mktemp -d)
trap 'rm -rf "$bin"' EXIT
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$bin"

here=$(cd "$(dirname "$0")" && pwd)
if [ -f "$here/.chezmoi.toml.tmpl" ]; then
    "$bin/chezmoi" init --apply --source "$here"
else
    "$bin/chezmoi" init --apply Pedrexus/dotfiles
fi

echo "dotfiles applied: start zsh (an interactive bash hands over to it), then herdr"
