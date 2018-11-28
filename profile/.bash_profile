# Set architecture flags
export ARCHFLAGS="-arch x86_64"
# Ensure user-installed binaries take precedence
export PATH="/usr/local/opt/python/libexec/bin:/usr/local/sbin:/usr/local/bin:$(getconf PATH)"
# TeX
export PATH="$PATH:/Library/TeX/texbin"

# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -f ~/.bash_secrets ] && source ~/.bash_secrets

## mapbox
if [ -f "$(npm root -g)/@mapbox/mbxcli/bin/mapbox.sh" ]; then
    source "$(npm root -g)/@mapbox/mbxcli/bin/mapbox.sh"
fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export PATH="$HOME/.cargo/bin:$PATH"
