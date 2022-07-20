-- prettier/vim-prettier

local use = require("packer").use

use({
    "prettier/vim-prettier",
    branch = "release/1.x",
    run = "yarn install --frozen-lockfile --production",
    config = function()
        vim.cmd[[autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.vue,*.json,*.markdown PrettierAsync]]
    end
})
