#!/usr/bin/env bash

echo 'Do you want to install nerd fonts?(Type y to install them)'
echo 'This will clone github.com/ryanoasis/nerd-fonts to .ignore/ in this directory'
read install_nf
typeset -l install_nf
if [ $install_nf = 'y' ]; then
	git clone --depth=1 https://github.com/ryanoasis/nerd-fonts.git .ignore/
	echo 'Installing nerd-fonts'
	bash .ignore/nerd-fonts/install.sh -C
else
	echo 'Install at least Iosevka Nerd Font or change the font in .config files'
fi

cp -Trv .config ~/.config/
cp -Trv .local ~/.local/
echo 'Dotfiles copied'

echo 'Setting up network configuration:'
sudo cp -v system/50-macrandomize.conf /etc/NetworkManager/conf.d/
loopbackName=$(cat /etc/hostname)
sudo cp -v /dev/null /etc/hostname
if [ -z '$loopbackName' ]; then
    sudo hostnamectl set-hostname --transient localhost
else
    sudo hostnamectl set-hostname --transient $loopbackName
fi
