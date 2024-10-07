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
	{
		"m4xshen/hardtime.nvim",
		event = "VeryLazy",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
		opts = {
			disable_mouse = false,
			max_count = 6,
			allow_different_key = true,
			disabled_filetypes = { "qf", "netrw", "NvimTree", "lazy", "mason", "oil", "dbui" },
		},
	},
	{ "https://gitlab.com/HiPhish/rainbow-delimiters.nvim" },
}
