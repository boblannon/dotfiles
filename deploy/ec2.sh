#! /bin/bash

mkdir $HOME/cfg
# This would be hard to do, right?
#git clone https://${MOREC2_GITHUB_TOKEN}/boblannon/dotfiles $HOME/cfg/dotfiles
git clone https://github.com/magicmonty/bash-git-prompt.git $HOME/.bash-git-prompt --depth=1

if [ -f $HOME/.bashrc ] then
    mv $HOME/.bashrc $HOME/.bashrc-old
fi

ln -s ~/cfg/dotfiles/profile/.bashrc .bashrc
ln -s ~/cfg/dotfiles/profile/.bash_aliases .bash_aliases
ln -s ~/cfg/dotfiles/shell-session/.tmux.conf .tmux.conf
git config --global user.email "bob.lannon@mapbox.com"
git config --global user.name "Bob Lannon"
git config --global push.default simple
