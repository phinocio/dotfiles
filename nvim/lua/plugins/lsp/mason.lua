return {
	"williamboman/mason.nvim",
	dependencies = { "williamboman/mason-lspconfig.nvim" },
	config = function()
		require("config.lsp.mason")
	end,
}
