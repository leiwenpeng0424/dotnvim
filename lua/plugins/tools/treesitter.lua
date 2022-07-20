-- nvim-treesitter/nvim-treesitter

local use = require("packer").use

use({
    "nvim-treesitter/nvim-treesitter",
    run = ':TSUpdate',
    config = function ()
        require('nvim-treesitter.configs').setup({
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { 'org' },
            },
            autotag = {
                enable = true,
            },
            ensure_installed  = {
                'javascript',
                'typescript',
                'dockerfile',
                'query',
                'bash',
                'html',
                'css',
                'scss',
                'vim',
                'php',
                'go',
                'python',
                'lua',
                'jsdoc',
                'org',
                'comment',
                'hcl',
                'tsx',
                'json',
                'yaml',
                'toml',
                'rust'
            },
        })
    end
    
})