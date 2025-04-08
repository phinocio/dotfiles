return {

	-- #########################################
	-- Disable formatting related plugins
	-- #########################################

	-- #########################################
	-- Change config of existing LazyVim formatting plugins
	-- #########################################
	{ "stevearc/conform.nvim", opts = { formatters_by_ft = { php = { "pint" } } } },

	-- #########################################
	-- Add new formatting plugins
	-- #########################################
}
