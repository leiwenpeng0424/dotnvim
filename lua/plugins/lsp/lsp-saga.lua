-- glepnir/lspsaga.nvim
local use = require("packer").use

use({
    "glepnir/lspsaga.nvim",
    config = function()
        local saga = require('lspsaga')
        saga.init_lsp_saga({
            code_action_lightbulb = {
                enable = false,
                sign = true,
                sign_priority = 20,
                virtual_text = true,
            },
            finder_action_keys = {
                open = "o",
                vsplit = "v",
                split = "s",
                tabe = "t",
                quit = "q",
                scroll_down = "<C-d>",
                scroll_up = "<C-u>", -- quit can be a table
            },
            rename_in_select = false,
            border_style = "single",
            symbol_in_winbar = {
                in_custom = true
            }
        })
    end
})
