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
			servers = {
				intelephense = {
					init_options = {
						licenceKey = vim.fn.trim(
							table.concat(vim.fn.readfile(vim.fn.expand("~/.config/intelephense/license.txt")), "\n")
						),
					},
				},
			},
		},
	},
	{
		"mason-org/mason.nvim",
		opts = {
			ensure_installed = {
				"phpstan",
			},
		},
	},
	-- #########################################
	-- Add new LSP plugins
	-- #########################################
}
