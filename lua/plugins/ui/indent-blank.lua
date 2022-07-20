-- lukas-reineke/indent-blankline.nvim

local use = require("packer").use

use({
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPost",
    setup = {
        show_trailing_blankline_indent = false,
    },
    config = function ()
        require('indent_blankline').setup({
            space_char_blankline = ' ',
            show_current_context = true,
            char = "",
        })
    end
})