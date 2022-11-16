-- numToStr/Comment.nvim

local use = require("packer").use

use({
    "numToStr/Comment.nvim",
    config = function()
        require "Comment".setup {
            pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
        }
    end
})

