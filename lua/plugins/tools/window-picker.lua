-- s1n7ax/nvim-window-picker

local use = require("packer").use

use({
    "s1n7ax/nvim-window-picker",
    config = function()
        require('window-picker').setup({
            selection_chars = '1234567890'
        })
    end
})