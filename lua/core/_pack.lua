local fn = vim.fn
local uv = vim.loop
local api = vim.api
local split = vim.split
local plugin_path = fn.stdpath("config")..'lua/plugins'
local install_path = fn.stdpath('data')..'site/pack/packer/start/packer.nvim'
local pack = {}

function pack.load_plugins()
    local get_plugin_list = function ()
    end
end

function pack.ensure_packer_installed()
    local state = uv.fs_stat(install_path)
    if not state then
        local cmd = "!git clone git@github.com:wbthomason/packer.nvim.git " .. packer_dir
        api.nvim_command(cmd);
        require('packer').install()
    end
end

return pack