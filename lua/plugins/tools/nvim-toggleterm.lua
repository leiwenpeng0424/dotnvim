--[[ akinsho/nvim-toggleterm.lua ]]

local use  = require("packer").use

use({
    "akinsho/toggleterm.nvim",
    tag = 'v2.*',
    config = function ()
        require("toggleterm").setup({
            open_mapping = [[;;]],
            direction = 'horizontal', -- 'vertical' | 'horizontal' | 'tab' | 'float'
            insert_mappings = true,
            float_opts = {
                border = 'double'
            }
        })
    end
})
