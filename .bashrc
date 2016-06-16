# Load system defaults
if [[ -f /etc/bashrc ]]; then
    source /etc/bashrc || echo "Errors loading system bashrc"
fi

umask 022
export TMOUT=0
export EDITOR=vim
export PS1="\u@\h > "
export PS2="     > "
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

export SCREENDIR="$HOME/.screen"
mkdir --mode=700 --parents "$SCREENDIR"

prefix="${HOME}/git/ac-essentials"
ac_tex="${prefix}/ac-tex"
ac_python="${HOME}/git/ac-python"
ac_chroma_utils="${HOME}/git/ac-chroma-utils"

ac-envvar-push-front() {
    local varname="${1}"
    shift
    for ((i=$#;i>0;i--)) ; do
        newvalue="${!i}"
        if [[ -z "${!varname:-}" ]] ; then
            export "${varname}"="${newvalue}:"
        elif [[ ":${!varname}:" != *":${newvalue}:"* ]] ; then
            export "${varname}"="${newvalue}:${!varname}"
        fi
    done
}

# ac-envvar-push-back() {
#     local varname="${1}"
#     shift
#     for newvalue in "$@" ; do
# 	if [[ -z "${!varname:-}" ]] ; then
# 	    export "${varname}"="${newvalue}:"
# 	elif [[ ":${!varname}:" != *":${newvalue}:"* ]] ; then
# 	    export "${varname}"="${!varname}:${newvalue}"
# 	fi
#     done
# }

ac-envvar-push-front PATH \
    "${prefix}/bin" \
    "${prefix}/lib" \
    "${ac_chroma_utils}" \
    "${HOME}/bin" \
    "${HOME}/local/bin" \
    "${HOME}/.local/bin" \
    "${HOME}/local/anaconda2/bin" \

ac-envvar-push-front MANPATH \
    "${HOME}/man" \
    "${HOME}/share/man"

ac-envvar-push-front PYTHONPATH "." "${ac_python}"

ac-envvar-push-front TEXINPUTS "." "${ac_tex}//"
ac-envvar-push-front BIBINPUTS "." "${ac_tex}"
ac-envvar-push-front BSTINPUTS "." "${ac_tex}"

alias ls='ls --color=auto'
alias emacs='emacs -nw'
alias rsync='rsync --archive --verbose --progress --partial --human-readable --compress'
alias watch='watch --difference=cumulative'

# eval "$(dircolors ${AC_ESSENTIALS_DIR}/dircolors/dircolors.ansi-light)"
unset LS_COLORS

if [[ "${TERM}" == "xterm" && "${COLORTERM}" == gnome-terminal ]] ; then
	export TERM=xterm-256color
fi

if [[ $- == *i* ]] ; then
    if [[ -s "${prefix}/base16-shell/base16-default.dark.sh" ]] ; then
        source "${prefix}/base16-shell/base16-default.dark.sh"
    fi
fi

function ac-hostname {
    case "${HOSTNAME}" in
        eddie*) echo "eddie" ;;
        erwin*) echo "erwin" ;;
        isaac*) echo "isaac" ;;
        *phoenix*) echo "phoenix" ;;
        kraft) echo "kraft" ;;
        frost) echo "frost" ;;
        *)
            if [[ ! -z "${IVEC_CLUSTER:-}" ]] ; then echo "${IVEC_CLUSTER}"
            elif  [[ ! -z "${SLURM_CLUSTER_NAME:-}" ]] ; then
                case "${SLURM_CLUSTER_NAME}" in
                    phoenix) echo "phoenix" ;;
                esac
            else
                case "${USER}" in
                    ajc566)
                        echo "raijin"
                        ;;
                    hhpchamb)
                        echo "hlrn"
                        ;;
                    *)
                        echo "unknown"
                esac
            fi
    esac
}

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
esac
