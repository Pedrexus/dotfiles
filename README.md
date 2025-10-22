# Dotfiles

This project contains my personal dotfiles, managed by [chezmoi](httpss://www.chezmoi.io/).
It sets up a consistent development environment across multiple machines.

## Installation

To set up your dotfiles, use the `mask` command-line tool.
All common tasks are defined in `maskfile.md`.

1. **Install `pixi`:**

   Follow their instruction in [their website](https://pixi.sh/latest/installation/).

2. **Install `chezmoi` and `zsh`:**

    ```bash
    pixi global install chezmoi zsh tmux age mask
    ```

3. Move age.key to new machine

    ```bash
    rsync -aP ~/key.age machine:~/.config/chezmoi/
    ```

5. **Initialize `chezmoi`:**

    ```bash
    chezmoi init Pedrexus/dotfiles.git
    ```

3. **Set `zsh` as default shell:**

    ```bash
    mask shell
    ```

4. **Install Global Dependencies:**

    ```bash
    mask install
    ```

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

* **[chezmoi](httpss://www.chezmoi.io/):** Manages the dotfiles.
* **[zsh](httpss://www.zsh.org/):** A powerful shell.
* **[tmux](httpss://github.com/tmux/tmux/wiki):** A terminal multiplexer.
* **[LazyVim](httpss://www.lazyvim.org/):** A Neovim setup.
* **[pixi](httpss://pixi.sh/):** A package manager that does not need SUDO.

## Troubleshooting

### `mask install` fails due to Python version

If you encounter issues with `mask install` on systems with older Python versions (e.g., Python 3.9), it might be due to `tomllib` not being available. You can resolve this by installing a compatible Python version globally via `pixi`:

```bash
pixi global install python
```

This will install a recent Python version that includes `tomllib`, allowing the dependency installation script to run correctly.

### `compilation failed` happens due to GCC not loaded

In HPC clusters, start running `module purge` and `module load {packages}` to add the necessary dependencies.
