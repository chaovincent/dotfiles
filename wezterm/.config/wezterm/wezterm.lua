local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "rose-pine"
config.font_size = 10
config.max_fps = 60
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

config.colors = {
    selection_bg = "#44415a",
    selection_fg = "none",
}

config.keys = {
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
