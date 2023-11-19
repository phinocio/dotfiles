return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	-- dependencies = {
	-- 	"JoosepAlviste/nvim-ts-context-commentstring",
	-- },
	config = function()
		-- require("config.comment")
		require("Comment").setup({})
	end,
}
