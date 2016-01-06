#!/bin/bash
# ~/.bash_aliases

# enhancement
alias ls='ls --color=auto'
alias ll='ls -al'
alias lll='ll -i -h --time-style=long-iso'
alias grep='grep --color=auto'

alias sshfs='sshfs -o Ciphers=arcfour -o cache_stat_timeout=600 -o workaround=nodelaysrv'

# shortcuts
alias x='startx'
alias 256colors='(x=`tput op` y=`printf %4s`
    echo BLK RED GRN YEL BLU MAG CYN WHT
    for i in {1..16}; do
        c=$((i-1))
        echo -en `tput setaf $c;tput setab $c`${y// /=}$x
        if [ $(($i % 8)) -eq 0 ]; then
            echo
        fi
    done)'

# quick edit
alias suvim='sudo vim'
alias ehosts='sudo vim /etc/hosts'
alias ebash="vim ~/.bashrc"
alias ealias="vim ~/.bash_aliases"

# utilities
alias sshtunnel='ssh -qTfnN -D 8080'
alias myip="curl ifconfig.me"
alias serverthis="python2 -m SimpleHTTPServer"
alias pbin="curl -F 'f:1=<-' ix.io"
alias pbin2="curl -F 'sprunge=<-' sprunge.us"

# power manage
alias bye='sudo shutdown -h now'
alias away="sudo sh -c 'echo -n mem > /sys/power/state'"

# git
alias gs='git status'
alias gl='git lg'
alias gd='git diff'
alias gdl='git diff HEAD^ HEAD'
alias m="git add -u && git commit -m"
alias mm='git add -u && git commit --amend'
alias gco='git checkout'
alias gmg='git merge'
alias grb='git rebase'
alias gcp='git cherry-pick'

# package manager
alias pacman='pacman --color=auto'
alias pmi='sudo pacman -S'
alias pmip='sudo pacman -U'
alias pms='pacman -Ss'
alias pmsi='pacman -Si'
alias pmrm='sudo pacman -Rsn'
alias pmwho='pacman -Qo'
alias pmls='pacman -Ql'
alias pmlo='pacman -Qdt'
alias pmclean='sudo pacman -Rsn $(pacman -Qdtq)'
alias packer='packer --noconfirm'

# eclim
if [[ -e ~/opt/eclipse/eclimd ]]; then
    alias eclim='(Xvfb :8 -screen 0 1024x768x24 &) && (DISPLAY=:8 ~/opt/eclipse/eclimd -b &)'
    alias eclimd='~/opt/eclipse/eclimd &'
fi

mkalias () { echo "alias $1='$2'" >> ~/.bash_aliases; }

man () {
  env LESS_TERMCAP_mb=$'\E[01;31m' \
  LESS_TERMCAP_md=$'\E[01;32m' \
  LESS_TERMCAP_me=$'\E[0m' \
  LESS_TERMCAP_so=$'\E[01;37;44m' \
  LESS_TERMCAP_se=$'\E[0m' \
  LESS_TERMCAP_us=$'\E[01;04;35m' \
  LESS_TERMCAP_ue=$'\E[0m' \
  man "$@"
}

extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1     ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar e $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xf $1      ;;
      *.tbz2)      tar xjf $1     ;;
      *.tgz)       tar xzf $1     ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
