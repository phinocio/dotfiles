return {
	-- #########################################
	-- Disable editor related plugins
	-- #########################################
	{ "nvim-neo-tree/neo-tree.nvim", enabled = false },

	-- #########################################
	-- Change config of existing LazyVim editor plugins
	-- #########################################
	{
		"folke/which-key.nvim",
		opts = { delay = 750 },
	},
	{
		"nvim-telescope/telescope.nvim",
		opts = {
			defaults = {
				mappings = {
					i = {
						["<C-j>"] = "move_selection_next",
						["<C-k>"] = "move_selection_previous",
					},
				},
			},
		},
	},

	-- #########################################
	-- Add new editor plugins
	-- #########################################
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
		opts = {
			delete_to_trash = true,
			columns = {
				"icon",
				-- "permissions",
				-- "size",
				-- "mtime",
			},
			default_file_explorer = true,
			view_options = {
				show_hidden = true,
			},
		},
		keys = {
			{ "<leader>e", "<cmd>Oil<CR>", desc = "Open oil file explorer" },
		},
	},
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<C-h>", "<cmd><C-U>TmuxNavigateLeft<CR>" },
			{ "<C-j>", "<cmd><C-U>TmuxNavigateDown<CR>" },
			{ "<C-k>", "<cmd><C-U>TmuxNavigateUp<CR>" },
			{ "<C-l>", "<cmd><C-U>TmuxNavigateRight<CR>" },
			{ "<C-\\>", "<cmd><C-U>TmuxNavigatePrevious<CR>" },
		},
	},
}
