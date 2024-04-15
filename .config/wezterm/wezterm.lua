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
-- config.window_background_opacity = 0.95

config.underline_position = -2
config.max_fps = 144
config.audible_bell = "Disabled"

-- Hide tab bar
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = true
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 14,
	right = 14,
	top = 14,
	bottom = 14,
}

-- Cursor blinks too slow for me
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.cursor_blink_rate = 600

config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.7,
}

wezterm.on("gui-startup", function()
	---@diagnostic disable-next-line: unused-local
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

local tmux_keys = { { key = "m", mods = "CTRL", action = wezterm.action.SpawnTab("CurrentPaneDomain") } }
local wez_keys = {
	{ key = "a", mods = "LEADER|CTRL", action = wezterm.action({ SendString = "\x01" }) },
	{ key = "-", mods = "LEADER", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
	{ key = "\\", mods = "LEADER", action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
	{ key = "s", mods = "LEADER", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
	{ key = "v", mods = "LEADER", action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
	{ key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
	{ key = "c", mods = "LEADER", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
	{ key = "h", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
	{ key = "j", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
	{ key = "k", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
	{ key = "l", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
	{ key = "H", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Left", 5 } }) },
	{ key = "J", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Down", 5 } }) },
	{ key = "K", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Up", 5 } }) },
	{ key = "L", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Right", 5 } }) },
	{ key = "1", mods = "LEADER", action = wezterm.action({ ActivateTab = 0 }) },
	{ key = "2", mods = "LEADER", action = wezterm.action({ ActivateTab = 1 }) },
	{ key = "3", mods = "LEADER", action = wezterm.action({ ActivateTab = 2 }) },
	{ key = "4", mods = "LEADER", action = wezterm.action({ ActivateTab = 3 }) },
	{ key = "5", mods = "LEADER", action = wezterm.action({ ActivateTab = 4 }) },
	{ key = "6", mods = "LEADER", action = wezterm.action({ ActivateTab = 5 }) },
	{ key = "7", mods = "LEADER", action = wezterm.action({ ActivateTab = 6 }) },
	{ key = "8", mods = "LEADER", action = wezterm.action({ ActivateTab = 7 }) },
	{ key = "9", mods = "LEADER", action = wezterm.action({ ActivateTab = 8 }) },
	{ key = "&", mods = "LEADER|SHIFT", action = wezterm.action({ CloseCurrentTab = { confirm = true } }) },
	{ key = "d", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
	{ key = "x", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
}

wezterm.on("user-var-changed", function(window, pane)
	-- If we are *not* in tmux, set wezterm related multiplexer hotkeys
	if pane:get_user_vars().WEZTERM_IN_TMUX == "0" then
		window:set_config_overrides({
			leader = { key = "Space", mods = "CTRL" },
			keys = wez_keys,
		})

	-- If we *are* in tmux, remove those keys (or reset default ones), to prevent conflicts
	else
		window:set_config_overrides({
			keys = tmux_keys,
		})
	end
end)

config.front_end = "OpenGL" -- Laptop was having some issues with WebGPU

-- config.default_prog = { "tmux" }
return config
