" General settings {{{1

" Indentation/whitespace
set expandtab " Expand tabs into spaces
set softtabstop=4 " Actual length when inserting tabs
set shiftwidth=4 " Width when using <, >
set shiftround " When using <, >, round to nearest shiftwidth

" Yank/paste to/from system clipboard by default
set clipboard+=unnamed

" Text formatting
set textwidth=80 " Sets when the line should break
set linebreak " Ensures word-wrap does not split words
set breakindent " Indents word-wrapped lines as much as the parent line

" Searching
set ignorecase " Ignore case when searching
set smartcase " Overrides the ignorecase option when using capital letters

" Display {{{1

" Make window sizes equal when the terminal window is resized
augroup auto_equal_windows
    autocmd!
    autocmd VimResized * wincmd =
augroup END
set nohlsearch " Do not highlight search matches
set foldlevel=99 " Start with all folds open
set foldopen-=block " Don't open folds when using (, {, [[, [{, etc. motions
set foldmethod=marker " Use markers to define folds by default
set shortmess+=I " Disables intro on startup
set completeopt=menu,menuone " Display insertion completion as a popup
set splitbelow splitright " Open new splits below/to the right

" Terminal settings
augroup terminal
    autocmd!
    autocmd TermOpen * startinsert
augroup END

" Plugins {{{1

" Ensure vim-plug is installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
    " Plug 'tpope/vim-commentary'
    " Plug 'tpope/vim-surround'
    " Plug 'tpope/vim-repeat'

    " Plug 'slarwise/vim-oldfiles'
    " Plug 'slarwise/vim-projectfiles'

    " Plug 'lifepillar/vim-gruvbox8'

    " Plug 'junegunn/vader.vim'

    " Plug 'slarwise/vim-erlang-syntax-simple'

    " Plug 'neovim/nvim-lspconfig'

    " Plug 'nvim-lua/plenary.nvim'
    " Plug 'nvim-telescope/telescope.nvim'

    " Plug 'skanehira/preview-uml.vim'

    " Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

    " Plug 'tjdevries/colorbuddy.vim'

    " Plug 'RRethy/nvim-base16'

    " Plug '~/Dropbox/projects/lists.nvim'
    " Plug '~/Dropbox/projects/telescope-args.nvim'
    " Plug '~/Dropbox/projects/telescope-git-diff.nvim'
    " Plug '~/Dropbox/projects/interesting-files.nvim'
call plug#end()

packadd cfilter

" Plugin specific settings
let g:tex_no_error = 1
let g:tex_flavor = 'latex'
let g:tex_comment_nospell = 1

let g:vimsyn_embed = 'l' " Syntax highlighting for lua in vim files

let g:markdown_fenced_languages = ['python', 'vim'] " Syntax highlighting for code blocks

let g:gruvbox_filetype_hi_groups = 1 " Include highlights for some popular plugins
let g:gruvbox_plugin_hi_groups = 1 " Include highlights for several filetypes

let g:oldfiles_ignore = ['COMMIT_EDITMSG', '/runtime/doc/']

lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, {
        border = "rounded"
        }
    )

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        -- Disable signs
        signs = false,
        }
    )

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "erlangls" }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
            },
        }
end
EOF

lua << EOF
require('telescope').setup()
require('telescope').load_extension('args')
require('telescope').load_extension('git_diff')
require('telescope').load_extension('interesting_files')
require"interesting_files".setup({locations = {"interesting-files"}})
EOF

" Colors {{{1

" Use a statusline with some fancy symbols if the terminal can handle it.
" Also need to have a font which can handle the symbols.
if exists("$COLORTERM")
    function s:UpdateUserHLGroups() abort
        if synIDattr(synIDtrans(hlID('StatusLine')), 'reverse')
            let status_line_fg = 'fg'
        else
            let status_line_fg = 'bg'
        end
        if synIDattr(synIDtrans(hlID('StatusLineNC')), 'reverse')
            let status_line_fg_not_current = 'fg'
        else
            let status_line_fg_not_current = 'bg'
        end
        let statusline_bg_current = synIDattr(synIDtrans(hlID('StatusLine')), status_line_fg)
        let statusline_bg_not_current = synIDattr(synIDtrans(hlID('StatusLineNC')), status_line_fg_not_current)
        let normal_bg = synIDattr(synIDtrans(hlID('Normal')), 'bg')
        execute 'highlight User1 guifg=' .. statusline_bg_current .. ' guibg=' .. normal_bg
        execute 'highlight User2 guifg=' .. statusline_bg_not_current .. ' guibg=' .. normal_bg
    endfunction
    " Update the highlight groups of the corners to get a rounded statusline
    augroup statusline
        autocmd!
        autocmd ColorScheme * call s:UpdateUserHLGroups()
        autocmd WinEnter,BufEnter * setlocal statusline=%1*%*\ %{&modified?'●':'\ '}\ \ %f%=%l/%L,%c\ %1*%*
        autocmd WinLeave,BufLeave * setlocal statusline=%2*%*\ %{&modified?'●':'\ '}\ \ %f%=%l/%L,%c\ %2*%*
    augroup END
else
    set statusline=\ %m\ \ %f%=%l/%L,%c\ 
endif

if exists("$COLORTERM")
    set termguicolors
    colorscheme base16-tomorrow-night-eighties
endif
" set statusline=%t

" Mappings {{{1

" Remove delay after pressing ESC and another character. Needed?
set ttimeoutlen=0

" Use CTRL-H and CTRL-L to go up/down directories when the wildmenu is open
set wildcharm=<Tab>
cnoremap <expr> <C-L> wildmenumode() ? "\<Down>\<Tab>" : "\<C-l>"
cnoremap <expr> <C-H> wildmenumode() ? "\<Up>\<Tab>" : "\<C-h>"

" Use CTRL-J and CTRL-K to find the next/previous matching command on the
" command-line
cnoremap <C-J> <Down>
cnoremap <C-K> <Up>

" Navigate the quickfix list
nnoremap <C-J> :cnext<CR>
nnoremap <C-K> :cprevious<CR>
nnoremap <C-N> :cnfile<CR>
nnoremap <C-P> :cpfile<CR>

" Exit terminal mode using CTRL-/ or CTRL-7
tnoremap <C-_> <C-\><C-N>

" Update and make
nnoremap m<C-M> :update <bar> make<CR>

" Telescope
nnoremap sta <Cmd>Telescope args<CR>
nnoremap stb <Cmd>Telescope buffers<CR>
nnoremap stt <Cmd>Telescope<CR>
" nnoremap std <Cmd>lua require"telescope.builtin".git_files({prompt_title="Git Diff Main Files", show_untracked=false, recurse_submodules=false, git_command={"git", "diff", "--name-only", "main"}})<CR>
" nnoremap std <Cmd>Telescope git_diff<CR>
nnoremap sti <Cmd>Telescope interesting_files<CR>
nnoremap sto <Cmd>Telescope oldfiles<CR>
nnoremap std <Cmd>Telescope find_files search_dirs=~/Dropbox/dotfiles<CR>

" Interesting files
nnoremap <space> <cmd>lua require"interesting_files".navigate(vim.v.count1)<CR>

command! EngToSwe %s/[;'[]/\={';': 'ö', "'": 'ä', '[': 'å'}[submatch(0)]/ge

" vim:set foldmethod=marker:
