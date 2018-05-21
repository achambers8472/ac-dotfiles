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
export PS1='$fill \t\n$(status=$? ; if [[ ${status} == 0 ]] ; then echo -en \[$(tput setaf 2)\] ; else echo -en \[$(tput setaf 1)\] ; fi ; printf [%03d] ${status})\[$(tput sgr0)\] --- \u@\h:\w\n \$ '

function prompt_command {
    # create a $fill of all screen width minus the time string and a space:
    let fillsize=${COLUMNS}-9
    fill=""
    while [ "$fillsize" -gt "0" ]
    do
        fill="-${fill}" # fill with underscores to work on
        let fillsize=${fillsize}-1
    done
}
export PROMPT_COMMAND=prompt_command

# Host-specific settings
case "$(ac-hostname)" in
    eddie)
        JHOME=/remote/accounts/jzanotti
        export PATH=/remote/accounts/jzanotti/bin.Linux:/home/eddie/jzanotti/opt/install/Canopy64/bin/:$PATH
        export QA_LOGGER_PROP=/remote/accounts/jzanotti/etc/qa_log4cpp.properties
        export LD_LIBRARY_PATH="${JHOME}/lib:/home/eddie/jzanotti/opt/install/guile-1.8.1/lib:$LD_LIBRARY_PATH"
        export GLI_HOME=${JHOME}/share
        export UKQCDSF_ANALYSIS=/home/eddie/achamber/qcd/ukqcdsf_analysis
        export QA_GUILE_GPDLIB=/home/eddie/jzanotti/qcd/src/qa/evff/gpdlib.scm
        export CCACHE_DIR=/home/eddie/achamber/.ccache/

        export PATH="/home/eddie/achamber/bin:${PATH}"
        export PATH="/home/eddie/achamber/local/qcdsfa-20140729+:${PATH}"
        export PATH="/home/eddie/achamber/local/anaconda2/bin:${PATH}"

        export MANPATH="/home/eddie/achamber/man:${MANPATH}"
        ;;
    erwin)
		export WORK=/raid/achambers
        JZANOTTI_HOME=/home/accounts/jzanotti
        export PATH="${HOME}/local/qcdsfa-20140729+:${JZANOTTI_HOME}/bin:$PATH"
        export QA_LOGGER_PROP=${JZANOTTI_HOME}/etc/qa_log4cpp.properties
        export LD_LIBRARY_PATH="${JZANOTTI_HOME}/lib:${JZANOTTI_HOME}/opt/install/guile-1.8.1/lib:$LD_LIBRARY_PATH"
        export GLI_HOME=${JZANOTTI_HOME}/share
        export UKQCDSF_ANALYSIS=~/qcd/ukqcdsf_analysis
        #export QA_GUILE_GPDLIB=${JZANOTTI_HOME}/qcd/src/qa/evff/gpdlib.scm
        export QA_GUILE_GPDLIB=~/qcd/src/qa/evff/gpdlib.scm
        ;;
    isaac)
        module load openmpi-uofa-gnu/1.8.1
        module load cuda/6.0
        module load gcc/4.7.2-rdt
        ;;
    phoenix)
		export WORK=/data/cssm/achambers
        module load OpenMPI/1.8.8-GNU-4.9.3-2.25
        module load CUDA/6.5.14
        module load ncurses/6.0-GNU-4.9.3-2.25
        module load Autotools/20150215-GNU-4.9.3-2.25
        ;;
    raijin)
		export WORK=/short/e31/ajc566
        module unload intel-fc
        module unload intel-cc
        module load openmpi/1.6.5
        module load gcc/5.2.0
        ;;
    galaxy)
        module switch PrgEnv-cray PrgEnv-gnu
	module switch gcc/4.8.2 gcc/4.9.2
	;;
    hlrn)
	module switch PrgEnv-cray PrgEnv-gnu
	;;
esac
