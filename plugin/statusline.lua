local conditions = require "heirline.conditions"
local utils = require "heirline.utils"

local Align = { provider = "%=" }
local Space = { provider = " " }

local LeftCorner = {
    hl = function()
        if conditions.is_active() then
            return {
                fg = utils.get_highlight("StatusLine").bg,
                bg = utils.get_highlight("Normal").bg,
            }
        else
            return {
                fg = utils.get_highlight("StatusLineNC").bg,
                bg = utils.get_highlight("Normal").bg,
            }
        end
    end,
    provider = "",
}
local RightCorner = {
    hl = function()
        if conditions.is_active() then
            return {
                fg = utils.get_highlight("StatusLine").bg,
                bg = utils.get_highlight("Normal").bg,
            }
        else
            return {
                fg = utils.get_highlight("StatusLineNC").bg,
                bg = utils.get_highlight("Normal").bg,
            }
        end
    end,
    provider = "",
}
local FileModified = {
    provider = function()
        if vim.bo.modified then
            return "●"
        else
            return " "
        end
    end,
}
local FileName = {
    provider = function()
        local filetype = vim.bo.filetype
        if filetype == "help" then
            local filename = vim.api.nvim_buf_get_name(0)
            return vim.fn.fnamemodify(filename, ":t")
        elseif filetype == "qf" then
            return vim.w.quickfix_title
        else
            local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":.")
            if filename == "" then
                return "[No Name]"
            end
            if not conditions.width_percent_below(#filename, 0.75) then
                filename = vim.fn.pathshorten(filename)
            end
            return filename
        end
    end,
}
local Warnings = {
    hl = {
        fg = utils.get_highlight("DiagnosticWarn").fg,
        bg = utils.get_highlight("DiagnosticWarn").bg,
    },
    provider = function()
        local warnings = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
        return string.format("W:%d", #warnings)
    end,
}
local Errors = {
    hl = {
        fg = utils.get_highlight("DiagnosticError").fg,
        bg = utils.get_highlight("DiagnosticError").bg,
    },
    provider = function()
        local errors = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
        return string.format("E:%d", #errors)
    end,
}
local DefaultStatusline = {
    LeftCorner,
    Space,
    FileModified,
    Space,
    Errors,
    Space,
    Warnings,
    Space,
    FileName,
    Align,
    RightCorner,
}

local StatusLines = {
    hl = function()
        if conditions.is_active() then
            return {
                fg = utils.get_highlight("StatusLine").fg,
                bg = utils.get_highlight("StatusLine").bg,
            }
        else
            return {
                fg = utils.get_highlight("StatusLineNC").fg,
                bg = utils.get_highlight("StatusLineNC").bg,
            }
        end
    end,

    stop_at_first = true,

    DefaultStatusline,
}

require("heirline").setup(StatusLines)
