return {
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
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 100,
                    window = { border = "rounded" } },
            },
        },
    },
}
