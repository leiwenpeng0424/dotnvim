local config = {}

config.telescope = function ()
    require('telescope').load_extension('lazygit')
    require('telescope').setup({
        defaults = {
            mappings = {
                
            }
        }
    })
end

config.nvim_gps = function ()
    -- 
end

config.feline = function ()
    local lsp = require('feline.providers.lsp')
    local file = require('feline.providers.file')
    local vi_mode_utils = require('feline.providers.vi_mode')
    local gps = require("nvim-gps")

    local force_inactive = {
        filetypes = {},
        buftypes = {},
        bufnames = {}
    }
    
    local winbar_components = {
        active = {{}, {}, {}},
        inactive = {{}, {}, {}},
    }
    
    local components = {
        active = {{}, {}, {}},
        inactive = {{}, {}, {}},
    }
    
    local colors = {
        bg = '#282828',
        black = '#282828',
        yellow = '#d8a657',
        cyan = '#89b482',
        oceanblue = '#45707a',
        green = '#a9b665',
        orange = '#e78a4e',
        violet = '#d3869b',
        magenta = '#c14a4a',
        white = '#a89984',
        fg = '#a89984',
        skyblue = '#7daea3',
        red = '#ea6962',
    }
    
    local vi_mode_colors = {
        NORMAL = 'green',
        OP = 'green',
        INSERT = 'red',
        CONFIRM = 'red',
        VISUAL = 'skyblue',
        LINES = 'skyblue',
        BLOCK = 'skyblue',
        REPLACE = 'violet',
        ['V-REPLACE'] = 'violet',
        ENTER = 'cyan',
        MORE = 'cyan',
        SELECT = 'orange',
        COMMAND = 'green',
        SHELL = 'green',
        TERM = 'green',
        NONE = 'yellow'
    }
    
    local vi_mode_text = {
        NORMAL = '<|',
        OP = '<|',
        INSERT = '|>',
        VISUAL = '<>',
        LINES = '<>',
        BLOCK = '<>',
        REPLACE = '<>',
        ['V-REPLACE'] = '<>',
        ENTER = '<>',
        MORE = '<>',
        SELECT = '<>',
        COMMAND = '<|',
        SHELL = '<|',
        TERM = '<|',
        NONE = '<>',
        CONFIRM = '|>'
    }
    
    local buffer_not_empty = function()
      if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
        return true
      end
      return false
    end
    
    local checkwidth = function()
      local squeeze_width  = vim.fn.winwidth(0) / 2
      if squeeze_width > 40 then
        return true
      end
      return false
    end
    
    force_inactive.filetypes = {
        'NvimTree',
        'dbui',
        'packer',
        'startify',
        'fugitive',
        'fugitiveblame'
    }
    
    force_inactive.buftypes = {
          'terminal'
    }
    
    -- STATUSLINE
    -- LEFT
    
    -- vi-mode
    components.active[1][1] = {
        provider = function()
            return ' ' .. vi_mode_utils.get_vim_mode() .. ' '
        end,
        hl = function()
            local val = {}
        
            val.bg = vi_mode_utils.get_mode_color()
            val.fg = 'black'
            val.style = 'bold'
        
            return val
        end,
        right_sep = ' '
    }
    -- vi-symbol
    components.active[1][2] = {
        provider = function()
            return vi_mode_text[vi_mode_utils.get_vim_mode()]
        end,
        hl = function()
            local val = {}
            val.fg = vi_mode_utils.get_mode_color()
            val.bg = 'bg'
            val.style = 'bold'
            return val
        end,
        right_sep = ' '
    }
    -- git branch
    components.active[1][3] = {
        provider = 'git_branch',
        hl = {
            fg = 'yellow',
            bg = 'bg',
            style = 'bold'
        },
        right_sep = ' '
    }
    -- active lsp clients
    components.active[1][4] = {
        provider = function ()
            -- if lsp.is_lsp_attached() then
            --     return ''
            -- else
            return ''
            -- end
        end,
        hl = {
            fg = 'cyan',
            bg = 'bg',
            style = 'bold'
        },
        -- right_sep = ' '
    }
    components.active[1][5] = {
        provider = 'lsp_client_names',
        hl = {
            fg = 'cyan',
            bg = 'bg',
            style = 'bold'
        },
        right_sep = ' '
    }

    -- diagnostics errors
    components.active[1][6] = {
        provider = 'diagnostic_errors',
        hl = {
            fg = 'red',
            bg = 'bg',
            style = 'bold'
        },
        right_sep = ' '
    }

     -- diagnostics warnings
    components.active[1][7] = {
        provider = 'diagnostic_warnings',
        hl = {
            fg = 'yellow',
            bg = 'bg',
            style = 'bold'
        },
        right_sep = ' '
    }

     -- diagnostics infos
    components.active[1][8] = {
        provider = 'diagnostic_info',
        hl = {
            fg = 'violet',
            bg = 'bg',
            style = 'bold'
        },
        right_sep = ' '
    }
    -- MID
    
    -- gitBranch
    -- components.active[2][1] = {
    --     provider = 'git_branch',
    --     hl = {
    --         fg = 'yellow',
    --         bg = 'bg',
    --         style = 'bold'
    --     }
    -- }
    -- -- diffAdd
    -- components.active[2][2] = {
    --     provider = 'git_diff_added',
    --     hl = {
    --         fg = 'green',
    --         bg = 'bg',
    --         style = 'bold'
    --     }
    -- }
    -- -- diffModfified
    -- components.active[2][3] = {
    --     provider = 'git_diff_changed',
    --     hl = {
    --         fg = 'orange',
    --         bg = 'bg',
    --         style = 'bold'
    --     }
    -- }
    -- -- diffRemove
    -- components.active[2][4] = {
    --     provider = 'git_diff_removed',
    --     hl = {
    --         fg = 'red',
    --         bg = 'bg',
    --         style = 'bold'
    --     },
    -- }
    
    -- RIGHT
    
    -- fileIcon
    components.active[3][1] = {
        provider = function()
            local filename = vim.fn.expand('%:t')
            local extension = vim.fn.expand('%:e')
            local icon  = require'nvim-web-devicons'.get_icon(filename, extension)
            if icon == nil then
                icon = ''
            end
            return icon
        end,
        hl = function()
            local val = {}
            local filename = vim.fn.expand('%:t')
            local extension = vim.fn.expand('%:e')
            local icon, name  = require'nvim-web-devicons'.get_icon(filename, extension)
            if icon ~= nil then
                val.fg = vim.fn.synIDattr(vim.fn.hlID(name), 'fg')
            else
                val.fg = 'white'
            end
            val.bg = 'bg'
            val.style = 'bold'
            return val
        end,
        right_sep = ' '
    }
    -- filename
    components.active[3][2] = {
        provider = function()
            return vim.fn.expand("%:.")
        end,
        hl = {
            fg = 'white',
            bg = 'bg',
            style = 'bold'
        },
        right_sep = ' '
    }
    -- fileSize
    components.active[3][3] = {
        provider = function ()
            return ' '..file.file_size()..' '
        end,
        enabled = function() return vim.fn.getfsize(vim.fn.expand('%:F')) > 0 end,
        hl = {
            fg = 'skyblue',
            bg = 'bg',
            style = 'bold'
        },
        right_sep = ' '
    }
    -- fileType
    -- components.active[3][2] = {
    --     provider = 'file_type',
    --     hl = function()
    --         local val = {}
    --         local filename = vim.fn.expand('%:t')
    --         local extension = vim.fn.expand('%:e')
    --         local icon, name  = require'nvim-web-devicons'.get_icon(filename, extension)
    --         if icon ~= nil then
    --             val.fg = vim.fn.synIDattr(vim.fn.hlID(name), 'fg')
    --         else
    --             val.fg = 'white'
    --         end
    --         val.bg = 'bg'
    --         val.style = 'bold'
    --         return val
    --     end,
    --     right_sep = ' '
    -- }
    -- fileFormat
    components.active[3][4] = {
        provider = function() return '' .. vim.bo.fileformat:upper() .. '' end,
        hl = {
            fg = 'white',
            bg = 'bg',
            style = 'bold'
        },
        right_sep = ' '
    }
    -- fileEncode
    components.active[3][5] = {
        provider = 'file_encoding',
        hl = {
            fg = 'white',
            bg = 'bg',
            style = 'bold'
        },
        right_sep = ' '
    }
    components.active[3][6] = {
        provider = 'position',
        hl = {
            fg = 'white',
            bg = 'bg',
            style = 'bold'
        },
        right_sep = ' '
    }
    -- linePercent
    -- components.active[3][7] = {
    --     provider = 'line_percentage',
    --     hl = {
    --         fg = 'white',
    --         bg = 'bg',
    --         style = 'bold'
    --     },
    --     right_sep = ' '
    -- }
    -- scrollBar
    components.active[3][8] = {
        provider = 'scroll_bar',
        hl = {
            fg = 'yellow',
            bg = 'bg',
        },
    }
    -- INACTIVE
    
    -- fileType
    components.inactive[1][1] = {
        provider = 'file_type',
        hl = {
            fg = 'black',
            bg = 'cyan',
            style = 'bold'
        },
        left_sep = {
            str = ' ',
            hl = {
            fg = 'NONE',
            bg = 'cyan'
            }
        },
        right_sep = {
            {
            str = ' ',
            hl = {
                fg = 'NONE',
                bg = 'cyan'
            }
            },
            ' '
        }
    }
    
    -- WINBAR
    -- LEFT
    
    -- nvimGps
    winbar_components.active[1][1] = {
        provider = function() return gps.get_location() end,
        enabled = function() return gps.is_available() end,
        hl = {
            fg = 'orange',
            style = 'bold'
        }
    }
    
    -- MID
    
    -- RIGHT
    
    -- LspName
    winbar_components.active[3][1] = {
        provider = 'lsp_client_names',
        hl = {
            fg = 'yellow',
            style = 'bold'
        },
        right_sep = ' '
    }
    -- diagnosticErrors
    winbar_components.active[3][2] = {
        provider = 'diagnostic_errors',
        enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.ERROR) end,
        hl = {
            fg = 'red',
            style = 'bold'
        }
    }
    -- diagnosticWarn
    winbar_components.active[3][3] = {
        provider = 'diagnostic_warnings',
        enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.WARN) end,
        hl = {
            fg = 'yellow',
            style = 'bold'
        }
    }
    -- diagnosticHint
    winbar_components.active[3][4] = {
        provider = 'diagnostic_hints',
        enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.HINT) end,
        hl = {
            fg = 'cyan',
            style = 'bold'
        }
    }
    -- diagnosticInfo
    winbar_components.active[3][5] = {
        provider = 'diagnostic_info',
        enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.INFO) end,
        hl = {
            fg = 'skyblue',
            style = 'bold'
        }
    }
    
    -- INACTIVE
    
    -- fileType
    winbar_components.inactive[1][1] = {
        provider = 'file_type',
        hl = {
            fg = 'black',
            bg = 'cyan',
            style = 'bold'
        },
        left_sep = {
            str = ' ',
            hl = {
            fg = 'NONE',
            bg = 'cyan'
            }
        },
        right_sep = {
            {
            str = ' ',
            hl = {
                fg = 'NONE',
                bg = 'cyan'
            }
            },
            ' '
        }
    }
    
    require('feline').setup({
        theme = colors,
        default_bg = bg,
        default_fg = fg,
        vi_mode_colors = vi_mode_colors,
        components = components,
        force_inactive = force_inactive,
    })

