#!/bin/bash

export EDITOR=vi
export TERM=xterm-256color

# Avoid clutter in home directory
export XDG_CACHE_HOME=${HOME}/.cache
export CARGO_HOME=${XDG_CACHE_HOME}/cargo
export JUPYTER_CONFIG_DIR=${XDG_CACHE_HOME}/jupyter
export MLFLOW_RECIPES_EXECUTION_DIRECTORY=${XDG_CACHE_HOME}/mlflow/recipes
