local nnoremap = require "my.utils".nnoremap
local cnoremap = require "my.utils".cnoremap

vim.cmd [[cnoremap <expr> <C-L> wildmenumode() ? "\<Down>\<Tab>" : "\<C-l>"]]
vim.cmd [[cnoremap <expr> <C-H> wildmenumode() ? "\<Up>\<Tab>" : "\<C-h>"]]

cnoremap("<C-J>", "<Down>")
cnoremap("<C-K>", "<Up>")

nnoremap("<C-J>", "<Cmd>cnext<CR>")
nnoremap("<C-K>", "<Cmd>cprevious<CR>")
nnoremap("<C-N>", "<Cmd>cnfile<CR>")
nnoremap("<C-P>", "<Cmd>cpfile<CR>")
nnoremap("m<C-M>", "<Cmd>update<bar>make<CR>")

nnoremap("<C-_>", [[<C-\><C-N>]])

nnoremap("<space>", "<cmd>lua require'microscope.builtin'.args()<cr>")
nnoremap(",,", "<cmd>lua require'microscope.builtin'.pickers()<cr>")
nnoremap("sn", "<cmd>lua require'my.microscope'.nvim()<cr>")
nnoremap("sf", "<Cmd>Telescope find_files<CR>")
nnoremap("sg", "<Cmd>Telescope live_grep<CR>")
