local pack = require('core.pack')

function load()
    require('core.options')
    require('core.keymap')
    pack.ensure_packer_installed()
    pack.load_compile()
    vim.cmd [[set background=dark]]
    vim.cmd [[set whichwrap+=<,>,[,]]
    vim.cmd [[colorscheme catppuccin]] -- enfocado
end

load()
