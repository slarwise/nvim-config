require("packer").use {
    "iamcco/markdown-preview.nvim",
    run = function()
        vim.fn["mkdp#util#install"]()
    end,
    cmd = "MarkdownPreview",
}
