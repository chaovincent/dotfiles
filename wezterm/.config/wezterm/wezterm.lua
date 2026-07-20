local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- -----------------------------------------------------------------------------
-- Stability Fixes
-- -----------------------------------------------------------------------------

-- Force WezTerm to snap window resizing to exact terminal character cells.
config.use_resize_increments = true

-- Stop WezTerm from trying to adjust window dimensions when font scales change
config.adjust_window_size_when_changing_font_size = false

-- Ensure standard terminal capabilities so tmux handles repaints cleanly
config.term = "xterm-256color"

-- -----------------------------------------------------------------------------
-- Appearance & Styling
-- -----------------------------------------------------------------------------
config.color_scheme = "rose-pine"

-- Font Configuration
config.font_size = 10.0

-- Window Padding
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

-- Let AwesomeWM handle borders and titlebars entirely
config.window_decorations = "RESIZE"

-- Hide WezTerm's tab bar when only 1 tab is open
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

-- -----------------------------------------------------------------------------
-- Performance & Keybindings
-- -----------------------------------------------------------------------------
config.front_end = "WebGpu"
config.max_fps = 60
config.enable_scroll_bar = false

-- Copy/Paste shortcuts
config.keys = {
    { key = "V", mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom("Clipboard") },
    { key = "C", mods = "CTRL|SHIFT", action = wezterm.action.CopyTo("Clipboard") },
}

return config
