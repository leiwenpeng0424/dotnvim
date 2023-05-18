local use = require "packer".use

use {
    'goolord/alpha-nvim',
    config = function()
        require 'alpha'.setup(require 'alpha.themes.theta'.config)
    end
}
