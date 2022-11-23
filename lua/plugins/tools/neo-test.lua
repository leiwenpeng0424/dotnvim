local use = require("packer").use

use {
    "nvim-neotest/neotest",
    requires = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",
        "haydenmeade/neotest-jest",
        "rouge8/neotest-rust"
    },
    config = function()
        require('neotest').setup({
            adapters = {
                require('neotest-jest')({
                    jestCommand = "npm test --",
                    jestConfigFile = "jest.config.ts",
                    env = { CI = true },
                    cwd = function()
                        return vim.fn.getcwd()
                    end
                }),
                require("neotest-rust")
            }
        })
    end
}
