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
vim.opt.timeoutlen = 500

if vim.env.COLORTERM then
    vim.opt.termguicolors = true
end
vim.cmd "colorscheme base16-tomorrow-night-eighties"

vim.diagnostic.config { signs = false }
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})
