local on_attach = function(_, bufnr)
	map = function(mode, keys, func, opts)
		local options = { buffer = bufnr, remap = false }
		if opts then
			options = vim.tbl_extend("force", options, opts)
		end
		vim.keymap.set(mode, keys, func, options)
	end
	local bufmap = map

	bufmap("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
	bufmap("n", "K", vim.lsp.buf.hover, { desc = "Hover definition" })
	bufmap(
		"n",
		"<leader>vds",
		require("telescope.builtin").lsp_document_symbols,
		{ desc = "List symbols in current document" }
	)
	bufmap(
		"n",
		"<leader>vws",
		require("telescope.builtin").lsp_dynamic_workspace_symbols,
		{ desc = "List symbols in current workspace" }
	)
	bufmap("n", "<leader>vd", vim.diagnostic.open_float, { desc = "Open floating diagnostic" })
	bufmap("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next warn/error" })
	bufmap("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to prev warn/error" })
	bufmap("n", "<leader>vca", vim.lsp.buf.code_action, { desc = "Select code aciton at cursor" })
	bufmap("n", "<leader>vrr", require("telescope.builtin").lsp_references, { desc = "Show references" })
	bufmap("n", "<leader>vrn", vim.lsp.buf.rename, { desc = "Rename in project" })
	bufmap("i", "<C-h>", vim.lsp.buf.signature_help, { desc = "Signature help" })
	bufmap("n", "<leader>lf", vim.lsp.buf.format, { desc = "LSP format code" })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

-- MASON CONFIG --
require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls" },
})

require("mason-lspconfig").setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end,

	["lua_ls"] = function()
		require("neodev").setup()
		require("lspconfig").lua_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				Lua = {
					workspace = { checkThirdParty = false },
					telemetry = { enable = false },
				},
			},
		})
	end,
})

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = false,
})

local sign = function(opts)
	vim.fn.sign_define(opts.name, {
		texthl = opts.name,
		text = opts.text,
		numhl = "",
	})
end

sign({ name = "DiagnosticSignError", text = "✘" })
sign({ name = "DiagnosticSignWarn", text = "▲" })
sign({ name = "DiagnosticSignHint", text = "⚑" })
sign({ name = "DiagnosticSignInfo", text = "" })

-- FKSDLFJKDSLFKDSLKFLSDFKDSLFKSDL

-- local lspconfig = require("lspconfig")
-- local lsp_defaults = lspconfig.util.default_config

-- lsp_defaults.capabilities =
-- 	vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	desc = "LSP actions",
-- 	callback = function(event)
-- 		map = function(mode, keys, func, opts)
-- 			local options = { buffer = bufnr, remap = false }
-- 			if opts then
-- 				options = vim.tbl_extend("force", options, opts)
-- 			end
-- 			vim.keymap.set(mode, keys, func, options)
-- 		end
-- 		local bufmap = map

-- 		bufmap("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
-- 		bufmap("n", "K", vim.lsp.buf.hover, { desc = "Hover definition" })
-- 		bufmap("n", "<leader>vws", vim.lsp.buf.workspace_symbol, { desc = "List symbols in current workspace" })
-- 		bufmap("n", "<leader>vd", vim.diagnostic.open_float, { desc = "Open floating diagnostic" })
-- 		bufmap("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next warn/error" })
-- 		bufmap("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to prev warn/error" })
-- 		bufmap("n", "<leader>vca", vim.lsp.buf.code_action, { desc = "Select code aciton at cursor" })
-- 		bufmap("n", "<leader>vrr", vim.lsp.buf.references, { desc = "Show references" })
-- 		bufmap("n", "<leader>vrn", vim.lsp.buf.rename, { desc = "Rename in project" })
-- 		bufmap("i", "<C-h>", vim.lsp.buf.signature_help, { desc = "Signature help" })
-- 		bufmap("n", "<leader>lf", vim.lsp.buf.format, { desc = "LSP format code" })
-- 	end,
-- })

-- local default_setup = function(server)
-- 	lspconfig[server].setup({})
-- end

-- require("mason").setup({})
-- require("mason-lspconfig").setup({
-- 	ensure_installed = { "lua_ls" },
-- 	handlers = {
-- 		default_setup,
-- 		lua_ls = function()
-- 			require("lspconfig").lua_ls.setup({
-- 				on_attach = on_attach,
-- 				capabilities = capabilities,
-- 				settings = {
-- 					Lua = {
-- 						workspace = { checkThirdParty = false },
-- 						telemetry = { enable = false },
-- 					},
-- 				},
-- 			})
-- 		end,
-- 	},
-- })

-- local cmp = require("cmp")

-- cmp.setup({
-- 	sources = {
-- 		{ name = "nvim_lsp" },
-- 	},
-- 	mapping = cmp.mapping.preset.insert({
-- 		-- Enter key confirms completion item
-- 		["<CR>"] = cmp.mapping.confirm({ select = false }),

-- 		-- Ctrl + space triggers completion menu
-- 		["<C-Space>"] = cmp.mapping.complete(),
-- 	}),
-- 	snippet = {
-- 		expand = function(args)
-- 			require("luasnip").lsp_expand(args.body)
-- 		end,
-- 	},
-- })
