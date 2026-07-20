local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Appearance & Font
config.color_scheme = "rose-pine"
config.font_size = 10.0
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

-- Sizing & Performance
config.use_resize_increments = true
config.adjust_window_size_when_changing_font_size = false
config.term = "xterm-256color"
config.front_end = "WebGpu"
config.max_fps = 120
config.scrollback_lines = 10000
config.audible_bell = "Disabled"
config.enable_scroll_bar = false

-- UI & Layout
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.default_cursor_style = "SteadyBlock"
config.inactive_pane_hsb = { saturation = 0.50, brightness = 0.50 }

-- Keymaps
config.keys = {
    -- QuickSelect Overlay
    { key = "Space", mods = "CTRL|SHIFT", action = wezterm.action.QuickSelect },

    -- Rename Tab
    {
        key = "E",
        mods = "CTRL|SHIFT",
        action = wezterm.action.PromptInputLine({
            description = "Enter new name for tab",
            action = wezterm.action_callback(function(window, pane, line)
                if line then
                    window:active_tab():set_title(line)
                end
            end),
        }),
    },
}

return config
