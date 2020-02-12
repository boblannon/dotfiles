#!/bin/bash

set -ex

# this isn't found for some reason but i don't know why
#brew cask install font-inconsolata
brew cask install keybase

# needed for elasticsearch
#brew cask install java
brew cask install homebrew/cask-versions/adoptopenjdk8

packages=(
  # utils
  bash-completion
  ack
  ncdu
  awscli
  openssl
  gnupg2
  htop
  jq
  wget
  gcc
  tree
  cmake

  protobuf
  protobuf-c
  json-c
  libxml2
  jpeg
  libpng
  libyaml


  # databases
  elasticsearch
  redis
  postgresql
  memcached
  mysql

  # python
  python

  # node
  v8
  node
  nvm
  yarn

  # spark

  apache-spark

  # ruby
  ruby
  ruby-build

  # git
  git
  bash-git-prompt

  # terminal-notifier
  terminal-notifier

  # for tmux
  reattach-to-user-namespace
)

for p in "${packages[@]}"
do
  brew install $p
done

brew install gnu-sed
brew install grep
brew install ripgrep

mkdir $HOME/.nvm

yarn global add jshint
yarn global add jsonlint
