local global = {
    paths = {}
}

local paths = global.paths

paths.nvim_config_path = vim.fn.stdpath('config')
paths.nvim_data_path = vim.fn.stdpath("data")
paths.plugs_path = paths.nvim_config_path .. '/lua/plugins'
paths.packer_compiled_path = paths.nvim_config_path .. '/lua/packer_compiled.lua'
paths.packer_path = paths.nvim_data_path .. '/site/pack/packer/start/packer.nvim'

return global
