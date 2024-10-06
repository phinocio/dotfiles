return {

	-- #########################################
	-- Disable treesitter related plugins
	-- #########################################

	-- #########################################
	-- Change config of existing LazyVim treesitter plugins
	-- #########################################
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				"blade",
				"php_only",
			})
		end,
		config = function(_, opts)
			vim.filetype.add({
				pattern = {
					[".*%.blade%.php"] = "blade",
				},
			})

			require("nvim-treesitter.configs").setup(opts)
			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			---@diagnostic disable-next-line: inject-field
			parser_config.blade = {
				install_info = {
					url = "https://github.com/EmranMR/tree-sitter-blade",
					files = { "src/parser.c" },
					branch = "main",
				},
				filetype = "blade",
			}
		end,
	},

	-- #########################################
	-- Add new treesitter plugins
	-- #########################################
}