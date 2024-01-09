function parse_git_branch(){
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

function prompt_command(){
    # Colors:
    #   Foreground: '\e[MODE;COLORm'
    #     MODE:
    #       0: Regular
    #       1: Bold
    #       3: Italic
    #       4: Underline
    #     COLOR:
    #       30: Black
    #       31: Red
    #       32: Green
    #       33: Yellow
    #       34: Blue
    #       35: Purple
    #       36: Cyan
    #       37: White
    #   Background: '\e[COLORm'
    #     COLOR: 
    #       40: Black
    #       41: Red
    #       42: Green
    #       43: Yellow
    #       44: Blue
    #       45: Purple
    #       46: Cyan
    #       47: White
    #       0: Reset

    # Current python environment
    PY_ENV=""
    if [[ -n $CONDA_DEFAULT_ENV ]]; then
        PY_ENV=$CONDA_DEFAULT_ENV
    elif [[ -n $VIRTUAL_ENV ]]; then
        PY_ENV=$(dirname $VIRTUAL_ENV)
        PY_ENV="${PY_ENV##*/}"
    fi

    if [[ -n $PY_ENV ]]; then
        PY_ENV="\e[3;32m${PY_ENV} "
    fi

    # Current git branch
    GITBRANCH=$(parse_git_branch)
    if [[ -n $GITBRANCH ]]; then
        if [[ -n $(git status -s) ]]; then
            GITBRANCH="\e[41m\e[3;30m${GITBRANCH} "
        else
            GITBRANCH="\e[43m\e[3;30m${GITBRANCH} "
        fi
    fi

    # Base prompt
    PROMPT="\e[0;30m\e[46m\u@\h\e[0;31m:\e[0;37m\w "

    # Set prompt variable
    PS1="┌ ${PY_ENV}${GITBRANCH}${PROMPT}\e[0m\n└> "
 
    # Cleanup
    unset GITBRANCH PROMPT PY_ENV
}


PROMPT_COMMAND=prompt_command
