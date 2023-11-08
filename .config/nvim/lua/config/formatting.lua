local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		css = { "prettierd" },
		go = { "gofumpt", "goimports" },
		html = { "prettierd" },
		javascript = { "prettierd" },
		javascriptreact = { "prettierd" },
		json = { "prettierd" },
		lua = { "stylua" },
		markdown = { "prettierd" },
		python = { "isort", "black" },
		svelte = { "prettierd" },
		typescript = { "prettierd" },
		typescriptreact = { "prettierd" },
		yaml = { "prettierd" },
	},

	format_on_save = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	},
})

local map = function(mode, keys, func, opts)
	local options = { noremap = true, silent = false }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, keys, func, options)
end
local keymap = map

keymap({ "n", "v" }, "<leader>fm", function()
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	})
end, { desc = "[Fmt] Format file or selection (in visual)" })
