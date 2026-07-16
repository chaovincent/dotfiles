return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        -- Set up group names so Which-Key renders clean headers
        spec = {
            { "<leader>f", group = "Find / File" },
            { "<leader>s", group = "Search" },
            { "<leader>g", group = "Git" },
            { "<leader>n", group = "Notifications" },
            { "g", group = "Go to / LSP" },
        },
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (Which-Key)",
        },
    },
}
