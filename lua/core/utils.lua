local M = {}

function M.keymap_bind(mappings)
    for key, value in pairs(mappings) do
        local lhs, cmd = key:match("([^|]*)|?(.*)")
        if type(value) == "table" then
            local mode = value.mode
            local options = { noremap = true }
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

return M
