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
    config = { "\27LJ\2\n\\\0\0\5\0\5\1\0156\0\0\0009\0\1\0009\0\2\0006\2\0\0009\2\1\0029\2\3\2'\4\4\0B\2\2\0A\0\0\2\b\0\0\0X\0\2Ä+\0\2\0L\0\2\0+\0\1\0L\0\2\0\b%:t\vexpand\nempty\afn\bvim\2L\0\0\3\0\3\1\r6\0\0\0009\0\1\0009\0\2\0)\2\0\0B\0\2\2\25\0\0\0)\1(\0\1\1\0\0X\1\2Ä+\1\2\0L\1\2\0+\1\1\0L\1\2\0\rwinwidth\afn\bvim\4W\0\0\3\1\6\0\n4\0\0\0-\1\0\0009\1\1\1B\1\1\2=\1\0\0'\1\3\0=\1\2\0'\1\5\0=\1\4\0L\0\2\0\2¿\tbold\nstyle\nblack\afg\19get_mode_color\abg0\0\0\3\2\1\0\6-\0\0\0-\1\1\0009\1\0\1B\1\1\0028\0\1\0L\0\2\0\t¿\2¿\17get_vim_modeQ\0\0\3\1\5\0\n4\0\0\0-\1\0\0009\1\1\1B\1\1\2=\1\0\0'\1\2\0=\1\2\0'\1\4\0=\1\3\0L\0\2\0\2¿\tbold\nstyle\abg\19get_mode_color\afg-\0\0\3\0\4\0\0056\0\0\0009\0\1\0009\0\2\0'\2\3\0D\0\2\0\b%:.\vexpand\afn\bvim3\0\0\3\1\3\0\a'\0\0\0-\1\0\0009\1\1\1B\1\1\2'\2\2\0&\0\2\0L\0\2\0\1¿\6]\14file_size\6[b\0\0\5\0\5\0\0166\0\0\0009\0\1\0009\0\2\0006\2\0\0009\2\1\0029\2\3\2'\4\4\0B\2\2\0A\0\0\2)\1\0\0\0\1\0\0X\0\2Ä+\0\1\0X\1\1Ä+\0\2\0L\0\2\0\b%:F\vexpand\rgetfsize\afn\bvimU\0\0\2\1\3\0\v-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\3Ä'\0\1\0L\0\2\0X\0\2Ä'\0\2\0L\0\2\0K\0\1\0\0¿\19No LSP Clients\5\20is_lsp_attachedò\1\0\0\6\0\t\0\0216\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\0026\1\0\0009\1\1\0019\1\2\1'\3\4\0B\1\2\0026\2\5\0'\4\6\0B\2\2\0029\2\a\2\18\4\0\0\18\5\1\0B\2\3\2\v\2\0\0X\3\1Ä'\2\b\0L\2\2\0\bÔÅô\rget_icon\22nvim-web-devicons\frequire\b%:e\b%:t\vexpand\afn\bvimÇ\2\0\0\n\0\15\0'4\0\0\0006\1\0\0009\1\1\0019\1\2\1'\3\3\0B\1\2\0026\2\0\0009\2\1\0029\2\2\2'\4\4\0B\2\2\0026\3\5\0'\5\6\0B\3\2\0029\3\a\3\18\5\1\0\18\6\2\0B\3\3\3\n\3\0\0X\5\fÄ6\5\0\0009\5\1\0059\5\t\0056\a\0\0009\a\1\a9\a\n\a\18\t\4\0B\a\2\2'\b\b\0B\5\3\2=\5\b\0X\5\2Ä'\5\v\0=\5\b\0'\5\f\0=\5\f\0'\5\14\0=\5\r\0L\0\2\0\tbold\nstyle\abg\nwhite\thlID\14synIDattr\afg\rget_icon\22nvim-web-devicons\frequire\b%:e\b%:t\vexpand\afn\bvimH\0\0\4\0\5\0\n'\0\0\0006\1\1\0009\1\2\0019\1\3\1\18\3\1\0009\1\4\1B\1\2\2'\2\0\0&\0\2\0L\0\2\0\nupper\15fileformat\abo\bvim\5\"\0\0\2\1\1\0\3-\0\0\0009\0\0\0D\0\1\0\3¿\17get_location\"\0\0\2\1\1\0\3-\0\0\0009\0\0\0D\0\1\0\3¿\17is_availableU\0\0\3\1\5\0\a-\0\0\0009\0\0\0006\2\1\0009\2\2\0029\2\3\0029\2\4\2D\0\2\0\0¿\nERROR\rseverity\15diagnostic\bvim\22diagnostics_existT\0\0\3\1\5\0\a-\0\0\0009\0\0\0006\2\1\0009\2\2\0029\2\3\0029\2\4\2D\0\2\0\0¿\tWARN\rseverity\15diagnostic\bvim\22diagnostics_existT\0\0\3\1\5\0\a-\0\0\0009\0\0\0006\2\1\0009\2\2\0029\2\3\0029\2\4\2D\0\2\0\0¿\tHINT\rseverity\15diagnostic\bvim\22diagnostics_existT\0\0\3\1\5\0\a-\0\0\0009\0\0\0006\2\1\0009\2\2\0029\2\3\0029\2\4\2D\0\2\0\0¿\tINFO\rseverity\15diagnostic\bvim\22diagnostics_exist±\24\1\0\17\0g\0Ä\0026\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\0\0'\5\4\0B\3\2\0025\4\5\0004\5\0\0=\5\6\0044\5\0\0=\5\a\0044\5\0\0=\5\b\0045\5\t\0004\6\4\0004\a\0\0>\a\1\0064\a\0\0>\a\2\0064\a\0\0>\a\3\6=\6\n\0054\6\4\0004\a\0\0>\a\1\0064\a\0\0>\a\2\0064\a\0\0>\a\3\6=\6\v\0055\6\f\0004\a\4\0004\b\0\0>\b\1\a4\b\0\0>\b\2\a4\b\0\0>\b\3\a=\a\n\0064\a\4\0004\b\0\0>\b\1\a4\b\0\0>\b\2\a4\b\0\0>\b\3\a=\a\v\0065\a\r\0005\b\14\0005\t\15\0003\n\16\0003\v\17\0005\f\18\0=\f\6\0045\f\19\0=\f\a\0049\f\n\6:\f\1\f5\r\20\0003\14\21\0=\14\22\r>\r\1\f9\f\n\6:\f\1\f5\r\24\0003\14\23\0=\14\25\r3\14\26\0=\14\22\r>\r\2\f9\f\n\6:\f\1\f5\r\28\0003\14\27\0=\14\25\r5\14\29\0=\14\22\r>\r\3\f9\f\n\6:\f\1\f5\r\31\0003\14\30\0=\14\25\r3\14 \0=\14!\r5\14\"\0=\14\22\r>\r\4\f9\f\n\6:\f\1\f5\r$\0003\14#\0=\14\25\r5\14%\0=\14\22\r>\r\5\f9\f\n\6:\f\1\f5\r&\0005\14'\0=\14\22\r>\r\6\f9\f\n\6:\f\2\f5\r(\0005\14)\0=\14\22\r>\r\1\f9\f\n\6:\f\2\f5\r*\0005\14+\0=\14\22\r>\r\2\f9\f\n\6:\f\2\f5\r,\0005\14-\0=\14\22\r>\r\3\f9\f\n\6:\f\2\f5\r.\0005\14/\0=\14\22\r>\r\4\f9\f\n\6:\f\3\f5\r1\0003\0140\0=\14\25\r3\0142\0=\14\22\r>\r\1\f9\f\n\6:\f\3\f5\r4\0003\0143\0=\14\25\r5\0145\0=\14\22\r>\r\2\f9\f\n\6:\f\3\f5\r6\0005\0147\0=\14\22\r>\r\3\f9\f\n\6:\f\3\f5\r8\0005\0149\0=\14\22\r>\r\4\f9\f\v\6:\f\1\f5\r:\0005\14;\0=\14\22\r5\14<\0005\15=\0=\15\22\14=\14>\r5\14A\0005\15?\0005\16@\0=\16\22\15>\15\1\14=\14B\r>\r\1\f9\f\n\5:\f\1\f5\rD\0003\14C\0=\14\25\r3\14E\0=\14!\r5\14F\0=\14\22\r>\r\1\f9\f\n\5:\f\3\f5\rG\0005\14H\0=\14\22\r>\r\1\f9\f\n\5:\f\3\f5\rI\0003\14J\0=\14!\r5\14K\0=\14\22\r>\r\2\f9\f\n\5:\f\3\f5\rL\0003\14M\0=\14!\r5\14N\0=\14\22\r>\r\3\f9\f\n\5:\f\3\f5\rO\0003\14P\0=\14!\r5\14Q\0=\14\22\r>\r\4\f9\f\n\5:\f\3\f5\rR\0003\14S\0=\14!\r5\14T\0=\14\22\r>\r\5\f9\f\v\5:\f\1\f5\rU\0005\14V\0=\14\22\r5\14W\0005\15X\0=\15\22\14=\14>\r5\14[\0005\15Y\0005\16Z\0=\16\22\15>\15\1\14=\14B\r>\r\1\f6\f\0\0'\14\\\0B\f\2\0029\f]\f5\14^\0=\a_\0146\15`\0=\15a\0146\15b\0=\15c\14=\bd\14=\6e\14=\4f\14B\f\2\0012\0\0ÄK\0\1\0\19force_inactive\15components\19vi_mode_colors\15default_fg\afg\15default_bg\abg\ntheme\1\0\0\nsetup\vfeline\1\3\0\0\0\6 \1\0\2\abg\tcyan\afg\tNONE\1\0\1\bstr\6 \1\0\2\abg\tcyan\afg\tNONE\1\0\1\bstr\6 \1\0\3\nstyle\tbold\afg\nblack\abg\tcyan\1\0\1\rprovider\14file_type\1\0\2\nstyle\tbold\afg\fskyblue\0\1\0\1\rprovider\20diagnostic_info\1\0\2\nstyle\tbold\afg\tcyan\0\1\0\1\rprovider\21diagnostic_hints\1\0\2\nstyle\tbold\afg\vyellow\0\1\0\1\rprovider\24diagnostic_warnings\1\0\2\nstyle\tbold\afg\bred\0\1\0\1\rprovider\22diagnostic_errors\1\0\2\nstyle\tbold\afg\vyellow\1\0\2\14right_sep\6 \rprovider\21lsp_client_names\1\0\2\nstyle\tbold\afg\vorange\0\1\0\0\0\14right_sep\1\3\0\0\0\6 \1\0\2\abg\tcyan\afg\tNONE\1\0\1\bstr\6 \rleft_sep\1\0\2\abg\tcyan\afg\tNONE\1\0\1\bstr\6 \1\0\3\nstyle\tbold\afg\nblack\abg\tcyan\1\0\1\rprovider\14file_type\1\0\3\nstyle\tbold\afg\nwhite\abg\abg\1\0\2\14right_sep\6 \rprovider\rposition\1\0\3\nstyle\tbold\afg\nwhite\abg\abg\1\0\2\14right_sep\6 \rprovider\18file_encoding\1\0\3\nstyle\tbold\afg\nwhite\abg\abg\1\0\1\14right_sep\6 \0\0\1\0\1\14right_sep\6 \0\1\0\3\nstyle\tbold\afg\bred\abg\abg\1\0\1\rprovider\21git_diff_removed\1\0\3\nstyle\tbold\afg\vorange\abg\abg\1\0\1\rprovider\21git_diff_changed\1\0\3\nstyle\tbold\afg\ngreen\abg\abg\1\0\1\rprovider\19git_diff_added\1\0\3\nstyle\tbold\afg\vyellow\abg\abg\1\0\1\rprovider\15git_branch\1\0\3\nstyle\tbold\afg\tcyan\abg\abg\1\0\2\14right_sep\6 \rprovider\21lsp_client_names\1\0\3\nstyle\tbold\afg\tcyan\abg\abg\1\0\0\0\1\0\3\nstyle\tbold\afg\fskyblue\abg\abg\fenabled\0\1\0\1\14right_sep\6 \0\1\0\3\nstyle\tbold\afg\nwhite\abg\abg\1\0\1\14right_sep\6 \0\0\rprovider\1\0\1\14right_sep\6 \0\ahl\0\1\0\2\14right_sep\6 \rprovider\f Hello \1\2\0\0\rterminal\1\a\0\0\rNvimTree\tdbui\vpacker\rstartify\rfugitive\18fugitiveblame\0\0\1\0\16\tNONE\a<>\tTERM\a<|\nSHELL\a<|\fCOMMAND\a<|\vSELECT\a<>\tMORE\a<>\nENTER\a<>\14V-REPLACE\a<>\fREPLACE\a<>\nBLOCK\a<>\nLINES\a<>\vVISUAL\a<>\fCONFIRM\a|>\vINSERT\a|>\aOP\a<|\vNORMAL\a<|\1\0\16\tNONE\vyellow\tTERM\ngreen\nSHELL\ngreen\fCOMMAND\ngreen\vSELECT\vorange\tMORE\tcyan\nENTER\tcyan\14V-REPLACE\vviolet\fREPLACE\vviolet\nBLOCK\fskyblue\nLINES\fskyblue\vVISUAL\fskyblue\fCONFIRM\bred\vINSERT\bred\aOP\ngreen\vNORMAL\ngreen\1\0\r\afg\f#a89984\14oceanblue\f#45707a\bred\f#ea6962\tcyan\f#89b482\fskyblue\f#7daea3\vyellow\f#d8a657\nblack\f#282828\nwhite\f#a89984\fmagenta\f#c14a4a\abg\f#282828\vviolet\f#d3869b\vorange\f#e78a4e\ngreen\f#a9b665\1\0\0\rinactive\vactive\1\0\0\rbufnames\rbuftypes\14filetypes\1\0\0\rnvim-gps\29feline.providers.vi_mode\26feline.providers.file\25feline.providers.lsp\frequire\0" },
    loaded = true,
    path = "/Users/leiwenpeng/.local/share/nvim/site/pack/packer/start/feline.nvim",
    url = "https://github.com/feline-nvim/feline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n⁄\a\0\0\5\0\24\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0=\3\17\0025\3\18\0=\3\19\0025\3\20\0=\3\21\0025\3\22\0=\3\23\2B\0\2\1K\0\1\0\tyadm\1\0\1\venable\1\19preview_config\1\0\5\vborder\vsingle\nstyle\fminimal\rrelative\vcursor\bcol\3\1\brow\3\0\28current_line_blame_opts\1\0\4\22ignore_whitespace\1\ndelay\3Ë\a\18virt_text_pos\beol\14virt_text\2\17watch_gitdir\1\0\2\17follow_files\2\rinterval\3Ë\a\nsigns\1\0\n\23current_line_blame\2\24attach_to_untracked\2\15signcolumn\2\vlinehl\1\14word_diff\1\20update_debounce\3d\18sign_priority\3\6\nnumhl\1!current_line_blame_formatter1<author>, <author_time:%Y-%m-%d> - <summary>\20max_file_length\3¿∏\2\17changedelete\1\0\4\ttext\6~\vlinehl\21GitSignsChangeLn\nnumhl\21GitSignsChangeNr\ahl\19GitSignsChange\14topdelete\1\0\4\ttext\b‚Äæ\vlinehl\21GitSignsDeleteLn\nnumhl\21GitSignsDeleteNr\ahl\19GitSignsDelete\vdelete\1\0\4\ttext\6_\vlinehl\21GitSignsDeleteLn\nnumhl\21GitSignsDeleteNr\ahl\19GitSignsDelete\vchange\1\0\4\ttext\b‚îÇ\vlinehl\21GitSignsChangeLn\nnumhl\21GitSignsChangeNr\ahl\19GitSignsChange\badd\1\0\0\1\0\4\ttext\b‚îÇ\vlinehl\18GitSignsAddLn\nnumhl\18GitSignsAddNr\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0" },
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
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/Users/leiwenpeng/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/tami5/lspsaga.nvim"
  },
  ["neo-tree.nvim"] = {
    config = { "\27LJ\2\nÉ\16\0\0\a\0002\0?6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0035\4\a\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\16\0005\5\15\0=\5\17\4=\4\18\3=\3\19\0025\3\20\0005\4\21\0=\4\22\0035\4\24\0005\5\23\0=\5\25\0045\5\26\0005\6\27\0=\6\28\5=\5\29\4=\4\30\3=\3\31\0024\3\0\0=\3 \0025\3&\0005\4!\0004\5\0\0=\5\"\0044\5\0\0=\5#\0045\5$\0=\5%\4=\4'\0035\4)\0005\5(\0=\5\30\4=\4\31\3=\3*\0025\3+\0005\4-\0005\5,\0=\5\30\4=\4\31\3=\3.\0025\0031\0005\4/\0005\0050\0=\5\30\4=\4\31\3=\3\18\2B\0\2\1K\0\1\0\1\0\0\1\0\a\aga\17git_add_file\agg\24git_commit_and_push\agu\21git_unstage_file\6A\16git_add_all\agc\15git_commit\agp\rgit_push\agr\20git_revert_file\1\0\1\rposition\nfloat\fbuffers\1\0\0\1\0\3\abd\18buffer_delete\t<bs>\16navigate_up\6.\rset_root\1\0\3\18show_unloaded\2\21group_empty_dirs\2\24follow_current_file\2\15filesystem\1\0\0\1\0\b\6/\17fuzzy_finder\6f\21filter_on_submit\t<bs>\16navigate_up\6.\rset_root\n<c-x>\17clear_filter\6H\18toggle_hidden\a[g\22prev_git_modified\a]g\22next_git_modified\19filtered_items\1\0\4\27use_libuv_file_watcher\1\26hijack_netrw_behavior\17open_default\21group_empty_dirs\1\24follow_current_file\1\15never_show\1\3\0\0\14.DS_Store\14thumbs.db\20hide_by_pattern\17hide_by_name\1\0\4\fvisible\1\16hide_hidden\2\20hide_gitignored\1\18hide_dotfiles\1\18nesting_rules\vwindow\rmappings\6a\vconfig\1\0\1\14show_path\tnone\1\2\0\0\badd\f<space>\1\0\18\6y\22copy_to_clipboard\6r\vrename\6C\15close_node\6R\frefresh\6S\15open_split\t<cr>\topen\18<2-LeftMouse>\topen\6?\14show_help\6d\vdelete\6q\17close_window\6m\tmove\6p\25paste_from_clipboard\6x\21cut_to_clipboard\6c\tcopy\6w\28open_with_window_picker\6t\16open_tabnew\6A\18add_directory\6s\16open_vsplit\1\2\1\0\16toggle_node\vnowait\1\20mapping_options\1\0\2\vnowait\2\fnoremap\2\1\0\2\nwidth\3(\rposition\tleft\30default_component_configs\15git_status\fsymbols\1\0\0\1\0\t\vstaged\bÔÅÜ\runstaged\bÔò∞\rmodified\5\fignored\bÔë¥\14untracked\bÔÑ®\frenamed\bÔïî\fdeleted\b‚úñ\nadded\5\rconflict\bÓúß\tname\1\0\3\26use_git_status_colors\2\19trailing_slash\1\14highlight\20NeoTreeFileName\rmodified\1\0\2\14highlight\20NeoTreeModified\vsymbol\b[+]\ticon\1\0\5\16folder_open\bÓóæ\14highlight\20NeoTreeFileIcon\17folder_empty\bÔ∞ä\fdefault\6*\18folder_closed\bÓóø\vindent\1\0\t\23last_indent_marker\b‚îî\18indent_marker\b‚îÇ\17with_markers\2\fpadding\3\1\16indent_size\3\2\23expander_highlight\20NeoTreeExpander\14highlight\24NeoTreeIndentMarker\22expander_expanded\bÔëº\23expander_collapsed\bÔë†\14container\1\0\0\1\0\1\26enable_character_fade\2\1\0\4\23enable_diagnostics\1\22enable_git_status\1\23popup_border_style\frounded\25close_if_last_window\1\nsetup\rneo-tree\frequire\0" },
    loaded = true,
    path = "/Users/leiwenpeng/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/leiwenpeng/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/Users/leiwenpeng/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-gps"] = {
    loaded = true,
    path = "/Users/leiwenpeng/.local/share/nvim/site/pack/packer/start/nvim-gps",
    url = "https://github.com/SmiteshP/nvim-gps"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/Users/leiwenpeng/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nˇ\1\0\0\5\0\v\0\0216\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0025\2\4\0005\3\6\0005\4\5\0=\4\a\3=\3\b\2=\2\3\0009\2\t\0019\2\3\0024\4\0\0B\2\2\0019\2\n\0019\2\3\0024\4\0\0B\2\2\1K\0\1\0\veslint\rtsserver\aui\nicons\1\0\0\1\0\3\21server_installed\b‚úì\23server_uninstalled\b‚úó\19server_pending\b‚ûú\1\0\1\27automatic_installation\2\nsetup\14lspconfig\23nvim-lsp-installer\frequire\0" },
    loaded = true,
    path = "/Users/leiwenpeng/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/Users/leiwenpeng/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/Users/leiwenpeng/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
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
  ["rust.vim"] = {
    loaded = true,
    path = "/Users/leiwenpeng/.local/share/nvim/site/pack/packer/start/rust.vim",
    url = "https://github.com/rust-lang/rust.vim"
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
try_loadstring("\27LJ\2\nÄ\1\0\0\2\0\6\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0K\0\1\0\1\2\0\0\14dashboard\31indentLine_fileTypeExclude\14telescope dashboard_default_executive\6g\bvim\0", "setup", "dashboard-nvim")
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
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nˇ\1\0\0\5\0\v\0\0216\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0025\2\4\0005\3\6\0005\4\5\0=\4\a\3=\3\b\2=\2\3\0009\2\t\0019\2\3\0024\4\0\0B\2\2\0019\2\n\0019\2\3\0024\4\0\0B\2\2\1K\0\1\0\veslint\rtsserver\aui\nicons\1\0\0\1\0\3\21server_installed\b‚úì\23server_uninstalled\b‚úó\19server_pending\b‚ûú\1\0\1\27automatic_installation\2\nsetup\14lspconfig\23nvim-lsp-installer\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: neo-tree.nvim
time([[Config for neo-tree.nvim]], true)
try_loadstring("\27LJ\2\nÉ\16\0\0\a\0002\0?6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0035\4\a\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\16\0005\5\15\0=\5\17\4=\4\18\3=\3\19\0025\3\20\0005\4\21\0=\4\22\0035\4\24\0005\5\23\0=\5\25\0045\5\26\0005\6\27\0=\6\28\5=\5\29\4=\4\30\3=\3\31\0024\3\0\0=\3 \0025\3&\0005\4!\0004\5\0\0=\5\"\0044\5\0\0=\5#\0045\5$\0=\5%\4=\4'\0035\4)\0005\5(\0=\5\30\4=\4\31\3=\3*\0025\3+\0005\4-\0005\5,\0=\5\30\4=\4\31\3=\3.\0025\0031\0005\4/\0005\0050\0=\5\30\4=\4\31\3=\3\18\2B\0\2\1K\0\1\0\1\0\0\1\0\a\aga\17git_add_file\agg\24git_commit_and_push\agu\21git_unstage_file\6A\16git_add_all\agc\15git_commit\agp\rgit_push\agr\20git_revert_file\1\0\1\rposition\nfloat\fbuffers\1\0\0\1\0\3\abd\18buffer_delete\t<bs>\16navigate_up\6.\rset_root\1\0\3\18show_unloaded\2\21group_empty_dirs\2\24follow_current_file\2\15filesystem\1\0\0\1\0\b\6/\17fuzzy_finder\6f\21filter_on_submit\t<bs>\16navigate_up\6.\rset_root\n<c-x>\17clear_filter\6H\18toggle_hidden\a[g\22prev_git_modified\a]g\22next_git_modified\19filtered_items\1\0\4\27use_libuv_file_watcher\1\26hijack_netrw_behavior\17open_default\21group_empty_dirs\1\24follow_current_file\1\15never_show\1\3\0\0\14.DS_Store\14thumbs.db\20hide_by_pattern\17hide_by_name\1\0\4\fvisible\1\16hide_hidden\2\20hide_gitignored\1\18hide_dotfiles\1\18nesting_rules\vwindow\rmappings\6a\vconfig\1\0\1\14show_path\tnone\1\2\0\0\badd\f<space>\1\0\18\6y\22copy_to_clipboard\6r\vrename\6C\15close_node\6R\frefresh\6S\15open_split\t<cr>\topen\18<2-LeftMouse>\topen\6?\14show_help\6d\vdelete\6q\17close_window\6m\tmove\6p\25paste_from_clipboard\6x\21cut_to_clipboard\6c\tcopy\6w\28open_with_window_picker\6t\16open_tabnew\6A\18add_directory\6s\16open_vsplit\1\2\1\0\16toggle_node\vnowait\1\20mapping_options\1\0\2\vnowait\2\fnoremap\2\1\0\2\nwidth\3(\rposition\tleft\30default_component_configs\15git_status\fsymbols\1\0\0\1\0\t\vstaged\bÔÅÜ\runstaged\bÔò∞\rmodified\5\fignored\bÔë¥\14untracked\bÔÑ®\frenamed\bÔïî\fdeleted\b‚úñ\nadded\5\rconflict\bÓúß\tname\1\0\3\26use_git_status_colors\2\19trailing_slash\1\14highlight\20NeoTreeFileName\rmodified\1\0\2\14highlight\20NeoTreeModified\vsymbol\b[+]\ticon\1\0\5\16folder_open\bÓóæ\14highlight\20NeoTreeFileIcon\17folder_empty\bÔ∞ä\fdefault\6*\18folder_closed\bÓóø\vindent\1\0\t\23last_indent_marker\b‚îî\18indent_marker\b‚îÇ\17with_markers\2\fpadding\3\1\16indent_size\3\2\23expander_highlight\20NeoTreeExpander\14highlight\24NeoTreeIndentMarker\22expander_expanded\bÔëº\23expander_collapsed\bÔë†\14container\1\0\0\1\0\1\26enable_character_fade\2\1\0\4\23enable_diagnostics\1\22enable_git_status\1\23popup_border_style\frounded\25close_if_last_window\1\nsetup\rneo-tree\frequire\0", "config", "neo-tree.nvim")
time([[Config for neo-tree.nvim]], false)
-- Config for: feline.nvim
time([[Config for feline.nvim]], true)
try_loadstring("\27LJ\2\n\\\0\0\5\0\5\1\0156\0\0\0009\0\1\0009\0\2\0006\2\0\0009\2\1\0029\2\3\2'\4\4\0B\2\2\0A\0\0\2\b\0\0\0X\0\2Ä+\0\2\0L\0\2\0+\0\1\0L\0\2\0\b%:t\vexpand\nempty\afn\bvim\2L\0\0\3\0\3\1\r6\0\0\0009\0\1\0009\0\2\0)\2\0\0B\0\2\2\25\0\0\0)\1(\0\1\1\0\0X\1\2Ä+\1\2\0L\1\2\0+\1\1\0L\1\2\0\rwinwidth\afn\bvim\4W\0\0\3\1\6\0\n4\0\0\0-\1\0\0009\1\1\1B\1\1\2=\1\0\0'\1\3\0=\1\2\0'\1\5\0=\1\4\0L\0\2\0\2¿\tbold\nstyle\nblack\afg\19get_mode_color\abg0\0\0\3\2\1\0\6-\0\0\0-\1\1\0009\1\0\1B\1\1\0028\0\1\0L\0\2\0\t¿\2¿\17get_vim_modeQ\0\0\3\1\5\0\n4\0\0\0-\1\0\0009\1\1\1B\1\1\2=\1\0\0'\1\2\0=\1\2\0'\1\4\0=\1\3\0L\0\2\0\2¿\tbold\nstyle\abg\19get_mode_color\afg-\0\0\3\0\4\0\0056\0\0\0009\0\1\0009\0\2\0'\2\3\0D\0\2\0\b%:.\vexpand\afn\bvim3\0\0\3\1\3\0\a'\0\0\0-\1\0\0009\1\1\1B\1\1\2'\2\2\0&\0\2\0L\0\2\0\1¿\6]\14file_size\6[b\0\0\5\0\5\0\0166\0\0\0009\0\1\0009\0\2\0006\2\0\0009\2\1\0029\2\3\2'\4\4\0B\2\2\0A\0\0\2)\1\0\0\0\1\0\0X\0\2Ä+\0\1\0X\1\1Ä+\0\2\0L\0\2\0\b%:F\vexpand\rgetfsize\afn\bvimU\0\0\2\1\3\0\v-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\3Ä'\0\1\0L\0\2\0X\0\2Ä'\0\2\0L\0\2\0K\0\1\0\0¿\19No LSP Clients\5\20is_lsp_attachedò\1\0\0\6\0\t\0\0216\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\0026\1\0\0009\1\1\0019\1\2\1'\3\4\0B\1\2\0026\2\5\0'\4\6\0B\2\2\0029\2\a\2\18\4\0\0\18\5\1\0B\2\3\2\v\2\0\0X\3\1Ä'\2\b\0L\2\2\0\bÔÅô\rget_icon\22nvim-web-devicons\frequire\b%:e\b%:t\vexpand\afn\bvimÇ\2\0\0\n\0\15\0'4\0\0\0006\1\0\0009\1\1\0019\1\2\1'\3\3\0B\1\2\0026\2\0\0009\2\1\0029\2\2\2'\4\4\0B\2\2\0026\3\5\0'\5\6\0B\3\2\0029\3\a\3\18\5\1\0\18\6\2\0B\3\3\3\n\3\0\0X\5\fÄ6\5\0\0009\5\1\0059\5\t\0056\a\0\0009\a\1\a9\a\n\a\18\t\4\0B\a\2\2'\b\b\0B\5\3\2=\5\b\0X\5\2Ä'\5\v\0=\5\b\0'\5\f\0=\5\f\0'\5\14\0=\5\r\0L\0\2\0\tbold\nstyle\abg\nwhite\thlID\14synIDattr\afg\rget_icon\22nvim-web-devicons\frequire\b%:e\b%:t\vexpand\afn\bvimH\0\0\4\0\5\0\n'\0\0\0006\1\1\0009\1\2\0019\1\3\1\18\3\1\0009\1\4\1B\1\2\2'\2\0\0&\0\2\0L\0\2\0\nupper\15fileformat\abo\bvim\5\"\0\0\2\1\1\0\3-\0\0\0009\0\0\0D\0\1\0\3¿\17get_location\"\0\0\2\1\1\0\3-\0\0\0009\0\0\0D\0\1\0\3¿\17is_availableU\0\0\3\1\5\0\a-\0\0\0009\0\0\0006\2\1\0009\2\2\0029\2\3\0029\2\4\2D\0\2\0\0¿\nERROR\rseverity\15diagnostic\bvim\22diagnostics_existT\0\0\3\1\5\0\a-\0\0\0009\0\0\0006\2\1\0009\2\2\0029\2\3\0029\2\4\2D\0\2\0\0¿\tWARN\rseverity\15diagnostic\bvim\22diagnostics_existT\0\0\3\1\5\0\a-\0\0\0009\0\0\0006\2\1\0009\2\2\0029\2\3\0029\2\4\2D\0\2\0\0¿\tHINT\rseverity\15diagnostic\bvim\22diagnostics_existT\0\0\3\1\5\0\a-\0\0\0009\0\0\0006\2\1\0009\2\2\0029\2\3\0029\2\4\2D\0\2\0\0¿\tINFO\rseverity\15diagnostic\bvim\22diagnostics_exist±\24\1\0\17\0g\0Ä\0026\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\0\0'\5\4\0B\3\2\0025\4\5\0004\5\0\0=\5\6\0044\5\0\0=\5\a\0044\5\0\0=\5\b\0045\5\t\0004\6\4\0004\a\0\0>\a\1\0064\a\0\0>\a\2\0064\a\0\0>\a\3\6=\6\n\0054\6\4\0004\a\0\0>\a\1\0064\a\0\0>\a\2\0064\a\0\0>\a\3\6=\6\v\0055\6\f\0004\a\4\0004\b\0\0>\b\1\a4\b\0\0>\b\2\a4\b\0\0>\b\3\a=\a\n\0064\a\4\0004\b\0\0>\b\1\a4\b\0\0>\b\2\a4\b\0\0>\b\3\a=\a\v\0065\a\r\0005\b\14\0005\t\15\0003\n\16\0003\v\17\0005\f\18\0=\f\6\0045\f\19\0=\f\a\0049\f\n\6:\f\1\f5\r\20\0003\14\21\0=\14\22\r>\r\1\f9\f\n\6:\f\1\f5\r\24\0003\14\23\0=\14\25\r3\14\26\0=\14\22\r>\r\2\f9\f\n\6:\f\1\f5\r\28\0003\14\27\0=\14\25\r5\14\29\0=\14\22\r>\r\3\f9\f\n\6:\f\1\f5\r\31\0003\14\30\0=\14\25\r3\14 \0=\14!\r5\14\"\0=\14\22\r>\r\4\f9\f\n\6:\f\1\f5\r$\0003\14#\0=\14\25\r5\14%\0=\14\22\r>\r\5\f9\f\n\6:\f\1\f5\r&\0005\14'\0=\14\22\r>\r\6\f9\f\n\6:\f\2\f5\r(\0005\14)\0=\14\22\r>\r\1\f9\f\n\6:\f\2\f5\r*\0005\14+\0=\14\22\r>\r\2\f9\f\n\6:\f\2\f5\r,\0005\14-\0=\14\22\r>\r\3\f9\f\n\6:\f\2\f5\r.\0005\14/\0=\14\22\r>\r\4\f9\f\n\6:\f\3\f5\r1\0003\0140\0=\14\25\r3\0142\0=\14\22\r>\r\1\f9\f\n\6:\f\3\f5\r4\0003\0143\0=\14\25\r5\0145\0=\14\22\r>\r\2\f9\f\n\6:\f\3\f5\r6\0005\0147\0=\14\22\r>\r\3\f9\f\n\6:\f\3\f5\r8\0005\0149\0=\14\22\r>\r\4\f9\f\v\6:\f\1\f5\r:\0005\14;\0=\14\22\r5\14<\0005\15=\0=\15\22\14=\14>\r5\14A\0005\15?\0005\16@\0=\16\22\15>\15\1\14=\14B\r>\r\1\f9\f\n\5:\f\1\f5\rD\0003\14C\0=\14\25\r3\14E\0=\14!\r5\14F\0=\14\22\r>\r\1\f9\f\n\5:\f\3\f5\rG\0005\14H\0=\14\22\r>\r\1\f9\f\n\5:\f\3\f5\rI\0003\14J\0=\14!\r5\14K\0=\14\22\r>\r\2\f9\f\n\5:\f\3\f5\rL\0003\14M\0=\14!\r5\14N\0=\14\22\r>\r\3\f9\f\n\5:\f\3\f5\rO\0003\14P\0=\14!\r5\14Q\0=\14\22\r>\r\4\f9\f\n\5:\f\3\f5\rR\0003\14S\0=\14!\r5\14T\0=\14\22\r>\r\5\f9\f\v\5:\f\1\f5\rU\0005\14V\0=\14\22\r5\14W\0005\15X\0=\15\22\14=\14>\r5\14[\0005\15Y\0005\16Z\0=\16\22\15>\15\1\14=\14B\r>\r\1\f6\f\0\0'\14\\\0B\f\2\0029\f]\f5\14^\0=\a_\0146\15`\0=\15a\0146\15b\0=\15c\14=\bd\14=\6e\14=\4f\14B\f\2\0012\0\0ÄK\0\1\0\19force_inactive\15components\19vi_mode_colors\15default_fg\afg\15default_bg\abg\ntheme\1\0\0\nsetup\vfeline\1\3\0\0\0\6 \1\0\2\abg\tcyan\afg\tNONE\1\0\1\bstr\6 \1\0\2\abg\tcyan\afg\tNONE\1\0\1\bstr\6 \1\0\3\nstyle\tbold\afg\nblack\abg\tcyan\1\0\1\rprovider\14file_type\1\0\2\nstyle\tbold\afg\fskyblue\0\1\0\1\rprovider\20diagnostic_info\1\0\2\nstyle\tbold\afg\tcyan\0\1\0\1\rprovider\21diagnostic_hints\1\0\2\nstyle\tbold\afg\vyellow\0\1\0\1\rprovider\24diagnostic_warnings\1\0\2\nstyle\tbold\afg\bred\0\1\0\1\rprovider\22diagnostic_errors\1\0\2\nstyle\tbold\afg\vyellow\1\0\2\14right_sep\6 \rprovider\21lsp_client_names\1\0\2\nstyle\tbold\afg\vorange\0\1\0\0\0\14right_sep\1\3\0\0\0\6 \1\0\2\abg\tcyan\afg\tNONE\1\0\1\bstr\6 \rleft_sep\1\0\2\abg\tcyan\afg\tNONE\1\0\1\bstr\6 \1\0\3\nstyle\tbold\afg\nblack\abg\tcyan\1\0\1\rprovider\14file_type\1\0\3\nstyle\tbold\afg\nwhite\abg\abg\1\0\2\14right_sep\6 \rprovider\rposition\1\0\3\nstyle\tbold\afg\nwhite\abg\abg\1\0\2\14right_sep\6 \rprovider\18file_encoding\1\0\3\nstyle\tbold\afg\nwhite\abg\abg\1\0\1\14right_sep\6 \0\0\1\0\1\14right_sep\6 \0\1\0\3\nstyle\tbold\afg\bred\abg\abg\1\0\1\rprovider\21git_diff_removed\1\0\3\nstyle\tbold\afg\vorange\abg\abg\1\0\1\rprovider\21git_diff_changed\1\0\3\nstyle\tbold\afg\ngreen\abg\abg\1\0\1\rprovider\19git_diff_added\1\0\3\nstyle\tbold\afg\vyellow\abg\abg\1\0\1\rprovider\15git_branch\1\0\3\nstyle\tbold\afg\tcyan\abg\abg\1\0\2\14right_sep\6 \rprovider\21lsp_client_names\1\0\3\nstyle\tbold\afg\tcyan\abg\abg\1\0\0\0\1\0\3\nstyle\tbold\afg\fskyblue\abg\abg\fenabled\0\1\0\1\14right_sep\6 \0\1\0\3\nstyle\tbold\afg\nwhite\abg\abg\1\0\1\14right_sep\6 \0\0\rprovider\1\0\1\14right_sep\6 \0\ahl\0\1\0\2\14right_sep\6 \rprovider\f Hello \1\2\0\0\rterminal\1\a\0\0\rNvimTree\tdbui\vpacker\rstartify\rfugitive\18fugitiveblame\0\0\1\0\16\tNONE\a<>\tTERM\a<|\nSHELL\a<|\fCOMMAND\a<|\vSELECT\a<>\tMORE\a<>\nENTER\a<>\14V-REPLACE\a<>\fREPLACE\a<>\nBLOCK\a<>\nLINES\a<>\vVISUAL\a<>\fCONFIRM\a|>\vINSERT\a|>\aOP\a<|\vNORMAL\a<|\1\0\16\tNONE\vyellow\tTERM\ngreen\nSHELL\ngreen\fCOMMAND\ngreen\vSELECT\vorange\tMORE\tcyan\nENTER\tcyan\14V-REPLACE\vviolet\fREPLACE\vviolet\nBLOCK\fskyblue\nLINES\fskyblue\vVISUAL\fskyblue\fCONFIRM\bred\vINSERT\bred\aOP\ngreen\vNORMAL\ngreen\1\0\r\afg\f#a89984\14oceanblue\f#45707a\bred\f#ea6962\tcyan\f#89b482\fskyblue\f#7daea3\vyellow\f#d8a657\nblack\f#282828\nwhite\f#a89984\fmagenta\f#c14a4a\abg\f#282828\vviolet\f#d3869b\vorange\f#e78a4e\ngreen\f#a9b665\1\0\0\rinactive\vactive\1\0\0\rbufnames\rbuftypes\14filetypes\1\0\0\rnvim-gps\29feline.providers.vi_mode\26feline.providers.file\25feline.providers.lsp\frequire\0", "config", "feline.nvim")
time([[Config for feline.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n⁄\a\0\0\5\0\24\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0=\3\17\0025\3\18\0=\3\19\0025\3\20\0=\3\21\0025\3\22\0=\3\23\2B\0\2\1K\0\1\0\tyadm\1\0\1\venable\1\19preview_config\1\0\5\vborder\vsingle\nstyle\fminimal\rrelative\vcursor\bcol\3\1\brow\3\0\28current_line_blame_opts\1\0\4\22ignore_whitespace\1\ndelay\3Ë\a\18virt_text_pos\beol\14virt_text\2\17watch_gitdir\1\0\2\17follow_files\2\rinterval\3Ë\a\nsigns\1\0\n\23current_line_blame\2\24attach_to_untracked\2\15signcolumn\2\vlinehl\1\14word_diff\1\20update_debounce\3d\18sign_priority\3\6\nnumhl\1!current_line_blame_formatter1<author>, <author_time:%Y-%m-%d> - <summary>\20max_file_length\3¿∏\2\17changedelete\1\0\4\ttext\6~\vlinehl\21GitSignsChangeLn\nnumhl\21GitSignsChangeNr\ahl\19GitSignsChange\14topdelete\1\0\4\ttext\b‚Äæ\vlinehl\21GitSignsDeleteLn\nnumhl\21GitSignsDeleteNr\ahl\19GitSignsDelete\vdelete\1\0\4\ttext\6_\vlinehl\21GitSignsDeleteLn\nnumhl\21GitSignsDeleteNr\ahl\19GitSignsDelete\vchange\1\0\4\ttext\b‚îÇ\vlinehl\21GitSignsChangeLn\nnumhl\21GitSignsChangeNr\ahl\19GitSignsChange\badd\1\0\0\1\0\4\ttext\b‚îÇ\vlinehl\18GitSignsAddLn\nnumhl\18GitSignsAddNr\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
