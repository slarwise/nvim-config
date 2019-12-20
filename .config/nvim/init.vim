set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" General settings{{{
set langmenu=none " Disable localized menus

filetype plugin indent on

set smartindent " Takes the indent of above line, useful for regular txt-files
set expandtab " Expands tab into spaces
set shiftwidth=4 " Width when using <, >
set shiftround " When using <, >, round to nearest shiftwidth
set softtabstop=4 " Actual length when using tabs

set ignorecase " Ignore case when searching...
set smartcase " ...unless we type a capital
set nohlsearch " Don't highlight search matches

set clipboard=unnamed " Yank/paste automatically to/from system clipboard

set foldlevel=99 " Start with all folds open
"}}}
" Display{{{

if exists("$COLORTERM")
    " Fancy colors
    " According to :h xterm-true-color
    " t_8f and t_8b are only set when $TERM is xterm*
    " In tmux, $TERM is screen by default.
    " Therefore, we have to set them explicitly here.
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
    set background=light
    let g:gruvbox_contrast_light='soft'
    let g:gruvbox_italic=1
    let g:gruvbox_italicize_comments=1
    colorscheme gruvbox
    " Change cursor shape depending on mode
    let &t_SI = "\e[5 q"
    let &t_EI = "\e[2 q"
    " Status line style
    highlight StatusLine cterm=reverse,italic
    highlight StatusLineNC cterm=reverse,italic
else
    " Simple colors
    set background=light
    colorscheme zellner
endif

set number " Show line number on the left
set relativenumber " Show numbers relative to current line number

set scrolloff=2 " Minimal number of lines to keep above and below the cursor

set statusline= " Empty the statusline
set statusline+=%f	    " filename, relative to current working directory
set statusline+=\[%{strlen(&ft)?&ft:'none'}]    " file type
set statusline+=%h%m%r%w    " status flags
set statusline+=%=  " right align remainder
set statusline+=%{wordcount()['words']}\ words,\  " Show number of words
set statusline+=%-14(%l/%L,%c%)  " line/total number of lines

set wildignore=*.aux,*.log,*.fdb_latexmk,*.fls,*.out,*.synctex.gz
set completeopt=menu,menuone " Display insertion completion as a popup

set breakindent " Indents word-wrapped lines as much as the parent line
set textwidth=80 " Sets when the line should break
set linebreak " Ensures word-wrap does not split words 

set splitbelow " Open new windows below the current...
set splitright " ... and to the right
"}}}
" Mappings{{{
let mapleader=" "
let maplocalleader="-"

" Basic commands
nnoremap <LEADER>w :w<CR>
nnoremap <LEADER>q :q<CR>
nnoremap <LEADER>Q :qall<CR>

" Remove delay after pressing ESC and another character, i.e. key code delays
set ttimeoutlen=0

" Remap ö to colon for faster ex commands
noremap ö :

" Make
nnoremap <LEADER>mm :make<CR>
nnoremap <LEADER>mM :make!<CR>
nnoremap <LEADER>mc :make clean<CR>
nnoremap <LEADER>mC :make! clean<CR>

" $MYVIMRC
nnoremap <LEADER>sm :source $MYVIMRC<CR>
nnoremap <LEADER>em :edit $MYVIMRC<CR>

" Open explorer to my vim-folders
nnoremap <LEADER>ef :Explore ~/Dropbox/dotfiles/.vim/after/ftplugin/<CR>

" Todo-file
nnoremap <LEADER>t :sp ~/Dropbox/Chalmers/todo.md<CR>

" Finding files
" Searches recursively from the current directory, matching 
nnoremap <LEADER>f :find **/*
set path=.,, " Finds files in current directory and relative to current directory

" Navigating tmux panes and vim windows with the same mappings.
" <c-j> to go to the next window/pane and <c-k> to previous.
if exists("$TMUX")
    function GoToNextWindow()
        if winnr() < winnr('$') || (str2nr(system("tmux list-panes|wc -l")) == 1)
            execute "normal! \<c-w>w"
        else
            call jobstart("tmux select-pane -t+")
            if trim(system("tmux display -p '#{pane_current_command}'")) ==# "nvim"
                call jobstart("tmux send-keys C-w t")
            endif
        endif
    endfunction

    function GoToPreviousWindow()
        if winnr() > 1 || (str2nr(system("tmux list-panes|wc -l")) == 1)
            execute "normal! \<c-w>W"
        else
            call jobstart("tmux select-pane -t-")
            if trim(system("tmux display -p '#{pane_current_command}'")) ==# "nvim"
                call jobstart("tmux send-keys C-w b")
            endif
        endif
    endfunction

    nnoremap <silent> <c-j> :call GoToNextWindow()<cr>
    nnoremap <silent> <c-k> :call GoToPreviousWindow()<cr>
else
    nnoremap <c-j> <c-w>w
    nnoremap <c-k> <c-w>W
endif
"}}}
" Filetype specifics (That cannot be put in the after-directory){{{
" Latex
let g:tex_no_error=1
let g:tex_flavor='latex'
let g:tex_noindent_env = 'document\|verbatim\|lstlisting\|center'
let g:tex_fold_enabled = 1
" =============================================================================
"}}}
" vim: set foldmethod=marker:
