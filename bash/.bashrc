# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Add user's private bin to PATH
if [ -d "$HOME/.local/bin" ] && [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    PATH="${PATH:+"$PATH:"}$HOME/.local/bin"
fi

# Source additional files
if [ -d $HOME/.config/bash ]; then
    for d in $HOME/.config/bash/*; do
        . $d
    done
fi
