# Dotfiles

My personal dotfiles, managed by [chezmoi](https://www.chezmoi.io/): the same zsh, tmux, Neovim
and command-line toolbox on Linux, macOS and Windows, set up by one command and no sudo.

## Installation

Linux or macOS:

```bash
curl -fsSL https://raw.githubusercontent.com/Pedrexus/dotfiles/main/install.sh | sh
```

Windows (PowerShell):

```powershell
irm https://raw.githubusercontent.com/Pedrexus/dotfiles/main/install.ps1 | iex
```

From a checkout, run `sh install.sh` or `powershell -ExecutionPolicy Bypass -File install.ps1`
instead, and chezmoi uses that checkout as its source.

The script installs [pixi](https://pixi.sh) when it is missing, then runs `chezmoi init --apply`
through it. Applying writes the dotfiles, fetches the zsh and tmux plugins, and installs the
toolbox with `pixi global`. Afterwards `chezmoi apply` keeps everything in step: an edit to the
toolbox manifest is one apply away.

To carry encrypted files, move the age key first:

```bash
rsync -aP ~/key.age machine:~/.config/chezmoi/
```

## What each system gets

| | Linux | macOS | Windows |
|---|---|---|---|
| shell | the system's zsh | the system's zsh | MSYS2's zsh, through pixi |
| terminal multiplexer | tmux | tmux | MSYS2's tmux, through pixi |
| toolbox | pixi global | pixi global | pixi global |
| prompt, plugins | starship, fzf-tab, autosuggestions, syntax highlighting | same | same |

- **The toolbox** lives in [`.chezmoitemplates/pixi-global.toml`](.chezmoitemplates/pixi-global.toml):
  git, gh, lazygit, nvim, ripgrep, fd, fzf, bat, eza, zoxide, starship, jaq, bottom, uv, python,
  node, rust, pandoc and the PDF and image tools. Every package there is built by conda-forge for
  all four platforms, and a synced environment exposes exactly what its `exposed` table lists.
- **zsh plugins** are plain files from [`.chezmoiexternal.toml`](.chezmoiexternal.toml),
  refreshed weekly, so no plugin manager runs when a shell starts.
- **Linux without sudo:** zsh must come from the system (`apt install zsh`). Where the login shell
  cannot be changed, an interactive bash hands over to zsh (`DOTFILES_BASH=1` keeps bash). pixi
  keeps one home per architecture (`~/.pixi/$(uname -m)`), so an HPC home shared by x86-64 and
  aarch64 nodes works.
- **Windows:** conda-forge ships MSYS2's runtime and tools (`m2-*`) but not zsh or tmux, so
  [`recipes/`](recipes) repackages MSYS2's own builds and applying builds them into
  `~/.cache/dotfiles/channel` (seconds, sources pinned by sha256). zsh opens from the "zsh"
  profile in Windows Terminal. Make it the default in Settings > Startup. MSYS's coreutils stay
  inside zsh, so Windows' own `find` and `sort` keep working everywhere else. ssh stays Windows'
  or Git's: MSYS2's OpenSSH cannot share connections on Windows either.

## First usage

Start `zsh`, then `tmux`. Inside tmux, `Ctrl+A` then `I` installs the tmux plugins.

## Troubleshooting

### `compilation failed` happens due to GCC not loaded

In HPC clusters, start running `module purge` and `module load {packages}` to add the necessary dependencies.
