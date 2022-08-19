-- nvim-telescope/telescope.nvim

local use = require("packer").use

use({
    "nvim-telescope/telescope.nvim",
    config = function ()
        local tel = require('telescope')
        local actions = require('telescope.actions')
        tel.setup({
            defaults = {
                mappings = {
                    n = {
                        ["s"] = actions.select_horizontal,
                        ["S"] = actions.select_vertical,
                    }
                },
                layout_strategies = 'horizontal',
                layout_config = {
                    width = 0.7,
                    height = 0.8,
                    prompt_position = 'top'
                }
            }
        })
        tel.load_extension('lazygit')
    end
})
