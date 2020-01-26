" Source files from where vim's path{{{
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
"}}}

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
set clipboard=unnamed " Yank/paste automatically to/from system clipboard
set foldlevel=99 " Start with all folds open
set ttimeoutlen=0 " Delay after pressing ESC and another character
set path=.,, " Search relative to current dir and in current dir
set path+=/Users/arvidbjurklint/Dropbox/Chalmers/
set path+=/Users/arvidbjurklint/Dropbox/dotfiles/
set path+=/Users/arvidbjurklint/Dropbox/dotfiles/.bin/
set path+=/Users/arvidbjurklint/Dropbox/dotfiles/.config/
set path+=/Users/arvidbjurklint/Dropbox/dotfiles/.vim/
set wildignore=*.aux,*.log,*.fdb_latexmk,*.fls,*.out,*.synctex.gz,
set wildignorecase
set nohlsearch
set completeopt=menu,menuone " Display insertion completion as a popup
set breakindent " Indents word-wrapped lines as much as the parent line
set textwidth=80 " Sets when the line should break
set linebreak " Ensures word-wrap does not split words 
set splitbelow splitright " Open new windows below the current and to the right
set shortmess=I " Disables intro on startup
set number " Show line number on the left
set relativenumber " Show numbers relative to current line number
set scrolloff=2 " Minimal number of lines to keep above and below the cursor
"}}}

" Plugins {{{
call plug#begin('~/.vim/plugged')
    Plug 'morhetz/gruvbox'
    Plug 'tpope/vim-commentary'
    Plug 'neomake/neomake'
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'
call plug#end()

" gruvbox
let g:gruvbox_contrast_light='soft'
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italic=1
let g:gruvbox_italicize_comments=1

" tex
let g:tex_no_error=1
let g:tex_flavor='latex'
let g:tex_noindent_env = 'document\|verbatim\|lstlisting\|center'
let g:tex_fold_enabled = 1

" fzf
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
"}}}

" Display{{{
if exists("$COLORTERM")
    " According to :h xterm-true-color
    " t_8f and t_8b are only set when $TERM is xterm*
    " In tmux, $TERM is screen by default.
    " Therefore, we have to set them explicitly here.
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    if trim(system("get-background-mode")) ==# "dark"
        set background=dark
    else
        set background=light
    endif
    set termguicolors
    colorscheme gruvbox
else
    set background=light
    colorscheme zellner
endif

let &t_SI = "\e[5 q" " Cursor: line in insert mode
let &t_EI = "\e[2 q" " Cursor: block in other modes
" This could be made into a function (and made fancier)
" Inspiration
" https://www.reddit.com/r/vimporn/comments/efjcv0/gruvboxxx/ 
set statusline= " Empty the statusline
set statusline+=%f	    " filename, relative to current working directory
set statusline+=\[%{strlen(&ft)?&ft:'none'}]    " file type
set statusline+=%h%m%r%w    " status flags
set statusline+=%=  " right align remainder
set statusline+=%-14(%l/%L,%c%)  " line/total number of lines
set fillchars=eob:\     " Remove the tilde at lines at end of buffer
"}}}

" Mappings{{{
let mapleader=" "
let maplocalleader="-"

nnoremap <LEADER>w :w<CR>
nnoremap <LEADER>q :q<CR>
nnoremap <LEADER>Q :qall<CR>
noremap ö :

nnoremap <LEADER>m :Neomake <CR>
nnoremap <LEADER>M :Neomake! <CR>
nnoremap <LEADER>co :copen<BAR>wincmd p <CR>
nnoremap <LEADER>cc :cclose <CR>
nnoremap <LEADER>cn :cnext <CR>
nnoremap <LEADER>cn :cprev <CR>

nnoremap <LEADER>sm :source $MYVIMRC<CR>
nnoremap <LEADER>em :edit $MYVIMRC<CR>

nnoremap <LEADER>ef :e ~/Dropbox/dotfiles/.vim/after/ftplugin/
nnoremap <LEADER>et :sp ~/Dropbox/Chalmers/todo.md<CR>

nnoremap <LEADER>f :find **/

" Navigating tmux panes and vim windows with the same mappings.
" <c-j> to go to the next window/pane and <c-k> to previous.
if exists("$TMUX")
    nnoremap <silent> <c-j> :TmuxGoToNextWindow <CR>
    nnoremap <silent> <c-k> :TmuxGoToPreviousWindow <CR>
else
    nnoremap <c-j> <c-w>w
    nnoremap <c-k> <c-w>W
endif
"}}}

" vim:set foldmethod=marker foldlevel=0:
