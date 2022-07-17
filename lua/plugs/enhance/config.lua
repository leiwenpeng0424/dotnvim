local config = {}
local map = require('core.utils').map

config.autopairs = function ()
    require('nvim-autopairs').setup({
        disable_filetype = { 'TelescopePrompt', 'vim' }
    })

    -- If you want insert `(` after select function or method item
	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	local cmp = require("cmp")
	local handlers = require("nvim-autopairs.completion.handlers")
	cmp.event:on(
		"confirm_done",
		cmp_autopairs.on_confirm_done({
			filetypes = {
				-- "*" is an alias to all filetypes
				["*"] = {
					["("] = {
						kind = {
							cmp.lsp.CompletionItemKind.Function,
							cmp.lsp.CompletionItemKind.Method,
						},
						handler = handlers["*"],
					},
				},
                lua = {
                    ['('] = {
                        kind = {
                            cmp.lsp.CompletionItemKind.Function,
                            cmp.lsp.CompletionItemKind.Method
                        },
                        handler = function (char, item, bufnr) end
                    }
                },
				-- Disable for tex
				tex = false,
			},
		})
	)
end

config.lazygit = function () end

config.terminal = function()
    vim.o.hidden = true
    require('nvim-terminal').setup({
        disable_default_keymaps = false,
        toggle_keymap = ';;',
        terminals = {
            { keymap = ';1' },
            { keymap = ';2' },
            { keymap = ';3' },
            { keymap = ';4' },
            { keymap = ';5' }
        }
    })
end

config.ale = function ()
    vim.g.ale_sign_error = ''
    vim.g.ale_sign_warning = ''
end

config.vimspector = function () end

config.fixcursorhold = function ()
    -- in millisecond, used for both CursorHold and CursorHoldI,
    -- use updatetime instead if not defined
    vim.g.cursorhold_updatetime = 100
end

config.window_picker = function()
	require('window-picker').setup({
		selection_chars = '1234567890'
	})
end

config.vim_easy_align = function() end

config.vim_dog = function()
    vim.cmd[[call doge#install()]]
end

config.nvim_ts_autotag = function ()
    vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics,
        {
            underline = true,
            virtual_text = {
                spacing = 5,
                severity_limit = 'Warning',
            },
            update_in_insert = true,
        }
    )
    require('nvim-ts-autotag').setup({
        enable = true
    })
end

config.editorconfig = function () end

config.lsp_signature = function ()
    require('lsp_signature').setup({
        bind = true,
        handler_opts = {
            border = "rounded"
        }
    })
end

config.wilder = function ()
	vim.cmd([[
call wilder#setup({'modes': [':', '/', '?']})
call wilder#set_option('use_python_remote_plugin', 0)
call wilder#set_option('pipeline', [wilder#branch(
	\ wilder#cmdline_pipeline({'use_python': 0,'fuzzy': 1, 'fuzzy_filter': wilder#lua_fzy_filter()}),
	\ wilder#vim_search_pipeline(),
	\ [wilder#check({_, x -> empty(x)}), wilder#history(), wilder#result({'draw': [{_, x -> ' ' . x}]})]
	\ )])
call wilder#set_option('renderer', wilder#renderer_mux({
	\ ':': wilder#popupmenu_renderer({
		\ 'highlighter': wilder#lua_fzy_highlighter(),
		\ 'left': [wilder#popupmenu_devicons()],
		\ 'right': [' ', wilder#popupmenu_scrollbar()]
		\ }),
	\ '/': wilder#wildmenu_renderer({
		\ 'highlighter': wilder#lua_fzy_highlighter(),
		\ 'apply_incsearch_fix': v:true,
		\})
	\ }))
]])
end

config.neoscroll = function ()
    require('neoscroll').setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
		mappings = {
			"<C-u>",
			"<C-d>",
			"<C-b>",
			"<C-f>",
			"<C-y>",
			"<C-e>",
			"zt",
			"zz",
			"zb",
		},
		hide_cursor = true, -- Hide cursor while scrolling
		stop_eof = true, -- Stop at <EOF> when scrolling downwards
		use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
		respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
		cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
		easing_function = nil, -- Default easing function
		pre_hook = nil, -- Function to run before the scrolling animation starts
		post_hook = nil, -- Function to run after the scrolling animation ends
    })
end

config.which_key = function ()
    require('which-key').setup({})
end

return config
