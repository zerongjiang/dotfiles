#
# ~/.bash_profile
#

umask 022

# private bin
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# java
if [[ -d $HOME/opt/java ]]; then
    export JAVA_HOME=$HOME/opt/java
    export PATH=$JAVA_HOME/bin:$PATH
fi

# android
if [[ -d $HOME/opt/android/sdk ]]; then
    export ANDROID_SDK=$HOME/opt/android/sdk
    export PATH=$PATH:$ANDROID_SDK/tools:$ANDROID_SDK/platform-tools
fi

# rvm
if [[ -d $HOME/.rvm/bin ]]; then
    export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
    # export PATH=$PATH:$(ruby -rubygems -e "puts Gem.user_dir")/bin
fi

# nvm
if [[ -d $HOME/.nvm ]]; then
    export NVM_DIR=$HOME/.nvm
fi

[[ -s "$HOME/.bashrc" ]] && source "$HOME/.bashrc"
