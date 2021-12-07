#!/bin/bash
apt-get update -y \
    && apt-get install -y locales curl \
    && locale-gen en_US.UTF-8 \
    && bash -c "echo \"Etc/UTC\" > /etc/timezone"

apt-get -y -q install build-essential cmake
apt-get -y -q install python3-pip python3-venv
apt-get -y -q install ncurses-term bash-completion wget ack-grep htop tree vim-nox ruby-dev rake memcached libevent-dev libncurses5-dev libncursesw5-dev ncdu postgresql-client neovim python-neovim python3-neovim xclip

curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
apt-get install -y nodejs

# curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
# echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# apt update && apt install yarn

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf aws

# yarn global add jshint
# yarn global add jsonlint

# build and install new tmux
# mkdir src
# cd src
# wget https://github.com/tmux/tmux/releases/download/2.3/tmux-2.3.tar.gz
# tar xvzf tmux-2.3.tar.gz
# cd tmux-2.3/
# ./configure && make
# make install

