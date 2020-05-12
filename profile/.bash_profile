# I'll migrate when I'm good and ready, thanks
export BASH_SILENCE_DEPRECATION_WARNING=1

# Set architecture flags
export ARCHFLAGS="-arch x86_64"
# Ensure user-installed binaries take precedence
export PATH="/usr/local/opt/python/libexec/bin:/usr/local/sbin:/usr/local/bin:$(getconf PATH)"
# Add user base binary directory
# see: https://docs.python-guide.org/dev/virtualenvs/#installing-pipenv
export PATH="$PATH:$(python -m site --user-base)/bin"
# TeX
export PATH="$PATH:/Library/TeX/texbin"

# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -f ~/.bash_secrets ] && source ~/.bash_secrets

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

export PATH="$HOME/.cargo/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/robertlannon/.sdkman"
[[ -s "/Users/robertlannon/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/robertlannon/.sdkman/bin/sdkman-init.sh"
