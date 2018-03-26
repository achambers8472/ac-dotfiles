alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
alias emacs="emacs --no-window-system"
alias watch="watch --difference=cumulative"
alias rsync="rsync --archive --verbose --progress --partial --human-readable --compress"
alias du="du --summarize --human-readable"
alias mv="mv --interactive"
alias df="df --human-readable"

# git
alias ,gs="git status"
alias ,gc="git commit"
alias ,gh="git push"
alias ,gl="git pull"
alias ,gd="git diff"
alias ,ga="git add"

# alias vim="vim --servername vim"

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
