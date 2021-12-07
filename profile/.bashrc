export PROMPT_COMMAND=""

checkPath () {
    case ":$PATH:" in
        *":$1:"*) return 1;;
    esac
    return 0;
}

# Prepend to $PATH
prependToPath () {
    for a; do
        checkPath $a
        if [ $? -eq 0 ]; then
            local new_path="${a}:${PATH}"
            export PATH=$new_path
        fi
    done
}

# Append to $PATH
appendToPath () {
    for a; do
        checkPath $a
        if [ $? -eq 0 ]; then
            local new_path=$PATH:$a
            export PATH=$new_path
        fi
    done
}


# MacOS specific stuff
if [ "$(uname)" == "Darwin" ]; then
    # I'll migrate when I'm good and ready, thanks
    export BASH_SILENCE_DEPRECATION_WARNING=1

    # Ensure user-installed binaries take precedence
    prependToPath "/usr/local/bin"
    prependToPath "/usr/local/sbin"
    prependToPath "/usr/local/opt/python/libexec/bin"

    # Set architecture flags
    export ARCHFLAGS="-arch x86_64"

    # Compiler flags
    export LDFLAGS="-I/usr/local/opt/openssl/include -L/usr/local/opt/openssl/lib -L/usr/local/opt/icu4c/lib"
    export CPPFLAGS="-I/usr/local/opt/icu4c/include"

    test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

    # init pyenv
    if command -v pyenv 1>/dev/null 2>&1; then
      export PYENV_ROOT="$HOME/.pyenv"
      export PATH="$PYENV_ROOT/bin:$PATH"
      eval "$(pyenv init --path)"
    fi

    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
    fi

    unset JAVA_HOME
    # export JAVA_HOME=$(/usr/libexec/java_home -v "1.8.0_251")

    export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
fi

# Linux specific stuff
if [ "$(uname)" == "Linux" ]; then
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'

    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
fi

## add my own scripts dir
test -d "${HOME}/scripts" && appendToPath "${HOME}/scripts"

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

## bash_secrets
if [ -f ~/.bash_secrets ]; then
  . ~/.bash_secrets
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

## git
# this works with aliases for `git files` and `git stat` in ~/.gitconfig
export GIT_REVIEW_BASE=main

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
if [ -n "$TMUX" ]; then
    alias vim="TERM=screen-256color vim"
fi

if type nvim > /dev/null 2>&1; then
    alias vim='TERM=screen-256color nvim'
    export EDITOR='nvim'
else
    export EDITOR='vim'
fi


## apache-spark
export SPARK_HOME=/usr/local/Cellar/apache-spark/2.1.0/libexec
export PYTHONPATH=$PYTHONPATH:$SPARK_HOME/python:$SPARK_HOME/python/lib/py4j-0.10.4-src.zip

## git
#source ~/.git-completion.bash

## transfer.sh
transfer() { if [ $# -eq 0 ]; then echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
    tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; }

## nvm
export NVM_DIR="$HOME/.nvm"
if [ -f /usr/local/opt/nvm/nvm.sh ]; then
    . "/usr/local/opt/nvm/nvm.sh"
else
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi


## ack colorizing
ack_color() {
    ack --passthru --color-match=red "$1"
}

if [ -f ~/.config/exercism/exercism_completion.bash ]; then
  . ~/.config/exercism/exercism_completion.bash
fi

# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

# rust
if [ -d "$HOME/.cargo/bin" ]; then
    prependToPath "${HOME}/.cargo/bin"
    export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
fi

# poetry
if [ -d "$HOME/.poetry/bin" ]; then
    prependToPath "${HOME}/.poetry/bin"
fi

## irssi
# create the pane with irssi's nicklist
function irssi_nickpane() {
    tmux renamew irssi                                              # name the window
    tmux -q setw main-pane-width $(( $(tput cols) - 21))            # set the main pane width to the total width-20
    tmux splitw -v "cat ~/.irssi/nicklistfifo"                      # create the window and begin reading the fifo
    tmux -q selectl main-vertical                                   # assign the layout
    tmux selectw -t irssi                                           # select window 'irssi'
    tmux selectp -t 0                                               # select pane 0
    tmux send-keys -t 0 "/nicklist fifo" C-m
}

# irssi wrapper
function irssi() {
    irssi_nickpane
    $(which irssi)                                                  # launch irssi
}

# repair running irssi's nicklist pane
function irssi_repair() {
    tmux selectw -t irssi
    tmux selectp -t 0
    tmux killp -a                                                   # kill all panes
    irssi_nickpane
}

test -d "${HOME}/bin" && prependToPath "${HOME}/bin"

## ruby
# prependToPath "/usr/local/opt/ruby/bin"

### rbenv
# prependToPath "$HOME/.rbenv/bin"
# eval "$(rbenv init -)"

function jqcolor() {
    jq -C . | less -R
}

# Python

# Add user base binary directory
# see: https://docs.python-guide.org/dev/virtualenvs/#installing-pipenv
appendToPath "$(python -m site --user-base)/bin"

# TeX
if [ "$(uname)" == "Darwin" ]; then
    test -d "/Library/TeX/texbin" && appendToPath "/Library/TeX/texbin"
fi


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="${HOME}/.sdkman"
[[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"

### rvm
unset GEM_HOME
if [ -s "$HOME/.rvm/scripts/rvm" ]; then
    source $HOME/.rvm/scripts/rvm
fi
