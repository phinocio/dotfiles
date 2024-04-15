vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open netrw" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear highlight" })

-- Quickly change buffers
vim.keymap.set("n", "[b", "<cmd>bprev<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "]b", "<cmd>bnext<CR>", { desc = "Next buffer" })

-- Make cursor stay in place when combining below line into current one.
vim.keymap.set("n", "J", "mzJ`z", { desc = "" })

-- http://ddrscott.github.io/blog/2016/yank-without-jank/
-- Maintain the cursor position when yanking a visual selection.
vim.keymap.set("v", "y", "myy`y", { desc = "Yank - keep cursor pos" })

-- Visual paste without replacing register
-- Another option is to do pgvy which pastes, redoes the last selection, then yanks the
-- just pasted text.
vim.keymap.set("v", "p", '"_dp') -- paste after cursor
vim.keymap.set("v", "P", '"_dP') -- paste before cursor

-- OR

-- vim.keymap.set("v", "p", "pgvy") -- paste after cursor
-- vim.keymap.set("v", "P", "Pgvy") -- paste before cursor

-- d for delete, if I want it in register, use x for cut
vim.keymap.set({ "n", "v" }, "d", '"_d')

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
vim.keymap.set("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
vim.keymap.set("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- Splits and tabs
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Git related keymaps
vim.keymap.set("n", "<leader>lg", "<cmd>silent !tmux neww lazygit<CR>", { desc = "Open lazygit in a new tmux window" })
vim.keymap.set("n", "<leader>cg", "<cmd>!gh gist create %<CR>", { desc = "Create gist of current file" })
vim.keymap.set("v", "<leader>cg", "<cmd>'<,'>w !gh gist create -<CR>", { desc = "Create gist of current selection" })
