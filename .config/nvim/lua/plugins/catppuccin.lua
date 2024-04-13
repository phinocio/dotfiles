return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		transparent_background = false,
		custom_highlights = function(colors)
			return {
				LineNrAbove = { fg = colors.surface2 },
				LineNr = { fg = colors.lavender },
				LineNrBelow = { fg = colors.surface2 },
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
					errors = { "underline" },
					hints = { "underline" },
					warnings = { "underline" },
					information = { "underline" },
				},
				inlay_hints = {
					background = true,
				},
			},
		},
	},
}
