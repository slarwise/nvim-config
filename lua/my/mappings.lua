local nnoremap = require("my.utils").nnoremap
local cnoremap = require("my.utils").cnoremap
local tnoremap = require("my.utils").tnoremap

vim.cmd [[cnoremap <expr> <C-L> wildmenumode() ? "\<Down>\<Tab>" : "\<C-l>"]]
vim.cmd [[cnoremap <expr> <C-H> wildmenumode() ? "\<Up>\<Tab>" : "\<C-h>"]]
cnoremap("<C-J>", "<Down>")
cnoremap("<C-K>", "<Up>")

nnoremap("<C-J>", "<Cmd>cnext<CR>")
nnoremap("<C-K>", "<Cmd>cprevious<CR>")
nnoremap("<C-N>", "<Cmd>cnfile<CR>")
nnoremap("<C-P>", "<Cmd>cpfile<CR>")
nnoremap("m<C-M>", "<Cmd>update<bar>make<CR>")

nnoremap("sf", "<Cmd>Telescope find_files<CR>")
nnoremap("sg", "<Cmd>Telescope live_grep<CR>")
nnoremap("sd", "<Cmd>Telescope lsp_document_symbols<CR>")
nnoremap(
    "so",
    "<cmd>lua require'telescope.builtin'.oldfiles(require'telescope.themes'.get_dropdown{ previewer = false })<CR>"
)
nnoremap("se", "<Cmd>Telescope diagnostics bufnr=0<CR>")
nnoremap("sE", "<Cmd>lua vim.diagnostic.setqflist()<cr>")
nnoremap("<space>", "<cmd>lua require'microscope.builtin'.args()<cr>")
nnoremap("sa", "<cmd>lua require'microscope.builtin'.args()<cr>")
nnoremap("sw", "<cmd>lua require'microscope.builtin'.cwd()<cr>")
nnoremap("sW", "<cmd>lua require'lists'.cwd_to_quickfix()<cr>")
nnoremap("s<C-W>", "<cmd>lua require'lists'.cwd_to_args()<cr>")
nnoremap("sb", "<cmd>lua require'microscope.builtin'.buffer_dir()<cr>")
nnoremap("sB", "<cmd>lua require'lists'.buf_dir_to_quickfix()<cr>")
nnoremap("s<C-B>", "<cmd>lua require'lists'.buf_dir_to_args()<cr>")

tnoremap("<C-_>", [[<C-\><C-N>]])
