#!/bin/sh

#==========#
# Required #
#==========#

if ! command -v nvim >/dev/null 2>&1; then
    sudo add-apt-repository ppa:neovim-ppa/unstable
    sudo apt update
    sudo apt install -y neovim
fi
