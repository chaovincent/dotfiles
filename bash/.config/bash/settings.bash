#=========#
# History #
#=========#

# Save bash history to a file
HISTFILE=$HOME/.cache/bash/history

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# History searching
bind '"\C-p": history-search-backward'
bind '"\C-n": history-search-forward'

#======#
# Misc #
#======#

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
