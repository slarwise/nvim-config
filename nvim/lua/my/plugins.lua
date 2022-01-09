vim.cmd "packadd cfilter"
vim.g.tex_no_error = 1
vim.g.tex_flavor = "latex"
vim.g.tex_comment_nospell = 1
vim.g.vimsyn_embed = "l" -- Syntax highlighting for lua in vim files
vim.g.markdown_fenced_languages = { "python", "vim", "lua" }

return require("packer").startup {
    function(use)
        use "wbthomason/packer.nvim"

        use "akinsho/toggleterm.nvim"

        use "RRethy/nvim-base16"

        use "junegunn/vader.vim"

        use {
            "iamcco/markdown-preview.nvim",
            run = function()
                vim.fn["mkdp#util#install"]()
            end,
            cmd = "MarkdownPreview",
            }

        use "neovim/nvim-lspconfig"

        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
        }

        use {
            "jose-elias-alvarez/null-ls.nvim",
            requires = { "nvim-lua/plenary.nvim" },
        }

        use "nvim-lua/plenary.nvim"

        use {
            "nvim-telescope/telescope.nvim",
            requires = "nvim-lua/plenary.nvim",
        }
        use {
            "nvim-telescope/telescope-fzf-native.nvim",
            run = "make",
            requires = "nvim-telescope/telescope.nvim",
        }

        use "skanehira/preview-uml.vim"

        use "MunifTanjim/nui.nvim"

        use "slarwise/vim-erlang-syntax-simple"
        use "my.plugins.vim_oldfiles"
        use "slarwise/vim-projectfiles"

        use "tpope/vim-commentary"
        use "tpope/vim-repeat"
        use "tpope/vim-surround"

        use "aklt/plantuml-syntax"

        use "stevearc/dressing.nvim"

        use "~/Dropbox/projects/microscope.nvim"
    end,
    config = {
        display = {
            open_fn = function()
                return require("packer.util").float { border = "rounded" }
            end,
        },
    },
}
