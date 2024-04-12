return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	keys = {
		{ "<leader>tt", "<cmd>TroubleToggle<CR>", desc = "[Trouble] Toggle trouble" },
		{
			"[t",
			function()
				require("trouble").next({ skip_groups = true, jump = true })
			end,
			desc = "[Trouble] Next",
		},
		{
			"]t",
			function()
				require("trouble").previous({ skip_groups = true, jump = true })
			end,
			desc = "[Trouble] Prev",
		},
	},
}
