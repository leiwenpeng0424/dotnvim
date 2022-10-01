local pack = require('core.pack')

function load()
    require('core.options')
    pack.ensure_packer_installed()
    pack.load_compile()
    require('core.keymap')
    vim.cmd[[set background=dark]]
    vim.cmd[[colorscheme terafox]]
end

load()
