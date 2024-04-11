return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			config = function()
				require("telescope").load_extension("fzf")
			end,
		},
	},
	verison = false,
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
		{ "<leader>pf", "<cmd>Telescope git_files<CR>", desc = "[Tele] Find git files" },
		{ "<leader>pF", "<cmd>Telescope find_files no_ignore=true<CR>", desc = "[Tele] Find all files" },
		{ "<leader>pg", "<cmd>Telescope live_grep<CR>", desc = "[Tele] Grep files" },
		{ "<leader>pb", "<cmd>Telescope buffers<CR>", desc = "[Tele] Find buffer" },
		{ "<leader>ph", "<cmd>Telescope help_tags<CR>", desc = "[Tele] Search help" },
		{
			"<leader>pws",
			function()
				local word = vim.fn.expand("<cword>")
				require("telescope.builtin").grep_string({ search = word })
			end,
			desc = "Search project for word under cursor",
		},
		{
			"<leader>pWs",
			function()
				local word = vim.fn.expand("<cWORD>")
				require("telescope.builtin").grep_string({ search = word })
			end,
			desc = "Search project for word under cursor (space delim)",
		},
	},
}
