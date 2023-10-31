local lualine = require("lualine")
local lazy_status = require("lazy.status")

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			"branch",
			"diff",
			'"🖧  " .. tostring(#vim.tbl_keys(vim.lsp.buf_get_clients()))',
			{ "diagnostics", sources = { "nvim_diagnostic" } },
		},
		lualine_c = { "filename" },
		lualine_x = {
			{ lazy_status.updates, cond = lazy_status.has_updates },
			{ "encoding", "fileformat", "filetype" },
		},
		lualine_y = {
			'(vim.bo.expandtab and "␠ " or "⇥ ") .. " " .. vim.bo.shiftwidth',
		},
		lualine_z = {
			"location",
			"progress",
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = { "nvim-tree" },
})
