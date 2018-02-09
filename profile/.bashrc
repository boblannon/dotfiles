export PROMPT_COMMAND=""

## add my own scripts dir
export PATH="$PATH:$HOME/scripts"

### custom tab title
function tabtitle(){
    REPO_NAME=`git rev-parse --show-toplevel 2> /dev/null | awk -F'/' '{print $NF}'`;
    REMOTE_NAME=`echo $CURRENT_REMOTE_NAME`;
    if [ -z "$REMOTE_NAME" ]
    then
        if [ -z "$REPO_NAME" ]
        then
            echo "${PWD##*/}"
        else
            echo "[$REPO_NAME]"
        fi
    else
        echo "$REMOTE_NAME"
    fi
}
#if [ $ITERM_SESSION_ID ]; then
#    export PROMPT_COMMAND='echo -ne "\033];$(tabtitle)${PWD##*/}\007"; ':"$PROMPT_COMMAND";
#fi

function ms() {
    export CURRENT_REMOTE_NAME="$1"
    morecs ssh "$1"
}

# Add command to PROMPT_COMMAND (runs before each command)
# Makes sure the command is not already in PROMPT_COMMAND
addToPromptCommand() {
  if [[ ":$PROMPT_COMMAND:" != *":$1:"* ]]; then
    PROMPT_COMMAND="${PROMPT_COMMAND:+"$PROMPT_COMMAND:"}$1"
  fi
}

# Set iTerm title to show current directory
if [ $ITERM_SESSION_ID ]; then
  addToPromptCommand 'echo -ne "\033];$(tabtitle)\007";'
fi

## bash_aliases

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if [ "$(uname)" == "Darwin" ]; then
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
      . $(brew --prefix)/etc/bash_completion
    fi
fi

## bash-git-prompt
GIT_PROMPT_THEME=Solarized # use theme optimized for solarized color scheme
if [ "$(uname)" == "Darwin" ]; then
    if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
        source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
    fi
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # GIT_PROMPT_ONLY_IN_REPO=1
    source ~/.bash-git-prompt/gitprompt.sh
#elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    # Hopefully we never get here
fi

## rbenv
#eval "$(rbenv init -)"

## pip
# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true

# but, still make it possible to do global pip installs
gpip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

gpip3(){
   PIP_REQUIRE_VIRTUALENV="" pip3 "$@"
}

## virtualenvwrapper
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/dev
    export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2
    export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
    source /usr/local/bin/virtualenvwrapper.sh

    # mkvirtualenv with py3
    alias mkvirtualenv3='mkvirtualenv --python=$(which python3)'
fi


## history
# Key bindings, up/down arrow searches through history
if [ -t 1 ]; then
    bind '"\e[A": history-search-backward'
    bind '"\e[B": history-search-forward'
    bind '"\eOA": history-search-backward'
    bind '"\eOB": history-search-forward'
fi

## editor
export EDITOR="vim"

if [ -n "$TMUX" ]; then
    alias vim="TERM=screen-256color vim"
fi


## apache-spark
export SPARK_HOME=/usr/local/Cellar/apache-spark/2.1.0/libexec
export PYTHONPATH=$PYTHONPATH:$SPARK_HOME/python:$SPARK_HOME/python/lib/py4j-0.10.4-src.zip

## git
#source ~/.git-completion.bash

## transfer.sh
transfer() { if [ $# -eq 0 ]; then echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
    tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; }

## ruby
export PATH=/usr/local/opt/ruby/bin:$PATH

### rbenv
#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"

### rvm
unset GEM_HOME
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

## nvm
export NVM_DIR="$HOME/.nvm"
if [ -f /usr/local/opt/nvm/nvm.sh ]; then
    . "/usr/local/opt/nvm/nvm.sh"
else
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
fi

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

## mapbox
if [ -f "$(npm root -g)/mbxcli/mapbox.sh" ]; then
    source "$(npm root -g)/mbxcli/mapbox.sh"
fi

## ack colorizing
ack_color() {
    ack --passthru --color-match=red "$1"
}
