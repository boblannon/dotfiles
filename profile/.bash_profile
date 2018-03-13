# Set architecture flags
export ARCHFLAGS="-arch x86_64"
# Ensure user-installed binaries take precedence
export PATH="/usr/local/sbin:/usr/local/bin:$(getconf PATH)"

# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -f ~/.bash_secrets ] && source ~/.bash_secrets

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
