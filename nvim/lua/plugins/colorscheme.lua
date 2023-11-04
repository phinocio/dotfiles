return {
	{
		"Mofiqul/dracula.nvim",
		name = "dracula",
		event = "VeryLazy",
		config = function()
			require("config.dracula")
			-- vim.cmd("colorscheme dracula")
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("config.catppuccin")
			vim.cmd("colorscheme catppuccin")
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			require("config.tokyonight")
			-- vim.cmd("colorscheme tokyonight")
		end,
	},
	{
		"navarasu/onedark.nvim",
		priority = 1000,
		config = function()
			require("config.onedark")
			-- vim.cmd("colorscheme onedark")
		end,
	},
}
