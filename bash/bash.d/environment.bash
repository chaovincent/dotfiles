#!/bin/bash

export EDITOR=vi
export TERM=xterm-256color

# Core XDG
export XDG_CACHE_HOME=${HOME}/.cache        # Where user-specific non-essential (cached) data should be written (analogous to /etc).
export XDG_CONFIG_HOME=${HOME}/.config      # Where user-specific configurations should be written (analogous to /var/cache).
export XDG_DATA_HOME=${HOME}/.local/share   # Where user-specific data files should be written (analogous to /usr/share).
export XDG_STATE_HOME=${HOME}/.local/state  # Where user-specific state files should be written (analogous to /var/lib).

# Other XDG
export XDG_RUNTIME_DIR=/run/user/${UID}     # Stores transient runtime files like Unix sockets, pipes, and process IDs.
export XDG_CONFIG_DIRS=/etc/xdg             # A colon-separated preference list of system-wide config directories.
export XDG_DATA_DIRS=/usr/local/share/:/usr/share/  # A colon-separated preference list of system-wide data directories.


#===============================================================================
# Application Specific
#===============================================================================

# java
export JAVA_HOME=${XDG_CONFIG_HOME}/java
[[ -d $JAVA_HOME/bin ]] && export PATH="$JAVA_HOME/bin:$PATH"

# jupyter
export JUPYTER_CONFIG_DIR=${XDG_CONFIG_HOME}/jupyter

# mlflow
export MLFLOW_RECIPES_EXECUTION_DIRECTORY=${XDG_CACHE_HOME}/mlflow/recipes

# rust
export CARGO_HOME=${XDG_CACHE_HOME}/cargo

# node
export NVM_DIR="$HOME/.local/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pyenv
export PYENV_ROOT="${HOME}/.local/pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init - bash)"

