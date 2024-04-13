-- Need the Wezterm API to set the default cursor shape
local wezterm = require("wezterm")
local mux = wezterm.mux
-- Config object
local config = wezterm.config_builder()

-- Change config below

-- Font

config.font = wezterm.font_with_fallback({
	"Monaspace Neon",
	--"Cascadia Code PL",
	--"JetBrains Mono",
	"Symbols Nerd Font Mono",
})

config.font_size = 12
config.line_height = 1.2

-- Color Scheme (auto light/dark)

--local function scheme_for_appearance(appearance)
--	if appearance:find("Dark") then
--		return "Dracula"
--	else
--		return "Catppuccin Latte"
--	end
--end

-- config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())
config.color_scheme = "Dracula"
config.colors = { background = "#1e1e2e" }

config.window_padding = {
	left = 12,
	right = 12,
	top = 12,
	bottom = 4,
}

-- Hide tab bar
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"

-- Cursor blinks too slow for me
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.cursor_blink_rate = 600

wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

return config
