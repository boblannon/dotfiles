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

# alias openfiles="lsof | awk '{ print \$2 \$1; }' | sort -rn | uniq -c | sort -rn | head -20"

alias seba='source ./env/bin/activate '
alias svba='source ./venv/bin/activate '

# reattach-to-user-namespace to make terminal-notifier work within tmux
alias terminal-notifier='reattach-to-user-namespace terminal-notifier'

alias s3basename='awk -F " " '"'"'{ print $4 }'"'"''

alias ringbell='echo -e "\a"'
alias dockerlogin='eval "$(aws ecr get-login --region us-east-1 --no-include-email)"'

alias vimdiff='nvim -d '

alias tfprint='pbpaste | python -c "import sys;print(eval(sys.stdin.read()))"'

alias terd='awsudo -u dev terraform -chdir=environments/dev'
alias ters='awsudo -u staging terraform -chdir=environments/staging'
alias terp='awsudo -u production terraform -chdir=environments/production'
