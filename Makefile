# Makefile for dotfiles management

.PHONY: stow

stow:
	stow -t ~ zsh/
	stow -t ~/.config nvim/

status:
	@$(SCRIPTS_DIR)/stow-status.sh
