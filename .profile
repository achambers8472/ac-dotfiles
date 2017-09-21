umask 022

export PATH="${HOME}/.opt/anaconda2/bin:${PATH}"
export PATH="${HOME}/.opt/ac-chroma-utils:${PATH}"
export PATH="${HOME}/.opt/IGV_2.3.94:${PATH}"
export PATH="${HOME}/.opt/FastQC:${PATH}"
export PATH="${HOME}/.opt/picard_2.9.4:${PATH}"
export PATH="${HOME}/.opt/GenomeAnalysisTK-3.7:${PATH}"
export PATH="${HOME}/.opt/hisat2-2.0.4:${PATH}"
export PATH="${HOME}/.opt/fred:${PATH}"
export PATH="${HOME}/.local/bin:${PATH}"
# export PATH="${HOME}/local/samtools-1.5/bin"
# export PATH="${HOME}/local/htslib-1.5"
# export PATH="${HOME}/local/freebayes/bin"
export PYTHONPATH="${HOME}/.opt/ac-python"
export TEXMFHOME="${HOME}/.texmf"
export HTOPRC="${HOME}/.htoprc"
export SCREENDIR="$HOME/.screen"
mkdir --mode=700 --parents "$SCREENDIR"
export EDITOR=vim

export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=
export HISTFILESIZE=
export TMOUT=0
export PS1='$(status=$? ; if [[ ${status} == 0 ]] ; then echo -en \[$(tput setaf 2)\] ; else echo -en \[$(tput setaf 1)\] ; fi ; printf [%03d] ${status})\[$(tput sgr0)\] --- \u@\h:\w\n \$ '
# last=$(fc -ln -0 | sed -e s/^[[:space:]]*//)
export PS2=" > "
export PROMPT_COMMAND="history -a; history -c; history -r"

if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
	source "$HOME/.bashrc"
    fi
fi
