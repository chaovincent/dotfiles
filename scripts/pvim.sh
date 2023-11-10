#!/bin/sh

#==========#
# Required #
#==========#

# Clone or pull updates from repo
if [ -d "${HOME}/.local/share/pvim" ]; then
    git -C "${HOME}/.local/share/pvim" pull
else
    git clone https://github.com/RoryNesbitt/pvim.git "${HOME}/.local/share/pvim"
fi

# Link nvim config to pvim config dir
ln -fsv "${HOME}/.config/nvim" "${HOME}/.local/share/pvim/config"

# Link pvim binary to user's bin dir
ln -fsv "${HOME}/.local/share/pvim/pvim" "${HOME}/.local/bin/pvim"
