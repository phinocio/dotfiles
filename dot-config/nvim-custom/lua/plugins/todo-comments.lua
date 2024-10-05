return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	opts = {
		keywords = {
			FIX = {
				icon = " ", -- icon used for the sign, and in search results
				color = "error", -- can be a hex color, or a named color (see below)
				alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
				-- signs = false, -- configure signs for some keywords individually
			},
			TODO = { icon = " ", color = "info" },
			HACK = { icon = " ", color = "warning" },
			WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
			PERF = { icon = "󰅒 ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
			NOTE = { icon = "󰍨 ", color = "hint", alt = { "INFO" } },
			TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
		},
	},
	keys = {
		{ "<leader>xt", "<cmd>TodoTelescope keywords=TODO<CR>", desc = "[Todo] Show todos" },
		{ "<leader>xa", ":TodoTelescope<CR>", desc = "[Todo] Show all todo comments" },
		{ "<leader>xf", ":TodoTelescope keywords=FIX<CR>", desc = "[Todo] Show all fix comments" },
	},
}
