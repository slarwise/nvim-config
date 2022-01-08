vim.cmd "packadd cfilter"
vim.g.tex_no_error = 1
vim.g.tex_flavor = "latex"
vim.g.tex_comment_nospell = 1
vim.g.vimsyn_embed = "l" -- Syntax highlighting for lua in vim files
vim.g.markdown_fenced_languages = { "python", "vim", "lua" }

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]

return require("packer").startup {
    function(use)
        use "wbthomason/packer.nvim"

        use(require "plugins.toggleterm")

        use "RRethy/nvim-base16"

        use "junegunn/vader.vim"

        use(require "plugins.markdown_preview")

        use "neovim/nvim-lspconfig"

        use(require "plugins.treesitter")

        use(require "plugins.null_ls")

        use "nvim-lua/plenary.nvim"

        use(require "plugins.telescope")
        use(require "plugins.telescope_fzf_native")

        use "skanehira/preview-uml.vim"

        use "MunifTanjim/nui.nvim"

        use "slarwise/vim-erlang-syntax-simple"
        use(require "plugins.vim_oldfiles")
        use "slarwise/vim-projectfiles"

        use "tpope/vim-commentary"
        use "tpope/vim-repeat"
        use "tpope/vim-surround"

        use "aklt/plantuml-syntax"

        use(require "plugins.dressing")

        use(require "plugins.microscope")
    end,
    config = {
        display = {
            open_fn = function()
                return require("packer.util").float { border = "rounded" }
            end,
        },
    },
}
