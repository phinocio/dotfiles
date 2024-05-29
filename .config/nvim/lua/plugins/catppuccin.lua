return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	opts = {
		transparent_background = false,
		custom_highlights = function(colors)
			return {
				LineNrAbove = { fg = colors.overlay1 },
				LineNr = { fg = colors.lavender },
				LineNrBelow = { fg = colors.overlay1 },
			}
		end,
		integrations = {
			cmp = true,
			gitsigns = true,
			lsp_trouble = true,
			noice = true,
			notify = true,
			telescope = { enabled = true },
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
				inlay_hints = {
					background = true,
				},
			},
		},
	},
}
