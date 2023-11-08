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

-- Configure LSPs to install
mason_lspconfig.setup({
	ensure_installed = {
		"ansiblels",
		"gopls",
		"lua_ls",
		"powershell_es",
		"pyright",
		"rust_analyzer",
		"tailwindcss",
		"tsserver",
	},
	automatic_installation = true,
})

-- Configure linters and formatters to install
mason_tool_installer.setup({
	ensure_installed = {
		"ansible-lint",
		"black",
		"eslint_d",
		"gofumpt",
		"goimports",
		"isort",
		"mypy",
		"prettierd",
		"ruff",
		"stylua",
	},
})
