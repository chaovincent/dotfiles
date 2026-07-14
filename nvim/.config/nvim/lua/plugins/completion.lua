return {
    -- Autopairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {
            check_ts = true,
        },
    },

    -- Blink
    {
        "saghen/blink.cmp",
        version = "*",
        event = "InsertEnter",
        opts = {
            keymap = { preset = "default" },

            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },

            completion = {
                menu = { border = "rounded" },
                documentation = { window = { border = "rounded" } },
            },
        },
    },
}
