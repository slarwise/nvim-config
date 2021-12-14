vim.cmd "packadd cfilter"
vim.g.tex_no_error = 1
vim.g.tex_flavor = "latex"
vim.g.tex_comment_nospell = 1
vim.g.vimsyn_embed = "l" -- Syntax highlighting for lua in vim files
vim.g.markdown_fenced_languages = { "python", "vim" }

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require("packer").startup({function()
    use "wbthomason/packer.nvim"

    use "RRethy/nvim-base16"

    use "junegunn/vader.vim"

    use {
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn['mkdp#util#install']() end,
        cmd = 'MarkdownPreview'
    }

    use "neovim/nvim-lspconfig"

    use "nvim-lua/plenary.nvim"

    use {
        "nvim-telescope/telescope.nvim",
        config = function()
            require"telescope".setup()
            vim.api.nvim_set_keymap("n", "sb", "<Cmd>Telescope buffers<CR>", { noremap = true })
            vim.api.nvim_set_keymap("n", "sf", "<Cmd>Telescope find_files<CR>", { noremap = true })
            vim.api.nvim_set_keymap("n", "sd", "<Cmd>Telescope find_files search_dirs=~/.config,$DOTS<CR>", { noremap = true })
            vim.api.nvim_set_keymap("n", "sD", "<Cmd>Telescope live_grep search_dirs=~/.config,$DOTS<CR>", { noremap = true })
            vim.api.nvim_set_keymap("n", "so", "<Cmd>Telescope oldfiles<CR>", { noremap = true })
        end,
        requires = "nvim-lua/plenary.nvim",
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
        config = function()
            require"telescope".load_extension"fzf"
        end,
        requires = "nvim-telescope/telescope.nvim",
    }

    use "skanehira/preview-uml.vim"

    use "slarwise/vim-erlang-syntax-simple"
    use {
        "slarwise/vim-oldfiles",
        config = function()
            vim.g.oldfiles_ignore = { "COMMIT_EDITMSG", "/runtime/doc/" }
        end,
    }
    use "slarwise/vim-projectfiles"

    use "tpope/vim-commentary"
    use "tpope/vim-repeat"
    use "tpope/vim-surround"

    use {
        "~/Dropbox/projects/interesting-files.nvim",
        config = function()
            require"interesting_files".setup{
                locations = { "interesting-files" }
            }
            require"telescope".load_extension"interesting_files"
            vim.api.nvim_set_keymap("n", "si", "<Cmd>Telescope interesting_files<CR>", { noremap = true })
            -- Interesting files
            vim.api.nvim_set_keymap("n", "'", [[v:count ? "<cmd>lua require'interesting_files'.navigate(vim.v.count)<CR>" : "'"]], { noremap = true, expr = true})
        end,
        requires = "nvim-lua/plenary.nvim",
    }
    use "~/Dropbox/projects/lists.nvim"
    use {
        "~/Dropbox/projects/telescope-args.nvim",
        requires = "nvim-telescope/telescope.nvim",
        config = function()
            require"telescope".load_extension"args"
            vim.api.nvim_set_keymap("n", "sa", "<Cmd>Telescope args<CR>", { noremap = true })
        end,
    }
    use {
        "~/Dropbox/projects/telescope-git-diff.nvim",
        requires = "nvim-telescope/telescope.nvim",
        config = function() require"telescope".load_extension"git_diff" end
    }
end,
config = {
    display = {
        open_fn = function()
            return require('packer.util').float{ border = "rounded" }
        end,
    }
}})
