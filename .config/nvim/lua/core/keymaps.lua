-- Adapted from https://github.com/LunarVim/Neovim-from-scratch

-- local {desc=""} = { noremap = true, silent = false }

-- local term_{desc=""} = { silent = true }

-- Shorten function name
local keymap = function(mode, keys, func, opts)
	local options = { noremap = true, silent = false }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, keys, func, options)
end
-- local keymap = vim.api.nvim_set_keymap

-- Space as leader
keymap("", "<Space>", "<Nop>", { desc = "Space leader" })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- ########## Normal ##########

-- Open netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open netrw" })

-- Make cursor stay in place when combining below line into current one.
keymap("n", "J", "mzJ`z", { desc = "" })

-- Better window navigation
-- keymap("n", "<C-h>", "<C-w>h", { desc = "" })
-- keymap("n", "<C-j>", "<C-w>j", { desc = "" })
-- keymap("n", "<C-k>", "<C-w>k", { desc = "" })
-- keymap("n", "<C-l>", "<C-w>l", { desc = "" })

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", { desc = "Resize h +2" })
keymap("n", "<C-Down>", ":resize -2<CR>", { desc = "Resize h -2" })
keymap("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Resize v -2" })
keymap("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Resize v +2" })

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
keymap("n", "<S-h>", ":bprevious<CR>", { desc = "Prev buffer" })
keymap("n", "<leader>bd", ":bdelete<CR> :bprevious<CR>", { desc = "Del buffer and goto prev" })

-- Center cursor when page up/down-ing
keymap("n", "<C-d>", "<C-d>zz", { desc = "Page down and center" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "Page up and center" })
keymap("n", "n", "nzzzv", { desc = "Next result and center" })
keymap("n", "N", "Nzzzv", { desc = "Prev result and center" })

-- Q is cursed apparently
keymap("n", "Q", "<nop>", { desc = "ban Q" })

-- Make current file executable
keymap("n", "<leader>mx", ":!chmod +x %<CR>", { desc = "Make current file executable" })

-- Use tmux-sessionizer to navigate elsewhere
keymap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "Open tmux sessionizer" })

-- Source current file
keymap("n", "<leader><leader>", "<cmd>so %<CR>", { desc = "Source current file" })

-- Git related keymaps
keymap("n", "<leader>lg", "<cmd>silent !tmux neww lazygit<CR>", { desc = "Open lazygit in a new tmux window" })
-- ########## Insert ##########

-- Move text up and down
keymap("i", "<a-j>", "<esc>:move .+1<cr>==gi", { desc = "move line down (visual)" })
keymap("i", "<a-k>", "<esc>:move .-2<cr>==gi", { desc = "move line up (visual)" })

-- Easy insertion of a trailing ; or , from insert mode.
-- keymap("i", ";;", "<Esc>A;")
-- keymap("i", ",,", "<Esc>A,")

-- ########## Visual ##########

-- Reselect visual after indenting
keymap("v", "<", "<gv", { desc = "Untab selection" })
keymap("v", ">", ">gv", { desc = "Tab selection" })

-- Move text up and down
-- Move lines up and down.
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line up" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected line down" })

-- Paste replace visual selection without copying it. Also yeets register because reasons.
keymap("v", "p", '"_dp', { desc = "Paste without copy" })

-- Maintain the cursor position when yanking a visual selection.
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
keymap("v", "y", "myy`y", { desc = "Yank - keep cusor pos" })

-- DONT KILL MY CLIPBOARD DAMNIT
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- ########## Visual Block ##########

-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", { desc = "Move selection up" })
keymap("x", "K", ":move '<-2<CR>gv-gv", { desc = "Move selection down" })
keymap("x", "<leader>p", [["_dP]], { desc = "Delete selection" })

-- DONT KILL MY CLIPBOARD DAMNIT
-- keymap("x", "d", '"_d', { desc = "Delete and preserve clipboard" })

-- ########## Terminal ##########

-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", { noremap = false, silent = true, desc = "[Term] Move left" })
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", { noremap = false, silent = true, desc = "[Term] Move right" })
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", { noremap = false, silent = true, desc = "[Term] Move up" })
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", { noremap = false, silent = true, desc = "[Term] Move down" })
