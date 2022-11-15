local use = require('packer').use

use {
  'romgrk/barbar.nvim',
  requires = {'kyazdani42/nvim-web-devicons'},
  config = function ()
      require('bufferline').setup({
          -- Configure icons on the bufferline.
          icon_separator_active = '🁢 ',
          icon_separator_inactive = '',
          icon_close_tab = '窱',
          icon_close_tab_modified = '●',
          icon_pinned = ' ',
          -- If true, new buffers will be inserted at the start/end of the list.
          -- Default is to insert after current buffer.
          insert_at_end = false,
          insert_at_start = false,
      })
  end
}
