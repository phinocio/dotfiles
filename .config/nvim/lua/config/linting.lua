local lint = require("lint")

lint.linters_by_ft = {
	-- typescript = { "eslint_d" },
	-- javascript = { "eslint_d" },
	-- javascriptreact = { "eslint_d" },
	-- typescriptreact = { "eslint_d" },
	-- svelte = { "eslint_d" },
	python = { "mypy", "ruff" },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	callback = function()
		lint.try_lint()
	end,
})

local map = function(mode, keys, func, opts)
	local options = { noremap = true, silent = false }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, keys, func, options)
end
local keymap = map

keymap("n", "<leader>ln", function()
	lint.try_lint()
end, { desc = "[Lint] Lint current file" })
