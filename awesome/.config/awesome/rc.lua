-- -----------------------------------------------------------------------------
-- 1. Libraries & Error Handling
-- -----------------------------------------------------------------------------
pcall(require, "luarocks.loader")

local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")

-- Startup error handling
if awesome.startup_errors then
    naughty.notify({
        preset = naughty.config.presets.critical,
        title = "Oops, there were errors during startup!",
        text = awesome.startup_errors,
    })
end

-- Runtime error handling
do
    local in_error = false
    awesome.connect_signal("debug::error", function(err)
        if in_error then return end
        in_error = true
        naughty.notify({
            preset = naughty.config.presets.critical,
            title = "Oops, an error happened!",
            text = tostring(err),
        })
        in_error = false
    end)
end

-- -----------------------------------------------------------------------------
-- 2. Variables & Theme
-- -----------------------------------------------------------------------------
beautiful.init(os.getenv("HOME") .. "/.config/awesome/theme.lua")

terminal = "wezterm"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor
modkey = "Mod4"

-- Active Tiling Layouts
awful.layout.layouts = {
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.fair.vertical,
}

-- -----------------------------------------------------------------------------
-- 3. Menus & Launcher
-- -----------------------------------------------------------------------------
myawesomemenu = {
    { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
    { "manual", terminal .. " -e man awesome" },
    { "edit config", editor_cmd .. " " .. awesome.conffile },
    { "restart", awesome.restart },
    { "quit", function() awesome.quit() end },
}

mymainmenu = awful.menu({
    items = {
        { "awesome", myawesomemenu, beautiful.awesome_icon },
        { "open terminal", terminal },
    },
})

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })

-- -----------------------------------------------------------------------------
-- 4. Wibar & Widgets
-- -----------------------------------------------------------------------------
mytextclock = wibox.widget.textclock(" %a %b %d, %I:%M %p ")

local taglist_buttons = gears.table.join(
    awful.button({}, 1, function(t) t:view_only() end),
    awful.button({ modkey }, 1, function(t)
        if client.focus then client.focus:move_to_tag(t) end
    end),
    awful.button({}, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, function(t)
        if client.focus then client.focus:toggle_tag(t) end
    end)
)

local tasklist_buttons = gears.table.join(
    awful.button({}, 1, function(c)
        if c == client.focus then
            c.minimized = true
        else
            c:emit_signal("request::activate", "tasklist", { raise = true })
        end
    end)
)

-- System Monitor Widgets

-- 1. CPU % Widget (Refreshes every 3s)
local cpu_widget = awful.widget.watch(
    [[bash -c "top -bn1 | grep 'Cpu(s)' | awk '{print 100 - $8}'"]],
    3,
    function(widget, stdout)
        local val = tonumber(stdout:match("[%d%.]+")) or 0
        widget:set_markup(string.format(" <span foreground='#ebbcba'>CPU</span> %3d%% ", math.floor(val)))
    end
)

-- 2. RAM % Widget (Refreshes every 5s)
local ram_widget = awful.widget.watch(
    [[bash -c "free -m | awk '/Mem:/ {print $3/$2*100}'"]],
    5,
    function(widget, stdout)
        local val = tonumber(stdout:match("[%d%.]+")) or 0
        widget:set_markup(string.format(" <span foreground='#9ccfd8'>RAM</span> %3d%% ", math.floor(val)))
    end
)

-- 3. DISK % Widget (Refreshes every 30s)
local disk_widget = awful.widget.watch(
    [[bash -c "df -h / | awk 'NR==2 {print $5}'"]],
    30,
    function(widget, stdout)
        local val = tonumber(stdout:match("%d+")) or 0
        widget:set_markup(string.format(" <span foreground='#f6c177'>DISK</span> %3d%% ", val))
    end
)

-- 4. GPU & VRAM % Widget (Nvidia - Refreshes every 5s)
local gpu_widget = awful.widget.watch(
    [[bash -c "nvidia-smi --query-gpu=utilization.gpu,memory.used,memory.total --format=csv,noheader,nounits 2>/dev/null || echo 'N/A'"]],
    5,
    function(widget, stdout)
        local out = stdout:gsub("\n", "")
        if out == "N/A" or out == "" then
            widget:set_text("")
        else
            local gpu_util, mem_used, mem_total = out:match("(%d+),%s*(%d+),%s*(%d+)")
            if gpu_util and mem_used and mem_total then
                local g_val = tonumber(gpu_util) or 0
                local vram_pct = math.floor((tonumber(mem_used) / tonumber(mem_total)) * 100)
                widget:set_markup(string.format(" <span foreground='#c4a7e7'>GPU</span> %3d%% <span foreground='#c4a7e7'>VRAM</span> %3d%% ", g_val, vram_pct))
            end
        end
    end
)

