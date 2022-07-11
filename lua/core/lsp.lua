local vim =  vim
local diagnostic_ns = vim.api.nvim_create_namespace('lsp_diagnostics')

local function show_diagnostics()
  vim.schedule(function()
    local line = vim.api.nvim_win_get_cursor(0)[1] - 1
    local bufnr = vim.api.nvim_get_current_buf()
    local diagnostics = vim.diagnostic.get(bufnr, { lnum = line })
    vim.diagnostic.show(diagnostic_ns, bufnr, diagnostics, { virtual_text = true })
  end)
end

vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
    buffer =  0,
    callback = show_diagnostics
})


