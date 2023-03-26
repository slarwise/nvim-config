vim.cmd "packadd cfilter"

require("packer").startup(function(use)
    use "RRethy/nvim-base16"
    use "wbthomason/packer.nvim"
    use {
        "slarwise/nvim-but-yaml",
        config = function()
            require("nvim_but_yaml").run("/home/arvid/.config/nvim/nvim.json")
        end,
    }
    use {
        "nvim-telescope/telescope.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("telescope").setup {
                defaults = { layout_strategy = "vertical" },
            }
        end,
    }
    require("packer").use {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
        requires = "nvim-telescope/telescope.nvim",
        config = function()
            require("telescope").load_extension "fzf"
        end,
    }
    use "tpope/vim-commentary"
    use {
        "stevearc/dressing.nvim",
        config = function()
            require("dressing").setup {
                select = {
                    backend = { "telescope", "builtin" },
                },
            }
        end,
    }
    use "slarwise/vim-erlang-syntax-simple"
    use {
        "antoinemadec/FixCursorHold.nvim",
        config = function()
            vim.g.cursorhold_updatetime = 250
        end,
    }
    use "Nicholas-Hein/folding-nvim"
    use {
        "rebelot/heirline.nvim",
        commit = "5fc36e3166bd0d6311bf839c298d7f72d3c2d06f",
    }
    use {
        "mfussenegger/nvim-lint",
        config = function()
            require("lint").linters_by_ft = {}
        end,
    }
    use "slarwise/lists.nvim"
    use "slarwise/make.nvim"
    use "slarwise/microscope.nvim"
    use {
        "jose-elias-alvarez/null-ls.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("null-ls").setup()
        end,
    }
    use "nvim-lua/plenary.nvim"
    use "numToStr/prettierrc.nvim"
    use "tpope/vim-repeat"
    use "tpope/vim-surround"
    use {
        "akinsho/toggleterm.nvim",
        config = function()
            require("toggleterm").setup { direction = "float" }
        end,
    }
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = { "erlang", "markdown", "python", "lua", "hcl" },
                highlight = { enable = true },
                indent = { enable = false },
            }
        end,
    }
    use {
        "slarwise/vim-oldfiles",
        config = function()
            vim.g.oldfiles_ignore = { "COMMIT_EDITMSG", "/runtime/doc/" }
        end,
    }
end)
require("nvim_but_yaml").run("/home/arvid/.config/nvim/nvim.json")