awful.screen.connect_for_each_screen(function(s)
    -- Tags / Workspaces
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

    s.mypromptbox = awful.widget.prompt()
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
        awful.button({}, 1, function() awful.layout.inc(1) end),
        awful.button({}, 3, function() awful.layout.inc(-1) end)
    ))

    s.mytaglist = awful.widget.taglist({
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = taglist_buttons,
    })

    s.mytasklist = awful.widget.tasklist({
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons,
    })

    -- Create Top Bar
    s.mywibox = awful.wibar({ position = "top", screen = s, height = 24 })
    s.mywibox:setup({
        layout = wibox.layout.align.horizontal,
        { -- Left Widgets
            layout = wibox.layout.fixed.horizontal,
            mylauncher,
            s.mytaglist,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle Widget
        { -- Right Widgets
            layout = wibox.layout.fixed.horizontal,
            -- Inserted System Monitors:
            cpu_widget,
            ram_widget,
            gpu_widget,
            disk_widget,
            -- Standard Status Items:
            wibox.widget.systray(),
            mytextclock,
            s.mylayoutbox,
        },
    })
end)

-- -----------------------------------------------------------------------------
-- 5. Keybindings
-- -----------------------------------------------------------------------------
globalkeys = gears.table.join(
    -- Applications & System
    awful.key({ modkey }, "Return", function() awful.spawn(terminal) end, { description = "open terminal", group = "launcher" }),
    awful.key({ modkey }, "d", function() awful.spawn("rofi -show drun") end, { description = "rofi launcher", group = "launcher" }),
    awful.key({ modkey }, "b", function() awful.spawn("xdg-open https://") end, { description = "open browser", group = "launcher" }),
    awful.key({ modkey }, "Escape", function() awful.spawn("i3lock -c 191724") end, { description = "lock screen", group = "session" }),
    awful.key({ modkey }, "s", hotkeys_popup.show_help, { description = "show help", group = "awesome" }),
    awful.key({ modkey, "Control" }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),
    --
    -- Smart Persistent Scratchpad Terminal
    awful.key({ modkey }, "`", function()
        local scratch_client = nil
        -- Find the running scratchpad instance
        for _, c in ipairs(client.get()) do
            if c.class == "floating_term" then
                scratch_client = c
                break
            end
        end

        if not scratch_client then
            -- 1. Spawn if it doesn't exist yet
            awful.spawn("wezterm start --class floating_term")
        else
            local cur_tag = awful.screen.focused().selected_tag
            if client.focus == scratch_client then
                -- 2. If open and currently focused, hide it
                scratch_client.minimized = true
            else
                -- 3. If closed or on another tag, bring it here and focus
                scratch_client.minimized = false
                if cur_tag then
                    scratch_client:move_to_tag(cur_tag)
                end
                scratch_client:raise()
                client.focus = scratch_client
            end
        end
    end, { description = "toggle scratchpad terminal", group = "launcher" }),

    -- Screenshots
    awful.key({}, "Print", function() awful.util.spawn("screenshot") end, { description = "screenshot", group = "screenshots" }),
    awful.key({ "Mod1" }, "Print", function() awful.util.spawn("gnome-screenshot --interactive") end, { description = "interactive screenshot", group = "screenshots" }),

    -- Vim Window Navigation (Focus)
    awful.key({ modkey }, "h", function()
        awful.client.focus.bydirection("left")
        if client.focus then client.focus:raise() end
    end, { description = "focus left", group = "client" }),
    awful.key({ modkey }, "j", function()
        awful.client.focus.bydirection("down")
        if client.focus then client.focus:raise() end
    end, { description = "focus down", group = "client" }),
    awful.key({ modkey }, "k", function()
        awful.client.focus.bydirection("up")
        if client.focus then client.focus:raise() end
    end, { description = "focus up", group = "client" }),
    awful.key({ modkey }, "l", function()
        awful.client.focus.bydirection("right")
        if client.focus then client.focus:raise() end
    end, { description = "focus right", group = "client" }),

    -- Vim Window Movement (Swap)
    awful.key({ modkey, "Shift" }, "h", function()
        if client.focus then awful.client.swap.bydirection("left", client.focus) end
    end, { description = "swap left", group = "client" }),
    awful.key({ modkey, "Shift" }, "j", function()
        if client.focus then awful.client.swap.bydirection("down", client.focus) end
    end, { description = "swap down", group = "client" }),
    awful.key({ modkey, "Shift" }, "k", function()
        if client.focus then awful.client.swap.bydirection("up", client.focus) end
    end, { description = "swap up", group = "client" }),
    awful.key({ modkey, "Shift" }, "l", function()
        if client.focus then awful.client.swap.bydirection("right", client.focus) end
    end, { description = "swap right", group = "client" }),

    -- Tag / Workspace Switches
    awful.key({ modkey }, "Left", awful.tag.viewprev, { description = "view previous tag", group = "tag" }),
    awful.key({ modkey }, "Right", awful.tag.viewnext, { description = "view next tag", group = "tag" }),
    awful.key({ modkey }, "space", function() awful.layout.inc(1) end, { description = "select next layout", group = "layout" }),
    awful.key({ modkey, "Shift" }, "space", function() awful.layout.inc(-1) end, { description = "select previous layout", group = "layout" })
)

