local fn = vim.fn
local paths = require("core.global").paths
local M = {}

function M.keymap_bind(mappings)
    for key, value in pairs(mappings) do
        local lhs, cmd = key:match("([^|]*)|?(.*)")
        if type(value) == "table" then
            local mode = value.mode
            local options = { noremap = true, silent = true }
            if value.opts then
                options = vim.tbl_extend("force", options, value.opts)
            end
            vim.keymap.set(mode, lhs, cmd, options)
        end
    end
end

function M.set_options(options)
    for name, value in pairs(options) do
        vim.o[name] = value
    end
end

function M.load_plugins(module)
    local get_plugs_list = function ()
        local repos = {}
        local temp = vim.split(
            fn.globpath(paths.plugs_path, '*/init.lua'), '\n'
        )

        for _, file in ipairs(temp) do
            repos[#repos+1] = file:sub(#paths.nvim_config_path + 6, -1)
        end

        return repos
    end
end

return M
