local pack = require('core.pack')

function load()

    require('core.options')

    pack.ensure_packer_installed()
    pack.load_compile()
    require('core.keymap')
    require('core.lsp')
    vim.cmd([[set background=dark]])
    -- vim.g.catppuccin_flavour = "mocha"
    --vim.g.tokyonight_style = "night"
    vim.cmd[[colorscheme tokyonight]]
end

load()
