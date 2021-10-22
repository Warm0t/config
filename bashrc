export LANG=en_US.utf8

export EDITOR=vim

#Alias git
alias gita='git add'
alias gitc='git commit -m'
alias gitt='git tag -a'
alias gitp='git push --follow-tag'
alias gitl='git log --oneline --graph'
alias gits='git status --untracked-files=no'
alias comp='gcc -Wall -Wextra -Werror -std=c99 -pedantic'

alias ls='ls --color=auto'
alias grep='grep --color -n'
GREEN="\[\e[0;32m\]"
PURPLE="\[\e[m\e[0;35m\]"
YELLOW="\[\e[m\033[33m\]"
NORMAL="\[$(tput sgr0)\]"

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
PS1=$GREEN"ocr.aeyes@bbbb $PURPLE\W $YELLOW\$(parse_git_branch) $NORMAL\$ "
command -V opam &> /dev/null && eval $(opam env)
