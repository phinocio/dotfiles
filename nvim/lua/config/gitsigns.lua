local gitsigns = require("gitsigns")

gitsigns.setup({
	signs = {
		add = { hl = "GitAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
		change = { hl = "GitChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
		delete = { hl = "GitDelete", text = "", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		topdelete = { hl = "GitDelete", text = "", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		changedelete = { hl = "GitChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
	},
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
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
	current_line_blame_formatter_opts = {
		relative_time = false,
	},
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000,
	preview_config = {
		-- Options passed to nvim_open_win
		border = "single",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
	yadm = {
		enable = false,
	},
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local keymap = function(mode, keys, func, opts)
			local options = { noremap = true, silent = false, buffer = bufnr }
			if opts then
				options = vim.tbl_extend("force", options, opts)
			end
			vim.keymap.set(mode, keys, func, options)
		end
		-- Navigation
		keymap("n", "]c", function()
			if vim.wo.diff then
				return "]c"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true, desc = "[Git] Next hunk" })

		keymap("n", "[c", function()
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true, desc = "[Git] Prev hunk" })

		-- Actions
		keymap("n", "<leader>hs", gs.stage_hunk, { desc = "[Git] Stage hunk" })
		keymap("n", "<leader>hr", gs.reset_hunk, { desc = "[Git] Reset hunk" })
		keymap("v", "<leader>hs", function()
			gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, { desc = "[Git] Stage hunk (visual)" })
		keymap("v", "<leader>hr", function()
			gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, { desc = "[Git] Reset hunk (visual)" })
		keymap("n", "<leader>hS", gs.stage_buffer, { desc = "[Git] Stage buffer" })
		keymap("n", "<leader>hu", gs.undo_stage_hunk, { desc = "[Git] Undo stage hunk" })
		keymap("n", "<leader>hR", gs.reset_buffer, { desc = "[Git] Reset buffer" })
		keymap("n", "<leader>hp", gs.preview_hunk, { desc = "[Git] Preview hunk" })
		keymap("n", "<leader>hb", function()
			gs.blame_line({ full = true })
		end, { desc = "[Git] Blame line" })
		keymap("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "[Git] Toggle line blame" })
		keymap("n", "<leader>hd", gs.diffthis, { desc = "[Git] Diff this" })
		keymap("n", "<leader>hD", function()
			gs.diffthis("~")
		end, { desc = "[Git] Diff this (all?)" })
		keymap("n", "<leader>td", gs.toggle_deleted, { desc = "[Git] Toggle deleted" })

		-- Text object
		keymap({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "[Git] Select hunk" })
	end,
})
