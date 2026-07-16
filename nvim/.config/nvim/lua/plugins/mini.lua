return {
    -- Line and block code commenting
    {
        "echasnovski/mini.comment",
        event = "VeryLazy",
        opts = {},
    },

    -- Icon provider with Nerd Font support and caching
    {
        "echasnovski/mini.icons",
        lazy = true,
        opts = {},
    },

    -- Jump anywhere on screen
    {
        "echasnovski/mini.jump2d",
        event = "VeryLazy",
        opts = {
            view = { dim = true },
            mappings = { start_jumping = "" },
        },
    },

    -- Automatic closing of brackets, parentheses, and quotes
    {
        "echasnovski/mini.pairs",
        event = "InsertEnter",
        opts = {},
    },

    -- Status line at the bottom of the screen
    {
        "echasnovski/mini.statusline",
        event = "VeryLazy",
        config = function()
            local statusline = require("mini.statusline")
            statusline.setup({ use_icons = true })

            statusline.section_location = function()
                return "%2l:%-2v"
            end
        end,
    },

    -- Fast manipulation of surrounding brackets, quotes, and tags
    {
        "echasnovski/mini.surround",
        event = "VeryLazy",
        opts = {},
    },

    -- Tab/buffer line at the top of the screen
    {
        "echasnovski/mini.tabline",
        event = "VeryLazy",
        opts = {
            show_icons = true,
        },
    },
}
