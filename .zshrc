# Brew completion
autoload -Uz compinit
compinit

# Set stand-alone context earlier than texlive version in PATH
export PATH=/Users/arvidbjurklint/context/tex/texmf-osx-64/bin:$PATH
export PATH=/usr/local/opt/python/libexec/bin:$PATH
export PATH=$PATH:~/.bin

export LANG="sv_SE.UTF-8"
export LC_ALL="sv_SE.UTF-8"

alias dots="cd ~/Dropbox/dotfiles/"
alias chalm="cd ~/Dropbox/Chalmers/"
alias contextdocs="cd /Library/TeX/Documentation/texmf-doc/context/"

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Start tmux when alacritty is started
if [ "$TMUX" = "" ] && [ "$TERM_PROGRAM" = "alacritty" ]; then
    run-tmux-and-monitor-background
    # tmux
fi
