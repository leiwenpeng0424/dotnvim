local fn, uv, api = vim.fn, vim.loop, vim.api
local paths = require("core.global").paths

local packer = nil

local pack = {}

function pack.ensure_packer_installed()
    local stat = uv.fs_stat(paths.packer_path)
    if not stat then
        local cmd = '!git clone git@github.com:wbthomason/packer.nvim.git ' .. paths.packer_path
        api.nvim_command(cmd)
    end
    pack.load_packer()
    packer.install()
end

function pack.load_plugins()
    local get_plugs_list = function ()
        local repos = {}
        local temp = vim.split(
            fn.globpath(paths.plugs_path, '*/*.lua'), '\n'
        )

        for _, file in ipairs(temp) do
            repos[#repos+1] = file:sub(#paths.nvim_config_path + 6, -1)
        end

        return repos
    end

    local plug_files = get_plugs_list()

    for _, p in ipairs(plug_files) do
        -- vim.notify(p:sub(0, #p - 4))
        require(p:sub(0, #p - 4))
    end
end

function pack.load_packer()
    if not packer then
        api.nvim_command('packadd packer.nvim')
        packer = require('packer')
    end

    packer.init({
        compile_path = paths.packer_compiled_path,
        git = { clone_timeout = 60, default_url_format = "https://github.com/%s" },
        ensure_dependencies = true,
        disable_commands = true,
        display = {
            non_interactive = false, -- If true, disable display windows for all operations
            open_fn = function()
                return require("packer.util").float({ border = "single" })
            end,
        },
    })
    -- packer.reset()

    packer.use({ "nvim-lua/plenary.nvim" })
    packer.use({ "wbthomason/packer.nvim" })
    pack.load_plugins()
end

function pack.load_compile()
    if vim.fn.filereadable(paths.packer_compiled_path) == 1 then
        require('packer_compiled')
    else
        vim.notify('Missing packer compile file Run PackerCompile Or PackerInstall to fix')
    end

    vim.cmd([[command! PackerCompile lua require('packer').compile()]])
	vim.cmd([[command! PackerInstall lua require('packer').install()]])
	vim.cmd([[command! PackerUpdate lua require('packer').update()]])
	vim.cmd([[command! PackerSync lua require('packer').sync()]])
	vim.cmd([[command! PackerClean lua require('packer').clean()]])
	vim.cmd([[command! PackerStatus lua require('packer').compile() require('packer').status()]])
end

return pack
