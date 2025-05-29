-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux-sessionizer<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- disable leader e because for some fucking stupid reason I can't just disable the lazyvim snacks explorer bullshit
vim.keymap.set("", "<leader>e", "<Nop>", { noremap = true, silent = true })
