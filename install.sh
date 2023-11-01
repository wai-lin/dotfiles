#!/bin/bash

DOTFILES=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

#################### ~~~ ####################
# Zsh
#################### ~~~ ####################
if [ ! -d $ZSH ]
then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

rm $HOME/.zshrc
ln -s $DOTFILES/.zshrc $HOME/.zshrc

echo "Run the following command."
echo "source \$HOME/.zshrc"

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

# install ripgrep for telescope neovim plugin to run grep
if [ ! -f /opt/homebrew/bin/rg ]
then
	brew install ripgrep
fi

# install fd for telescope neovim plugin that show file browser
# if [ ! -f /opt/homebrew/bin/fd ]
# then
# 	brew install fd
# fi

rm -rf $HOME/.config/nvim
ln -s $DOTFILES/nvim $HOME/.config/nvim

