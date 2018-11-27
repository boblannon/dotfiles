#!/bin/bash
apt-get update -y \
    && apt-get install -y locales curl \
    && locale-gen en_US.UTF-8 \
    && bash -c "echo \"Etc/UTC\" > /etc/timezone"

apt-get -y -q install build-essential cmake
apt-get -y -q install ncurses-term bash-completion wget ack-grep htop tree vim-nox ruby-dev rake memcached libevent-dev libncurses5-dev libncursesw5-dev ncdu postgresql-client


pip install awscli --upgrade

yarn global add jshint
yarn global add jsonlint

# build and install new tmux
mkdir src
cd src
wget https://github.com/tmux/tmux/releases/download/2.3/tmux-2.3.tar.gz
tar xvzf tmux-2.3.tar.gz
cd tmux-2.3/
./configure && make
make install

