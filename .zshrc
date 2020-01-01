# Brew completion
autoload -Uz compinit
compinit

export PATH=/usr/local/opt/python/libexec/bin:$PATH
export PATH=$PATH:~/.bin

export LANG="sv_SE.UTF-8"
export LC_ALL="sv_SE.UTF-8"

export EDITOR=nvim

alias dots="cd ~/Dropbox/dotfiles/"
alias chalm="cd ~/Dropbox/Chalmers/"
alias contextdocs="cd /Library/TeX/Documentation/texmf-doc/context/"

if [ "$TMUX" = "" ]; then tmux; fi
