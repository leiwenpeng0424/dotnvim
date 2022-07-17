local conf = require('plugs.enhance.config')
local plugins = {}

-- 自动补全配对的符号()[]''""等
plugins['windwp/nvim-autopairs'] = {
    config = conf.autopairs
}

plugins['kdheepak/lazygit.nvim'] = {
    config = conf.lazygit
}

plugins['s1n7ax/nvim-terminal'] = {
    config = conf.terminal
}

--[[ plugins['dense-analysis/ale'] = {
    config = conf.ale
}
]]
plugins['puremourning/vimspector'] = {}

plugins['antoinemadec/FixCursorHold.nvim'] = {
    config = conf.fixcursorhold
}

plugins['s1n7ax/nvim-window-picker'] = {
	tag = 'v1.*',
	config = conf.window_picker
}
--[[
plugins['kkoomen/vim-doge'] = {
    config = conf.vim_dog
} ]]

plugins['junegunn/vim-easy-align'] = {
    config = conf.vim_easy_align
}

plugins['windwp/nvim-ts-autotag']  = {
    config = conf.nvim_ts_autotag
}

 plugins['editorconfig/editorconfig-vim'] = {
    config = conf.editorconfig
}

plugins['ray-x/lsp_signature.nvim'] = {
    config = conf.lsp_signature
}

plugins['gelguy/wilder.nvim'] = {
    event = 'CmdlineEnter',
    config = conf.wilder,
    requires = { { "romgrk/fzy-lua-native", after = "wilder.nvim" } },
}

plugins["dstein64/vim-startuptime"] = { opt = true, cmd = "StartupTime" }

plugins['folke/which-key.nvim'] = {
    config = conf.which_key
}

return plugins
