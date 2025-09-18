-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- LazyVim Options
vim.g.snacks_animate = false
vim.g.lazyvim_php_lsp = "intelephense"
vim.g.lazyvim_prettier_needs_config = true

vim.opt.list = false
vim.opt.mouse = "n"
vim.opt.scrolloff = 999
vim.diagnostic.config({
	float = {
		border = "rounded",
		focusable = true,
	},
})
