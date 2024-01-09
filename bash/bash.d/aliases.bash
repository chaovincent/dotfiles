alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias tree="tree -C"

alias ll='ls -alF'
alias src="source ${HOME}/.bashrc"

# Vim
if [ -x "$(command -v nvim)" ]; then
    alias vim=nvim
elif [ -x "$(command -v pvim)" ]; then
    alias vim=pvim
elif [ -x "$(command -v vi)" ]; then
    alias vim=vi
fi

# Conda
if [ -x "$(which $(command -v micromamba))" ]; then
    alias conda=micromamba
fi

