# Load system defaults
if [[ -f /etc/bashrc ]]; then
    source /etc/bashrc || echo "Errors loading system bashrc"
fi

# Load static bash environment
export BASH_ENV="${HOME}/.bash_env"
source "${BASH_ENV}"

# Load dynamic bash environment
export EDITOR=vim
export PS1="\u@\h > "
export PS2="     > "
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

alias ls='ls --color=auto'
alias emacs='emacs -nw'

# eval "$(dircolors ${AC_ESSENTIALS_DIR}/dircolors/dircolors.ansi-light)"
unset LS_COLORS

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
        export PATH="/home/eddie/achamber/local/anaconda/bin:${PATH}"

        export MANPATH="/home/eddie/achamber/man:${MANPATH}"
        ;;
    erwin)
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
        module load OpenMPI/1.8.8-GNU-4.9.3-2.25
        module load CUDA/6.5.14
        module load ncurses/6.0-GNU-4.9.3-2.25
        module load Autotools/20150215-GNU-4.9.3-2.25
        ;;
    raijin)
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
	frost|kraft)
		export TERM=xterm-256color
		;;
esac

if [[ $- == *i* ]] ; then
    if [[ -s "${AC_ESSENTIALS_DIR}/base16-shell/base16-default.dark.sh" ]] ; then
        source "${AC_ESSENTIALS_DIR}/base16-shell/base16-default.dark.sh"
    fi
fi
