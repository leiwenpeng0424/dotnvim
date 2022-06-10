local vim = vim
local map = vim.api.nvim_set_keymap
-- Key Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

map("n", "s", "", opts)
map("n", "f", "", opts)

-- Lspsage key bindings
map('n', '<leader>ca', ':Lspsaga code_action<CR>', opts)
map('n', '<leader>K', ':Lspsaga hover_doc<CR>', opts)
map('n', '<leader>f', ':Lspsaga lsp_finder<CR>', opts)
map('n', '<leader>rn', ':Lspsaga rename<CR>', opts)
map('n', '<leader>gs', ':Lspsaga signature_help<CR>', opts)
map('n', '<leader>gd', ':Lspsaga preview_definition<CR>', opts)

-- Editor key bindings
map("n", '<leader>w', ":w<CR>", opts) -- write
map("n", "<leader>wq", ":wqa!<CR>", opts) -- write quit all
map("n", "sv", ":vsp<CR>", opts) -- split vertical
map("n", "sh", ":sp<CR>", opts) -- split horezontal
map("n", "sc", "<C-w>", opts) -- close current window

-- <leader> + hjkl 窗口之间跳转
map("n", "<leader><Left>", "<C-w>h", opts)
map("n", "<leader><Down>", "<C-w>j", opts)
map("n", "<leader><Up>", "<C-w>k", opts)
map("n", "<leader><Right>", "<C-w>l", opts)

-- Neotree key binding
map('n', '<C-b>', ':NeoTreeShowToggle<CR>', opts)

-- ToggleTerm
map('n', '<C-t>', '', opts)
map('n', '<C-t>', ':ToggleTerm<CR>', opts)
