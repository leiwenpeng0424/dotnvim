-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/leiwenpeng/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/leiwenpeng/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/leiwenpeng/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/leiwenpeng/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/leiwenpeng/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["barbar.nvim"] = {
    loaded = true,
    path = "/Users/leiwenpeng/.local/share/nvim/site/pack/packer/start/barbar.nvim",
    url = "https://github.com/romgrk/barbar.nvim"
  },
  ["dashboard-nvim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/Users/leiwenpeng/.local/share/nvim/site/pack/packer/opt/dashboard-nvim",
    url = "https://github.com/glepnir/dashboard-nvim"
  },
  ["feline.nvim"] = {
    config = { "\27LJ\2\n\\\0\0\5\0\5\1\0156\0\0\0009\0\1\0009\0\2\0006\2\0\0009\2\1\0029\2\3\2'\4\4\0B\2\2\0A\0\0\2\b\0\0\0X\0\2€+\0\2\0L\0\2\0+\0\1\0L\0\2\0\b%:t\vexpand\nempty\afn\bvim\2L\0\0\3\0\3\1\r6\0\0\0009\0\1\0009\0\2\0)\2\0\0B\0\2\2\25\0\0\0)\1(\0\1\1\0\0X\1\2€+\1\2\0L\1\2\0+\1\1\0L\1\2\0\rwinwidth\afn\bvim\4W\0\0\3\1\6\0\n4\0\0\0-\1\0\0009\1\1\1B\1\1\2=\1\0\0'\1\3\0=\1\2\0'\1\5\0=\1\4\0L\0\2\0\1À\tbold\nstyle\nblack\afg\19get_mode_color\abg0\0\0\3\2\1\0\6-\0\0\0-\1\1\0009\1\0\1B\1\1\0028\0\1\0L\0\2\0\bÀ\1À\17get_vim_modeQ\0\0\3\1\5\0\n4\0\0\0-\1\0\0009\1\1\1B\1\1\2=\1\0\0'\1\2\0=\1\2\0'\1\4\0=\1\3\0L\0\2\0\1À\tbold\nstyle\abg\19get_mode_color\afg-\0\0\3\0\4\0\0056\0\0\0009\0\1\0009\0\2\0'\2\3\0D\0\2\0\b%:F\vexpand\afn\bvim˜\1\0\0\6\0\t\0\0216\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\0026\1\0\0009\1\1\0019\1\2\1'\3\4\0B\1\2\0026\2\5\0'\4\6\0B\2\2\0029\2\a\2\18\4\0\0\18\5\1\0B\2\3\2\v\2\0\0X\3\1€'\2\b\0L\2\2\0\bï™\rget_icon\22nvim-web-devicons\frequire\b%:e\b%:t\vexpand\afn\bvim‚\2\0\0\n\0\15\0'4\0\0\0006\1\0\0009\1\1\0019\1\2\1'\3\3\0B\1\2\0026\2\0\0009\2\1\0029\2\2\2'\4\4\0B\2\2\0026\3\5\0'\5\6\0B\3\2\0029\3\a\3\18\5\1\0\18\6\2\0B\3\3\3\n\3\0\0X\5\f€6\5\0\0009\5\1\0059\5\t\0056\a\0\0009\a\1\a9\a\n\a\18\t\4\0B\a\2\2'\b\b\0B\5\3\2=\5\b\0X\5\2€'\5\v\0=\5\b\0'\5\f\0=\5\f\0'\5\14\0=\5\r\0L\0\2\0\tbold\nstyle\abg\nwhite\thlID\14synIDattr\afg\rget_icon\22nvim-web-devicons\frequire\b%:e\b%:t\vexpand\afn\bvim‚\2\0\0\n\0\15\0'4\0\0\0006\1\0\0009\1\1\0019\1\2\1'\3\3\0B\1\2\0026\2\0\0009\2\1\0029\2\2\2'\4\4\0B\2\2\0026\3\5\0'\5\6\0B\3\2\0029\3\a\3\18\5\1\0\18\6\2\0B\3\3\3\n\3\0\0X\5\f€6\5\0\0009\5\1\0059\5\t\0056\a\0\0009\a\1\a9\a\n\a\18\t\4\0B\a\2\2'\b\b\0B\5\3\2=\5\b\0X\5\2€'\5\v\0=\5\b\0'\5\f\0=\5\f\0'\5\14\0=\5\r\0L\0\2\0\tbold\nstyle\abg\nwhite\thlID\14synIDattr\afg\rget_icon\22nvim-web-devicons\frequire\b%:e\b%:t\vexpand\afn\bvimb\0\0\5\0\5\0\0166\0\0\0009\0\1\0009\0\2\0006\2\0\0009\2\1\0029\2\3\2'\4\4\0B\2\2\0A\0\0\2)\1\0\0\0\1\0\0X\0\2€+\0\1\0X\1\1€+\0\2\0L\0\2\0\b%:t\vexpand\rgetfsize\afn\bvimH\0\0\4\0\5\0\n'\0\0\0006\1\1\0009\1\2\0019\1\3\1\18\3\1\0009\1\4\1B\1\2\2'\2\0\0&\0\2\0L\0\2\0\nupper\15fileformat\abo\bvim\5\"\0\0\2\1\1\0\3-\0\0\0009\0\0\0D\0\1\0\2À\17get_location\"\0\0\2\1\1\0\3-\0\0\0009\0\0\0D\0\1\0\2À\17is_availableU\0\0\3\1\5\0\a-\0\0\0009\0\0\0006\2\1\0009\2\2\0029\2\3\0029\2\4\2D\0\2\0\0À\nERROR\rseverity\15diagnostic\bvim\22diagnostics_existT\0\0\3\1\5\0\a-\0\0\0009\0\0\0006\2\1\0009\2\2\0029\2\3\0029\2\4\2D\0\2\0\0À\tWARN\rseverity\15diagnostic\bvim\22diagnostics_existT\0\0\3\1\5\0\a-\0\0\0009\0\0\0006\2\1\0009\2\2\0029\2\3\0029\2\4\2D\0\2\0\0À\tHINT\rseverity\15diagnostic\bvim\22diagnostics_existT\0\0\3\1\5\0\a-\0\0\0009\0\0\0006\2\1\0009\2\2\0029\2\3\0029\2\4\2D\0\2\0\0À\tINFO\rseverity\15diagnostic\bvim\22diagnostics_existÈ\24\1\0\16\0f\0ÿ\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0025\3\4\0004\4\0\0=\4\5\0034\4\0\0=\4\6\0034\4\0\0=\4\a\0035\4\b\0004\5\4\0004\6\0\0>\6\1\0054\6\0\0>\6\2\0054\6\0\0>\6\3\5=\5\t\0044\5\4\0004\6\0\0>\6\1\0054\6\0\0>\6\2\0054\6\0\0>\6\3\5=\5\n\0045\5\v\0004\6\4\0004\a\0\0>\a\1\0064\a\0\0>\a\2\0064\a\0\0>\a\3\6=\6\t\0054\6\4\0004\a\0\0>\a\1\0064\a\0\0>\a\2\0064\a\0\0>\a\3\6=\6\n\0055\6\f\0005\a\r\0005\b\14\0003\t\15\0003\n\16\0005\v\17\0=\v\5\0035\v\18\0=\v\6\0039\v\t\5:\v\1\v5\f\19\0003\r\20\0=\r\21\f>\f\1\v9\v\t\5:\v\1\v5\f\23\0003\r\22\0=\r\24\f3\r\25\0=\r\21\f>\f\2\v9\v\t\5:\v\1\v5\f\27\0003\r\26\0=\r\24\f5\r\28\0=\r\21\f>\f\3\v9\v\t\5:\v\2\v5\f\29\0005\r\30\0=\r\21\f>\f\1\v9\v\t\5:\v\2\v5\f\31\0005\r \0=\r\21\f>\f\2\v9\v\t\5:\v\2\v5\f!\0005\r\"\0=\r\21\f>\f\3\v9\v\t\5:\v\2\v5\f#\0005\r$\0=\r\21\f>\f\4\v9\v\t\5:\v\3\v5\f&\0003\r%\0=\r\24\f3\r'\0=\r\21\f>\f\1\v9\v\t\5:\v\3\v5\f(\0003\r)\0=\r\21\f>\f\2\v9\v\t\5:\v\3\v5\f*\0003\r+\0=\r,\f5\r-\0=\r\21\f>\f\3\v9\v\t\5:\v\3\v5\f/\0003\r.\0=\r\24\f5\r0\0=\r\21\f>\f\4\v9\v\t\5:\v\3\v5\f1\0005\r2\0=\r\21\f>\f\5\v9\v\t\5:\v\3\v5\f3\0005\r4\0=\r\21\f>\f\6\v9\v\t\5:\v\3\v5\f5\0005\r6\0=\r\21\f>\f\a\v9\v\t\5:\v\3\v5\f7\0005\r8\0=\r\21\f>\f\b\v9\v\n\5:\v\1\v5\f9\0005\r:\0=\r\21\f5\r;\0005\14<\0=\14\21\r=\r=\f5\r@\0005\14>\0005\15?\0=\15\21\14>\14\1\r=\rA\f>\f\1\v9\v\t\4:\v\1\v5\fC\0003\rB\0=\r\24\f3\rD\0=\r,\f5\rE\0=\r\21\f>\f\1\v9\v\t\4:\v\3\v5\fF\0005\rG\0=\r\21\f>\f\1\v9\v\t\4:\v\3\v5\fH\0003\rI\0=\r,\f5\rJ\0=\r\21\f>\f\2\v9\v\t\4:\v\3\v5\fK\0003\rL\0=\r,\f5\rM\0=\r\21\f>\f\3\v9\v\t\4:\v\3\v5\fN\0003\rO\0=\r,\f5\rP\0=\r\21\f>\f\4\v9\v\t\4:\v\3\v5\fQ\0003\rR\0=\r,\f5\rS\0=\r\21\f>\f\5\v9\v\n\4:\v\1\v5\fT\0005\rU\0=\r\21\f5\rV\0005\14W\0=\14\21\r=\r=\f5\rZ\0005\14X\0005\15Y\0=\15\21\14>\14\1\r=\rA\f>\f\1\v6\v\0\0'\r[\0B\v\2\0029\v\\\v5\r]\0=\6^\r6\14_\0=\14`\r6\14a\0=\14b\r=\ac\r=\5d\r=\3e\rB\v\2\0012\0\0€K\0\1\0\19force_inactive\15components\19vi_mode_colors\15default_fg\afg\15default_bg\abg\ntheme\1\0\0\nsetup\vfeline\1\3\0\0\0\6 \1\0\2\afg\tNONE\abg\tcyan\1\0\1\bstr\6 \1\0\2\afg\tNONE\abg\tcyan\1\0\1\bstr\6 \1\0\3\abg\tcyan\nstyle\tbold\afg\nblack\1\0\1\rprovider\14file_type\1\0\2\afg\fskyblue\nstyle\tbold\0\1\0\1\rprovider\20diagnostic_info\1\0\2\afg\tcyan\nstyle\tbold\0\1\0\1\rprovider\21diagnostic_hints\1\0\2\afg\vyellow\nstyle\tbold\0\1\0\1\rprovider\24diagnostic_warnings\1\0\2\afg\bred\nstyle\tbold\0\1\0\1\rprovider\22diagnostic_errors\1\0\2\afg\vyellow\nstyle\tbold\1\0\2\14right_sep\6 \rprovider\21lsp_client_names\1\0\2\afg\vorange\nstyle\tbold\0\1\0\0\0\14right_sep\1\3\0\0\0\6 \1\0\2\afg\tNONE\abg\tcyan\1\0\1\bstr\6 \rleft_sep\1\0\2\afg\tNONE\abg\tcyan\1\0\1\bstr\6 \1\0\3\abg\tcyan\nstyle\tbold\afg\nblack\1\0\1\rprovider\14file_type\1\0\2\afg\vyellow\abg\abg\1\0\1\rprovider\15scroll_bar\1\0\3\abg\abg\nstyle\tbold\afg\nwhite\1\0\2\14right_sep\6 \rprovider\20line_percentage\1\0\3\abg\abg\nstyle\tbold\afg\nwhite\1\0\2\14right_sep\6 \rprovider\rposition\1\0\3\abg\abg\nstyle\tbold\afg\nwhite\1\0\2\14right_sep\6 \rprovider\18file_encoding\1\0\3\abg\abg\nstyle\tbold\afg\nwhite\1\0\1\14right_sep\6 \0\1\0\3\abg\abg\nstyle\tbold\afg\fskyblue\fenabled\0\1\0\2\rprovider\14file_size\14right_sep\6 \0\1\0\2\14right_sep\6 \rprovider\14file_type\0\1\0\1\14right_sep\6 \0\1\0\3\abg\abg\nstyle\tbold\afg\bred\1\0\1\rprovider\21git_diff_removed\1\0\3\abg\abg\nstyle\tbold\afg\vorange\1\0\1\rprovider\21git_diff_changed\1\0\3\abg\abg\nstyle\tbold\afg\ngreen\1\0\1\rprovider\19git_diff_added\1\0\3\abg\abg\nstyle\tbold\afg\vyellow\1\0\1\rprovider\15git_branch\1\0\3\abg\abg\nstyle\tbold\afg\nwhite\1\0\0\0\0\rprovider\1\0\1\14right_sep\6 \0\ahl\0\1\0\2\14right_sep\6 \rprovider\n Ray \1\2\0\0\rterminal\1\a\0\0\rNvimTree\tdbui\vpacker\rstartify\rfugitive\18fugitiveblame\0\0\1\0\16\vNORMAL\a<|\tNONE\a<>\tTERM\a<|\nSHELL\a<|\fCOMMAND\a<|\vSELECT\a<>\tMORE\a<>\nENTER\a<>\14V-REPLACE\a<>\fREPLACE\a<>\nBLOCK\a<>\nLINES\a<>\vVISUAL\a<>\fCONFIRM\a|>\vINSERT\a|>\aOP\a<|\1\0\16\vNORMAL\ngreen\tNONE\vyellow\tTERM\ngreen\nSHELL\ngreen\fCOMMAND\ngreen\vSELECT\vorange\tMORE\tcyan\nENTER\tcyan\14V-REPLACE\vviolet\fREPLACE\vviolet\nBLOCK\fskyblue\nLINES\fskyblue\vVISUAL\fskyblue\fCONFIRM\bred\vINSERT\bred\aOP\ngreen\1\0\r\ngreen\f#a9b665\abg\f#282828\14oceanblue\f#45707a\bred\f#ea6962\tcyan\f#89b482\fskyblue\f#7daea3\vyellow\f#d8a657\nblack\f#282828\nwhite\f#a89984\afg\f#a89984\fmagenta\f#c14a4a\vviolet\f#d3869b\vorange\f#e78a4e\1\0\0\rinactive\vactive\1\0\0\rbufnames\rbuftypes\14filetypes\1\0\0\rnvim-gps\29feline.providers.vi_mode\25feline.providers.lsp\frequire\0" },
    loaded = true,
    path = "/Users/leiwenpeng/.local/share/nvim/site/pack/packer/start/feline.nvim",
    url = "https://github.com/feline-nvim/feline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nÚ\a\0\0\5\0\24\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0=\3\17\0025\3\18\0=\3\19\0025\3\20\0=\3\21\0025\3\22\0=\3\23\2B\0\2\1K\0\1\0\tyadm\1\0\1\venable\1\19preview_config\1\0\5\brow\3\0\bcol\3\1\vborder\vsingle\nstyle\fminimal\rrelative\vcursor\28current_line_blame_opts\1\0\4\14virt_text\2\22ignore_whitespace\1\ndelay\3è\a\18virt_text_pos\beol\17watch_gitdir\1\0\2\17follow_files\2\rinterval\3è\a\nsigns\1\0\n\vlinehl\1\15signcolumn\2\14word_diff\1\20update_debounce\3d\18sign_priority\3\6!current_line_blame_formatter1<author>, <author_time:%Y-%m-%d> - <summary>\nnumhl\1\20max_file_length\3À¸\2\23current_line_blame\2\24attach_to_untracked\2\17changedelete\1\0\4\ttext\6~\vlinehl\21GitSignsChangeLn\nnumhl\21GitSignsChangeNr\ahl\19GitSignsChange\14topdelete\1\0\4\ttext\bâ€¾\vlinehl\21GitSignsDeleteLn\nnumhl\21GitSignsDeleteNr\ahl\19GitSignsDelete\vdelete\1\0\4\ttext\6_\vlinehl\21GitSignsDeleteLn\nnumhl\21GitSignsDeleteNr\ahl\19GitSignsDelete\vchange\1\0\4\ttext\bâ”‚\vlinehl\21GitSignsChangeLn\nnumhl\21GitSignsChangeNr\ahl\19GitSignsChange\badd\1\0\0\1\0\4\ttext\bâ”‚\vlinehl\18GitSignsAddLn\nnumhl\18GitSignsAddNr\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/leiwenpeng/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/Users/leiwenpeng/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/leiwenpeng/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/tami5/lspsaga.nvim"
  },
  ["neo-tree.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rneo-tree\frequire\0" },
    loaded = true,
    path = "/Users/leiwenpeng/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/leiwenpeng/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-gps"] = {
    loaded = true,
    path = "/Users/leiwenpeng/.local/share/nvim/site/pack/packer/start/nvim-gps",
    url = "https://github.com/SmiteshP/nvim-gps"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    needs_bufread = true,
    path = "/Users/leiwenpeng/.local/share/nvim/site/pack/packer/opt/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/leiwenpeng/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = {
      ensure_installed = { "rust", "html", "css", "js", "typescript", "yaml", "tsx", "toml", "scss", "lua", "regex", "json", "json5", "jsdoc", "http", "graphql", "dot", "c" },
      highlight = {
        enable = true
      },
      sync_install = true
    },
    loaded = true,
    path = "/Users/leiwenpeng/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/leiwenpeng/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["oceanic-next"] = {
    loaded = true,
    path = "/Users/leiwenpeng/.local/share/nvim/site/pack/packer/start/oceanic-next",
    url = "https://github.com/mhartington/oceanic-next"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/leiwenpeng/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/leiwenpeng/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/leiwenpeng/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/leiwenpeng/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: dashboard-nvim
