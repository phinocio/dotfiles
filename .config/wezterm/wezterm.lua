-- Need the Wezterm API to set the default cursor shape
local wezterm = require("wezterm")
local mux = wezterm.mux
-- Config object
local config = wezterm.config_builder()

-- Font
config.font = wezterm.font_with_fallback({
	{
		family = "Monaspace Radon",
		weight = "Medium",
		harfbuzz_features = { "ss01", "ss02", "ss03", "ss04", "ss05", "ss06", "ss07", "ss08", "calt", "dlig" },
	},
	"Hack",
	"Cascadia Code",
	"JetBrains Mono",
	"Symbols Nerd Font Mono",
})
config.font_size = 12
config.line_height = 1.2

config.color_scheme = "Dracula"
config.colors = { background = "#1e1e2e" }
--config.window_background_opacity = 0.95

config.window_padding = {
	left = 12,
	right = 12,
	top = 12,
	bottom = 4,
}

config.underline_position = -2

-- Hide tab bar
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"

-- Cursor blinks too slow for me
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.cursor_blink_rate = 600

wezterm.on("gui-startup", function()
	---@diagnostic disable-next-line: unused-local
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

return config
