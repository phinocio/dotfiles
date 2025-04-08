return {
	-- #########################################
	-- Disable UI related plugins
	-- #########################################
	{ "akinsho/bufferline.nvim", enabled = false },

	-- #########################################
	-- Change config of existing LazyVim plugins
	-- #########################################
	-- {
	-- 	"nvim-lualine/lualine.nvim",
	-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- 	event = "VeryLazy",
	-- 	opts = function()
	-- 		local lazy_status = require("lazy.status")
	-- 		return {
	-- 			options = {
	-- 				icons_enabled = true,
	-- 				theme = "auto",
	-- 				section_separators = "",
	-- 				component_separators = "",
	-- 				disabled_filetypes = {
	-- 					statusline = {},
	-- 					winbar = {},
	-- 				},
	-- 				ignore_focus = {},
	-- 				always_divide_middle = true,
	-- 				globalstatus = true,
	-- 				refresh = {
	-- 					statusline = 1000,
	-- 					tabline = 1000,
	-- 					winbar = 1000,
	-- 				},
	-- 			},
	-- 			sections = {
	-- 				lualine_a = { "mode" },
	-- 				lualine_b = {
	-- 					"branch",
	-- 					"diff",
	-- 					'"🖧  " .. tostring(#vim.tbl_keys(vim.lsp.buf_get_clients()))',
	-- 					{ "diagnostics", sources = { "nvim_diagnostic" } },
	-- 				},
	-- 				lualine_c = { { "filename", path = 1 } },
	-- 				lualine_x = {
	-- 					{ lazy_status.updates, cond = lazy_status.has_updates },
	-- 					"encoding",
	-- 					"fileformat",
	-- 					"filetype",
	-- 				},
	-- 				lualine_y = {
	-- 					'(vim.bo.expandtab and "␠ " or "⇥ ") .. " " .. vim.bo.shiftwidth',
	-- 				},
	-- 				lualine_z = {
	-- 					"location",
	-- 					"progress",
	-- 				},
	-- 			},
	-- 		}
	-- 	end,
	-- },
	{
		"folke/noice.nvim",
		opts = {
			presets = { command_palette = false },
		},
	},
	{
		"folke/snacks.nvim",
		opts = {
			scroll = { enabled = false },
			explorer = { enabled = false },
		},
	},

	-- #########################################
	-- Add new ui plugins
	-- #########################################
}
