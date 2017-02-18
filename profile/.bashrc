## add my own scripts dir
export PATH="$PATH:$HOME/scripts"

## custom tab title
function tabtitle(){
    REPO_NAME=`git rev-parse --show-toplevel 2> /dev/null | awk -F'/' '{print $NF}'`;
    if [ -z "$REPO_NAME" ]
    then
        echo ""
    else
        echo "[$REPO_NAME] "
    fi
}
if [ $ITERM_SESSION_ID ]; then
    export PROMPT_COMMAND='echo -ne "\033];$(tabtitle)${PWD##*/}\007"; ':"$PROMPT_COMMAND";
fi

## bash_aliases

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi


## bash-git-prompt
GIT_PROMPT_THEME=Solarized # use theme optimized for solarized color scheme
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
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
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/dev
source /usr/local/bin/virtualenvwrapper.sh

# mkvirtualenv with py3
alias mkvirtualenv3='mkvirtualenv --python=$(which python3)'

## history
# Key bindings, up/down arrow searches through history
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\eOA": history-search-backward'
bind '"\eOB": history-search-forward'

## editor
export EDITOR="vim"

## apache-spark
export SPARK_HOME=/usr/local/Cellar/apache-spark/2.1.0/libexec
export PYTHONPATH=$PYTHONPATH:$SPARK_HOME/python:$SPARK_HOME/python/lib/py4j-0.10.4-src.zip

## git
#source ~/.git-completion.bash

## transfer.sh
transfer() { if [ $# -eq 0 ]; then echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
    tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; }

## rvm
unset GEM_HOME
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

## mapbox
source "$(npm root -g)/mbxcli/mapbox.sh"

## nvm
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
