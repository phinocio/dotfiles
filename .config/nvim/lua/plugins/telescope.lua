return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-live-grep-args.nvim",
		"nvim-telescope/telescope-media-files.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("config.telescope")
	end,
}
