-- folke/trouble.nvim

local use = require("packer").use

use({
    "folke/trouble.nvim",
    opt = true,
    config = function ()
        require('trouble').setup({
            action_keys = {
                open_split = { 's' },
                open_vsplit = { 'S' }
            }
        })
    end
})