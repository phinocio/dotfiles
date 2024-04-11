return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	dependencies = {
		{ "b0o/schemastore.nvim" },
		{ "williamboman/mason.nvim", config = true, build = ":MasonUpdate" },
		{
			"williamboman/mason-lspconfig.nvim",
			opts = {
				ensure_installed = {
					"jsonls",
					"lua_ls",
					"svelte",
					"tailwindcss",
					"tsserver", -- Also handles JavaScript
				},
			},
		},
	},
	config = function()
		local signs = { Error = "✘", Warn = "▲", Hint = "⚑", Info = "" }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end
		local lspconfig = require("lspconfig")
		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					telemetry = { enable = false },
					format = { enable = false }, -- Use stylua instead
				},
			},
		})
		lspconfig.svelte.setup({})
		lspconfig.jsonls.setup({
			settings = {
				json = {
					schemas = require("schemastore").json.schemas(),
					validate = { enable = true },
				},
			},
		})
		lspconfig.tsserver.setup({})
	end,
	keys = {
		{ "K", vim.lsp.buf.hover, desc = "Hover definition" },
		{ "gd", vim.lsp.buf.definition, desc = "Go to definition" },
		{ "<leader>ca", vim.lsp.buf.code_action, desc = "Code action" },
	},
}
