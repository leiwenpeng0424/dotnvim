-- j-hui/fidget.nvim

local use = require("packer").use

use({
    "j-hui/fidget.nvim",
    config = function()
        require "fidget".setup {
            window = {
                border = "single"
            }
        }
    end
})
