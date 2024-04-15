return {
	enabled = false,
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
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
		{ "<leader>pv", "<cmd>Oil<CR>", desc = "Open oil file explorer" },
	},
}
