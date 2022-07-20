-- numToStr/Comment.nvim

local use = require("packer").use

use({
    "numToStr/Comment.nvim",
    config = function ()
        require('Comment').setup({})
    end
})