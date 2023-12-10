DOTFILES=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

echo $DOTFILES

install() {
	if [ ! -f /opt/homebrew/bin/nvim ]
	then
		brew install nvim
	fi

	rm -rf $HOME/.config/nvim
	ln -s $DOTFILES/nvim $HOME/.config/nvim
}

uninstall() {
	rm -rf ~/.config/nvim
	rm -rf ~/.local/share/nvim
}

	# install ripgrep for telescope neovim plugin to run grep
	# if [ ! -f /opt/homebrew/bin/rg ]
	# then
	# 	brew install ripgrep
	# fi

	# install fd for telescope neovim plugin that show file browser
	# if [ ! -f /opt/homebrew/bin/fd ]
	# then
	# 	brew install fd
	# fi

# ############################################################
# Execution
# ############################################################
operation=$1

if [[ operation == "install" ]]
	if install; then
		echo "Neovim installation success."
	else
		echo "Neovim installation failed."
	fi
fi

if [[ operation == "uninstall" ]]
	if uninstall; then
		echo "Neovim uninstallation success."
	else
		echo "Neovim uninstallation failed."
	fi
fi