-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux-sessionizer<CR>")

-- Visual paste without replacing register
-- Another option is to do pgvy which pastes, redoes the last selection, then yanks the
-- just pasted text.
vim.keymap.set("v", "p", '"_dp') -- paste after cursor
vim.keymap.set("v", "P", '"_dP') -- paste before cursor

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
