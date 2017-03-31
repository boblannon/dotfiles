#! /bin/bash

[[ -d $HOME/cfg ]] || mkdir $HOME/cfg
# This would be hard to do, right?
#git clone https://${MOREC2_GITHUB_TOKEN}/boblannon/dotfiles $HOME/cfg/dotfiles
[[ -d $HOME/.bash-git-prompt ]] || git clone https://github.com/magicmonty/bash-git-prompt.git $HOME/.bash-git-prompt --depth=1

function move_to_old(){
    if [ -f $1 ]; then
	mv $1 $1-old
    fi
}


move_to_old $HOME/.bashrc
ln -s $HOME/cfg/dotfiles/profile/.bashrc $HOME/.bashrc

move_to_old $HOME/.bash_aliases
ln -s $HOME/cfg/dotfiles/profile/.bash_aliases $HOME/.bash_aliases

move_to_old $HOME/.tmux.conf
ln -s $HOME/cfg/dotfiles/shell-session/.tmux.conf $HOME/.tmux.conf

move_to_old $HOME/.gitconfig
ln -s $HOME/cfg/dotfiles/git/.gitconfig $HOME/.gitconfig

move_to_old $HOME/.gitignore
ln -s $HOME/cfg/dotfiles/git/.gitignore $HOME/.gitignore

git config --global user.email "bob.lannon@mapbox.com"
git config --global user.name "Bob Lannon"
git config --global push.default simple

[[ -d $HOME/.vim/bundle ]] || mkdir -p $HOME/.vim/bundle
[[ -d $HOME/.vim/bundle/Vundle.vim ]] || git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

[[ -d $HOME/.vimbackup ]] || mkdir -p $HOME/.vimbackup
[[ -d $HOME/.vimswap ]] || mkdir -p $HOME/.vimswap
move_to_old $HOME/.vimrc
ln -s $HOME/cfg/dotfiles/vim/.vimrc $HOME/.vimrc

vim +PluginInstall +qall