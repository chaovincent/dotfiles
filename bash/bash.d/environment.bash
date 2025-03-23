#!/bin/bash

export EDITOR=vi
export TERM=xterm-256color

# Define base user directories to reduce clutter
export XDG_CACHE_HOME=${HOME}/.cache        # Where user-specific non-essential (cached) data should be written (analogous to /etc).
export XDG_CONFIG_HOME=${HOME}/.config      # Where user-specific configurations should be written (analogous to /var/cache).
export XDG_DATA_HOME=${HOME}/.local/share   # Where user-specific data files should be written (analogous to /usr/share).
export XDG_STATE_HOME=${HOME}/.local/state  # Where user-specific state files should be written (analogous to /var/lib).
export XDG_RUNTIME_DIR=/run/user/${UID}     # Used for non-essential, user-specific data files such as sockets, named pipes, etc.

export CARGO_HOME=${XDG_CACHE_HOME}/cargo
export MLFLOW_RECIPES_EXECUTION_DIRECTORY=${XDG_CACHE_HOME}/mlflow/recipes

export JUPYTER_CONFIG_DIR=${XDG_CONFIG_HOME}/jupyter

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"
