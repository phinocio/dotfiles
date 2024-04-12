return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	opts = {
		-- add any options here
	},
	keys = {
		{ "<leader>nd", "<cmd>NoiceDismiss<CR>", desc = "Dismiss noice message" },
	},
}
