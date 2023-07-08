local status_ok_catppuccin, catppuccin = pcall(require, "catppuccin")
if not status_ok_catppuccin then
	return
end

catppuccin.setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	transparent_background = true,
	show_end_of_buffer = false, -- show the '~' characters after the end of buffers
	term_colors = false,
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

local status_ok_dracula, dracula = pcall(require, "dracula")
if not status_ok_dracula then
	return
end
dracula.setup({
	-- customize dracula color palette
	colors = {
		bg = "#282A36",
		fg = "#F8F8F2",
		selection = "#44475A",
		comment = "#6272A4",
		red = "#FF5555",
		orange = "#FFB86C",
		yellow = "#F1FA8C",
		green = "#50fa7b",
		purple = "#BD93F9",
		cyan = "#8BE9FD",
		pink = "#FF79C6",
		bright_red = "#FF6E6E",
		bright_green = "#69FF94",
		bright_yellow = "#FFFFA5",
		bright_blue = "#D6ACFF",
		bright_magenta = "#FF92DF",
		bright_cyan = "#A4FFFF",
		bright_white = "#FFFFFF",
		menu = "#21222C",
		visual = "#3E4452",
		gutter_fg = "#4B5263",
		nontext = "#3B4048",
		white = "#ABB2BF",
		black = "#191A21",
	},
	-- show the '~' characters after the end of buffers
	show_end_of_buffer = true, -- default false
	-- use transparent background
	transparent_bg = true, -- default false
	-- set custom lualine background color
	lualine_bg_color = "#44475a", -- default nil
	-- set italic comment
	italic_comment = true, -- default false
	-- overrides the default highlights with table see `:h synIDattr`
	overrides = function(colors)
		return {
			TelescopePromptTitle = { bg = colors.pink, fg = colors.fg },
			TelescopePromptPrefix = { bg = colors.bg },
			TelescopePromptNormal = { bg = colors.bg },
			TelescopePromptBorder = { bg = colors.bg, fg = colors.purple },

			TelescopeResultsTitle = { fg = colors.fg },
			TelescopeResultsNormal = { bg = colors.bg },
			TelescopeResultsBorder = { bg = colors.bg, fg = colors.purple },

			TelescopePreviewTitle = { bg = colors.green, fg = colors.fg },
			TelescopePreviewNormal = { bg = colors.bg },
			TelescopePreviewBorder = { bg = colors.bg, fg = colors.purple },

			TelescopeBorder = { default = true, fg = colors.fg, bg = colors.bg },

			-- NvimTreeIndentMarker = { fg = "#30323E" },
			IndentBlanklineChar = { fg = colors.fg },
		}
	end,
	-- You can use overrides as table like this
	-- overrides = {
	--   NonText = { fg = "white" }, -- set NonText fg to white
	--   NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
	--   Nothing = {} -- clear highlight of Nothing
	-- },
	-- Or you can also use it like a function to get color from theme
	-- overrides = function (colors)
	--   return {
	--     NonText = { fg = colors.white }, -- set NonText fg to white of theme
	--   }
	-- end,
})

function ColorMyPencils(color)
	color = color or "dracula"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
