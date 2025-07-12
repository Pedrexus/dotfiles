# ~/.zshrc: sourced in interactive shells.
# Contains commands to set up aliases, functions, options, key bindings, etc.

# ------------------------------------------------------------------------------
# REGION: Environment Variables
# ------------------------------------------------------------------------------

export LANG='en_US.UTF-8'
export LANGUAGE='en_US:en'
export LC_ALL='en_US.UTF-8'
export TERM='xterm-256color'
export NVM_DIR="$HOME/.nvm"

# Set PATH, adding ~/.local/bin and custom ~/bin
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

# ------------------------------------------------------------------------------
# REGION: Shell Options
# ------------------------------------------------------------------------------

# Other shell options
setopt autocd              # Change directory without `cd`
setopt NO_BEEP             # Disable system beeps
setopt NOBGNICE            # Don't lower priority of background jobs
MAILCHECK=0                # Disable mail checking
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ------------------------------------------------------------------------------
# REGION: Aliases
# ------------------------------------------------------------------------------

alias l='eza --no-permissions --hyperlink -hagM'
alias ll='l -l'
alias ls='ll'
alias llf='ll --total-size'
alias lvim="NVIM_APPNAME=lazyvim nvim"
alias vim="NVIM_APPNAME=mynvim nvim"

# ------------------------------------------------------------------------------
# REGION: Zinit Plugin Manager
# ------------------------------------------------------------------------------

# Install Zinit if it's not already installed
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33}%F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33}%F{34}Installation successful.%f%b" || \
        print -P "%F{160}The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load Zinit annexes
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# ------------------------------------------------------------------------------
# REGION: Zinit Plugins
# ------------------------------------------------------------------------------

# Starship prompt
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

# Zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-history-substring-search
zinit light Aloxaf/fzf-tab

zinit snippet OMZP::git
zinit snippet OMZP::python
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

# ------------------------------------------------------------------------------
# REGION: Completions and Keybindings
# ------------------------------------------------------------------------------

autoload -U compinit && compinit

zinit cdreplay -q

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# ------------------------------------------------------------------------------
# REGION: History
# ------------------------------------------------------------------------------

HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=$HISTSIZE
setopt APPEND_HISTORY      # Append to history file, don't overwrite
setopt COMPLETE_IN_WORD    # Allow tab completion in the middle of a word
setopt HIST_IGNORE_DUPS    # Don't save duplicate consecutive commands
setopt HIST_IGNORE_SPACE   # Don't save commands that start with a space
setopt INC_APPEND_HISTORY  # Add commands immediately
setopt SHARE_HISTORY       # Share history between all active sessions

# ------------------------------------------------------------------------------
# REGION: fzf-tab Configuration
# ------------------------------------------------------------------------------

# Disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false

# Set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'

# Set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no

# Preview directory's content with eza when completing cd
# The line below is commented out because it can cause issues with the fzf-tab popup size.
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'

# Custom fzf flags (NOTE: This might cause theme issues)
zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept

# Switch group using `<` and `>`
zstyle ':fzf-tab:*' use-fzf-default-opts yes
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

eval "$(zoxide init --cmd cd zsh)"
source <(fzf --zsh)

# ------------------------------------------------------------------------------
# REGION: Environment Setup
# ------------------------------------------------------------------------------

# Load nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Load cargo
. "$HOME/.cargo/env"


