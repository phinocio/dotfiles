-- List of options: https://neovim.io/doc/user/quickref.html#option-list

-- vim.g.netrw_liststyle = 3
vim.g.netrw_bufsettings = "nu rnu"

-- Tabs related stuff
vim.opt.autoindent = true
vim.opt.expandtab = false -- Tabs > spaces (also plugin changes based on editorconfig)
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

vim.opt.autoread = true -- Read file when changed outside vim
vim.opt.backspace = "indent,eol,start"
vim.opt.backup = true -- Keep backup file after overwriting
vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.completeopt = "menuone,longest,preview" -- See https://neovim.io/doc/user/options.html#'completeopt'
vim.opt.confirm = true -- Ask for confirmation instead of erroring on ex: :q
vim.opt.hlsearch = true -- Following cursor is easy enough
vim.opt.ignorecase = true -- Ignore case in searches
vim.opt.incsearch = true -- Incremental highlight when searching
vim.opt.number = true
vim.opt.mouse = "n" -- Disable mouse
vim.opt.relativenumber = true
vim.opt.scrolloff = 16
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes:2"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.undodir = os.getenv("HOME") .. "/.cache/nvim/undodir"
vim.opt.undofile = true
vim.opt.updatetime = 50
vim.opt.wrap = false

vim.opt.backupdir:remove(".") -- makes sure backups aren"t in the current directory
vim.opt.fillchars:append({ eob = " " })
