return {
    "nvim-telescope/telescope.nvim",
    config = function()
        require("telescope").setup {
            defaults = { layout_strategy = "flex" },
        }
        vim.api.nvim_set_keymap("n", "sf", "<Cmd>Telescope find_files<CR>", { noremap = true })
    end,
    requires = "nvim-lua/plenary.nvim",
}
