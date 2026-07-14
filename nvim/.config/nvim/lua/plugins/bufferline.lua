return {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    opts = {
        options = {
            hover = {
                enabled = true,
                delay = 150,
                reveal = { "close" },
            },
        },
    },
}
