require "plugins"
require "lsp"

vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.clipboard = "unnamed"
vim.opt.textwidth = 80
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false 
vim.opt.foldlevel = 99 
vim.opt.foldopen:remove { "block" } 
vim.opt.foldmethod = "marker" 
vim.opt.shortmess:append "I" 
vim.opt.completeopt = { "menu", "menuone" } 
vim.opt.splitbelow = true 
vim.opt.splitright = true 
vim.cmd [[set wildcharm=<Tab>]]

vim.cmd([[
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
]])

if vim.env.COLORTERM then
    vim.opt.termguicolors = true
end
vim.cmd "colorscheme base16-tomorrow-night-eighties"

vim.cmd([[
    augroup make_split_sizes_equal_on_terminal_window_resize
	autocmd!
	autocmd VimResized * wincmd =
    augroup END
]])
vim.cmd([[
    augroup highlight_on_yank
	autocmd!
	autocmd TextYankPost * silent! lua vim.highlight.on_yank()
    augroup END
]])

vim.cmd([[cnoremap <expr> <C-L> wildmenumode() ? "\<Down>\<Tab>" : "\<C-l>"]])
vim.cmd([[cnoremap <expr> <C-H> wildmenumode() ? "\<Up>\<Tab>" : "\<C-h>"]])
vim.api.nvim_set_keymap("c", "<C-J>", "<Down>", { noremap = true} )
vim.api.nvim_set_keymap("c", "<C-K>", "<Up>", { noremap = true} )

vim.api.nvim_set_keymap("n", "<C-J>", "<Cmd>cnext<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-K>", "<Cmd>cprevious<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-N>", "<Cmd>cnfile<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-P>", "<Cmd>cpfile<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "m<C-M>", "<Cmd>update<bar>make<CR>", { noremap = true })

vim.api.nvim_set_keymap("t", "<C-_>", [[<C-\><C-N>]], { noremap = true })

vim.cmd([[command! EngToSwe %s/[;'[]/\={';': 'ö', "'": 'ä', '[': 'å'}[submatch(0)]/ge]])
