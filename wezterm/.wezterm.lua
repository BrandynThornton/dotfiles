local wezterm = require("wezterm")

local config = wezterm.config_builder()

local is_windows = wezterm.target_triple == 'x86_64-pc-windows-msvc'
local is_macos = wezterm.target_triple:lower():find("darwin") ~= nil

local function file_exists(path)
	local f = io.open(path, "r")
	if f~=nil then io.close(f) return true else return false end
end

--defaults
config.audible_bell = "Disabled"
config.check_for_updates = false
config.term = 'wezterm'

-- ui
config.color_scheme = "rose-pine-moon"
config.max_fps = 120
config.font = wezterm.font("Hack Nerd Font", { weight = "Regular" })
config.font_size = 16.0

config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
config.window_frame = {
	font = wezterm.font("Hack Nerd Font", { weight = "Bold" }),
}

config.inactive_pane_hsb = {
	saturation = 0.0,
	brightness = 0.5,
}

if is_windows then
	config.win32_system_backdrop = "Acrylic"
	config.window_background_opacity = 0.7
	config.window_frame.font_size = 10.0
    config.default_prog = { 'pwsh.exe' }
    config.default_domain = 'local'
end

if is_macos then
	config.window_background_opacity = 0.8
	config.macos_window_background_blur = 50
	config.font_size = 15.0
	config.window_frame.font_size = 19.0
end

--keys
wezterm.on('update-right-status', function(window, pane)
	local leader = ''
	if window:leader_is_active() then
		leader = 'LEADER'
	end
	window:set_right_status(leader)
end)

config.disable_default_key_bindings = true
config.leader = { key = "Space", mods = "CTRL" }
config.colors = { compose_cursor = 'orange' }
config.keys = {
        { key = "-", mods = "LEADER",       action=wezterm.action{SplitVertical={domain=CurrentPaneDomain}}},
        { key = "\\",mods = "LEADER",       action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
        { key = "z", mods = "LEADER",       action=wezterm.action.TogglePaneZoomState},
        { key = "c", mods = "LEADER",       action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
        { key = "h", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Left"}},
        { key = "j", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Down"}},
        { key = "k", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Up"}},
        { key = "l", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Right"}},
        { key = "H", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Left", 5}}},
        { key = "J", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Down", 5}}},
        { key = "K", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Up", 5}}},
        { key = "L", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Right", 5}}},
        { key = "1", mods = "LEADER",       action=wezterm.action{ActivateTab=0}},
        { key = "2", mods = "LEADER",       action=wezterm.action{ActivateTab=1}},
        { key = "3", mods = "LEADER",       action=wezterm.action{ActivateTab=2}},
        { key = "4", mods = "LEADER",       action=wezterm.action{ActivateTab=3}},
        { key = "5", mods = "LEADER",       action=wezterm.action{ActivateTab=4}},
        { key = "6", mods = "LEADER",       action=wezterm.action{ActivateTab=5}},
        { key = "7", mods = "LEADER",       action=wezterm.action{ActivateTab=6}},
        { key = "8", mods = "LEADER",       action=wezterm.action{ActivateTab=7}},
        { key = "9", mods = "LEADER",       action=wezterm.action{ActivateTab=8}},
        { key = "&", mods = "LEADER|SHIFT", action=wezterm.action{CloseCurrentTab={confirm=true}}},
        { key = "x", mods = "LEADER",       action=wezterm.action{CloseCurrentPane={confirm=true}}},
        { key = "N", mods = "SHIFT|CTRL",   action=wezterm.action.ToggleFullScreen},
        { key = "V", mods = "SHIFT|CTRL",   action=wezterm.action.PasteFrom 'Clipboard'},
        { key = "C", mods = "SHIFT|CTRL",   action=wezterm.action.CopyTo 'Clipboard'},
        { key = "+", mods = "SHIFT|CTRL",   action=wezterm.action.IncreaseFontSize},
        { key = "_", mods = "SHIFT|CTRL",   action=wezterm.action.DecreaseFontSize},
        { key = ")", mods = "SHIFT|CTRL",   action=wezterm.action.ResetFontSize},
}

return config
