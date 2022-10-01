-- s1n7ax/nvim-window-picker

local use = require("packer").use

use({
    "s1n7ax/nvim-window-picker",
    config = function()

        local picker =  require('window-picker');

        picker.setup({
            selection_chars = "1029384756",
            -- the foreground (text) color of the picker
            fg_color = '#ededed',
            -- if you have include_current_win == true, then current_win_hl_color will
            -- be highlighted using this background color
            current_win_hl_color = '#e35e4f',

            -- all the windows except the curren window will be highlighted using this
            -- color
            other_win_hl_color = '#8b0000',
        })

        vim.keymap.set('n', "<leader>w", function ()
            local picked_window_id = picker.pick_window or vim.api.nvim_get_current_win(
            vim.api.nvim_set_current_win(picked_window_id)
            )
        end)
    end
})
