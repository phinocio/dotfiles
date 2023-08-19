-- Adapted from https://github.com/LunarVim/Neovim-from-scratch

local opts = { noremap = true, silent = false }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Space as leader
keymap("", "<Space>", "<Nop>", opts)
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
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, opts)

-- Make cursor stay in place when combining below line into current one.
keymap("n", "J", "mzJ`z", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Center cursor when page up/down-ing
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Q is cursed apparently
keymap("n", "Q", "<nop>", opts)

-- DONT KILL MY CLIPBOARD DAMNIT
keymap("n", "d", '"_d', opts);
keymap("n", "dd", '"_dd', opts);

-- Use LSP to format files
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, opts)

-- ########## Insert ##########

-- Move text up and down
keymap("i", "<A-j>", "<Esc>:move .+1<CR>==gi", opts)
keymap("i", "<A-k>", "<Esc>:move .-2<CR>==gi", opts)

-- Easy insertion of a trailing ; or , from insert mode.
-- keymap('i', ';;', '<Esc>A;')
-- keymap('i', ',,', '<Esc>A,')

-- ########## Visual ##########

-- Reselect visual after indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
-- Move lines up and down.
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Paste replace visual selection without copying it. Also yeets register because reasons.
keymap("v", "p", '"_dP', opts)

-- Maintain the cursor position when yanking a visual selection.
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
keymap("v", "y", "myy`y", opts)

-- DONT KILL MY CLIPBOARD DAMNIT
keymap("v", "d", '"_d', opts);

-- ########## Visual Block ##########

-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<leader>p", [["_dP]], opts)

-- DONT KILL MY CLIPBOARD DAMNIT
keymap("x", "d", '"_d', opts);

-- ########## Terminal ##########

-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
-- keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
-- keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)

keymap("n", "<leader>ff", [[<cmd>lua require('telescope.builtin').find_files()<CR>]], opts)
keymap(
	"n",
	"<leader>fF",
	[[<cmd>lua require('telescope.builtin').find_files({ no_ignore = true, prompt_title = 'All Files' })<CR>]],
	opts
)
keymap("n", "<leader>fb", [[<cmd>lua require('telescope.builtin').buffers()<CR>]], opts)
keymap("n", "<leader>fg", [[<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>]], opts)
keymap("n", "<leader>fh", [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], opts)
keymap("n", "<leader>fs", [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- folke/todo-comments
keymap("n", "<leader>ft", "<cmd>TodoTelescope<cr>", opts);
keymap("n", "<leader>tr", "<cmd>TroubleToggle<cr>", opts);

keymap("n", "<leader>ct", "<cmd>ColorizerToggle<cr>", opts);

-- Python
keymap('n', '<leader>pr', ":w <bar> exec '!python3 '.shellescape('%')<CR>", opts);
