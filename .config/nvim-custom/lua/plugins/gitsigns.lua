return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	opts = {
		signs = {
			add = { text = "▎" },
			change = { text = "▎" },
			delete = { text = "" },
			topdelete = { text = "" },
			changedelete = { text = "▎" },
		},
		signcolumn = true,
		numhl = false,
		watch_gitdir = {
			interval = 1000,
			follow_files = true,
		},
		attach_to_untracked = true,
		current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
			delay = 1000,
			ignore_whitespace = false,
		},
		current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
	},
	keys = {
		{
			"]c",
			function()
				if vim.wo.diff then
					return "]c"
				end
				vim.schedule(function()
					package.loaded.gitsigns.next_hunk()
				end)
				return "<Ignore>"
			end,
			expr = true,
			desc = "[Git] Next hunk",
		},
		{
			"[c",
			function()
				if vim.wo.diff then
					return "[c"
				end
				vim.schedule(function()
					package.loaded.gitsigns.prev_hunk()
				end)
				return "<Ignore>"
			end,
			expr = true,
			desc = "[Git] Prev hunk",
		},
		{
			"<leader>hp",
			function()
				package.loaded.gitsigns.preview_hunk()
			end,
			desc = "[Git] Preview hunk",
		},
		{
			"<leader>hb",
			function()
				package.loaded.gitsigns.blame_line({ full = true })
			end,
			desc = "[Git] Blame line",
		},
		{
			"<leader>td",
			function()
				package.loaded.gitsigns.toggle_deleted()
			end,
			desc = "[Git] Toggle deleted",
		},
	},
}
