local status_ok, hop = pcall(require, "hop")
if not status_ok then
    return
end

hop.setup({
    keys = 'etovxqpdygfblzhckisuran',
    jump_on_sole_occurance = true,
})

-- Visual tweaks to match theme
vim.api.nvim_set_hl(0, "HopNextKey",  { fg = "#ebbcba", bold = true }) -- Main keys
vim.api.nvim_set_hl(0, "HopNextKey1", { fg = "#31748f", bold = true }) -- Secondary keys
vim.api.nvim_set_hl(0, "HopUnmatched", { fg = "#6e6a86", blend = 40 }) -- Dim the rest of the file
