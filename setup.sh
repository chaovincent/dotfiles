#!/bin/sh

DOTFILES=$(realpath $(dirname $0))

# Create ${HOME}/.local/bin if it doesn't exist
if [ ! -d "${HOME}/.local/bin" ]; then
    mkdir -v "${HOME}/.local/bin"
fi

# Symlink dotfile directories to ${HOME}/.config/
ln -fsvt "${HOME}/.config/" \
    "${DOTFILES}/bash" \
    "${DOTFILES}/nvim"

# Symlink specific files
ln -fsv "${HOME}/.config/bash/bashrc" "${HOME}/.bashrc"

unset DOTFILES
