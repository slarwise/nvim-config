# Completion
autoload -Uz compinit
compinit

# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

# Vi mode in terminal
bindkey -v

# Set stand-alone context earlier than texlive version in PATH. Screws up
# matplotlib.
# export PATH=/Users/arvidbjurklint/context/tex/texmf-osx-64/bin:$PATH

# Python path
export PATH=/usr/local/opt/python/libexec/bin:$PATH

# My own scripts
export PATH=$PATH:~/.bin

export LANG="sv_SE.UTF-8"
export LC_ALL="sv_SE.UTF-8"

alias dots="cd ~/Dropbox/dotfiles/"
alias chalm="cd ~/Dropbox/Chalmers/"
alias context-commands="open ~/Dropbox/Chalmers/report-writing/context/docs/setup-en.pdf"
alias context-ref="open ~/Dropbox/Chalmers/report-writing/context/docs/contextref.pdf"
alias pv="qlmanage -p"

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Start tmux when alacritty is started
if [ "$TMUX" = "" ] && [ "$TERM_PROGRAM" = "alacritty" ]; then
    run-tmux-and-monitor-background
fi

# Start tmux when kitty is started
if [ "$TMUX" = "" ] && [ "$TERM_PROGRAM" = "kitty" ]; then
    run-tmux-and-monitor-background
fi
