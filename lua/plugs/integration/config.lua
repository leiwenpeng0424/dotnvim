local config = {}

config.telescope = function ()
    local tel = require('telescope')
    local actions = require('telescope.actions')

    tel.load_extension('lazygit')

    tel.setup({
        defaults = {
            mappings = {
                n = {
                    ["s"] = actions.select_horizontal,
                    ["S"] = actions.select_vertical,
                }
            }
        }
    })
end

config.nvim_gps = function () end

config.treesitter = function ()
    require('nvim-treesitter.configs').setup({
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = { 'org' },
        },
        autotag = {
            enable = true,
        },
        ensure_installed = {
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

config.schemastore = function () end

return config
