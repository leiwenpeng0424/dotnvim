-- glepnir/lspsaga.nvim
local use = require("packer").use

use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
        require("lspsaga").setup({
            rename = {
                in_select = false
            },
            definition = {
                split = "S",
                vsplit = "V"
            },
            finder = {
                keys = {
                    vsplit = "V",
                    split = "S",
                }
            }
        })
    end,
    requires = {
        { "nvim-tree/nvim-web-devicons" },
        { "nvim-treesitter/nvim-treesitter" }
    }
})
