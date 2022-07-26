
require('packer').use({
    "williamboman/mason.nvim",
    config = function()
        require('mason').setup({})
    end
})
