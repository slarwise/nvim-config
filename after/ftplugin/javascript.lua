vim.bo.shiftwidth = 2

vim.cmd [[compiler jest]] -- Sets the correct errorformat but jest as makeprg
vim.bo.makeprg = "npm"
