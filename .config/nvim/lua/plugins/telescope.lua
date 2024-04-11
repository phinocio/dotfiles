return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
	},

	opts = {
		defaults = {
			path_display = { "truncate" },
			prompt_prefix = "   ",
			selection_caret = " ",
			mappings = {
				i = {
					["<C-n>"] = "cycle_history_next",
					["<C-p>"] = "cycle_history_prev",
					["<C-j>"] = "move_selection_next",
					["<C-k>"] = "move_selection_previous",
					["<C-u>"] = "preview_scrolling_up",
					["<C-d>"] = "preview_scrolling_down",
				},
				n = {
					["j"] = "move_selection_next",
					["k>"] = "move_selection_previous",
					["<C-u>"] = "preview_scrolling_up",
					["<C-d>"] = "preview_scrolling_down",
				},
			},
		},
		pickers = {
			buffers = {
				mappings = {
					i = {
						["<C-d>"] = "delete_buffer",
					},
					n = {
						["<C-d>"] = "delete_buffer",
					},
				},
			},
		},
	},

	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "[Tele] Find files" },
		{ "<leader>fF", "<cmd>Telescope find_files no_ignore=true<cr>", desc = "[Tele] Find all files" },
		{ "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "[Tele] Git files" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "[Tele] Find buffer" },
	},
}
