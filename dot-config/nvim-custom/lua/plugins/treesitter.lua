return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	config = function()
		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

		parser_config.blade = {
			install_info = {
				url = "https://github.com/EmranMR/tree-sitter-blade",
				files = { "src/parser.c" },
				branch = "main",
			},
			filetype = "blade",
		}

		vim.filetype.add({
			pattern = {
				[".*%.blade%.php"] = "blade",
			},
		})

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
				"php",
				"php_only",
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
