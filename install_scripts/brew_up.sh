#!/bin/bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap caskroom/cask

brew cask install font-inconsolata
brew cask install java

packages = (

  # utils
  bash-completion
  ack
  ncdu
  awscli
  openssl
  gnupg2
  htop
  jq
  keybase
  wget
  gcc
  tree

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
  python3

  # node
  v8
  node
  nvm

  # spark

  apache-spark

  # ruby
  ruby
  ruby-build

  # git
  git
  bash-git-prompt
)

for p in "${packages[@]}"
do
  brew install $p
done
