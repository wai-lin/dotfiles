#!/bin/bash

DOTFILES=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

#################### ~~~ ####################
# Zsh
#################### ~~~ ####################
uninstall_oh_my_zsh

#################### ~~~ ####################
# Alacritty
#################### ~~~ ####################
brew uninstall --cask alacritty
rm -rf $HOME/.config/alacritty

#################### ~~~ ####################
# Tmux
#################### ~~~ ####################
brew uninstall tmux
rm -rf $HOME/.tmux
rm -rf $HOME/.tmux.conf
rm -rf $HOME/.config/tmux

#################### ~~~ ####################
# Neovim
#################### ~~~ ####################
brew uninstall nvim
brew uninstall ripgrep
brew uninstall fd
rm -rf $HOME/.config/nvim

#################### ~~~ ####################
# PHP
#################### ~~~ ####################
brew uninstall php
sudo rm -rf /usr/local/bin/composer