end

config.gitsigns = function ()
    require('gitsigns').setup(
        {
            signs = {
                add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
                change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
                delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
                topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
                changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
            },
            signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
            numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
            linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
            watch_gitdir = {
                interval = 1000,
                follow_files = true
            },
            attach_to_untracked = true,
            current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                delay = 1000,
                ignore_whitespace = false,
            },
            current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
            sign_priority = 6,
            update_debounce = 100,
            status_formatter = nil, -- Use default
            max_file_length = 40000,
            preview_config = {
                -- Options passed to nvim_open_win
                border = 'single',
                style = 'minimal',
                relative = 'cursor',
                row = 0,
                col = 1
            },
            yadm = {
                enable = false
            },
        }
    )
end

config.indent_blank_line = function ()
    -- 
end

config.dashboard = function ()
    -- 
end

config.oceanic = function ()
    -- 
end

config.devicons = function ()
    -- 
end

config.neo_tree = function ()
    require('neo-tree').setup({
        close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
        popup_border_style = "rounded",
        enable_git_status = false,
        enable_diagnostics = false,
        default_component_configs = {
            container = {
                enable_character_fade = true
            },
            indent = {
                indent_size = 2,
                padding = 1, -- extra padding on left hand side
                -- indent guides
                with_markers = true,
                indent_marker = "│",
                last_indent_marker = "└",
                highlight = "NeoTreeIndentMarker",
                -- expander config, needed for nesting files
                with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
                expander_collapsed = "",
                expander_expanded = "",
                expander_highlight = "NeoTreeExpander",
            },
            icon = {
                folder_closed = "",
                folder_open = "",
                folder_empty = "ﰊ",
                -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
                -- then these will never be used.
                default = "*",
                highlight = "NeoTreeFileIcon"
            },
            modified = {
                symbol = "[+]",
                highlight = "NeoTreeModified",
            },
            name = {
                trailing_slash = false,
                use_git_status_colors = true,
                highlight = "NeoTreeFileName",
            },
            git_status = {
                symbols = {
                    -- Change type
                    added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
                    modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
                    deleted   = "✖",-- this can only be used in the git_status source
                    renamed   = "",-- this can only be used in the git_status source
                    -- Status type
                    untracked = "",
                    ignored   = "",
                    unstaged  = "",
                    staged    = "",
                    conflict  = "",
                }
            },
        },
        window = {
            position = "left",
            width = 40,
            mapping_options = {
                noremap = true,
                nowait = true,
            },
            mappings = {
                ["<space>"] = { 
                    "toggle_node", 
                    nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use 
                },
                ["<2-LeftMouse>"] = "open",
                ["<cr>"] = "open",
                ["S"] = "open_split",
                ["s"] = "open_vsplit",
                -- ["S"] = "split_with_window_picker",
                -- ["s"] = "vsplit_with_window_picker",
                ["t"] = "open_tabnew",
                ["w"] = "open_with_window_picker",
                ["C"] = "close_node",
                ["a"] = { 
                    "add",
                    -- some commands may take optional config options, see `:h neo-tree-mappings` for details
                    config = {
                        show_path = "none" -- "none", "relative", "absolute"
                    }
                },
                ["A"] = "add_directory", -- also accepts the config.show_path option.
                ["d"] = "delete",
                ["r"] = "rename",
                ["y"] = "copy_to_clipboard",
                ["x"] = "cut_to_clipboard",
                ["p"] = "paste_from_clipboard",
                ["c"] = "copy", -- takes text input for destination
                ["m"] = "move", -- takes text input for destination
                ["q"] = "close_window",
                ["R"] = "refresh",
                ["?"] = "show_help",
            }
        },
        nesting_rules = {},
        filesystem = {
            filtered_items = {
                visible = false, -- when true, they will just be displayed differently than normal items
                hide_dotfiles = false,
                hide_gitignored = false,
                hide_hidden = true, -- only works on Windows for hidden files/directories
                hide_by_name = {
                    --"node_modules"
                },
                hide_by_pattern = { -- uses glob style patterns
                    --"*.meta"
                },
                never_show = { -- remains hidden even if visible is toggled to true
                    ".DS_Store",
                    "thumbs.db"
                },
            },
            follow_current_file = false, -- This will find and focus the file in the active buffer every
                                        -- time the current file is changed while the tree is open.
            group_empty_dirs = false, -- when true, empty folders will be grouped together
            hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
                                                    -- in whatever position is specified in window.position
                                    -- "open_current",  -- netrw disabled, opening a directory opens within the
                                                    -- window like netrw would, regardless of window.position
                                    -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
            use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
                                            -- instead of relying on nvim autocmd events.
            window = {
                mappings = {
                    ["<bs>"] = "navigate_up",
                    ["."] = "set_root",
                    ["H"] = "toggle_hidden",
                    ["/"] = "fuzzy_finder",
                    ["f"] = "filter_on_submit",
                    ["<c-x>"] = "clear_filter",
                    ["[g"] = "prev_git_modified",
                    ["]g"] = "next_git_modified",
                }
            }
        },
        buffers = {
            follow_current_file = true, -- This will find and focus the file in the active buffer every
                                        -- time the current file is changed while the tree is open.
            group_empty_dirs = true, -- when true, empty folders will be grouped together
            show_unloaded = true,
            window = {
                mappings = {
                    ["bd"] = "buffer_delete",
                    ["<bs>"] = "navigate_up",
                    ["."] = "set_root",
                }
            },
        },
        git_status = {
            window = {
                position = "float",
                mappings = {
                    ["A"]  = "git_add_all",
                    ["gu"] = "git_unstage_file",
                    ["ga"] = "git_add_file",
                    ["gr"] = "git_revert_file",
                    ["gc"] = "git_commit",
                    ["gp"] = "git_push",
                    ["gg"] = "git_commit_and_push",
                }
            }
        }
    })
end

config.barbar = function()
    --
end

config.colorizer = function ()
    require('colorizer').setup({})
end

config.tokyonight = function ()
    --
end

config.shade = function ()
    require'shade'.setup({
        overlay_opacity = 50,
        opacity_step = 1,
        keys = {
            brightness_up    = '<C-Up>',
            brightness_down  = '<C-Down>',
            toggle           = '<Leader>s',
        }
    })
end

config.lualine = function ()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'tokyonight',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = false,
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      extensions = {}
    }
end

config.treesitter = function ()
    require('nvim-treesitter.configs').setup({
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = { 'org' },
        },
        autotag = {
            enable = true,
        },
        ensure_installed = {
            'javascript',
            'typescript',
            'dockerfile',
            'query',
            'bash',
            'html',
            'css',
            'scss',
            'vim',
            'php',
            'go',
            'python',
            'lua',
            'jsdoc',
            'org',
            'comment',
            'hcl',
            'tsx',
            'json',
            'yaml',
            'toml',
            'rust'
        },
    })
end

return config
