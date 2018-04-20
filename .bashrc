#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \W \$\[\033[00m\] '
PS2='> '
PS3='> '
PS4='+ '

if [[ $PS1 && -f /usr/share/git/git-prompt.sh ]]; then
    source /usr/share/git/git-prompt.sh

    export GIT_PS1_SHOWDIRTYSTATE=1
    export GIT_PS1_SHOWSTASHSTATE=1
    export GIT_PS1_SHOWUNTRACKEDFILES=1

        PS1='\[\e[1;92m\]\u@\h\[\e[m\] \[\e[1;94m\]\W\[\e[m\] \[\e[1;91m\]$(__git_ps1 "(%s)")\[\e[m\]\[\e[1;92m\]\$\[\e[m\] \[\e[0;37m\]'
fi


alias ls='ls --group-directories-first --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'

alias cp='cp -aiv'
alias grep='grep --color=always'
alias tgz='tar -pczf'
alias pull='git pull -v'
alias push='git push -v'
alias openconnect='sudo openconnect asa-cluster.lrz.de'
alias battlenet='wine .wine/drive_c/Program\ Files/Battle.net/Battle.net.exe'

export VISUAL=vim
export EDITOR="$VISUAL"
