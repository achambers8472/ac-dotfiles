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

separator='='
export PROMPT_COMMAND='status=$?; _line_width=$(((${COLUMNS} - 7)/2)); tput setaf 3; printf %${_line_width}s | tr " " "${separator}" ; if [[ ${status} == 0 ]] ; then tput setaf 2 ; else tput setaf 1 ; fi ; printf " [%03d] " ${status}; tput setaf 3 ; printf %${_line_width}s | tr " " "${separator}" ; echo ; tput sgr0'
export PS1='\u@\h:\w\$ '
export PS2=" > "
# export PROMPT_COMMAND='status=$?; _line_width=$(((${COLUMNS} - 7)/2)); tput setaf 3; printf %${_line_width}s | tr " " "${separator}" ; echo -n " " ; if [[ ${status} == 0 ]] ; then tput setaf 2 ; else tput setaf 1 ; fi ; printf [%03d] ${status}; echo -n " " ; tput setaf 3 ; printf %$((${_line_width} - 25))s | tr " " "${separator}" ; echo -n " " ; date +"%F %T%z"; tput sgr0'
# export PS1='\[tput setaf 3\]$(status=$? ; printf %$((${COLUMNS}-31))s | tr " " "~" ; echo -n " " ; if [[ ${status} == 0 ]] ; then echo -en \[$(tput setaf 2)\] ; else echo -en \[$(tput setaf 1)\] ; fi ; printf [%03d] ${status})\[$(tput setaf 3)\] \D{%F %T%z}\n\[$(tput sgr0)\]\u@\h:\w \n\[$(tput sgr0)\] \$ ' #"\u@\h:\w"\n\n \$ '
