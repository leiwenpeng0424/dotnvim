-- prettier/vim-prettier

local use = require("packer").use

use({
    "prettier/vim-prettier",
    branch = "release/1.x",
    run = "yarn install --frozen-lockfile --production",
    config = function()
        local function is_prettier_installed()
            os.execute("where prettier")
        end

        if pcall(is_prettier_installed) then
            vim.cmd[[autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.vue,*.json,*.markdown PrettierAsync]]
        else
            vim.notify("prettier is not installed, install it by running 'npm install prettier --location=global'")
        end

    end
})
