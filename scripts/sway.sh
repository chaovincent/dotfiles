#!/bin/sh

# #==============#
# # Package List #
# #==============#
# 
# set -- \
#     sway \
#     swaylock \
#     waybar \
#     wdisplays \
#     wl-clipboard \
#     wofi
# 
# echo "Installing packages:\n  $@\n"
# 
# #==================#
# # Install Packages #
# #==================#
# 
# if command -v apt >/dev/null 2>&1; then
#     sudo apt install -y $@
# elif command -v yay >/dev/null 2>&1; then
#     yay -S $@
# elif command -v pacman >/dev/null 2>&1; then
#     sudo pacman -S $@
# fi
# 
#===================#
# Link config files #
#===================#

DOTFILES=$(realpath $(dirname $(dirname $0)))

# Symlink dotfile directories to ${HOME}/.config/
ln -fsvt "${HOME}/.config/" \
    "${DOTFILES}/sway" \
    "${DOTFILES}/swaylock" \
    "${DOTFILES}/waybar" \
    "${DOTFILES}/wofi"
