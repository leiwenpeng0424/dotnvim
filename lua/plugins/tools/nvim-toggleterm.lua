--[[ akinsho/nvim-toggleterm.lua ]]

local use  = require("packer").use

use({
    "akinsho/nvim-toggleterm.lua",
    tag = 'v2.*',
    config = function ()
        require("toggleterm").setup({
            open_mapping = [[;;]],
            direction = 'float', -- 'vertical' | 'horizontal' | 'tab' | 'float'
            insert_mappings = true,
        })
    end
})
