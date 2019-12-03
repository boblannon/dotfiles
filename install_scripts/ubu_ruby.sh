#!/bin/bash

url -sSL https://get.rvm.io | bash
source $HOME/.rvm/scripts/rvm
rvm install 2.2
rvm use 2.2 --default

