local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local mason_tool_installer = require("mason-tool-installer")

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

mason_lspconfig.setup({
	ensure_installed = {
		"gopls",
		"lua_ls",
		"tailwindcss",
	},
	automatic_installation = true,
})

mason_tool_installer.setup({
	ensure_installed = {
		"black",
		"eslint_d",
		"isort",
		"goimports",
		"prettierd",
		"pylint",
		"stylua",
	},
})
