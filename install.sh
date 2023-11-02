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

#################### ~~~ ####################
# PHP
#################### ~~~ ####################
# install php
if [ ! -f /opt/homebrew/bin/php ]
then
	brew install php
fi

# insall composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'e21205b207c3ff031906575712edab6f13eb0b361f2085f1f1237b7126d785e826a450292b6cfd1d64d92e6563bbde02') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv $DOTFILES/composer.phar /usr/local/bin/composer
