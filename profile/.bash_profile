## NOTE: for debugging
# PS4='+ $LINENO $(gdate "+%s.%N")\011 '
# exec 3>&2 2>/tmp/bashstart.$$.log
# set -x

# Load .bashrc if it exists
if [ -f "${HOME}/.bashrc" ]; then
    source "${HOME}/.bashrc"
fi

# NOTE: for debugging
# set +x
# exec 2>&3 3>&-
