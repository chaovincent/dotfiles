return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = {
            [[          ▀████▀▄▄              ▄█ ]],
            [[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
            [[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
            [[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
            [[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
            [[  ▀▄     ▀▄  █     ▀██▀      ██▄█  ]],
            [[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
            [[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
            [[   █   █  █       ▄▄           ▄▀  ]],
        }

        dashboard.section.buttons.val = {
            dashboard.button("f", "  Find file", ":Telescope find_files "),
            dashboard.button("e", "  New file", ":ene  startinsert "),
            dashboard.button("r", "  Recently used files", ":Telescope oldfiles "),
            dashboard.button("t", "  Find text", ":Telescope live_grep "),
            dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua"),
            dashboard.button("q", "  Quit Neovim", ":qa"),
        }

        dashboard.section.footer.val = "Don't Stop Until You are Proud..."

        dashboard.section.footer.opts.hl = "Type"
        dashboard.section.header.opts.hl = "Include"
        dashboard.section.buttons.opts.hl = "Keyword"

        dashboard.opts.opts.noautocmd = true

        require("alpha").setup(dashboard.opts)
    end,
}
