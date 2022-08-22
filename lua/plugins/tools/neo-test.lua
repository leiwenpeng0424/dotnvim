local use = require("packer").use

use {
  "nvim-neotest/neotest",
  requires = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    'haydenmeade/neotest-jest'
  },
  config = function ()
    require('neotest').setup({
        adapters = {
            require('neotest-jest')({
                cwd = function ()
                    return vim.fn.getcwd()
                end
            })
        }
    })
  end
}
