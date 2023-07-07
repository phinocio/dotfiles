vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move lines up and down.
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Make cursor stay in place when combining below line into current one.
vim.keymap.set("n", "J", "mzJ`z")

-- Center cursor when page up/down-ing
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Paste replace visual selection without copying it.
vim.keymap.set('v', 'p', '"_dP')
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Reselect visual after indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
