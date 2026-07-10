#!/bin/sh

#==========#
# Required #
#==========#

if ! command -v nvim >/dev/null 2>&1; then
    # Download AppImage
    curl \
        --location https://github.com/neovim/neovim/releases/latest/download/nvim.appimage \
        --output "${HOME}/.local/bin/nvim"

    # Set executable permissions
    chmod u+x "${HOME}/.local/bin/nvim"
fi
