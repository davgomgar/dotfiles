-- Pull in the wezterm API
local wezterm = require("wezterm")

local h = require("utils/helpers")
local b = require("utils/background")
local w = require("utils/wallpaper")
local a = require("utils/appearance")
local k = require("utils/keys")

local dark_opacity = 0.7
local light_opacity = 0.8

local wallpapers_glob = os.getenv("HOME") .. "/Pictures/Wallpapers/1108171.png"

-- This will hold the configuration.
local config = wezterm.config_builder()

config.background = {
	w.get_wallpaper(wallpapers_glob),
	b.get_background(dark_opacity, light_opacity),
}

config.set_environment_variables = {
	--BAT_THEME = h.is_dark() and "tokyonight_storm" or "tokyonight_day",
	BAT_THEME = "Catppuccin Mocha",
}

local function resize_pane(key, direction)
	return {
		key = key,
		action = wezterm.action.AdjustPaneSize({ direction, 3 }),
	}
end

config.key_tables = {
	resize_panes = {
		resize_pane("j", "Down"),
		resize_pane("k", "Up"),
		resize_pane("h", "Left"),
		resize_pane("l", "Right"),
	},
}

-- This Will configure fonts
config.font =
	wezterm.font_with_fallback({ "RecMonoLinear Nerd Font Mono", "Cascadia Code", "Victor Mono", "MesloLGS NF" })
config.font_size = 16

-- Configuration for window and decorations
config.enable_tab_bar = false

config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"

config.color_scheme = "Catppuccin Mocha (Gogh)"
-- config.color_scheme = a.scheme_for_appearance(wezterm.gui.get_appearance())

-- Load the keybindings from keys.lua --
k.make_config(config)

-- and finally, return the configuration to wezterm
return config
