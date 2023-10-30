local highlight = {
	"RainbowRed",
	"RainbowYellow",
	"RainbowBlue",
	"RainbowOrange",
	"RainbowGreen",
	"RainbowViolet",
	"RainbowCyan",
}

local hooks = require("ibl.hooks")
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#555555" })
	vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#555555" })
	vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#555555" })
	vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#555555" })
	vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#555555" })
	vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#555555" })
	vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#555555" })
end)

require("ibl").setup({ indent = { highlight = highlight, tab_char = "│" }, scope = { show_start = false } })
