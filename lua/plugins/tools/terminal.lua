-- s1n7ax/nvim-terminal

local use = require("packer").use

use({
    "s1n7ax/nvim-terminal",
    config = function()
        vim.o.hidden = true
        require('nvim-terminal').setup({
            disable_default_keymaps = false,
            toggle_keymap = ';;',
            terminals = {
                { keymap = ';1' },
                { keymap = ';2' },
                { keymap = ';3' },
                { keymap = ';4' },
                { keymap = ';5' }
            }
        })
    end
})