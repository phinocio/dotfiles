-- Adapted from https://github.com/LunarVim/Neovim-from-scratch

-- Set in nvim-tree config
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

local options = {
	-- autochdir = true,
	backup = true, -- creates a backup file
	clipboard = "unnamedplus", -- use system clipboard
	-- colorcolumn = "120",
	completeopt = "menuone,longest,preview",
	confirm = true, -- ask for confirmation instead of erroring
	-- cursorline = true,
	expandtab = false, -- tabs > spaces
	hlsearch = false,
	ignorecase = true,
	list = true, -- enable the below listchars
	listchars = { tab = "▸ ", trail = "·", nbsp = "·", eol = "↴" },
	mouse = "a", -- enable mouse for all modes
	number = true,
	relativenumber = true,
	scrolloff = 16,
	shiftwidth = 4,
	sidescrolloff = 8,
	signcolumn = "yes:2",
	smartcase = true,
	smartindent = true,
	smarttab = true,
	softtabstop = 4,
	spell = false,
	splitbelow = true,
	splitright = true,
	swapfile = false,
	tabstop = 4,
	termguicolors = true,
	timeoutlen = 750,
	title = true,
	undodir = os.getenv("HOME") .. "/.cache/nvim/undodir",
	undofile = true, -- persistent undo
	updatetime = 50,
	wildmode = "longest:full,full", -- complete the longest common match, and allow tabbing the results to fully complete them
	wrap = false,
}

vim.opt.backupdir:remove(".") -- makes sure backups aren"t in the current directory
vim.opt.fillchars:append({ eob = " " }) -- remove the ~ from end of buffer
vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])

----------------------
---- AUTOCOMMANDS ----
----------------------

-- Define autocommands with Lua APIs
local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Enable spell checker for certain file types
autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.txt", "*.md", "*.tex" },
	command = "set spell",
})

-- Set conceal for markdown
autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.md" },
	command = "set conceallevel=2",
})

-- Highlight on yank
augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
	group = "YankHighlight",
	callback = function()
		vim.highlight.on_yank({ higroup = "CursorLine", timeout = "500" })
	end,
})
