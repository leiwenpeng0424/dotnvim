-- glepnir/lspsaga.nvim
local use = require("packer").use

use({
    "glepnir/lspsaga.nvim",
    config = function ()
        local saga = require('lspsaga')
        saga.init_lsp_saga({
            code_action_lightbulb = {
                enable = false,
                sign = true,
                sign_priority = 20,
                virtual_text = true,
            },
        })
    end
})
