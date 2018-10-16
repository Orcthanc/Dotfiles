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

alias cl='clear'
alias cp='cp -aiv'
alias grep='grep --color=always'
alias tgz='tar -pczf'
alias pull='git pull -v'
alias push='git push -v'
alias vim='nvim'
alias vktest='export VK_INSTANCE_LAYERS=VK_LAYER_LUNARG_standard_validation; '
alias mp3dl='youtube-dl -x -i --audio-format mp3 --audio-quality 1 --add-metadata --write-thumbnail --geo-bypass -w'

export MPD_HOST="$HOME/.config/mpd/socket"
export VISUAL=nvim
export EDITOR="$VISUAL"
