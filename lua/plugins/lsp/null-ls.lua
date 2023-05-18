local use = require("packer").use

use({
    "jose-elias-alvarez/null-ls.nvim",
    as = "null_ls",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                --[[ null_ls.builtins.diagnostics.luacheck,
				null_ls.builtins.diagnostics.shellcheck, ]]
                null_ls.builtins.formatting.lua_format,
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.nginx_beautifier,
                null_ls.builtins.formatting.rustfmt,
                null_ls.builtins.formatting.prettier,
            },
        })
    end,
})
