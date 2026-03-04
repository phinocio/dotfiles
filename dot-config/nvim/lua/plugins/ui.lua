return {
	-- #########################################
	-- Disable UI related plugins
	-- #########################################
	{ "akinsho/bufferline.nvim", enabled = false },

	-- #########################################
	-- Change config of existing LazyVim plugins
	-- #########################################
	{
		"folke/noice.nvim",
		opts = {
			presets = { command_palette = false },
		},
	},
	{
		"folke/snacks.nvim",
		opts = {
			scroll = { enabled = false },
			explorer = { enabled = false },
		},
		keys = {
			{ "<leader>fe", false },
			{ "<leader>fE", false },
			{ "<leader>E", false },
			{ "<leader>e", false },
		},
	},
}
