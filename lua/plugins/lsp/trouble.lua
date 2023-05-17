-- folke/trouble.nvim

local use = require("packer").use

use({
    "folke/trouble.nvim",
    config = function()
        local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
        require('trouble').setup({
            mode = "document_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
            action_keys = {
                open_split = { 'S' },
                open_vsplit = { 'V' }
            },
            use_diagnostic_signs = true
        })
    end
})
