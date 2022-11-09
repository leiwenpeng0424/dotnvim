-- folke/tokyonight.nvim

local use = require("packer").use

use({ 
    "folke/tokyonight.nvim",
    config = function ()
        vim.g.tokyonight_transparent = vim.g.transparent_enabled
    end
})
