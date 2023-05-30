#!/usr/bin/env bash

echo 'Installing dependencies'

if type 'zypper'; then
    sudo zypper in fish kitty ranger bat pasystray pavucontrol playerctl picom xscreensaver xscreensaver-data xscreensaver-data-extra rofi polybar i3 arandr lxrandr lxappearance zathura feh nitrogen neofetch neovim htop jq
elif type 'apt'; then
    sudo apt install fish kitty ranger bat diodon pasystray pavucontrol playerctl picom xscreensaver xscreensaver-data-extra xscreensaver-gl-extra rofi polybar i3 arandr lxrandr lxappearance zathura feh nitrogen neofetch neovim htop jq
fi
