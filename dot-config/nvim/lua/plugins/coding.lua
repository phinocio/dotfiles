return {
	-- #########################################
	-- Disable coding related plugins
	-- #########################################

	-- #########################################
	-- Change config of existing LazyVim coding plugins
	-- #########################################
	{
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {
			checkbox = { enabled = true },
		},
	},

	-- #########################################
	-- Add new coding plugins
	-- #########################################
	{
		"adalessa/laravel.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"tpope/vim-dotenv",
			"MunifTanjim/nui.nvim",
			"kevinhwang91/promise-async",
		},
		cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
		keys = {
			{ "<leader>ar", ":Laravel routes<cr>" },
		},
		event = { "VeryLazy" },
		opts = {
			features = {
				null_ls = {
					enable = false,
				},
				route_info = {
					enable = true, --- to enable the laravel.nvim virtual text
					position = "right", --- where to show the info (available options 'right', 'top')
					middlewares = true, --- wheather to show the middlewares section in the info
					method = true, --- wheather to show the method section in the info
					uri = true, --- wheather to show the uri section in the info
				},
			},
		},
		config = true,
	},
}
