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

plugins['editorconfig/editorconfig-vim'] = {
    config = conf.editorconfig
}

plugins['dense-analysis/ale'] = {
    config = conf.ale
}

plugins['preservim/nerdcommenter'] = {
    config = conf.nerdcommenter
}

plugins['windwp/nvim-ts-autotag']  = {
    config = conf.nvim_ts_autotag
}

plugins['puremourning/vimspector'] = {
    -- config = conf.vimspector
}

plugins['lewis6991/impatient.nvim'] = {
    config = conf.impatient
}

plugins['antoinemadec/FixCursorHold.nvim'] = {
    config = conf.fixcursorhold
}

return plugins
