return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		{ "rcarriga/nvim-notify", opts = { top_down = false } },
	},
	opts = {
		cmdline = {
			format = {
				cmdline = { pattern = "^:", icon = "⮞", lang = "vim" },
			},
		},
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
	},
	keys = {
		{ "<leader>nd", "<cmd>NoiceDismiss<CR>", desc = "Dismiss noice message" },
	},
}
