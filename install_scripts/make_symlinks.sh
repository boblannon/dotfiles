#!/bin/bash
ln -s $HOME/cfg/dotfiles/profile/.bash_aliases $HOME/.bash_aliases
ln -s $HOME/cfg/dotfiles/profile/.bash_profile $HOME/.bash_profile
ln -s $HOME/cfg/dotfiles/profile/.bashrc $HOME/.bashrc
ln -s $HOME/cfg/dotfiles/profile/.jshintrc $HOME/.jshintrc
rm $HOME/Library/Preferences/com.googlecode.iterm2.plist
ln -s $HOME/cfg/dotfiles/profile/com.googlecode.iterm2.plist $HOME/Library/Preferences/com.googlecode.iterm2.plist
ln -s $HOME/cfg/dotfiles/git/.gitconfig $HOME/.gitconfig
ln -s $HOME/cfg/dotfiles/git/.gitignore $HOME/.gitignore
