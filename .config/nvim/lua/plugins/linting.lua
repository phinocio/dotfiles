return {

	-- #########################################
	-- Disable linting related plugins
	-- #########################################

	-- #########################################
	-- Change config of existing LazyVim linting plugins
	-- #########################################
	{
		"mfussenegger/nvim-lint",
		optional = true,
		opts = {
			linters_by_ft = {
				php = {},
			},
		},
	},

	-- #########################################
	-- Add new linting plugins
	-- #########################################
}
