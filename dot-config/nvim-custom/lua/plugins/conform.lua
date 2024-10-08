return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		-- log_level = vim.log.levels.DEBUG,
		formatters_by_ft = {
			css = { "prettierd" },
			go = { "gofumpt", "goimports-reviser", "golines" },
			html = { "prettierd" },
			javascript = { "prettierd" },
			json = { "prettierd" },
			lua = { "stylua" },
			markdown = { "prettierd" },
			php = { "pint" },
			svelte = { "prettierd" },
			typescript = { "prettierd" },
			vue = { "prettierd" },
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
