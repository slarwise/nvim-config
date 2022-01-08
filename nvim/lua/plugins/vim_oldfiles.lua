return {
    "slarwise/vim-oldfiles",
    config = function()
        vim.g.oldfiles_ignore = { "COMMIT_EDITMSG", "/runtime/doc/" }
    end,
}
