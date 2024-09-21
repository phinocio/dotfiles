return {

	-- #########################################
	-- Disable test related plugins
	-- #########################################

	-- #########################################
	-- Change config of existing LazyVim test plugins
	-- #########################################
	{
		"nvim-neotest/neotest",
		opts = { adapters = { "neotest-phpunit" } },
	},

	-- #########################################
	-- Add new test plugins
	-- #########################################
	{ "nvim-neotest/neotest-phpunit" },
}
