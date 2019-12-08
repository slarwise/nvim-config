# Brew completion
autoload -Uz compinit
compinit

# Brew paths
# Python
export PATH=/usr/local/opt/python/libexec/bin:$PATH

# Default working directory
if [[ ! "$TMUX" ]]
then
    cd ~/Dropbox/Chalmers
fi
