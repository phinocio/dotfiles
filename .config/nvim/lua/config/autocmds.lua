-- Define autocommands with Lua APIs
local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Enable spell checker for certain file types
autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.txt", "*.md", "*.tex" },
	command = "setlocal spell",
})

-- Set conceal for markdown
-- autocmd({ "BufRead", "BufNewFile" }, {
-- 	pattern = { "*.md" },
-- 	command = "set conceallevel=2",
-- })

-- If try to reload buffers on events
-- From: https://stackoverflow.com/a/74230727
autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
	command = "if mode() != 'c' | checktime | endif",
	pattern = { "*" },
})
--
-- autocmd({ "FileChangedShellPost" }, {
-- 	command = "echohl WarningMsg | echo 'File changed on disk. Buffer reloaded.' | echohl None",
-- })
-- autocmd FileChangedShellPost *
--         \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

-- Highlight on yank
augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = "YankHighlight",
	callback = function()
		vim.highlight.on_yank()
	end,
})
