alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ls='ls --color=auto --group-directories-first'
alias ll='ls -alF'

alias src="source ${HOME}/.bashrc"
alias tree="tree -C"
alias diffs="diff --suppress-common-lines"

# Vim
if command -v nvim &> /dev/null; then
    export EDITOR="nvim"
    export VISUAL="nvim"
elif command -v vim &> /dev/null; then
    export EDITOR="vim"
    export VISUAL="vim"
else
    export EDITOR="vi"
    export VISUAL="vi"
fi
alias vi=$EDITOR

# Conda
# if [ -x "$(which $(command -v micromamba))" ]; then
#     alias conda=micromamba
# fi
