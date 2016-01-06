#!/bin/bash
# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

################
# 256color
################
if [[ $TERM != *-256color ]]; then
    export TERM=xterm-256color
fi

export HISTSIZE=65535
export HISTFILESIZE=$HISTSIZE

################
# PS1
################

#PS1='[\u@\h \W]\$ '

find_git_branch () {
    local dir=.
    local head
    until [ "$dir" -ef / ]; do
        if [ -f "$dir/.git/HEAD" ]; then
            head=$(< "$dir/.git/HEAD")
            if [[ $head = ref:\ refs/heads/* ]]; then
                git_branch="${head#*/*/}"
            elif [[ $head != '' ]]; then
                git_branch="(detached)"
            else
                git_branch="(unknow)"
            fi
            echo $git_branch
            return
        fi
        dir="../$dir"
    done
    git_branch=''
}

find_ruby () {
  if [ -f .ruby-version ]; then
    local ruby=$(echo $MY_RUBY_HOME | awk -F'-' '{print $2}')
    echo $ruby
  fi
}

find_gemset () {
  if [ -f .ruby-version ]; then
    local gemset=$(echo $GEM_HOME | awk -F'@' '{print $2}')
    [ "$gemset" != '' ] && gemset="@$gemset"
    echo $gemset
  fi
}

#--------------------+--+--+  +-+------------+
# CL='\[\e[F;B;Cm\]' |FG|BG|  |C| Style      |
#--------------------+--+--+  +-+------------+
# DFT='\[\e[0m\]'    |  |  |  |0| OFF        |
# BLK='\[\e[0;30m\]' |30|40|  |1| Hightlight |
# RED='\[\e[0;31m\]' |31|41|  |4| Uderline   |
# GRN='\[\e[0;32m\]' |32|42|  |5| Blink      |
# YEL='\[\e[0;33m\]' |33|43|  |7| Reverse    |
# BLU='\[\e[0;34m\]' |34|44|  +--------------+
# MAG='\[\e[0;35m\]' |35|45|
# CYN='\[\e[0;36m\]' |36|46|
# WHT='\[\e[0;37m\]' |37|47|
#--------------------+--+--+

# PS1="\n\[\e[0;36m\]┌─[\[\e[1;35m\]\u\[\e[1;34m\] @ \[\e[1;35m\]\h\[\e[0;36m\]]─[\[\e[1;34m\]\A\[\e[0;36m\]]─[\[\e[1;34m\]\w\[\e[0;36m\]]─[\[\e[0;31m\]\!\[\e[0;36m\]] \[\e[1;34m\$(find_git_branch)\]"
PS1="\n\[\e[0;36m\]┌─[\[\e[1;35m\]\u\[\e[1;34m\] @ \[\e[1;35m\]禪\[\e[0;36m\]]─[\[\e[1;34m\]\A\[\e[0;36m\]]─[\[\e[1;33m\]\w\[\e[0;36m\]] \[\e[1;32m\$(find_git_branch)\] \[\e[1;31m\$(find_ruby)\]\[\e[1;31m\$(find_gemset)\] "
# PS1="${PS1}\n\[\e[0;36m\]└─[\[\e[1;37m\]\$\[\e[0;36m\]] \[\e[0m\]"
PS1="${PS1}\n\[\e[0;36m\]└─╼ \[\e[0m\]"

# command prompt... HOLY SHIT MAGIC!
case $TERM in
    screen*)
        SCREENTITLE='\[\ek\e\\\]\[\ek\W\e\\\]\[\e]2;\W\e\\\]'
        ;;
    *)
        SCREENTITLE=''
        ;;
esac
PS1="${PS1}${SCREENTITLE}"

################
# alias
################

[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

################
# local
################

[[ -s ~/.bash_local ]] && . ~/.bash_local

################
# environment
################

export EDITOR="vim"
export BROWSER="firefox"

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
[[ -r $HOME/.rvm/scripts/completion ]] && . $HOME/.rvm/scripts/completion

# nvm
[ -s "$HOME/.nvm/nvm.sh" ] && . "$HOME/.nvm/nvm.sh"

if [[ -d $HOME/.pyenv ]]; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# 256-color gruvbox palette shellscript
if [[ -s $HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh ]]; then
    source $HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh
fi

#nodejs
# source <(npm completion)

# brew
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
