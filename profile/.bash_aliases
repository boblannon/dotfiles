# color some commands by default
alias ls='ls -G'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# list variants
alias ll='ls -GFlsh'
alias la='ls -GFLash'
alias lhtr="ls -lhtr"

alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cd) %C(bold blue)<%an>%Creset' --abbrev-commit --date=format-local:%m-%d-%Y"
alias gs='git status '
alias ga='git add '
alias gap='git add -p'
alias gcm='git commit -m'
alias gb='git checkout -b '
alias gd='git diff'
alias gdc='git diff --cached'
alias gc='git checkout '
alias gmv='git mv '

alias git_statuses='for dir in $(find -L . -type d -d 1); do cd $dir; curr_branch=`git branch | grep "*"`; echo "${dir} ${curr_branch}"; cd ..; done;'

alias ipynb='jupyter notebook'
alias pyserve='python -m http.server '

alias openports='sudo lsof -i -n -P '

alias seba='source ./env/bin/activate '

# reattach-to-user-namespace to make terminal-notifier work within tmux
alias terminal-notifier='reattach-to-user-namespace terminal-notifier'

alias s3basename='awk -F " " '"'"'{ print $4 }'"'"''
