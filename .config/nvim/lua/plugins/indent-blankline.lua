return {
	enabled = true,
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	config = function()
		require("config.indent-blankline")
	end,
}
