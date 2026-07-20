local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}

-- -----------------------------------------------------------------------------
-- Rosé Pine Palette
-- -----------------------------------------------------------------------------
local base    = "#191724"
local surface = "#26233a"
local overlay = "#31748f"
local text    = "#e0def4"
local subtle  = "#908caa"
local rose    = "#ebbcba"
local love    = "#eb6f92"

-- -----------------------------------------------------------------------------
-- Fonts & General Aesthetics
-- -----------------------------------------------------------------------------
theme.font = "JetBrainsMono Nerd Font 9"

theme.bg_normal = base
theme.bg_focus = surface
theme.bg_urgent = love
theme.bg_minimize = surface
theme.bg_systray = theme.bg_normal

theme.fg_normal = subtle
theme.fg_focus = text
theme.fg_urgent = text
theme.fg_minimize = subtle

theme.useless_gap = dpi(0)
theme.border_width = dpi(3)
theme.border_focus = rose
theme.border_normal = surface
theme.border_marked = overlay

-- -----------------------------------------------------------------------------
-- Taglist & Tasklist (Top Bar Colors)
-- -----------------------------------------------------------------------------
theme.taglist_bg_focus = surface
theme.taglist_fg_focus = rose
theme.taglist_bg_occupied = base
theme.taglist_fg_occupied = text
theme.taglist_bg_empty = base
theme.taglist_fg_empty = subtle

theme.tasklist_bg_focus = surface
theme.tasklist_fg_focus = text
theme.tasklist_bg_normal = base
theme.tasklist_fg_normal = subtle

-- -----------------------------------------------------------------------------
-- Menu & Layout Icons
-- -----------------------------------------------------------------------------
theme.menu_height = dpi(16)
theme.menu_width = dpi(110)

theme.awesome_icon = themes_path .. "default/titlebar/close_focus.png"
theme.layout_fairh = themes_path .. "default/layouts/fairhw.png"
theme.layout_fairv = themes_path .. "default/layouts/fairvw.png"
theme.layout_floating = themes_path .. "default/layouts/floatingw.png"

return theme
