return {
	-- #########################################
	-- Disable colorscheme related plugins
	-- #########################################
	{ "folke/tokyonight.nvim", enabled = false },

	-- #########################################
	-- Add new colorscheme plugins
	-- #########################################
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		opts = {
			transparent_background = true,
			custom_highlights = function(colors)
				return {
					CursorLine = { bg = colors.surface0 },
				}
			end,
		},
	},

	-- #########################################
	-- Make it default in LazyVim
	-- #########################################
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "catppuccin",
		},
	},
}
