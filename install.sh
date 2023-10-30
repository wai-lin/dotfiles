#!/bin/bash

DOTFILES=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

#################### ~~~ ####################
# Alacritty
#################### ~~~ ####################
if [ ! -f /opt/homebrew/bin/alacritty ]
then
	brew install --cask alacritty
fi

rm -rf $HOME/.config/alacritty
ln -s $DOTFILES/alacritty $HOME/.config/alacritty

#################### ~~~ ####################
# Tmux
#################### ~~~ ####################
if [ ! -f /opt/homebrew/bin/tmux ]
then
	brew install tmux
fi

if [ ! -d ~/.tmux/plugins/tpm ]
then
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

rm -rf $HOME/.tmux.conf
rm -rf $HOME/.config/tmux
ln -s $DOTFILES/tmux $HOME/.config/tmux

#################### ~~~ ####################
# Neovim
#################### ~~~ ####################
if [ ! -f /opt/homebrew/bin/nvim ]
then
	brew install nvim
fi

rm -rf $HOME/.config/nvim
ln -s $DOTFILES/nvim $HOME/.config/nvim

