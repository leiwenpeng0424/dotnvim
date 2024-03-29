local use = require("packer").use

use({
	"AckslD/nvim-neoclip.lua",
	config = function()
		require("neoclip").setup({})
	end,
})

use({
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	requires = {
		{ "nvim-lua/plenary.nvim" },
		{ "BurntSushi/ripgrep" },
	},
	config = function()
		local tel = require("telescope")
		local actions = require("telescope.actions")

		tel.setup({
			defaults = {
				mappings = {
					n = {
						["s"] = actions.select_horizontal,
						["v"] = actions.select_vertical,
					},
				},
				layout_strategies = "horizontal",
				layout_config = {
					width = 0.5,
					height = 0.6,
					prompt_position = "top",
				},
			},
		})
		tel.load_extension("neoclip")
	end,
})
