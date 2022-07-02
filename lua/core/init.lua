local pack = require('core.pack')

function load()
    require('core.options')

    pack.ensure_packer_installed()
    pack.load_compile()

    -- vim.cmd([[set background=light]])
    vim.cmd[[colorscheme catppuccin]]
end

load()