return {
    "smoka7/hop.nvim",
    keys = {
        { "s", "HopPattern", desc = "Hop Pattern (Incremental Search)" },
    },
    opts = {
        keys = "etovxqpdygfblzhckisuran",
        jump_on_sole_occurrence = true,
    },
    config = function(_, opts)
        require("hop").setup(opts)

        -- Visual tweaks to match theme
        vim.api.nvim_set_hl(0, "HopNextKey", { fg = "#ebbcba", bold = true }) 
        vim.api.nvim_set_hl(0, "HopNextKey1", { fg = "#31748f", bold = true }) 
        vim.api.nvim_set_hl(0, "HopUnmatched", { fg = "#6e6a86", blend = 40 }) 
    end,
}
