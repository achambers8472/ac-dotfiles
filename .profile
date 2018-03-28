umask 022

export PATH="${HOME}/.opt/anaconda3/bin:${PATH}"
export PATH="${HOME}/.opt/ac-chroma-utils:${PATH}"
export PATH="${HOME}/.opt/IGV_2.3.94:${PATH}"
export PATH="${HOME}/.opt/FastQC:${PATH}"
export PATH="${HOME}/.opt/picard_2.9.4:${PATH}"
export PATH="${HOME}/.opt/GenomeAnalysisTK-3.7:${PATH}"
export PATH="${HOME}/.opt/hisat2-2.0.4:${PATH}"
export PATH="${HOME}/.opt/fred:${PATH}"
export PATH="${HOME}/.opt/hexographer:${PATH}"
export PATH="${HOME}/.opt/dungeongrapher:${PATH}"
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
export TERM="xterm-256color"

if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
	source "$HOME/.bashrc"
    fi
fi
