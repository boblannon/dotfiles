## NOTE: for debugging
# PS4='+ $LINENO $(gdate "+%s.%N")\011 '
# exec 3>&2 2>/tmp/bashstart.$$.log
# set -x

eval "$(/opt/homebrew/bin/brew shellenv)"
# Load .bashrc if it exists
if [ -f "${HOME}/.bashrc" ]; then
    source "${HOME}/.bashrc"
fi

# NOTE: for debugging
# set +x
# exec 2>&3 3>&-


test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"


# added by Snowflake SnowSQL installer v1.2
export PATH=/Applications/SnowSQL.app/Contents/MacOS:$PATH

# added by Snowflake SnowCD installer
export PATH=/opt/snowflake/snowcd:$PATH
