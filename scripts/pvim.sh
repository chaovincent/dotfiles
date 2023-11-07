#!/bin/sh


if [ -d "${HOME}/.local/share/pvim" ]; then
    git -C "${HOME}/.local/share/pvim" pull
else
    git clone https://github.com/RoryNesbitt/pvim.git "${HOME}/.local/share/pvim"
fi

ln -fsv "${HOME}/.config/nvim" "${HOME}/.local/share/pvim/config"
ln -fsv "${HOME}/.local/share/pvim/pvim" "${HOME}/.local/bin/pvim"
