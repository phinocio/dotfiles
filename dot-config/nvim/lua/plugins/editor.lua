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
		opts = { preset = { "classic" }, delay = 750 },
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
			{ "<leader>ee", "<cmd>Oil<CR>", desc = "Open Oil" },
			{ "<leader>ev", "<cmd>vsplit | Oil<CR>", desc = "Open Oil in vertical split" },
			{ "<leader>es", "<cmd>split | Oil<CR>", desc = "Open Oil in horizontal split" },
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
	{ "https://gitlab.com/HiPhish/rainbow-delimiters.nvim" },
}
