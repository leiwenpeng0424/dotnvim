-- glepnir/lspsaga.nvim
local use = require("packer").use

use({
    "glepnir/lspsaga.nvim",
    config = function ()
        local saga = require('lspsaga')
        saga.init_lsp_saga({
            code_action_lightbulb = {
                enable = true,
                sign = true,
                sign_priority = 20,
                virtual_text = true,
            },
            finder_action_keys = {
                open = "o",
                vsplit = "s",
                split = "i",
                tabe = "t",
                quit = "q",
                scroll_down = "<C-d>",
                scroll_up = "<C-u>", -- quit can be a table
            },
        })
    end
})
