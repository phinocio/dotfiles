return {

	-- #########################################
	-- Disable linting related plugins
	-- #########################################

	-- #########################################
	-- Change config of existing LazyVim linting plugins
	-- #########################################
	{
		"mfussenegger/nvim-lint",
		opts = {
			linters_by_ft = {
				php = { "phpstan" },
			},
		},
	},

	-- #########################################
	-- Add new linting plugins
	-- #########################################
}
