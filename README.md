# Dotfiles

This project contains my personal dotfiles, managed by [chezmoi](https://www.chezmoi.io/).
It sets up a consistent development environment across multiple machines.

## Installation

All tooling lives in `chefe.toml` and is installed with [chefe](https://phvv.me/chefe).

1. **Install `chefe`:**

    ```bash
    pip install chefe      # or: pipx install chefe
    ```

    chefe installs [pixi](https://pixi.sh), the engine it compiles to, on first run.

    Install `zsh` with your system package manager before running `chefe run shell`.
    On Debian, Ubuntu, or Raspberry Pi OS that is `sudo apt install -y zsh`.

2. **Move the age key to the new machine:**

    ```bash
    rsync -aP ~/key.age machine:~/.config/chezmoi/
    ```

3. **Install the toolbox:**

    ```bash
    chefe global
    ```

    This installs every CLI declared in `chefe.toml` (chezmoi, age, tmux, nvim, and friends)
    into the shared global env, plus the npm tooling from `[nodejs.deps]`.

4. **Initialize `chezmoi`:**

    ```bash
    chezmoi init Pedrexus/dotfiles.git
    ```

5. **Set `zsh` as the default login shell:**

    ```bash
    chefe run shell
    ```

    This selects the registered system `zsh` from `/etc/shells`.

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
* **[chefe](https://phvv.me/chefe):** Installs every CLI from one manifest, no sudo needed.

## Troubleshooting

### `compilation failed` happens due to GCC not loaded

In HPC clusters, start running `module purge` and `module load {packages}` to add the necessary dependencies.
