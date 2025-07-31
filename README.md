# Dotfiles

This project contains my personal dotfiles, managed by [chezmoi](httpss://www.chezmoi.io/).
It sets up a consistent development environment across multiple machines.

## Encryption Setup

On a new machine, you must import your private GPG key to decrypt secrets.

**1. Export Your Private Key (from your primary machine):**

Securely transfer your private key.
Use a secure copy method (`scp`) to move this file to the new machine.

```bash
gpg --export-secret-keys --armor YOUR_EMAIL@example.com > private.key
```

**2. Import and Trust the Key (on the new machine):**

Once the `private.key` file is on the new machine, run these commands:

```bash
# Import the key
gpg --import private.key

# Trust the key
gpg --edit-key YOUR_EMAIL@example.com
```

In the GPG prompt, type `trust`, select `5` for ultimate trust, and then `quit`.

**3. Clean Up:**

After verifying the key is imported (`gpg --list-secret-keys`), securely delete the `private.key` file.

## Installation

1. **Install `chezmoi`:**

    Follow the instructions on the [official chezmoi installation page](https://www.chezmoi.io/install/).

2. **Initialize `chezmoi`:**

    Replace `YOUR_USERNAME/YOUR_REPO` with your actual repository path:

    ```bash
    chezmoi init https://github.com/YOUR_USERNAME/YOUR_REPO.git
    ```

3. **Apply the dotfiles:**

    ```bash
    chezmoi apply
    ```

4. **Install `pixi`:**

    Install pixi to manage packages:

    ```bash
    curl -fsSL https://pixi.sh/install.sh | bash
    ```

5. **Install Global Dependencies:**

    Run the following command to install all the necessary tools:

    ```bash
    pixi run install-global
    ```

### Technologies Installed

* **[chezmoi](httpss://www.chezmoi.io/):** Manages the dotfiles.
* **[zsh](httpss://www.zsh.org/):** A powerful shell.
* **[tmux](httpss://github.com/tmux/tmux/wiki):** A terminal multiplexer.
* **[LazyVim](httpss://www.lazyvim.org/):** A Neovim setup.
* **[pixi](httpss://pixi.sh/):** A package manager that does not need SUDO.

### TODO

* Add secrets with chezmoi.
