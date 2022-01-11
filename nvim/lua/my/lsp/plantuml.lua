local null_ls = require "null-ls"
local helpers = require "null-ls.helpers"

local plantuml = {
    name = "plantuml",
    method = null_ls.methods.DIAGNOSTICS,
    filetypes = { "plantuml" },
    generator = null_ls.generator {
        command = "plantuml",
        args = { "-pipe", "-stdrpt" },
        to_stdin = true,
        from_stderr = true,
        format = "line",
        on_output = helpers.diagnostics.from_patterns {
            {
                -- string:9:error:Syntax Error?
                pattern = [[%w+:(%d+):(.*)]],
                groups = { "row", "message" },
            },
        },
    },
}

null_ls.register(plantuml)
