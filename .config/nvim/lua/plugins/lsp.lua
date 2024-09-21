return {
	-- #########################################
	-- Disable colorscheme related plugins
	-- #########################################

	-- #########################################
	-- Chane config of existing LazyVim LSP plugins
	-- #########################################
	{
		"neovim/nvim-lspconfig",
		opts = {
			document_highlight = {
				enabled = false,
			},
		},
	},

	-- #########################################
	-- Add new LSP plugins
	-- #########################################
}
