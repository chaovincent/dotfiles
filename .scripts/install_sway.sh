#!/bin/sh

#==============#
# Package List #
#==============#

set -- \
    fcitx5 \
    fcitx5-hangul \
    grim \
    jq \
    libnotify-bin \
    slurp \
    sway \
    swaylock \
    waybar \
    wdisplays \
    wl-clipboard \
    wofi

echo "Installing packages:\n  $@\n"

#===================#
# Link config files #
#===================#

DOTFILES=$(git rev-parse --show-toplevel)

# Symlink dotfile directories to ${HOME}/.config/
ln -fsvt "${HOME}/.config/" \
    "${DOTFILES}/sway" \
    "${DOTFILES}/swaylock" \
    "${DOTFILES}/waybar" \
    "${DOTFILES}/wofi"

#==================#
# Install Packages #
#==================#

if   [ -x "$(command -v apk    )" ]; then sudo apk add --no-cache $@
elif [ -x "$(command -v apt    )" ]; then sudo apt install $@
elif [ -x "$(command -v apt-get)" ]; then sudo apt-get install $@
elif [ -x "$(command -v dnf    )" ]; then sudo dnf install $@
elif [ -x "$(command -v yay    )" ]; then sudo yay -S $@
elif [ -x "$(command -v pacman )" ]; then sudo pacman -S $@
else echo "ERROR: Package manager not found. Manually install:\n  $@"; fi
