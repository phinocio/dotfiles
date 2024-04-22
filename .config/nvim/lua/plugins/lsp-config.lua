return {
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { { "williamboman/mason.nvim", config = true, build = ":MasonUpdate" } },
		event = "VeryLazy",
		opts = {
			ensure_installed = {
				"astro",
				"jsonls",
				"lua_ls",
				"svelte",
				"tailwindcss",
				"tsserver", -- Also handles JavaScript
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		dependencies = {
			{ "b0o/schemastore.nvim" },
		},
		config = function()
			local lspconfig = require("lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			local signs = { Error = "✘", Warn = "▲", Hint = "⚑", Info = "" }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				cmp_nvim_lsp.default_capabilities()
			)

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
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
			lspconfig.svelte.setup({ capabilities = capabilities })
			lspconfig.jsonls.setup({
				capabilities = capabilities,
				settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
						validate = { enable = true },
					},
				},
			})
			lspconfig.tailwindcss.setup({ capabilities = capabilities })
			lspconfig.tsserver.setup({
				on_attach = function(client, bufnr)
					vim.keymap.set(
						"n",
						"<leader>co",
						"<cmd>lua vim.lsp.buf.code_action({ apply = true, context = { only = { 'source.organizeImports.ts' }, diagnostics = {}, }, })<CR>",
						{ buffer = bufnr, desc = "[TS] Organize Imports" }
					)
				end,
				capabilities = capabilities,
			})
			lspconfig.astro.setup({ capabilities = capabilities })
			lspconfig.mdx_analyzer.setup({ capabilities = capabilities })
		end,
		keys = {
			{ "gR", "<cmd>Telescope lsp_references<CR>", desc = "Show references" },
			{ "gD", vim.lsp.buf.declaration, desc = "Show declaration" },
			{ "gd", "<cmd>Telescope lsp_definitions<CR>", desc = "Show definition" },
			{ "gi", "<cmd>Telescope lsp_implementations<CR>", desc = "Show implementations" },
			{ "gt", "<cmd>Telescope lsp_type_definitions<CR>", desc = "Show type definitions" },
			{ "<leader>ca", vim.lsp.buf.code_action, desc = "Select code action at cursor" },
			{ "<leader>rn", vim.lsp.buf.rename, desc = "Rename in project" },
			{ "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", desc = "Show buffer diagnostics" },
			{ "<leader>d", vim.diagnostic.open_float, desc = "Open floating diagnostics" },
			{ "[d", vim.diagnostic.goto_prev, desc = "Go to prev warn/error" },
			{ "]d", vim.diagnostic.goto_next, desc = "Go to next warn/error" },
			{ "K", vim.lsp.buf.hover, desc = "Hover definition" },
			{ "<leader>rs", "<cmd>LspRestart<CR>", desc = "Restart LSP" },
		},
	},
}
