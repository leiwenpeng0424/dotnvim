local pack = require('core.pack')

function load()
    require('core.options')

    pack.ensure_packer_installed()
    pack.load_compile()

    require('core.keymap')

    -- vim.cmd([[set background=light]])
    vim.g.catppuccin_flavour = "mocha"
    vim.cmd[[colorscheme catppuccin]]
end

load()
