#!/bin/sh
# Set up these dotfiles on Linux or macOS, no sudo needed:
#   sh install.sh                                                            from a checkout
#   curl -fsSL https://raw.githubusercontent.com/Pedrexus/dotfiles/main/install.sh | sh
# pixi comes first, chezmoi runs through it once, and `chezmoi apply` does the rest: the files,
# the zsh plugins, and the pixi global toolbox (run_onchange_after_10-toolbox.sh.tmpl).
set -eu

PIXI_HOME="$HOME/.pixi/$(uname -m)"
export PIXI_HOME
PATH="$PIXI_HOME/bin:$HOME/.pixi/bin:$PATH"
if ! command -v pixi >/dev/null 2>&1; then
    curl -fsSL https://pixi.sh/install.sh | PIXI_NO_PATH_UPDATE=1 sh
fi

here=$(cd "$(dirname "$0")" && pwd)
if [ -f "$here/.chezmoi.toml.tmpl" ]; then
    pixi exec chezmoi init --apply --source "$here"
else
    pixi exec chezmoi init --apply Pedrexus/dotfiles
fi

if ! command -v zsh >/dev/null 2>&1; then
    echo "zsh is not installed; install it with the system's package manager" \
        "(apt install zsh, dnf install zsh). macOS ships it." >&2
elif [ "$(basename "${SHELL:-}")" != zsh ]; then
    echo "to make zsh the login shell: chsh -s $(command -v zsh)" \
        "(where that is not allowed, ~/.bashrc hands over to zsh)"
fi
