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
			setup = {
				intelephense = function(_, opts)
					require("lspconfig").intelephense.setup({
						server = opts,
						init_options = { licenceKey = os.getenv("HOME") .. "/.config/intelephense/license.txt" },
					})
					return true
				end,
			},
		},
	},

	-- #########################################
	-- Add new LSP plugins
	-- #########################################
}
