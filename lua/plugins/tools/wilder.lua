-- gelguy/wilder.nvim

local use = require("packer").use

use({
    "gelguy/wilder.nvim",
    config = function ()
        vim.cmd([[
            call wilder#setup({'modes': [':', '/', '?']})
        ]])
    end
})
