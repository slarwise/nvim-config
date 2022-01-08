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
vim.opt.list = true
vim.cmd [[set wildcharm=<Tab>]]

vim.cmd [[
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
]]

if vim.env.COLORTERM then
    vim.opt.termguicolors = true
end
vim.cmd "colorscheme base16-tomorrow-night-eighties"

vim.cmd [[
    augroup make_split_sizes_equal_on_terminal_window_resize
	autocmd!
	autocmd VimResized * wincmd =
    augroup END
]]
vim.cmd [[
    augroup highlight_on_yank
	autocmd!
	autocmd TextYankPost * silent! lua vim.highlight.on_yank()
    augroup END
]]
vim.cmd [[
    augroup terminal
        autocmd!
        autocmd TermOpen * startinsert
    augroup END
]]

vim.cmd [[cnoremap <expr> <C-L> wildmenumode() ? "\<Down>\<Tab>" : "\<C-l>"]]
vim.cmd [[cnoremap <expr> <C-H> wildmenumode() ? "\<Up>\<Tab>" : "\<C-h>"]]
vim.api.nvim_set_keymap("c", "<C-J>", "<Down>", { noremap = true })
vim.api.nvim_set_keymap("c", "<C-K>", "<Up>", { noremap = true })

vim.api.nvim_set_keymap("n", "<C-J>", "<Cmd>cnext<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-K>", "<Cmd>cprevious<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-N>", "<Cmd>cnfile<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-P>", "<Cmd>cpfile<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "m<C-M>", "<Cmd>update<bar>make<CR>", { noremap = true })

vim.api.nvim_set_keymap("t", "<C-_>", [[<C-\><C-N>]], { noremap = true })

vim.cmd [[command! EngToSwe %s/[;'[]/\={';': 'ö', "'": 'ä', '[': 'å'}[submatch(0)]/ge]]

vim.cmd [[ command! LspCodeAction lua vim.lsp.buf.code_action() ]]
vim.cmd [[ command! LspCompletion lua vim.lsp.buf.completion() ]]
vim.cmd [[ command! LspDefinition lua vim.lsp.buf.definition() ]]
vim.cmd [[ command! LspDocumentSymbol lua vim.lsp.buf.document_symbol() ]]
vim.cmd [[ command! LspFormat lua vim.lsp.buf.formatting() ]]
vim.cmd [[ command! LspHover lua vim.lsp.buf.hover() ]]
vim.cmd [[ command! LspIncomingCalls lua vim.lsp.buf.incoming_calls() ]]
vim.cmd [[ command! LspOutgoingCalls lua vim.lsp.buf.outgoing_calls() ]]
vim.cmd [[ command! LspReferences lua vim.lsp.buf.references() ]]
vim.cmd [[ command! LspRename lua vim.lsp.buf.rename() ]]
vim.cmd [[ command! LspWorkspaceSymbol lua vim.lsp.buf.workspace_symbol() ]]
vim.cmd [[ command! LspDiagnosticSetQf lua vim.diagnostic.set_qflist() ]]
vim.cmd [[ command! LspDiagnosticOpenFloat lua vim.diagnostic.open_float() ]]

vim.cmd [[ command! TelescopeLsptypedefinitions Telescope lsp_type_definitions ]]
vim.cmd [[ command! TelescopeTagstack Telescope tagstack ]]
vim.cmd [[ command! TelescopeLspimplementations Telescope lsp_implementations ]]
vim.cmd [[ command! TelescopeLspcodeactions Telescope lsp_code_actions ]]
vim.cmd [[ command! TelescopeLsprangecodeactions Telescope lsp_range_code_actions ]]
vim.cmd [[ command! TelescopeLspdocumentsymbols Telescope lsp_document_symbols ]]
vim.cmd [[ command! TelescopeLspworkspacesymbols Telescope lsp_workspace_symbols ]]
vim.cmd [[ command! TelescopeLspdynamicworkspacesymbols Telescope lsp_dynamic_workspace_symbols ]]
vim.cmd [[ command! TelescopeLspdocumentdiagnostics Telescope lsp_document_diagnostics ]]
vim.cmd [[ command! TelescopeDiagnostics Telescope diagnostics ]]
vim.cmd [[ command! TelescopeLspworkspacediagnostics Telescope lsp_workspace_diagnostics ]]
vim.cmd [[ command! TelescopeOldfiles Telescope oldfiles ]]
vim.cmd [[ command! TelescopeQuickfix Telescope quickfix ]]
vim.cmd [[ command! TelescopeKeymaps Telescope keymaps ]]
vim.cmd [[ command! TelescopeTreesitter Telescope treesitter ]]
vim.cmd [[ command! TelescopeResume Telescope resume ]]
vim.cmd [[ command! TelescopeSpellsuggest Telescope spell_suggest ]]
vim.cmd [[ command! TelescopeAutocommands Telescope autocommands ]]
vim.cmd [[ command! TelescopeHighlights Telescope highlights ]]
vim.cmd [[ command! TelescopeLivegrep Telescope live_grep ]]
vim.cmd [[ command! TelescopeFd Telescope fd ]]
vim.cmd [[ command! TelescopeGrepstring Telescope grep_string ]]
vim.cmd [[ command! TelescopeFindfiles Telescope find_files ]]
vim.cmd [[ command! TelescopeFilebrowser Telescope file_browser ]]
vim.cmd [[ command! TelescopeCurrentbufferfuzzyfind Telescope current_buffer_fuzzy_find ]]
vim.cmd [[ command! TelescopeCurrentbuffertags Telescope current_buffer_tags ]]
vim.cmd [[ command! TelescopeGitfiles Telescope git_files ]]
vim.cmd [[ command! TelescopeFiletypes Telescope filetypes ]]
vim.cmd [[ command! TelescopeGitcommits Telescope git_commits ]]
vim.cmd [[ command! TelescopePickers Telescope pickers ]]
vim.cmd [[ command! TelescopeGitbcommits Telescope git_bcommits ]]
vim.cmd [[ command! TelescopeBuffers Telescope buffers ]]
vim.cmd [[ command! TelescopeGitbranches Telescope git_branches ]]
vim.cmd [[ command! TelescopeMarks Telescope marks ]]
vim.cmd [[ command! TelescopeGitstatus Telescope git_status ]]
vim.cmd [[ command! TelescopeGitstash Telescope git_stash ]]
vim.cmd [[ command! TelescopeBuiltin Telescope builtin ]]
vim.cmd [[ command! TelescopePlanets Telescope planets ]]
vim.cmd [[ command! TelescopeLoclist Telescope loclist ]]
vim.cmd [[ command! TelescopeCommandhistory Telescope command_history ]]
vim.cmd [[ command! TelescopeSearchhistory Telescope search_history ]]
vim.cmd [[ command! TelescopeVimoptions Telescope vim_options ]]
vim.cmd [[ command! TelescopeHelptags Telescope help_tags ]]
vim.cmd [[ command! TelescopeManpages Telescope man_pages ]]
vim.cmd [[ command! TelescopeReloader Telescope reloader ]]
vim.cmd [[ command! TelescopeColorscheme Telescope colorscheme ]]
vim.cmd [[ command! TelescopeCommands Telescope commands ]]
vim.cmd [[ command! TelescopeRegisters Telescope registers ]]
vim.cmd [[ command! TelescopeSymbols Telescope symbols ]]
vim.cmd [[ command! TelescopeJumplist Telescope jumplist ]]
vim.cmd [[ command! TelescopeLspreferences Telescope lsp_references ]]
vim.cmd [[ command! TelescopeTags Telescope tags ]]
vim.cmd [[ command! TelescopeLspdefinitions Telescope lsp_definitions ]]
vim.cmd [[ command! TelescopeInterestingfiles Telescope interesting_files ]]
vim.cmd [[ command! TelescopeFzf Telescope fzf ]]
vim.cmd [[ command! TelescopeGitdiff Telescope git_diff ]]
vim.cmd [[ command! TelescopeArgs Telescope args ]]
