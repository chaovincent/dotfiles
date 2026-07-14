return {
    "HiPhish/rainbow-delimiters.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        local rainbow = require("rainbow-delimiters")

        require("rainbow-delimiters.setup").setup({
            strategy = {
                [""] = rainbow.strategy["global"],
            },
        })
    end,
}
