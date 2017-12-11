#!/bin/bash
apt-get -y -q install bash-completion wget ack-grep htop tree vim-nox ruby-dev rake memcached libevent-dev libncurses5-dev libncursesw5-dev ncdu postgresql-client

pip install awscli --upgrade

npm install -g jshint

# build and install new tmux
mkdir src
cd src
wget https://github.com/tmux/tmux/releases/download/2.3/tmux-2.3.tar.gz
tar xvzf tmux-2.3.tar.gz
cd tmux-2.3/
./configure && make
make install

