#!/bin/sh

#==========#
# Required #
#==========#

if ! command -v nvim >/dev/null 2>&1; then
    sudo snap install nvim --classic
fi
