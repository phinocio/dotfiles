return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"bash",
				"html",
				"javascript",
				"jsdoc",
				"json",
				"jsonc",
				"lua",
				"luadoc",
				"luap",
				"markdown",
				"markdown_inline",
				"query",
				"regex",
				"svelte",
				"toml",
				"typescript",
				"vim",
				"vimdoc",
			},
			auto_install = true,
			indent = { enable = true },
			highlight = { enable = true, additional_vim_regex_highlighting = false },
		})
	end,
}
