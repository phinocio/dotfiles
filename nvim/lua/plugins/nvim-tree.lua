return {
	enabled = true,
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("config.nvim-tree")
	end,
}
