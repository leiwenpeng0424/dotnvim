-- jose-elias-alvarez/null-ls.nvim

local use = require("packer").use

use({
    "jose-elias-alvarez/null-ls.nvim",
    config = function ()
        require('null-ls').setup({
            sources = {
                require("null-ls").builtins.formatting.stylua,
                require("null-ls").builtins.diagnostics.eslint,
                require("null-ls").builtins.completion.spell,
            }
        })
    end
})