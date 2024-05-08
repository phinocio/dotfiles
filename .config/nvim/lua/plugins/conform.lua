return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			css = { "prettierd" },
			go = { "gofumpt", "goimports-reviser", "golines" },
			html = { "prettierd" },
			javascript = { "prettierd" },
			json = { "prettierd" },
			lua = { "stylua" },
			markdown = { "prettierd" },
			svelte = { "prettierd" },
			typescript = { "prettierd" },
			yaml = { "prettierd" },
		},
		format_on_save = {
			lsp_fallback = true,
			async = false,
			timeout_ms = 500,
		},
	},
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			desc = "Code format",
		},
	},
}
