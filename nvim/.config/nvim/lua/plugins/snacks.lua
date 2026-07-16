return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        dashboard = { enabled = true },
        explorer = { enabled = true },
        indent = { enabled = true },
        input = { enabled = true },
        notifier = { enabled = true, timeout = 3000 },
        picker = { enabled = true },
        quickfile = { enabled = true },
        scope = { enabled = true },
        statuscol = { enabled = true },
        words = { enabled = true },
    },
    keys = {
        -- Pickers
        { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
        { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
        { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent Files" },
        { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep Search" },
        { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Search Word under Cursor" },
        { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers List" },
        { "<leader>sh", function() Snacks.picker.help() end, desc = "Search Help" },
        { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Search Keymaps" },

        -- Explorer
        { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },

        -- Terminal Toggle
        { "<leader>t", function() Snacks.terminal() end, desc = "Toggle Terminal" },
        { "<C-/>", function() Snacks.terminal() end, mode = { "n", "t" }, desc = "Toggle Terminal" },

        -- Utilities
        { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git Blame Line" },
        { "<leader>nh", function() Snacks.notifier.show_history() end, desc = "Notification History" },
    },
}
