#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

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

PS1='\n\[\e[0;36m\]┌─[\[\e[1;35m\]\u\[\e[1;34m\] @ \[\e[1;35m\]\h\[\e[0;36m\]]─[\[\e[1;34m\]\A\[\e[0;36m\]]─[\[\e[1;34m\]\w\[\e[0;36m\]]─[\[\e[0;31m\]\!\[\e[0;36m\]] \[\e[1;34m$(find_git_branch)\]\n\[\e[0;36m\]└─[\[\e[1;37m\]\$\[\e[0;36m\]] \[\e[0m\]'
# command prompt... HOLY SHIT MAGIC!
case $TERM in
    screen*)
        SCREENTITLE='\[\ek\e\\\]\[\ek\W\e\\\]'
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

# Java
# export JAVA_HOME=~/java/jdk1.6.0_45_i586
export JAVA_HOME=~/java/jdk1.6.0_45_x64
export PATH=$JAVA_HOME/bin:$PATH

# android
export ANDROID_SDK=~/android/sdk
export PATH=$PATH:$ANDROID_SDK/tools:$ANDROID_SDK/platform-tools

#ruby
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# source ~/.rvm/scripts/rvm
# export PATH=$PATH:$(ruby -rubygems -e "puts Gem.user_dir")/bin

#nodejs
# source <(npm completion)
