#!/bin/bash

DOTFILES=$(git rev-parse --show-toplevel)

# Create ${HOME}/.config if it doesn't exist
if [ ! -d "${HOME}/.config" ]; then
    mkdir -pv "${HOME}/.config"
fi

# Create ${HOME}/.local/bin if it doesn't exist
if [ ! -d "${HOME}/.local/bin" ]; then
    mkdir -pv "${HOME}/.local/bin"
fi

# Symlink dotfile directories to ${HOME}/.config/
ln -fsvt "${HOME}/.config/" \
    "${DOTFILES}/bash" \
    "${DOTFILES}/git" \
    "${DOTFILES}/gtk-3.0" \
    "${DOTFILES}/mpv" \
    "${DOTFILES}/nvim" \
    "${DOTFILES}/tmux"

# Symlink specific files
ln -fsv "${HOME}/.config/bash/bashrc" "${HOME}/.bashrc"

# Run additional setup scripts
# ${DOTFILES}/scripts/packages.sh
# ${DOTFILES}/scripts/docker.sh
# ${DOTFILES}/scripts/micromamba.sh
# ${DOTFILES}/scripts/nvim.sh
# ${DOTFILES}/scripts/sway.sh

# Source bashrc
source "${HOME}/.bashrc"

# Cleanup
unset DOTFILES
