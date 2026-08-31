# Dotfiles

This project contains my personal dotfiles, managed by [chezmoi](https://www.chezmoi.io/).
It sets up a consistent development environment across multiple machines.

## Installation

All tooling lives in `pixi-global.toml` and is installed with
[pixi global](https://pixi.sh/latest/global_tools/introduction/).

1. **Install `pixi`:**

    ```bash
    curl -fsSL https://pixi.sh/install.sh | sh
    ```

    Install `zsh` with your system package manager before setting the login shell below.
    On Debian, Ubuntu, or Raspberry Pi OS that is `sudo apt install -y zsh`.

2. **Move the age key to the new machine:**

    ```bash
    rsync -aP ~/key.age machine:~/.config/chezmoi/
    ```

3. **Install the toolbox:**

    ```bash
    export PIXI_HOME="$HOME/.pixi/$(uname -m)"
    mkdir -p "$PIXI_HOME/manifests"
    curl -fsSLo "$PIXI_HOME/manifests/pixi-global.toml" \
        https://raw.githubusercontent.com/Pedrexus/dotfiles/main/pixi-global.toml
    pixi global sync
    ```

    This installs every CLI declared in `pixi-global.toml` (chezmoi, age, tmux, nvim, and friends)
    into the shared global env at `$PIXI_HOME`. After editing the manifest, copy it back into
    `$PIXI_HOME/manifests/` and run `pixi global sync` again.

4. **Initialize `chezmoi`:**

    ```bash
    chezmoi init Pedrexus/dotfiles.git
    ```

5. **Set `zsh` as the default login shell:**

    ```bash
    sudo chsh -s "$(awk '/^\/(usr\/)?bin\/zsh$/ { print; exit }' /etc/shells)" "$USER"
    ```

    This selects the registered system `zsh` from `/etc/shells`.

6. **Install [Claude Code](https://claude.com/claude-code):**

    ```bash
    curl -fsSL https://claude.ai/install.sh | bash
    ```

    The native installer puts `claude` in `~/.local/bin`, already first on `PATH`.

## First Usage

After installation, you can start using your new shell and tools:

1. **Start Zsh:**

    ```bash
    zsh
    ```

2. **Start Tmux:**

    ```bash
    tmux
    ```

    Inside tmux, press `Ctrl+A` then `I` to install tmux plugin dependencies.

### Technologies Installed

* **[chezmoi](https://www.chezmoi.io/):** Manages the dotfiles.
* **[zsh](https://www.zsh.org/):** A powerful shell.
* **[tmux](https://github.com/tmux/tmux/wiki):** A terminal multiplexer.
* **[LazyVim](https://www.lazyvim.org/):** A Neovim setup.
* **[pixi](https://pixi.sh):** Installs every CLI from one manifest, no sudo needed.

## Troubleshooting

### `compilation failed` happens due to GCC not loaded

In HPC clusters, start running `module purge` and `module load {packages}` to add the necessary dependencies.
