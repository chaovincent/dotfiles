#!/bin/bash

DOTFILES=$(git rev-parse --show-toplevel)

# Create ${HOME}/.local/bin if it doesn't exist
if [ ! -d "${HOME}/.local/bin" ]; then
    mkdir -v "${HOME}/.local/bin"
fi

# Symlink dotfile directories to ${HOME}/.config/
ln -fsvt "${HOME}/.config/" \
    "${DOTFILES}/bash" \
    "${DOTFILES}/git" \
    "${DOTFILES}/mpv" \
    "${DOTFILES}/nvim"

# Symlink specific files
ln -fsv "${HOME}/.config/bash/bashrc" "${HOME}/.bashrc"

# Run additional setup scripts
${DOTFILES}/scripts/packages.sh
${DOTFILES}/scripts/micromamba.sh
${DOTFILES}/scripts/nvim.sh
# ${DOTFILES}/scripts/sway.sh

# Source bashrc
source "${HOME}/.bashrc"

# Cleanup
unset DOTFILES
