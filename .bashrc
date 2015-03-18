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
PS1="\n\[\e[0;36m\]┌─[\[\e[1;35m\]\u\[\e[1;34m\] @ \[\e[1;35m\]\h\[\e[0;36m\]]─[\[\e[1;34m\]\A\[\e[0;36m\]]─[\[\e[1;33m\]\w\[\e[0;36m\]] \[\e[1;31m\$(find_git_branch)\]"
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

[[ -f ~/.bash_local ]] && . ~/.bash_local

################
# environment
################

export EDITOR="vim"
export BROWSER="firefox"

# Java
if [[ -d ~/opt/java ]]; then
    export JAVA_HOME=~/opt/java
    export PATH=$JAVA_HOME/bin:$PATH
fi

# android
if [[ -d ~/opt/android/sdk ]]; then
    export ANDROID_SDK=~/opt/android/sdk
    export PATH=$PATH:$ANDROID_SDK/tools:$ANDROID_SDK/platform-tools
fi

#ruby
if [[ -d $HOME/.rvm/bin ]]; then
    export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
    # source ~/.rvm/scripts/rvm
    # export PATH=$PATH:$(ruby -rubygems -e "puts Gem.user_dir")/bin
fi

# 256-color gruvbox palette shellscript
if [ -f $HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh ]; then
    source $HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh
fi

#nodejs
# source <(npm completion)
