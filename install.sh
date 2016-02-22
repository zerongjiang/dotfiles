#!/bin/sh

linkdot(){
    source="$HOME/dotfiles/$1"
    target="$HOME/$1"

    if [ -e $target ]; then
        if [ $target -ef $source ]; then
            echo "$1 Linked"
            return
        else
            echo "$1 Backing up"
            mv $target "$target.dotbak"
        fi
    fi

    echo "$1 Linking"
    source="dotfiles/$1"
    target="$1"
    (cd $HOME && ln -sr $source $target)
}

# bash
link_bash(){
    linkdot .bash_profile
    if [ -f $HOME/.bashrc ]; then
        echo '.bashrc sourcing'
        line='[[ -f ~/dotfiles/.bashrc ]] && . ~/dotfiles/.bashrc'
        if ! grep -Fxq "$line" $HOME/.bashrc; then
            echo "
# source dotfiles
$line" >> $HOME/.bashrc
        fi
    else
        linkdot .bashrc
    fi
    linkdot .bash_aliases
    linkdot .bash_local
}

# vim
link_vim(){
    if [ ! -e $HOME/.vim/bundle ]; then
        if [ -e $HOME/.vim ]; then
            mv $HOME/.vim $HOME/.vim.dotbak
        fi
        mkdir -p $HOME/.vim/bundle
    fi
    linkdot .vimrc
    linkdot .vim/bundle/vundle
}

# git
link_git(){
    linkdot .gitconfig
}

# mux
link_mux(){
    linkdot .screenrc

    if [ ! -e $HOME/.tmux/plugins/tpm ]; then
      if [ -e $HOME/.tmux ]; then
        mv $HOME/.tmux $HOME/.tmux.dotbak
      fi
      mkdir -p $HOME/.tmux/plugins
    fi
    linkdot .tmux/plugins/tpm
    linkdot .tmux.conf
    linkdot .tmux.reset.conf
}

# ag
link_ag(){
    linkdot .agignore
}

# Xorg
link_x11(){
    linkdot .Xresources
    linkdot .Xcolors
    linkdot .xinitrc
    linkdot .Xmodmap
}

# urxvt
link_urxvt(){
    linkdot .urxvt
}

# .fonts
link_fonts(){
    linkdot .fonts
    linkdot .fonts.conf.d
}

# awesomw wm
link_awesome(){
    if [ ! -e $HOME/.config ]; then
        mkdir $HOME/.config
    fi
    linkdot .config/awesome
}

link_cli(){
    link_bash
    link_vim
    link_git
    link_mux
    link_ag
}

link_gui(){
    link_x11
    link_urxvt
    link_fonts
    link_awesome
}

link_all(){
    link_cli
    depoly_gui
}

update_vim(){
    vim +PluginUpdate +qall
}

update_ycm(){
    (cd $HOME/.vim/bundle/YouCompleteMe && ./install.sh --clang-completer)
}

update_all(){
    update_vim
    update_ycm
}

usage(){
cat << EOF
$(basename "$0") -- script to link and update dotfile compoments

Usage:
 command [compoments]

Commands:
 link       symbolic link dotfile compoments
 update     update dotfile compoments

Compoments:
 all
   - cli: bash vim git mux ag
   - gui: x11 urxvt fonts awesome
EOF
}

if [ $# -le 1 ]; then
    usage
else
    action=$1
    for item in ${@:2} ; do
        if [ "$(type -t $action'_'$item)" = function ]; then
            $action'_'$item
        fi
    done
fi
