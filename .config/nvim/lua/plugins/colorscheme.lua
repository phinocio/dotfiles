return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		custom_highlights = function(colors)
			return {
				LineNrAbove = { fg = colors.surface2 },
				LineNr = { fg = colors.lavender },
				LineNrBelow = { fg = colors.surface2 },
			}
		end,
		integrations = {
			cmp = true,
			native_lsp = {
				underlines = {
					errors = { "undercurl" },
					hints = { "undercurl" },
					warnings = { "undercurl" },
					information = { "undercurl" },
				},
			},
		},
	},
}
