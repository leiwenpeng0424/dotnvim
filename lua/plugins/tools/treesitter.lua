-- nvim-treesitter/nvim-treesitter

local use = require("packer").use

use({
    'JoosepAlviste/nvim-ts-context-commentstring'
})

use({ 'mfussenegger/nvim-ts-hint-textobject' })

use({ 'nvim-treesitter/nvim-tree-docs' })

use({
    "nvim-treesitter/nvim-treesitter",
    run = ':TSUpdate',
    config = function ()
        require('nvim-treesitter.configs').setup({
            tree_docs = { 
                enable = true,
                spec_config = {
                    jsdoc = {
                        slots = {
                            class = { author = true,  }
                        }
                    }
                }
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { 'org' },
            },
            autotag = {
                enable = true,
            },
            context_commentstring = {
                enable = true
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
