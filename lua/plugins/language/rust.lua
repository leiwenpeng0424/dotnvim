local use = require("packer").use

use({
    "simrat39/rust-tools.nvim",
    config = function()
        local rt = require "rust-tools"
        rt.setup {
            server = {
                on_attach = function(_, bufnr)

                    vim.keymap.set(
                        'n',
                        '<C-space>',
                        rt.hover_actions.hover_actions {
                            buffer = bufnr
                        }
                    )

                    vim.keymap.set(
                        "n",
                        "<leader>a",
                        rt.code_action_group.code_action_group,
                        {
                            buffer = bufnr
                        }
                    )
                end

            }
        }
    end
})

use({
    "saecki/crates.nvim",
    config = function()
        require 'crates'.setup {
            null_ls = {
                enabled = true,
                name = "Crates",
            },
        }
    end
})
