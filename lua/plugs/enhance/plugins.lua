local conf = require('plugs.enhance.config')
local plugins = {}


plugins['windwp/nvim-autopairs'] = {
    config = conf.autopairs
}

plugins['kdheepak/lazygit.nvim'] = {
    config = conf.lazygit
}

plugins['s1n7ax/nvim-terminal'] = {
    config = conf.terminal
}

return plugins
