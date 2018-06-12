unset BASH_ENV

shopt -s histappend
shopt -s checkwinsize
if [[ "${BASH_VERSION}" == 4* ]] ; then
  shopt -s globstar
fi

if ! shopt -oq posix; then
    source /usr/share/bash-completion/bash_completion 2>/dev/null \
        || source /etc/bash_completion 2>/dev/null
fi

# Aliases
source "${HOME}/.bash_aliases"

# Functions
function retry {
    while ! eval "$@" ; do : ; done
}
function repeat {
    local count="$1" i;
    shift;
    for i in $(seq $count) ; do eval "$@" ; done
}

export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=
export HISTFILESIZE=
export TMOUT=0
# export PS1='$(status=$? ; if [[ ${status} == 0 ]] ; then echo -en \[$(tput setaf 2)\] ; else echo -en \[$(tput setaf 1)\] ; fi ; printf [%03d] ${status})\[$(tput sgr0)\] --- \u@\h:\w\n \$ '
# last=$(fc -ln -0 | sed -e s/^[[:space:]]*//)
export PS2=" > "

fill="--- "
export PS1='$fill \D{%F %T}\n$(status=$? ; if [[ ${status} == 0 ]] ; then echo -en \[$(tput setaf 2)\] ; else echo -en \[$(tput setaf 1)\] ; fi ; printf [%03d] ${status})\[$(tput sgr0)\] --- \u@\h:\w\n \$ '

function prompt_command {
    # create a $fill of all screen width minus the time string and a space:
    let fillsize=${COLUMNS}-20
    fill=""
    while [ "$fillsize" -gt "0" ]
    do
        fill="-${fill}" # fill with underscores to work on
        let fillsize=${fillsize}-1
    done
}
export PROMPT_COMMAND=prompt_command
