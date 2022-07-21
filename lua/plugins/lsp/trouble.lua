-- folke/trouble.nvim

local use = require("packer").use

use({
    "folke/trouble.nvim",
    config = function ()
        require('trouble').setup({
            mode = "document_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
            action_keys = {
                open_split = { 's' },
                open_vsplit = { 'S' }
            }
        })
    end
})
