local pack = require('core.pack')

function load()

    vim.cmd [[highlight IndentBlanklineIndent1 guibg=#1f2335 gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent2 guibg=#24283b gui=nocombine]]

    require('core.options')

    pack.ensure_packer_installed()
    pack.load_compile()

    require('core.keymap')
    require('core.lsp')
    -- vim.cmd([[set background=light]])
    -- vim.g.catppuccin_flavour = "mocha"
    vim.g.tokyonight_style = "night"
    vim.cmd[[colorscheme tokyonight]]
end

load()
