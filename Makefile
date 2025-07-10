# Makefile for dotfiles management

.PHONY: stow

setup:
	stow -t ~ tmux/
	stow -t ~ zsh/
	stow -t ~/.config nvim/
	tmux source ~/.tmux.conf
