require('packer').use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
    setup = function()
        vim.g.mkdp_filetypes = { "markdown" }
    end
})
