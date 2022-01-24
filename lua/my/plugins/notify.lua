if vim.env.COLORTERM or vim.env.TERM == "tmux-256color" then
    require("packer").use {
        "rcarriga/nvim-notify",
        config = function()
            require("notify").setup {
                icons = {
                    ERROR = "ERROR",
                    WARN = "WARNING",
                    INFO = "INFO",
                    DEBUG = "DEBUG",
                    TRACE = "TRACE",
                },
            }
            vim.notify = require "notify"
        end,
    }
end