clientkeys = gears.table.join(
    awful.key({ modkey }, "f", function(c)
        c.fullscreen = not c.fullscreen
        c:raise()
    end, { description = "toggle fullscreen", group = "client" }),
    awful.key({ modkey }, "q", function(c) c:kill() end, { description = "close window", group = "client" }),
    awful.key({ modkey, "Control" }, "space", awful.client.floating.toggle, { description = "toggle floating", group = "client" }),
    awful.key({ modkey }, "m", function(c)
        c.maximized = not c.maximized
        c:raise()
    end, { description = "(un)maximize", group = "client" })
)

-- Bind Number Keys (1-9) to Workspaces
for i = 1, 9 do
    globalkeys = gears.table.join(
        globalkeys,
        awful.key({ modkey }, "#" .. i + 9, function()
            local screen = awful.screen.focused()
            local tag = screen.tags[i]
            if tag then tag:view_only() end
        end, { description = "view tag #" .. i, group = "tag" }),
        awful.key({ modkey, "Shift" }, "#" .. i + 9, function()
            if client.focus then
                local tag = client.focus.screen.tags[i]
                if tag then client.focus:move_to_tag(tag) end
            end
        end, { description = "move client to tag #" .. i, group = "tag" })
    )
end

clientbuttons = gears.table.join(
    awful.button({}, 1, function(c)
        c:emit_signal("request::activate", "mouse_click", { raise = true })
    end),
    awful.button({ modkey }, 1, function(c)
        c:emit_signal("request::activate", "mouse_click", { raise = true })
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function(c)
        c:emit_signal("request::activate", "mouse_click", { raise = true })
        awful.mouse.client.resize(c)
    end)
)

root.keys(globalkeys)

-- -----------------------------------------------------------------------------
-- 6. Rules
-- -----------------------------------------------------------------------------
awful.rules.rules = {
    -- Default rule for all clients
    {
        rule = {},
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = clientkeys,
            buttons = clientbuttons,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap + awful.placement.no_offscreen,
            titlebars_enabled = false, -- Clean, borderless windows by default
        },
    },

    -- Floating window rules
    {
        rule_any = {
            class = { "Arandr", "Blueman-manager", "Gpick", "Sxiv", "Tor Browser", "Wpa_gui" },
            name = { "Event Tester" },
            role = { "AlarmWindow", "pop-up" },
        },
        properties = { floating = true },
    },

}

-- -----------------------------------------------------------------------------
-- 7. Signals & Autostart
-- -----------------------------------------------------------------------------
client.connect_signal("manage", function(c)
    if not awesome.startup then awful.client.setslave(c) end
    if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
        awful.placement.no_offscreen(c)
    end
end)

client.connect_signal("focus", function(c)
    c.border_color = beautiful.border_focus
    -- Hide border if window is maximized or sole window on screen
    if c.maximized or #awful.screen.focused().selected_tag:clients() == 1 then
        c.border_width = 0
    else
        c.border_width = beautiful.border_width
    end
end)

client.connect_signal("unfocus", function(c)
    c.border_color = beautiful.border_normal
end)

-- Autostart Background Commands
awful.spawn.with_shell("nitrogen --restore")
awful.spawn.with_shell("xautolock -time 30 -locker 'i3lock -c 191724' -detectsleep")
