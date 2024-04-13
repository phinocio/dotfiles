-- Need the Wezterm API to set the default cursor shape
local wezterm = require("wezterm")
local mux = wezterm.mux
-- Config object
local config = wezterm.config_builder()

config.term = "wezterm"

-- Font
config.font = wezterm.font_with_fallback({
	{
		family = "JetBrains Mono",
		harfbuzz_features = { "calt", "zero", "cv12" },
	},
	{
		family = "Cascadia Code",
	},
	"Hack",
	{
		family = "Monaspace Radon",
		harfbuzz_features = { "ss01", "ss02", "ss03", "ss04", "ss05", "ss06", "ss07", "ss08", "calt", "dlig" },
	},
	"Symbols Nerd Font Mono",
})
config.font_size = 12
config.line_height = 1.2

config.color_scheme = "Dracula"
config.colors = { background = "#1e1e2e" }
--config.window_background_opacity = 0.95

config.underline_position = -2
config.max_fps = 144

-- Hide tab bar
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = true
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

local tmux_keys = { { key = "m", mods = "CTRL", action = wezterm.action.SpawnTab("DefaultDomain") } }

wezterm.on("user-var-changed", function(window, pane)
	-- If we are *not* in tmux, set wezterm related multiplexer hotkeys
	if pane:get_user_vars().WEZTERM_IN_TMUX == "0" then
		window:set_config_overrides({
			leader = { key = "Space", mods = "CTRL" },
			keys = {
				{ key = "m", mods = "LEADER", action = wezterm.action.SpawnTab("DefaultDomain") },
			},
		})

	-- If we *are* in tmux, remove those keys (or reset default ones), to prevent conflicts
	else
		window:set_config_overrides({
			keys = tmux_keys,
		})
	end
end)

--config.default_prog = { "tmux" }
return config
