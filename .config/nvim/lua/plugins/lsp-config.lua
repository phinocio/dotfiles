return {
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { { "williamboman/mason.nvim", config = true, build = ":MasonUpdate" } },
		event = "VeryLazy",
		opts = {
			ensure_installed = {
				"ansiblels",
				"astro",
				"eslint",
				"gopls",
				"jsonls",
				"lua_ls",
				"svelte",
				"tailwindcss",
				"tsserver", -- Also handles JavaScript
				"volar",
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"ansible-lint",
				"delve",
				"gofumpt",
				"goimports-reviser",
				"golines",
				"prettierd",
				"stylua",
			},
		},
	},
	{
		"mfussenegger/nvim-dap",
		keys = {
			{ "<leader>db", "<cmd>DapToggleBreakpoint<CR>", "Add breakpoint at line" },
			{
				"<leader>dus",
				function()
					local widgets = require("dap.ui.widgets")
					local sidebar = widgets.sidebar(widgets.scopes)
					sidebar.open()
				end,
				"Open debugging sidebar",
			},
		},
	},
	{
		"leoluz/nvim-dap-go",
		config = true,
		ft = "go",
		keys = {
			{
				"<leader>dgt",
				function()
					require("dap-go").debug_test()
				end,
				"Debug go test",
			},
			{
				"<leader>dgl",
				function()
					require("dap-go").debug_last()
				end,
				"Debug last go test",
			},
		},
	},
	{
		"olexsmir/gopher.nvim",
		ft = "go",
		keys = {
			{ "<leader>gsj", "<cmd>GoTagAdd json<CR>", "Add json struct tags" },
			{ "<leader>gsy", "<cmd>GoTagAdd yaml<CR>", "Add yaml struct tags" },
		},
		build = function()
			vim.cmd([[silent! GoInstallDeps]])
		end,
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

			local vue_typescript_plugin = require("mason-registry")
				.get_package("vue-language-server")
				:get_install_path() .. "/node_modules/@vue/language-server" .. "/node_modules/@vue/typescript-plugin"
			lspconfig.tsserver.setup({
				init_options = {
					plugins = {
						{
							name = "@vue/typescript-plugin",
							location = vue_typescript_plugin,
							languages = { "javascript", "typescript", "vue" },
						},
					},
				},
				filetypes = {
					"javascript",
					"javascriptreact",
					"javascript.jsx",
					"typescript",
					"typescriptreact",
					"typescript.tsx",
					"vue",
				},
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
			lspconfig.marksman.setup({ capabilities = capabilities })
			lspconfig.gopls.setup({
				capabilities = capabilities,
				settings = {
					gopls = { completeUnimported = true, analyses = { unusedParam = true } },
				},
			})
			local tslib = require("mason-registry").get_package("typescript-language-server"):get_install_path()
				.. "/node_modules/typescript/lib"
			lspconfig.volar.setup({
				init_options = {
					typescript = {
						tsdk = tslib,
					},
				},
			})
			lspconfig.ansiblels.setup({ capabilities = capabilities })
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
			-- { "<leader>dD", vim.diagnostic.open_float, desc = "Open floating diagnostics" },
			{ "<leader>rs", "<cmd>LspRestart<CR>", desc = "Restart LSP" },
		},
	},
}
