return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons", opt = true },
	},
	config = function()
		require("config.lualine")
	end,
}
