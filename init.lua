vim.cmd "packadd cfilter"

require("packer").startup(function(use)
    use "RRethy/nvim-base16"
    use "wbthomason/packer.nvim"
    use "slarwise/nvim-but-yaml"
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
    use {
        "jose-elias-alvarez/null-ls.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("null-ls").setup()
        end,
    }
    use "tpope/vim-repeat"
    use "tpope/vim-surround"
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = { "erlang", "markdown", "python", "lua", "hcl", "terraform" },
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
    use "lukas-reineke/indent-blankline.nvim"
    use {
        "nanotee/zoxide.vim",
        config = function()
            vim.g.zoxide_use_select = 1
            local zo_fzf_opts = os.getenv("_ZO_FZF_OPTS")
            if zo_fzf_opts then
                vim.g.zoxide_fzf_options = zo_fzf_opts
            end
        end
    }
    use "vijaymarupudi/nvim-fzf"
    use { 'ibhagwan/fzf-lua',
        -- optional for icon support
        requires = { 'nvim-tree/nvim-web-devicons' }
    }
end)

require("nvim_but_yaml").apply("/home/arvid/.config/nvim/nvim.yaml")
