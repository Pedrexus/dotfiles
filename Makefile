# Makefile for dotfiles management

.PHONY: stow install_stow

setup:
	stow -t ~ dotfiles 
	tmux source ~/.tmux.conf

install_stow:
	mkdir -p ~/.local/src
	curl -L https://ftp.gnu.org/gnu/stow/stow-latest.tar.gz -o ~/.local/src/stow-latest.tar.gz
	tar -xzf ~/.local/src/stow-latest.tar.gz -C ~/.local/src
	cd ~/.local/src/stow-* && ./configure --prefix=$HOME/.local && make && make install
	rm -rf ~/.local/src/stow-latest.tar.gz ~/.local/src/stow-*
