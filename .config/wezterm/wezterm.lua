-- Need the Wezterm API to set the default cursor shape
local wezterm = require("wezterm")
local mux = wezterm.mux
-- Config object
local config = wezterm.config_builder()

-- Change config below

-- Font

config.font = wezterm.font_with_fallback({
	"Monaspace Neon",
	-- "Cascadia Code PL",
	"JetBrains Mono",
	"Symbols Nerd Font Mono",
})

config.font_size = 13
config.line_height = 1.2

-- Color Scheme (auto light/dark)

-- local function scheme_for_appearance(appearance)
-- 	if appearance:find("Dark") then
-- 		return "Dracula"
-- 	else
-- 		return "Catppuccin Latte"
-- 	end
-- end

-- config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())
config.color_scheme = "Dracula"

-- Hide tab bar

config.hide_tab_bar_if_only_one_tab = true

wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)
return config
