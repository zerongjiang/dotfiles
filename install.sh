#!/bin/sh

linkdot()
{
    source="$HOME/dotfiles/$1"
    target="$HOME/$1"

    if [ -h $target ]; then
        if [ $target -ef $source ]; then
            echo "$1 Linked"
            return
        else
            echo "$1 Backing up"
            mv $target "$target.dotbak"
        fi
    fi

    echo "$1 Linking"
    ln -s $source $target
}

# bash
if [ ! -h $HOME/.bashrc ]; then
    echo '.bashrc sourcing'
    line='[[ -f ~/dotfiles/.bashrc ]] && . ~/dotfiles/.bashrc'
    if ! grep -Fxq "$line" $HOME/.bashrc; then
        echo "$line" >> $HOME/.bashrc
    fi
else
    linkdot .bashrc
fi
linkdot .bash_aliases
linkdot .bash_local

# vim
if [ ! -e $HOME/.vim/bundle ]; then
    if [ -e $HOME/.vim ]; then
        mv $HOME/.vim $HOME/.vim.dotbak
    fi
    mkdir -p $HOME/.vim/bundle
fi
linkdot .vimrc
linkdot .vim/bundle/vundle

# git
linkdot .gitconfig

# mux
linkdot .screenrc
linkdot .tmux.conf

# Xorg
linkdot .Xresources
linkdot .Xcolors
linkdot .xinitrc
linkdot .Xmodmap
