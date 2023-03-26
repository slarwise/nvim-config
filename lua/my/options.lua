vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.clipboard = "unnamedplus"
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
vim.opt.timeoutlen = 500
vim.opt.mouse = ""

if vim.env.COLORTERM or vim.env.TERM == "tmux-256color" then
    vim.opt.termguicolors = true
    vim.cmd "colorscheme base16-tomorrow-night-eighties"
end

vim.diagnostic.config { signs = false }
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

vim.cmd [[ highlight link LspCodeLens Comment ]]
vim.cmd [[ highlight link LspCodeLensSeparator Comment ]]
