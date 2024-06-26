#!/bin/sh

#==============#
# Package List #
#==============#

set -- \
    blueman \
    fcitx5 \
    fcitx5-hangul \
    git \
    jq \
    neofetch \
    pandoc \
    sshfs \
    tmux \
    pipewire \
    xdg-desktop-portal-wlr

echo "Installing packages:\n  $@"

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
