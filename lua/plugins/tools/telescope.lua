-- nvim-telescope/telescope.nvim

local use = require("packer").use

use({
    "nvim-telescope/telescope-ui-select.nvim",
})

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
                }
            },
            extensions = {
                ['ui-select'] = {
                    require("telescope.themes").get_dropdown {}
                }
            }
        })
        tel.load_extension('lazygit')
        tel.load_extension("ui-select")
    end
})
