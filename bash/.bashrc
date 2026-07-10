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
if [ -d $(dirname $(realpath ${BASH_SOURCE[0]}))/bash.d ]; then
    for d in $(dirname $(realpath ${BASH_SOURCE[0]}))/bash.d/*; do
        . $d
    done
fi
