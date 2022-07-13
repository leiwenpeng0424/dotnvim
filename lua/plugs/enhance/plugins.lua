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

plugins['junegunn/vim-easy-align'] = {
    config = conf.vim_easy_align
}

plugins['s1n7ax/nvim-window-picker'] = {
	tag = 'v1.*',
	config = conf.window_picker
}

return plugins
