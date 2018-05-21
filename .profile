umask 022

export PATH="${HOME}/.opt/anaconda3/bin:${PATH}"
export PATH="${HOME}/.local/bin:${PATH}"
export PATH="${HOME}/.opt/git/bin:${PATH}"
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
