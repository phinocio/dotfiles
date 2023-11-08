local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local on_attach = function(client, bufnr)
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

	-- Client Specific keybinds
	if client.name == "powershell_es" then
		bufmap("n", "<leader>pr", ":!pwsh %<CR>", { desc = "Run current pwsh script" })
	end
	if client.name == "pylsp" then
		bufmap("n", "<leader>pr", ":!python %<CR>", { desc = "Run current file as python script" })
	end

	if client.name == "tsserver" then
		bufmap("n", "<leader>pr", ":!node %<CR>", { desc = "Run current file as node script" })
		bufmap(
			"n",
			"<leader>pi",
			"<cmd>silent !tmux neww -n npm; tmux send-keys 'npm install' Enter; tmux last-window<CR>",
			{ desc = "Install packages in background window" }
		)
	end
end
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Define signs icons
local signs = { Error = "✘", Warn = "▲", Hint = "⚑", Info = "" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- configure lua server (with special settings)
lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = { -- custom settings for lua
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

-- Jsonls should always be active
lspconfig["jsonls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
})

-- Yamlls should also always be active
lspconfig["yamlls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		redhat = { telemetry = { enabled = false } },
		yaml = {
			-- b0o/SchemaStore config for yamlls
			schemaStore = {
				-- You must disable built-in schemaStore support if you want to use
				-- this plugin and its advanced options like `ignore`.
				enable = false,
				-- Avoid TypeError: Cannot read properties of undefined (reading 'length')
				url = "",
			},
			schemas = require("schemastore").yaml.schemas(),
		},
	},
})
if vim.fn.executable("go") == 1 then
	lspconfig["gopls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			gopls = {
				gofumpt = true,
			},
		},
	})
end

if vim.fn.executable("pwsh") == 1 then
	lspconfig["powershell_es"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services/",
	})
end

if vim.fn.executable("python") == 1 then
	-- lspconfig["pyright"].setup({
	-- 	capabilities = (function()
	-- 		capabilities = vim.lsp.protocol.make_client_capabilities()
	-- 		capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
	-- 		return capabilities
	-- 	end)(),
	-- 	on_attach = on_attach,
	-- 	settings = {
	-- 		python = {
	-- 			analysis = {
	-- 				typeCheckingMode = "off",
	-- 			},
	-- 		},
	-- 	},
	-- })
	-- })
	lspconfig["jedi_language_server"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})
end

if vim.fn.executable("ansible") == 1 then
	lspconfig["ansiblels"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})
end

if vim.fn.executable("node") == 1 then
	lspconfig["tsserver"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		init_options = {
			preferences = {
				disableSuggestions = true,
			},
		},
	})
end

if vim.fn.executable("rustup") == 1 then
	lspconfig["rust_analyzer"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})
end
