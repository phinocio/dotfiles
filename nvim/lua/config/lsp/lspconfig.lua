local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local on_attach = function(_, bufnr)
	local map = function(mode, keys, func, opts)
		local options = { buffer = bufnr, noremap = false, silent = true }
		if opts then
			options = vim.tbl_extend("force", options, opts)
		end
		vim.keymap.set(mode, keys, func, options)
	end
	local bufmap = map

	bufmap("n", "gR", "<cmd>Telescope lsp_references<CR>", { desc = "Show references" })
	bufmap("n", "gD", vim.lsp.buf.declaration, { desc = "Show declaration" })
	bufmap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Show definition" })
	bufmap("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { desc = "Show implementations" })
	bufmap("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "Show type definitions" })
	bufmap("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Select code action at cursor" })
	bufmap("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename in project" })
	bufmap("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = "Show buffer diagnostics" })
	bufmap("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostics" })
	bufmap("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to prev warn/error" })
	bufmap("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next warn/error" })
	bufmap("n", "K", vim.lsp.buf.hover, { desc = "Hover definition" })
	bufmap("n", "<leader>lf", vim.lsp.buf.format, { desc = "LSP format code" })
	bufmap("n", "<leader>rs", "<cmd>LspRestart<CR>", { desc = "Restart LSP" })
end
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Define signs icons
local signs = { Error = "✘", Warn = "▲", Hint = "⚑", Info = "" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- -- configure lua server (with special settings)
-- lspconfig["lua_ls"].setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- 	settings = { -- custom settings for lua
-- 		Lua = {
-- 			-- make the language server recognize "vim" global
-- 			diagnostics = {
-- 				globals = { "vim" },
-- 			},
-- 			workspace = {
-- 				-- make language server aware of runtime files
-- 				library = {
-- 					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
-- 					[vim.fn.stdpath("config") .. "/lua"] = true,
-- 				},
-- 				checkThirdParty = false,
-- 			},
-- 			telemetry = {
-- 				enable = false,
-- 			},
-- 		},
-- 	},
-- })

local default_setup = function(server)
	lspconfig[server].setup({})
end
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls" },
	handlers = {
		default_setup,
		lua_ls = function()
			require("lspconfig").lua_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					Lua = {
						-- make the language server recognize "vim" global
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							-- make language server aware of runtime files
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
							checkThirdParty = false,
						},
						telemetry = {
							enable = false,
						},
					},
				},
			})
		end,
	},
})

-- bufmap(
-- 	"n",
-- 	"<leader>vds",
-- 	require("telescope.builtin").lsp_document_symbols,
-- 	{ desc = "List symbols in current document" }
-- )
-- bufmap(
-- 	"n",
-- 	"<leader>vws",
-- 	require("telescope.builtin").lsp_dynamic_workspace_symbols,
-- 	{ desc = "List symbols in current workspace" }
-- )
-- bufmap("n", "<leader>vd", vim.diagnostic.open_float, { desc = "Open floating diagnostic" })
-- bufmap("n", "<leader>vrr", require("telescope.builtin").lsp_references, { desc = "Show references" })
-- bufmap("i", "<C-h>", vim.lsp.buf.signature_help, { desc = "Signature help" })
