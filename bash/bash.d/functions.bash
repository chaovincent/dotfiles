#===============================================================================
# Virtual Environments
#===============================================================================

function auto_activate_venv {
    local venv_path
    venv_path=$(find . -maxdepth 3 -name "venv" -o -name ".venv" 2>/dev/null | head -n 1)
    if [ -n "$venv_path" ]; then
        if [ -f "$venv_path/bin/activate" ]; then
            source "$venv_path/bin/activate"
        fi
    fi
}

# Activate venv on entering a directory
alias cd='cd '
cd () {
    builtin cd "$@"
    auto_activate_venv
}

# Also activate venv on shell startup
auto_activate_venv
