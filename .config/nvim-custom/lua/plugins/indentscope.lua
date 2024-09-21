return {
	"echasnovski/mini.indentscope",
	version = false, -- Latest main "*" for stable
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	opts = {
		symbol = "│",
		options = { try_as_border = true },
		draw = {
			animation = function()
				return 0
			end,
		},
	},
	init = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"help",
				"Trouble",
				"trouble",
				"lazy",
				"mason",
			},
			callback = function()
				vim.b.miniindentscope_disable = true
			end,
		})
	end,
}
