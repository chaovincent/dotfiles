local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'rose-pine'
config.font_size = 12

config.colors = {
    selection_bg = '#44415a',
    selection_fg = 'none',
}

config.keys = {
  {
    key = 'E',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.PromptInputLine {
      description = 'Enter new name for tab',
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          window:active_tab():set_title(line)
        end
      end),
    },
  },
}


return config
