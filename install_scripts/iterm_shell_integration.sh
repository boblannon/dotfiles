#!/bin/bash
curl -L https://iterm2.com/misc/`basename $SHELL`_startup.in \
-o $HOME/.iterm2_shell_integration.`basename $SHELL`
