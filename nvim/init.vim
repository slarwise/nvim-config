" General settings {{{1

" Indentation/whitespace
set expandtab " Expand tabs into spaces
set softtabstop=4 " Actual length when inserting tabs
set shiftwidth=4 " Width when using <, >
set shiftround " When using <, >, round to nearest shiftwidth

" Yank/paste to/from system clipboard by default
if has('clipboard')
    set clipboard=unnamed
endif

" Text formatting
set textwidth=80 " Sets when the line should break
set linebreak " Ensures word-wrap does not split words
set breakindent " Indents word-wrapped lines as much as the parent line
set nojoinspaces " Do not put two spaces after [.!?] when formatting

" Display

" Make window sizes equal when the terminal window is resized
augroup auto_equal_windows
    autocmd!
    autocmd VimResized * wincmd =
augroup END
set nohlsearch " Do not highlight search matches
set inccommand=nosplit " Show preview of what will happen on e.g. :s
set foldlevel=99 " Start with all folds open
set shortmess+=I " Disables intro on startup
set completeopt=menu,menuone " Display insertion completion as a popup

" Plugins {{{1

" Enable filetype specific plugins and indentation
filetype plugin indent on

" Tell neovim which python3 executable to use
let g:python3_host_prog = "/usr/local/bin/python3" 

" Ensure vim-plug is installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
    Plug 'lifepillar/vim-gruvbox8'
    Plug 'tpope/vim-commentary'
    Plug 'neomake/neomake'
    Plug 'justinmk/vim-sneak'
    Plug 'tpope/vim-repeat'
    Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
    Plug 'tpope/vim-surround'
call plug#end()

" Plugin specific settings
let g:tex_no_error=1
let g:tex_flavor='latex'
let g:tex_noindent_env = 'document\|verbatim\|lstlisting\|center'
let g:tex_fold_enabled = 1

let g:markdown_fenced_languages = ['python']

let g:gruvbox_filetype_hi_groups = 1
let g:gruvbox_plugin_hi_groups = 1

let g:neomake_virtualtext_current_error=0
let g:neomake_place_signs=0

let g:Hexokinase_highlighters = ['backgroundfull']

" Colors {{{1

" Use gruvbox colorscheme if the terminal can handle it
set background=light
if exists("$COLORTERM")
    set termguicolors
    colorscheme gruvbox8_soft
endif

" Use a statusline with some fancy symbols if the terminal can handle it.
" Also need to have a font which can handle the symbols.
if exists("$COLORTERM")
    function SetStatusLineCornersHLGroup()
        if synIDattr(synIDtrans(hlID('StatusLine')), 'reverse')
            let s:corner_fg = synIDattr(synIDtrans(hlID('StatusLine')), 'fg')
        else
            let s:corner_fg = synIDattr(synIDtrans(hlID('StatusLine')), 'bg')
        endif
        let s:corner_bg = synIDattr(synIDtrans(hlID('Normal')), 'bg')
        execute 'highlight User1 guifg='.s:corner_fg.' guibg='.s:corner_bg
    endfunction
    call SetStatusLineCornersHLGroup()
    set statusline=%1*%*\ %{&modified?'●':'\ '}\ \ %f%=%l/%L,%c\ %1*%*
    augroup statusline_corner_hl
        autocmd!
        autocmd ColorScheme * call SetStatusLineCornersHLGroup()
    augroup END
else
    set statusline=\ %m\ \ %f%=%l/%L,%c\ 
endif

" Mappings {{{1

" Remove delay after pressing ESC and another character
set ttimeoutlen=0

" Make Y behave the same way as C and D, i.e. yank to the end of the line
nnoremap Y y$

" Write, edit and find files
nnoremap Zu :update<CR>
nnoremap Zm :edit $MYVIMRC <CR>
nnoremap Zf :edit ~/Dropbox/dotfiles/nvim/after/ftplugin/
nnoremap Zt :edit ~/Dropbox/Chalmers/todo.md<CR>

" Compile programs and toggle the quickfix window
nnoremap m :update <bar> Neomake!<CR>
nnoremap m :update <bar> Neomake<CR>
nnoremap <silent> m
            \ :if getqflist({'winid' : 0}).winid <BAR> cclose <BAR> else <BAR>
            \ execute "copen <BAR> wincmd p" <BAR> endif <CR>

" Use Ctrl-h and Ctrl-l to go up/down directories when the wildmenu is open
set wildcharm=<Tab>
cnoremap <expr> <C-l> wildmenumode() ? "\<Down>\<Tab>" : "\<C-l>"
cnoremap <expr> <C-h> wildmenumode() ? "\<Up>\<Tab>" : "\<C-h>"

" vim:set foldmethod=marker:
