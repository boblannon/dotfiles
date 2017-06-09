#!/bin/bash

# install pypy for the pypy things
wget https://bitbucket.org/pypy/pypy/downloads/pypy2-v5.3.0-linux64.tar.bz2 -O - | tar xvfj - -C /data/
ln -s /data/pypy2-v5.3.0-linux64/bin/pypy /usr/local/bin/pypy

