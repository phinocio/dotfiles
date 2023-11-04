require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	transparent_background = true,
	show_end_of_buffer = false, -- show the '~' characters after the end of buffers
	term_colors = true,
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15,
	},
	no_italic = false, -- Force no italic
	no_bold = false, -- Force no bold
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = { "italic" },
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	color_overrides = {},
	custom_highlights = function(colors)
		return {
			TelescopePromptTitle = { bg = colors.pink, fg = colors.mantle },
			TelescopePromptPrefix = { bg = colors.surface0 },
			TelescopePromptNormal = { bg = colors.surface0 },
			TelescopePromptBorder = { bg = colors.mantle, fg = colors.mantle },

			TelescopeResultsTitle = { fg = colors.mantle },
			TelescopeResultsNormal = { bg = colors.mantle },
			TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },

			TelescopePreviewTitle = { bg = colors.green, fg = colors.mantle },
			TelescopePreviewNormal = { bg = colors.mantle },
			TelescopePreviewBorder = { bg = colors.mantle, fg = colors.mantle },

			TelescopeBorder = { default = true, fg = "#ffffff", bg = "#FFFFFF" },

			NvimTreeIndentMarker = { fg = "#30323E" },
			IndentBlanklineChar = { fg = "#30323E" },
			LineNrAbove = { fg = colors.surface2 },
			LineNr = { fg = colors.lavender },
			LineNrBelow = { fg = colors.surface2 },
		}
	end,
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		telescope = true,
		notify = false,
		mini = false,
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "undercurl" },
				hints = { "undercurl" },
				warnings = { "undercurl" },
				information = { "undercurl" },
			},
		},
	},
})

-- setup must be called before loading
-- vim.cmd.colorscheme("catppuccin")

-- Make the cursor line background invisible
vim.api.nvim_set_hl(0, "CursorLineBg", {
	fg = vim.api.nvim_get_hl_by_name("CursorLine", true).background,
	bg = vim.api.nvim_get_hl_by_name("CursorLine", true).background,
})

-- vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { fg = '#30323E' })

vim.api.nvim_set_hl(0, "StatusLineNonText", {
	fg = vim.api.nvim_get_hl_by_name("NonText", true).foreground,
	bg = vim.api.nvim_get_hl_by_name("StatusLine", true).foreground,
})

-- vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = '#30323E' })
-- slightly brighter background to make the float pop more
-- vim.api.nvim_set_hl(0, "FloatBorder", {bg="#3B4252", fg="#5E81AC"})
-- vim.api.nvim_set_hl(0, "NormalFloat", {bg="#3B4252"})
-- vim.api.nvim_set_hl(0, "TelescopeNormal", {bg="#3B4252"})
-- vim.api.nvim_set_hl(0, "TelescopeBorder", {bg="#3B4252"})
