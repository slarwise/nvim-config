# Brew completion
autoload -Uz compinit
compinit

# Brew paths
# Python
export PATH=/usr/local/opt/python/libexec/bin:$PATH

# Path to my own executable
export PATH=$PATH:~/.bin

# Default working directory
if [[ ! "$TMUX" ]]
then
    cd ~/Dropbox/Chalmers
fi
