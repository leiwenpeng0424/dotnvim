-- nvim-telescope/telescope.nvim

local use = require("packer").use

use({
    "nvim-telescope/telescope.nvim",
    config = function ()
        local tel = require('telescope')
        local actions = require('telescope.actions')
    
        tel.load_extension('lazygit')
    
        tel.setup({
            defaults = {
                mappings = {
                    n = {
                        ["s"] = actions.select_horizontal,
                        ["S"] = actions.select_vertical,
                    }
                }
            }
        })
    end
})