time([[Setup for dashboard-nvim]], true)
try_loadstring("\27LJ\2\n€\1\0\0\2\0\6\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0K\0\1\0\1\2\0\0\14dashboard\31indentLine_fileTypeExclude\14telescope dashboard_default_executive\6g\bvim\0", "setup", "dashboard-nvim")
time([[Setup for dashboard-nvim]], false)
time([[packadd for dashboard-nvim]], true)
vim.cmd [[packadd dashboard-nvim]]
time([[packadd for dashboard-nvim]], false)
-- Setup for: indent-blankline.nvim
time([[Setup for indent-blankline.nvim]], true)
time([[Setup for indent-blankline.nvim]], false)
time([[packadd for indent-blankline.nvim]], true)
vim.cmd [[packadd indent-blankline.nvim]]
time([[packadd for indent-blankline.nvim]], false)
-- Setup for: nvim-lsp-installer
time([[Setup for nvim-lsp-installer]], true)
time([[Setup for nvim-lsp-installer]], false)
time([[packadd for nvim-lsp-installer]], true)
vim.cmd [[packadd nvim-lsp-installer]]
time([[packadd for nvim-lsp-installer]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
time([[Config for nvim-treesitter]], false)
-- Config for: feline.nvim
time([[Config for feline.nvim]], true)
try_loadstring("\27LJ\2\n\\\0\0\5\0\5\1\0156\0\0\0009\0\1\0009\0\2\0006\2\0\0009\2\1\0029\2\3\2'\4\4\0B\2\2\0A\0\0\2\b\0\0\0X\0\2€+\0\2\0L\0\2\0+\0\1\0L\0\2\0\b%:t\vexpand\nempty\afn\bvim\2L\0\0\3\0\3\1\r6\0\0\0009\0\1\0009\0\2\0)\2\0\0B\0\2\2\25\0\0\0)\1(\0\1\1\0\0X\1\2€+\1\2\0L\1\2\0+\1\1\0L\1\2\0\rwinwidth\afn\bvim\4W\0\0\3\1\6\0\n4\0\0\0-\1\0\0009\1\1\1B\1\1\2=\1\0\0'\1\3\0=\1\2\0'\1\5\0=\1\4\0L\0\2\0\1À\tbold\nstyle\nblack\afg\19get_mode_color\abg0\0\0\3\2\1\0\6-\0\0\0-\1\1\0009\1\0\1B\1\1\0028\0\1\0L\0\2\0\bÀ\1À\17get_vim_modeQ\0\0\3\1\5\0\n4\0\0\0-\1\0\0009\1\1\1B\1\1\2=\1\0\0'\1\2\0=\1\2\0'\1\4\0=\1\3\0L\0\2\0\1À\tbold\nstyle\abg\19get_mode_color\afg-\0\0\3\0\4\0\0056\0\0\0009\0\1\0009\0\2\0'\2\3\0D\0\2\0\b%:F\vexpand\afn\bvim˜\1\0\0\6\0\t\0\0216\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\0026\1\0\0009\1\1\0019\1\2\1'\3\4\0B\1\2\0026\2\5\0'\4\6\0B\2\2\0029\2\a\2\18\4\0\0\18\5\1\0B\2\3\2\v\2\0\0X\3\1€'\2\b\0L\2\2\0\bï™\rget_icon\22nvim-web-devicons\frequire\b%:e\b%:t\vexpand\afn\bvim‚\2\0\0\n\0\15\0'4\0\0\0006\1\0\0009\1\1\0019\1\2\1'\3\3\0B\1\2\0026\2\0\0009\2\1\0029\2\2\2'\4\4\0B\2\2\0026\3\5\0'\5\6\0B\3\2\0029\3\a\3\18\5\1\0\18\6\2\0B\3\3\3\n\3\0\0X\5\f€6\5\0\0009\5\1\0059\5\t\0056\a\0\0009\a\1\a9\a\n\a\18\t\4\0B\a\2\2'\b\b\0B\5\3\2=\5\b\0X\5\2€'\5\v\0=\5\b\0'\5\f\0=\5\f\0'\5\14\0=\5\r\0L\0\2\0\tbold\nstyle\abg\nwhite\thlID\14synIDattr\afg\rget_icon\22nvim-web-devicons\frequire\b%:e\b%:t\vexpand\afn\bvim‚\2\0\0\n\0\15\0'4\0\0\0006\1\0\0009\1\1\0019\1\2\1'\3\3\0B\1\2\0026\2\0\0009\2\1\0029\2\2\2'\4\4\0B\2\2\0026\3\5\0'\5\6\0B\3\2\0029\3\a\3\18\5\1\0\18\6\2\0B\3\3\3\n\3\0\0X\5\f€6\5\0\0009\5\1\0059\5\t\0056\a\0\0009\a\1\a9\a\n\a\18\t\4\0B\a\2\2'\b\b\0B\5\3\2=\5\b\0X\5\2€'\5\v\0=\5\b\0'\5\f\0=\5\f\0'\5\14\0=\5\r\0L\0\2\0\tbold\nstyle\abg\nwhite\thlID\14synIDattr\afg\rget_icon\22nvim-web-devicons\frequire\b%:e\b%:t\vexpand\afn\bvimb\0\0\5\0\5\0\0166\0\0\0009\0\1\0009\0\2\0006\2\0\0009\2\1\0029\2\3\2'\4\4\0B\2\2\0A\0\0\2)\1\0\0\0\1\0\0X\0\2€+\0\1\0X\1\1€+\0\2\0L\0\2\0\b%:t\vexpand\rgetfsize\afn\bvimH\0\0\4\0\5\0\n'\0\0\0006\1\1\0009\1\2\0019\1\3\1\18\3\1\0009\1\4\1B\1\2\2'\2\0\0&\0\2\0L\0\2\0\nupper\15fileformat\abo\bvim\5\"\0\0\2\1\1\0\3-\0\0\0009\0\0\0D\0\1\0\2À\17get_location\"\0\0\2\1\1\0\3-\0\0\0009\0\0\0D\0\1\0\2À\17is_availableU\0\0\3\1\5\0\a-\0\0\0009\0\0\0006\2\1\0009\2\2\0029\2\3\0029\2\4\2D\0\2\0\0À\nERROR\rseverity\15diagnostic\bvim\22diagnostics_existT\0\0\3\1\5\0\a-\0\0\0009\0\0\0006\2\1\0009\2\2\0029\2\3\0029\2\4\2D\0\2\0\0À\tWARN\rseverity\15diagnostic\bvim\22diagnostics_existT\0\0\3\1\5\0\a-\0\0\0009\0\0\0006\2\1\0009\2\2\0029\2\3\0029\2\4\2D\0\2\0\0À\tHINT\rseverity\15diagnostic\bvim\22diagnostics_existT\0\0\3\1\5\0\a-\0\0\0009\0\0\0006\2\1\0009\2\2\0029\2\3\0029\2\4\2D\0\2\0\0À\tINFO\rseverity\15diagnostic\bvim\22diagnostics_existÈ\24\1\0\16\0f\0ÿ\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0025\3\4\0004\4\0\0=\4\5\0034\4\0\0=\4\6\0034\4\0\0=\4\a\0035\4\b\0004\5\4\0004\6\0\0>\6\1\0054\6\0\0>\6\2\0054\6\0\0>\6\3\5=\5\t\0044\5\4\0004\6\0\0>\6\1\0054\6\0\0>\6\2\0054\6\0\0>\6\3\5=\5\n\0045\5\v\0004\6\4\0004\a\0\0>\a\1\0064\a\0\0>\a\2\0064\a\0\0>\a\3\6=\6\t\0054\6\4\0004\a\0\0>\a\1\0064\a\0\0>\a\2\0064\a\0\0>\a\3\6=\6\n\0055\6\f\0005\a\r\0005\b\14\0003\t\15\0003\n\16\0005\v\17\0=\v\5\0035\v\18\0=\v\6\0039\v\t\5:\v\1\v5\f\19\0003\r\20\0=\r\21\f>\f\1\v9\v\t\5:\v\1\v5\f\23\0003\r\22\0=\r\24\f3\r\25\0=\r\21\f>\f\2\v9\v\t\5:\v\1\v5\f\27\0003\r\26\0=\r\24\f5\r\28\0=\r\21\f>\f\3\v9\v\t\5:\v\2\v5\f\29\0005\r\30\0=\r\21\f>\f\1\v9\v\t\5:\v\2\v5\f\31\0005\r \0=\r\21\f>\f\2\v9\v\t\5:\v\2\v5\f!\0005\r\"\0=\r\21\f>\f\3\v9\v\t\5:\v\2\v5\f#\0005\r$\0=\r\21\f>\f\4\v9\v\t\5:\v\3\v5\f&\0003\r%\0=\r\24\f3\r'\0=\r\21\f>\f\1\v9\v\t\5:\v\3\v5\f(\0003\r)\0=\r\21\f>\f\2\v9\v\t\5:\v\3\v5\f*\0003\r+\0=\r,\f5\r-\0=\r\21\f>\f\3\v9\v\t\5:\v\3\v5\f/\0003\r.\0=\r\24\f5\r0\0=\r\21\f>\f\4\v9\v\t\5:\v\3\v5\f1\0005\r2\0=\r\21\f>\f\5\v9\v\t\5:\v\3\v5\f3\0005\r4\0=\r\21\f>\f\6\v9\v\t\5:\v\3\v5\f5\0005\r6\0=\r\21\f>\f\a\v9\v\t\5:\v\3\v5\f7\0005\r8\0=\r\21\f>\f\b\v9\v\n\5:\v\1\v5\f9\0005\r:\0=\r\21\f5\r;\0005\14<\0=\14\21\r=\r=\f5\r@\0005\14>\0005\15?\0=\15\21\14>\14\1\r=\rA\f>\f\1\v9\v\t\4:\v\1\v5\fC\0003\rB\0=\r\24\f3\rD\0=\r,\f5\rE\0=\r\21\f>\f\1\v9\v\t\4:\v\3\v5\fF\0005\rG\0=\r\21\f>\f\1\v9\v\t\4:\v\3\v5\fH\0003\rI\0=\r,\f5\rJ\0=\r\21\f>\f\2\v9\v\t\4:\v\3\v5\fK\0003\rL\0=\r,\f5\rM\0=\r\21\f>\f\3\v9\v\t\4:\v\3\v5\fN\0003\rO\0=\r,\f5\rP\0=\r\21\f>\f\4\v9\v\t\4:\v\3\v5\fQ\0003\rR\0=\r,\f5\rS\0=\r\21\f>\f\5\v9\v\n\4:\v\1\v5\fT\0005\rU\0=\r\21\f5\rV\0005\14W\0=\14\21\r=\r=\f5\rZ\0005\14X\0005\15Y\0=\15\21\14>\14\1\r=\rA\f>\f\1\v6\v\0\0'\r[\0B\v\2\0029\v\\\v5\r]\0=\6^\r6\14_\0=\14`\r6\14a\0=\14b\r=\ac\r=\5d\r=\3e\rB\v\2\0012\0\0€K\0\1\0\19force_inactive\15components\19vi_mode_colors\15default_fg\afg\15default_bg\abg\ntheme\1\0\0\nsetup\vfeline\1\3\0\0\0\6 \1\0\2\afg\tNONE\abg\tcyan\1\0\1\bstr\6 \1\0\2\afg\tNONE\abg\tcyan\1\0\1\bstr\6 \1\0\3\abg\tcyan\nstyle\tbold\afg\nblack\1\0\1\rprovider\14file_type\1\0\2\afg\fskyblue\nstyle\tbold\0\1\0\1\rprovider\20diagnostic_info\1\0\2\afg\tcyan\nstyle\tbold\0\1\0\1\rprovider\21diagnostic_hints\1\0\2\afg\vyellow\nstyle\tbold\0\1\0\1\rprovider\24diagnostic_warnings\1\0\2\afg\bred\nstyle\tbold\0\1\0\1\rprovider\22diagnostic_errors\1\0\2\afg\vyellow\nstyle\tbold\1\0\2\14right_sep\6 \rprovider\21lsp_client_names\1\0\2\afg\vorange\nstyle\tbold\0\1\0\0\0\14right_sep\1\3\0\0\0\6 \1\0\2\afg\tNONE\abg\tcyan\1\0\1\bstr\6 \rleft_sep\1\0\2\afg\tNONE\abg\tcyan\1\0\1\bstr\6 \1\0\3\abg\tcyan\nstyle\tbold\afg\nblack\1\0\1\rprovider\14file_type\1\0\2\afg\vyellow\abg\abg\1\0\1\rprovider\15scroll_bar\1\0\3\abg\abg\nstyle\tbold\afg\nwhite\1\0\2\14right_sep\6 \rprovider\20line_percentage\1\0\3\abg\abg\nstyle\tbold\afg\nwhite\1\0\2\14right_sep\6 \rprovider\rposition\1\0\3\abg\abg\nstyle\tbold\afg\nwhite\1\0\2\14right_sep\6 \rprovider\18file_encoding\1\0\3\abg\abg\nstyle\tbold\afg\nwhite\1\0\1\14right_sep\6 \0\1\0\3\abg\abg\nstyle\tbold\afg\fskyblue\fenabled\0\1\0\2\rprovider\14file_size\14right_sep\6 \0\1\0\2\14right_sep\6 \rprovider\14file_type\0\1\0\1\14right_sep\6 \0\1\0\3\abg\abg\nstyle\tbold\afg\bred\1\0\1\rprovider\21git_diff_removed\1\0\3\abg\abg\nstyle\tbold\afg\vorange\1\0\1\rprovider\21git_diff_changed\1\0\3\abg\abg\nstyle\tbold\afg\ngreen\1\0\1\rprovider\19git_diff_added\1\0\3\abg\abg\nstyle\tbold\afg\vyellow\1\0\1\rprovider\15git_branch\1\0\3\abg\abg\nstyle\tbold\afg\nwhite\1\0\0\0\0\rprovider\1\0\1\14right_sep\6 \0\ahl\0\1\0\2\14right_sep\6 \rprovider\n Ray \1\2\0\0\rterminal\1\a\0\0\rNvimTree\tdbui\vpacker\rstartify\rfugitive\18fugitiveblame\0\0\1\0\16\vNORMAL\a<|\tNONE\a<>\tTERM\a<|\nSHELL\a<|\fCOMMAND\a<|\vSELECT\a<>\tMORE\a<>\nENTER\a<>\14V-REPLACE\a<>\fREPLACE\a<>\nBLOCK\a<>\nLINES\a<>\vVISUAL\a<>\fCONFIRM\a|>\vINSERT\a|>\aOP\a<|\1\0\16\vNORMAL\ngreen\tNONE\vyellow\tTERM\ngreen\nSHELL\ngreen\fCOMMAND\ngreen\vSELECT\vorange\tMORE\tcyan\nENTER\tcyan\14V-REPLACE\vviolet\fREPLACE\vviolet\nBLOCK\fskyblue\nLINES\fskyblue\vVISUAL\fskyblue\fCONFIRM\bred\vINSERT\bred\aOP\ngreen\1\0\r\ngreen\f#a9b665\abg\f#282828\14oceanblue\f#45707a\bred\f#ea6962\tcyan\f#89b482\fskyblue\f#7daea3\vyellow\f#d8a657\nblack\f#282828\nwhite\f#a89984\afg\f#a89984\fmagenta\f#c14a4a\vviolet\f#d3869b\vorange\f#e78a4e\1\0\0\rinactive\vactive\1\0\0\rbufnames\rbuftypes\14filetypes\1\0\0\rnvim-gps\29feline.providers.vi_mode\25feline.providers.lsp\frequire\0", "config", "feline.nvim")
time([[Config for feline.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\nÚ\a\0\0\5\0\24\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0=\3\17\0025\3\18\0=\3\19\0025\3\20\0=\3\21\0025\3\22\0=\3\23\2B\0\2\1K\0\1\0\tyadm\1\0\1\venable\1\19preview_config\1\0\5\brow\3\0\bcol\3\1\vborder\vsingle\nstyle\fminimal\rrelative\vcursor\28current_line_blame_opts\1\0\4\14virt_text\2\22ignore_whitespace\1\ndelay\3è\a\18virt_text_pos\beol\17watch_gitdir\1\0\2\17follow_files\2\rinterval\3è\a\nsigns\1\0\n\vlinehl\1\15signcolumn\2\14word_diff\1\20update_debounce\3d\18sign_priority\3\6!current_line_blame_formatter1<author>, <author_time:%Y-%m-%d> - <summary>\nnumhl\1\20max_file_length\3À¸\2\23current_line_blame\2\24attach_to_untracked\2\17changedelete\1\0\4\ttext\6~\vlinehl\21GitSignsChangeLn\nnumhl\21GitSignsChangeNr\ahl\19GitSignsChange\14topdelete\1\0\4\ttext\bâ€¾\vlinehl\21GitSignsDeleteLn\nnumhl\21GitSignsDeleteNr\ahl\19GitSignsDelete\vdelete\1\0\4\ttext\6_\vlinehl\21GitSignsDeleteLn\nnumhl\21GitSignsDeleteNr\ahl\19GitSignsDelete\vchange\1\0\4\ttext\bâ”‚\vlinehl\21GitSignsChangeLn\nnumhl\21GitSignsChangeNr\ahl\19GitSignsChange\badd\1\0\0\1\0\4\ttext\bâ”‚\vlinehl\18GitSignsAddLn\nnumhl\18GitSignsAddNr\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: neo-tree.nvim
time([[Config for neo-tree.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rneo-tree\frequire\0", "config", "neo-tree.nvim")
time([[Config for neo-tree.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
