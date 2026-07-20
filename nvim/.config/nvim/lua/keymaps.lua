local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- Set Space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-------------------------------------------------------------------------------
-- Modes
-------------------------------------------------------------------------------
-- n = normal_mode
-- i = insert_mode
-- c = command_mode
-- t = term_mode
-- x = visual_mode (all visual types: character, line, and block)
-- s = select_mode
-- v = visual_mode + select_mode
-- o = operator_pending_mode (waiting for a motion after d, y, c, etc.)
-------------------------------------------------------------------------------

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Navigate Buffers
keymap("n", "L", ":bnext<cr>", opts)
keymap("n", "H", ":bprevious<cr>", opts)

-- Package & Tool Management
keymap("n", "<leader>p", "<cmd>Lazy<cr>", { desc = "Plugin Manager (Lazy)" })
keymap("n", "<leader>m", "<cmd>Mason<cr>", { desc = "LSP & Tool Manager (Mason)" })

-- Fast 2D Jump
keymap({ "n", "x", "o" }, "<leader>j", function()
    local has_jump, jump = pcall(require, "mini.jump2d")
    if has_jump then
        jump.start(jump.builtin_opts.single_character)
    end
end, { desc = "Jump to Character" })

-- Safe Buffer Delete (Preserves window splits)
keymap("n", "<leader>bd", function()
    local has_bufremove, bufremove = pcall(require, "mini.bufremove")
    if has_bufremove then
        bufremove.delete(0, false)
    else
        vim.cmd("bdelete")
    end
end, { desc = "Delete Buffer" })
