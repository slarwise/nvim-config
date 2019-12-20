# Brew completion
autoload -Uz compinit
compinit

# Python
export PATH=/usr/local/opt/python/libexec/bin:$PATH

# Path to my own executable
export PATH=$PATH:~/.bin

# Set language, not set automatically in alacritty
export LANG="sv_SE.UTF-8"
export LC_ALL="sv_SE.UTF-8"

# Aliases
alias dots="cd ~/Dropbox/dotfiles/"
alias chalm="cd ~/Dropbox/Chalmers/"
