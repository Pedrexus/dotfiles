# Dotfiles

This project contains my personal dotfiles, managed by [chezmoi](httpss://www.chezmoi.io/).
It sets up a consistent development environment across multiple machines.

## Encryption Setup

If you are using encrypted files, you will need to perform the following steps on a new machine:

1. **Export Your Private Key (from your primary machine):**

    ```bash
    mask export-gpg-private-key YOUR_EMAIL@example.em
    ```

    Securely transfer the `private.key` file to your new machine.

2. **Import and Trust the Key (on the new machine):**

    ```bash
    mask import-gpg-private-key
    mask trust-gpg-key YOUR_EMAIL@example.com
    ```

3. **Verify and Clean Up:**

    ```bash
    mask list-gpg-secret-keys
    ```

    After verifying, securely delete the `private.key` file.

## Installation

To set up your dotfiles, use the `mask` command-line tool.
All common tasks are defined in `maskfile.md`.

1. **Install `pixi`:**

   Follow their instruction in the website.

2. **Install `chezmoi` and `zsh`:**

    ```bash
    mask install-core-tools
    ```

3. **Set `zsh` as default shell:**

    ```bash
    mask set-default-shell
    ```

4. **Initialize `chezmoi`:**

    ```bash
    mask init YOUR_USERNAME/YOUR_REPO.git
    ```

5. **Apply the dotfiles:**

    ```bash
    mask apply
    ```

6. **Install Global Dependencies:**

    ```bash
    mask install-global-dependencies
    ```

## First Usage

After installation, you can start using your new shell and tools:

1.  **Start Zsh:**
    ```bash
    zsh
    ```

2.  **Start Tmux:**
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

### `mask install-global-dependencies` fails due to Python version

If you encounter issues with `mask install-global-dependencies` on systems with older Python versions (e.g., Python 3.9), it might be due to `tomllib` not being available. You can resolve this by installing a compatible Python version globally via `pixi`:

```bash
pixi global install python
```

This will install a recent Python version that includes `tomllib`, allowing the dependency installation script to run correctly.
