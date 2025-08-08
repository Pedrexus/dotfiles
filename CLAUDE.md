# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository managed by [chezmoi](https://www.chezmoi.io/), a tool for managing configuration files across multiple machines. The repository contains configuration files for various development tools including zsh, tmux, LazyVim (Neovim), and more.

## Key Commands

### Dotfiles Management
- **Apply dotfiles changes:** `chezmoi apply` - Applies configuration changes to the system
- **Initialize chezmoi:** `chezmoi init <repo_url>` - Sets up chezmoi with the dotfiles repository
- **Edit a dotfile:** `chezmoi edit <file>` - Opens the source file for editing
- **Add a file to chezmoi:** `chezmoi add <file>` - Adds a new file to be managed by chezmoi

### Task Automation (via mask)
All common tasks are defined in `maskfile.md` and can be run with the `mask` command:
- **Set default shell:** `mask shell` - Sets zsh as the default shell
- **Install all dependencies:** `mask install` - Installs all tools defined in pixi.toml and npm packages
- **Install npm packages:** `mask npm` - Installs global npm packages (Claude Code, etc.)
- **Uninstall dependencies:** `mask uninstall` - Removes global dependencies

### Package Management
This repository uses a dual package management approach:
- **pixi** for system-level tools and languages: All conda-forge packages defined in `pixi.toml`
  - **Install a package globally:** `pixi global install <package>`
- **npm** for JavaScript/Node.js packages: Installed after nodejs via pixi
  - Claude Code is installed as a global npm package via `mask install-npm-packages`

## Architecture

### File Structure
- **dot_config/**: Contains configuration for various tools (chezmoi, lazyvim)
- **dot_gemini/**: Contains encrypted Google/Gemini account credentials (age-encrypted)
- **dot_tmux.conf**: Tmux configuration
- **dot_zshrc**: Zsh shell configuration with Zinit plugin manager
- **dot_zshenv**: Zsh environment variables
- **maskfile.md**: Task automation definitions
- **pixi.toml**: Global dependencies specification

### Encryption
The repository uses **age** encryption for sensitive files:
- Encrypted files have `.age` extension
- Encryption key should be at `~/.config/chezmoi/key.age`
- Configuration in `dot_config/chezmoi/chezmoi.toml`

### Shell Environment
- **Shell:** zsh with Zinit plugin manager
- **Prompt:** Starship
- **Key plugins:** fzf-tab, zsh-syntax-highlighting, zsh-autosuggestions, zsh-vi-mode
- **Terminal multiplexer:** tmux
- **Editor:** LazyVim (Neovim distribution) aliased as `lvim`

### Development Tools
Key tools installed via pixi.toml:
- **Navigation:** zoxide (aliased as cd), eza (aliased as l/ll/lf), fzf, fd-find
- **Git:** lazygit, gh (GitHub CLI)
- **Editor:** nvim with LazyVim configuration
- **Search:** ripgrep, ripgrep-all, bat (aliased as cat)
- **System:** btop, dust, nvitop, hyperfine
- **Network:** mosh, speedtest-cli, xh

## Important Notes

- The repository uses pixi for package management - avoid using system package managers for development tools
- LazyVim configuration is in `dot_config/lazyvim/` with custom plugins in `lua/plugins/`
- Sensitive files are encrypted with age - ensure the encryption key is properly configured before applying dotfiles
- The zsh configuration uses Zinit for plugin management and includes extensive customization

## Task Master AI Instructions
**Import Task Master's development workflow commands and guidelines, treat as if import is in the main CLAUDE.md file.**
@./.taskmaster/CLAUDE.md
